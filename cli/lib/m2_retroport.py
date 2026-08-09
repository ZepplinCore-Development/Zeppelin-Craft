"""Retroport a Cata (4.3.4) M2 to the WotLK 3.3.5a client format.

Written for I-328 (the Mechashark's eye lights). Kept deterministic and re-runnable
so the shipped binary — which is gitignored like every other client asset — can be
regenerated from its source on a fresh clone. This is the shape F-203 formalises: the
repo stores the recipe, not the derived bytes. See `asset_recipes.json` in the zpak.

WHAT IS AND IS NOT SAFE
-----------------------
M2 versions 264 (WotLK) and 272 (Cata) share the same 304-byte header *as long as
the model does not use the Cata additions*, so for a large class of doodads the
retroport is only the version field. This converter refuses anything outside that
class rather than emitting a file that loads and misbehaves:

  * global flag 0x08 `use_texture_combiner_combos` — Cata appends a
    texture_combiner_combos array the WotLK client knows nothing about.
  * particle emitters — the M2ParticleEmitter struct gained fields in Cata; a
    WotLK client reading them walks off the end of each record.
  * ribbon emitters — same story.
  * a header that does not start its name block at 304, which means the layout is
    not the WotLK one to begin with.

Verified against the target model before shipping: UL_Light_Effect_Green is 121
vertices, 1 bone, 1 texture, 1 inline animation, and none of the above — and its
global flags (128) are a value stock WotLK Ulduar doodads already carry, so the
flag word is passed through untouched.

Texture and .skin are NOT converted: BLPs are format-stable across the two builds,
and the WotLK and Cata .skin layouts agree (the shadow-batch change landed in MoP).
Copy them alongside unchanged.
"""
import struct

M2_MAGIC = b"MD20"
VERSION_WOTLK = 264
VERSION_CATA = 272
WOTLK_HEADER_BYTES = 304

# header word indices, counted from the start of the field block at offset 8
_F_GLOBAL_FLAGS = 2
# (count, offset) pairs live after the two bounding boxes; see the module doc
_TAIL_LABELS = ["nBoundTri", "ofsBoundTri", "nBoundVert", "ofsBoundVert",
                "nBoundNorm", "ofsBoundNorm", "nAttach", "ofsAttach",
                "nAttachLookup", "ofsAttachLookup", "nEvents", "ofsEvents",
                "nLights", "ofsLights", "nCameras", "ofsCameras",
                "nCameraLookup", "ofsCameraLookup", "nRibbon", "ofsRibbon",
                "nParticle", "ofsParticle"]

FLAG_USE_TEXTURE_COMBINER_COMBOS = 0x08


class NotRetroportable(Exception):
    """The model uses a Cata feature this converter will not fake."""


def inspect(data: bytes) -> dict:
    """Header facts the caller needs to decide whether the file is convertible."""
    if data[:4] != M2_MAGIC:
        raise NotRetroportable("not an MD20 file (got %r)" % data[:4])
    version = struct.unpack_from("<I", data, 4)[0]
    fields = struct.unpack_from("<38I", data, 8)
    tail_off = 8 + 38 * 4 + 14 * 4          # 38 header words + 2 bounding boxes
    tail = dict(zip(_TAIL_LABELS, struct.unpack_from("<22I", data, tail_off)))
    return {
        "version": version,
        "name_offset": fields[1],
        "global_flags": fields[_F_GLOBAL_FLAGS],
        "n_particle": tail["nParticle"],
        "n_ribbon": tail["nRibbon"],
    }


def retroport(data: bytes) -> bytes:
    """Cata M2 bytes -> WotLK M2 bytes. Raises NotRetroportable when unsafe."""
    h = inspect(data)
    if h["version"] == VERSION_WOTLK:
        return data                                  # already there, idempotent
    if h["version"] != VERSION_CATA:
        raise NotRetroportable("version %d is neither 264 nor 272" % h["version"])
    if h["name_offset"] != WOTLK_HEADER_BYTES:
        raise NotRetroportable(
            "name block at %d, not %d — header is not the WotLK layout"
            % (h["name_offset"], WOTLK_HEADER_BYTES))
    if h["global_flags"] & FLAG_USE_TEXTURE_COMBINER_COMBOS:
        raise NotRetroportable("uses texture_combiner_combos (Cata-only array)")
    if h["n_particle"]:
        raise NotRetroportable("%d particle emitter(s) — struct differs in Cata"
                               % h["n_particle"])
    if h["n_ribbon"]:
        raise NotRetroportable("%d ribbon emitter(s) — struct differs in Cata"
                               % h["n_ribbon"])
    out = bytearray(data)
    struct.pack_into("<I", out, 4, VERSION_WOTLK)
    return bytes(out)


if __name__ == "__main__":
    import hashlib
    import sys

    if len(sys.argv) != 3:
        sys.exit("usage: python -m lib.m2_retroport <in.m2> <out.m2>")
    src = open(sys.argv[1], "rb").read()
    print("in :", inspect(src), "sha256", hashlib.sha256(src).hexdigest())
    dst = retroport(src)
    open(sys.argv[2], "wb").write(dst)
    print("out:", inspect(dst), "sha256", hashlib.sha256(dst).hexdigest())
