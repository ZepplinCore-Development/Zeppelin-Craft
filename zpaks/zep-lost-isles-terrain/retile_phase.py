#!/usr/bin/env python3
"""
F-196 re-tile: move the Cata Lost Isles phase ADTs from map-648 tile coords to OA map-1 coords, so
PhasingHooks (which redirects base map-1 tiles to a same-named child tile) lines up with the base terrain.

Transform (F-011, verified): idxX_map1 = idxX_648 + 24 ; idxY_map1 = idxY_648 + 1
  world offset  X -533.3333 , Y -12800 , Z unchanged  (== one/24 tiles; matches MCNK.position exactly)

This pass does the VERIFIED parts:
  - rename every tile file (root + _tex0/_tex1/_obj0/_lod) to the new idx
  - root .adt: shift every MCNK.position by (-533.33, -12800, 0)   [verified against grid math]
  - rebuild the WDT MAIN present-table at the new coords            [what PhasingHooks reads]
  - copy .wdl / .tex verbatim
STAGED (next pass, needs the MDDF coord convention): shift the 1170 MDDF + 3 MODF placements in _obj0.
Until then _obj0 is copied unchanged, so doodads/WMOs render offset — terrain heightmap is correct.

Usage:  python3 retile_phase.py           (re-tiles all three phases -> mpq/parsed-assets/)

Lives in the zep-lost-isles-terrain zpak: reads the raw map-648-coord Cata ADTs from
mpq/source-binary/ (gitignored, host-only) and emits the map-1-coord tree straight into
mpq/parsed-assets/, which `zep build patch-mpq -p T --build` packs. Do NOT --parse-build
this zpak (source-assets is empty; it would clobber parsed-assets).
"""
import glob, os, re, struct, sys, collections

HERE = os.path.dirname(os.path.abspath(__file__))
SRC  = os.path.join(HERE, "mpq", "source-binary", "World", "Maps")
OUT  = os.path.join(HERE, "mpq", "parsed-assets", "World", "Maps")
PHASES = ("LostIsles", "LostIslesPhase1", "LostIslesPhase2")

DIDX_X, DIDX_Y = 24, 1
WDX, WDY = -533.3333, -12800.0          # MCNK.position px, py shift (Z unchanged)
MCNK_POS_OFF = 0x68                      # px,py,pz floats within the MCNK header
# _obj0 placement space is HALF-swapped (worldX=HALF-pos.z, worldY=HALF-pos.x), so the world offset
# (X-533.33, Y-12800) becomes pos.x+=12800, pos.z+=533.33 (height unchanged). Verified: world delta
# = exactly (-533.33, -12800), same as the terrain.
MDX, MDZ = 12800.0, 533.3333

# The BASE tiles the client keeps loaded are Kalimdor's (map 1, PATCH-O) -- SetTerrainPhase stays on
# the base map and redirects per tile, so the phase tile must reconcile against KALIMDOR_*.ADT, not
# against the retiled LostIsles copy in this zpak.
OA_KALIMDOR = os.path.normpath(os.path.join(
    HERE, "..", "patch-open-azeroth", "mpq", "parsed-assets", "WORLD", "MAPS", "KALIMDOR"))
UID_REBASE = 0x40000000   # phase-only doodads that would collide with a base uid land here
# Position tolerance for calling a phase doodad "the same doodad" as a base one. The two tiles come
# from different pipelines (OA's Noggit-saved Kalimdor vs the Cata phase ADT shifted here), so the
# floats differ by noise. Measured across the 12 Phase1 tiles: 2dp matches 1818 and 1dp matches 2600,
# both with ZERO ambiguous keys (no base tile has two doodads of the same model within the tolerance);
# 0dp adds only 121 more and introduces 5 ambiguous keys. 1dp is the safe maximum.
POS_DP = 1


def iter_chunks(d):
    i = 0
    while i + 8 <= len(d):
        tag = d[i:i+4][::-1].decode("ascii", "replace")
        sz = struct.unpack_from("<I", d, i+4)[0]
        yield tag, i+8, sz
        i += 8 + sz


def _mddf_entries(data: bytes):
    """[(offset_of_entry, model_name_key, (px,py,pz), uid)] for every MDDF record."""
    d = {}
    for tag, off, sz in iter_chunks(data):
        d.setdefault(tag, (off, sz))
    if "MDDF" not in d:
        return []
    names = []
    if "MMDX" in d and "MMID" in d:
        mo, ms = d["MMDX"]; io_, isz = d["MMID"]
        raw = data[mo:mo+ms]
        for o in struct.unpack_from("<%dI" % (isz // 4), data, io_):
            e = raw.index(b"\0", o)
            n = raw[o:e].decode("ascii", "replace").upper().replace("/", "\\")
            if n.endswith(".MDX"):
                n = n[:-4] + ".M2"
            names.append(n)
    off, sz = d["MDDF"]
    out = []
    for k in range(sz // 36):
        base = off + k * 36
        nid, uid = struct.unpack_from("<II", data, base)
        px, py, pz = struct.unpack_from("<3f", data, base + 8)
        nm = names[nid] if nid < len(names) else "?%d" % nid
        out.append((base, nm, (round(px, POS_DP), round(py, POS_DP), round(pz, POS_DP)), uid))
    return out


def _keyed(data: bytes):
    """key -> uid for every MDDF record. Key = (model, position @ POS_DP)."""
    out = {}
    for _, nm, pos, uid in _mddf_entries(data):
        out.setdefault((nm, pos), uid)
    return out


_CANON = {}


def _canonical_uids(x: int, y: int):
    """One canonical uniqueId per physical doodad on this tile, across base + every phase.

    WHY TRANSITIVE: reconciling each phase against the BASE tile alone is not enough. A doodad
    that exists in Phase1 and Phase2 but NOT in base has no anchor, so the two phases keep their
    own differing uids and double-place on a Phase1 <-> Phase2 transition. Measured before this
    pass: base<->P1 67 mismatches, base<->P2 22, P1<->P2 50 -- including 8 bamboo, which is what
    the in-game flicker was.

    Precedence: the BASE uid wins when the doodad exists in base (base tiles are what the client
    keeps loaded and we must not renumber them); otherwise the first phase that has it, in PHASES
    order, donates its uid to the rest.

    Returns (key -> canonical uid, set of uids live on this tile and its 8 neighbours).
    """
    if (x, y) in _CANON:
        return _CANON[(x, y)]

    canon, near = {}, set()
    bp = os.path.join(OA_KALIMDOR, "KALIMDOR_%d_%d.ADT" % (x, y))
    if os.path.exists(bp):
        canon.update(_keyed(open(bp, "rb").read()))
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            q = os.path.join(OA_KALIMDOR, "KALIMDOR_%d_%d.ADT" % (x + dx, y + dy))
            if os.path.exists(q):
                near.update(e[3] for e in _mddf_entries(open(q, "rb").read()))

    # Phase sources, shifted into map-1 space so their keys line up with the base tile's.
    for phase in PHASES:
        if phase == "LostIsles":
            continue
        src = os.path.join(SRC, phase,
                           "%s_%d_%d_obj0.adt" % (phase, x - DIDX_X, y - DIDX_Y))
        if not os.path.exists(src):
            continue
        for k, uid in _keyed(shift_placements(open(src, "rb").read())).items():
            canon.setdefault(k, uid)

    _CANON[(x, y)] = (canon, near)
    return canon, near


def reconcile_uids(data: bytes, x: int, y: int, stats: dict) -> bytes:
    """Stamp the canonical uniqueId onto every doodad of a phase tile.

    The Client identifies a doodad instance by its MDDF uniqueId. WXL's terrain phase re-streams
    the base map in place rather than performing a map change, so doodads from the previous state
    can still be resident when the next one loads; an identical doodad under a DIFFERENT uid is
    placed a second time and the coincident geometry z-fights (flickers with camera angle and
    distance). Blizzard's own phase maps carry different uids for the same doodad -- 182 of 205 on
    tile 27_30 -- because a real Cata terrain swap tears the base map down first.

    A phase-only doodad whose uid collides with a base uid on this tile or its neighbours is
    pushed to UID_REBASE instead: a FALSE dedupe would make a genuinely new doodad invisible.
    """
    canon, near = _canonical_uids(x, y)
    if not canon:
        stats["no_base"] += 1
        return data
    b = bytearray(data)
    for off, nm, pos, uid in _mddf_entries(data):
        want = canon.get((nm, pos))
        if want is not None:
            if want != uid:
                stats["matched"] += 1
            struct.pack_into("<I", b, off + 4, want)
        elif uid in near:
            stats["rebased"] += 1
            struct.pack_into("<I", b, off + 4, UID_REBASE + stats["rebased"])
        else:
            stats["kept"] += 1
    return bytes(b)


def shift_root_mcnks(data: bytes) -> bytes:
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MCNK":
            px, py, pz = struct.unpack_from("<fff", b, off + MCNK_POS_OFF)
            struct.pack_into("<fff", b, off + MCNK_POS_OFF, px + WDX, py + WDY, pz)
    return bytes(b)


def shift_placements(data: bytes) -> bytes:
    """Shift MDDF (doodads) + MODF (WMOs, incl. their bounding boxes) by the same world offset the
    terrain moved, in placement space (pos.x += 12800, pos.z += 533.33; height unchanged)."""
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MDDF":
            for k in range(sz // 36):
                p = off + k*36 + 8                 # id(4) + uid(4), then position(3f)
                x, y, z = struct.unpack_from("<fff", b, p)
                struct.pack_into("<fff", b, p, x + MDX, y, z + MDZ)
        elif tag == "MODF":
            for k in range(sz // 64):
                base = off + k*64
                for foff in (8, 32, 44):           # position, lower-bounds, upper-bounds
                    x, y, z = struct.unpack_from("<fff", b, base + foff)
                    struct.pack_into("<fff", b, base + foff, x + MDX, y, z + MDZ)
    return bytes(b)


def rebuild_wdt(data: bytes) -> bytes:
    """Move the MAIN present grid so tile (x,y) -> (x+24, y+1). MAIN = 64x64 entries x 8 bytes,
    row-major MAIN[y*64 + x], flag bit0 = present (SFile-present flag preserved)."""
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MAIN":
            old = bytes(b[off:off+0x8000])
            new = bytearray(0x8000)
            for y in range(64):
                for x in range(64):
                    e = struct.unpack_from("<I", old, (y*64 + x)*8)[0]
                    if e & 1:
                        nx, ny = x + DIDX_X, y + DIDX_Y
                        if 0 <= nx < 64 and 0 <= ny < 64:
                            struct.pack_into("<I", new, (ny*64 + nx)*8, e)
            b[off:off+0x8000] = new
            break
    return bytes(b)


def main():
    total = 0
    stats = collections.Counter()
    for phase in PHASES:
        pdir = os.path.join(SRC, phase)
        if not os.path.isdir(pdir):
            print(f"skip {phase}: not extracted"); continue
        outdir = os.path.join(OUT, phase); os.makedirs(outdir, exist_ok=True)
        n = 0
        for fn in sorted(os.listdir(pdir)):
            src = os.path.join(pdir, fn)
            data = open(src, "rb").read()
            m = re.match(rf"{phase}_(\d+)_(\d+)(.*)$", fn, re.I)   # tile file
            if m:
                x, y, suf = int(m.group(1)), int(m.group(2)), m.group(3)
                out = f"{phase}_{x+DIDX_X}_{y+DIDX_Y}{suf}"
                sl = suf.lower()
                if sl == ".adt":                        # root terrain -> shift MCNK heightmap origin
                    data = shift_root_mcnks(data)
                elif sl in ("_obj0.adt", "_obj1.adt"):  # placements -> shift doodads/WMOs
                    data = shift_placements(data)
                    # AFTER the shift: positions are now in map-1 space, so they can be compared
                    # against the Kalimdor base tile this phase tile will replace.
                    if phase != "LostIsles":
                        data = reconcile_uids(data, x + DIDX_X, y + DIDX_Y, stats)
                # _tex*/_lod copied verbatim under the new name
            elif fn.lower().endswith(".wdt"):
                out = fn; data = rebuild_wdt(data)
            else:                                       # .wdl / .tex / misc
                out = fn
            open(os.path.join(outdir, out), "wb").write(data)
            n += 1
        print(f"{phase}: re-tiled {n} files -> retiled/World/Maps/{phase}/")
        total += n
    print(f"done: {total} files. MCNK heightmap + MDDF/MODF doodads/WMOs re-positioned to map-1 coords.")
    print("uid reconcile: %d matched to the base tile, %d rebased (would have collided), "
          "%d left as-is, %d tiles with no base counterpart"
          % (stats["matched"], stats["rebased"], stats["kept"], stats["no_base"]))


if __name__ == "__main__":
    main()
