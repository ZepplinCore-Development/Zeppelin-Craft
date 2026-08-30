"""
Model edit ops — declarative, replayable edits to WoW 3.3.5a M2 and WMO files (F-203).

Binary client assets are gitignored in every zpak, so a hand-edited .m2 is
uncommittable: it lives as an untracked binary on one machine and a fresh
checkout silently rebuilds the patch without it.  The fix is to commit the
*recipe* instead of the derived binary — `model_transforms.json` names the
donor asset in source-assets and the ops to replay onto parsed-assets at
build time.

Ops are keyed by name so the set can grow without touching call sites:

    {"op": "m2.camera.fov", "index": 0, "value": 0.75}

`apply_ops` returns a list of human-readable descriptions of what changed.
Every op must be idempotent in effect — the preprocessor re-copies the base
from source-assets before replaying, so ops are always applied to pristine
bytes, never on top of themselves.
"""

import struct
from pathlib import Path
from typing import Any, Callable, Dict, List

from lib.m2_vertex_shifter import read_m2_header

# WotLK.  The camera struct differs in Cata (v272+): FOV moved from a scalar
# field to an animated M2Track appended after `roll`, and the struct grew from
# 100 to 116 bytes.  Refuse anything we have not laid out.
M2_VERSION_WOTLK = 264

# Offsets from the MD20 base, WotLK header layout.
OFS_VERSION = 4
OFS_N_CAMERAS = 272
OFS_OFS_CAMERAS = 276

CAMERA_STRIDE = 100
CAMERA_FOV_OFFSET = 4  # after uint32 type

# Sanity bound: glue-scene cameras sit around 0.7-1.2 rad.  A value outside
# this is almost certainly a units mistake (degrees for radians) rather than
# an intentional edit.
FOV_MIN = 0.05
FOV_MAX = 3.0


class M2OpError(Exception):
    """An op could not be applied to this file."""


def _require_wotlk(data: bytes, base: int) -> None:
    version = struct.unpack_from('<I', data, base + OFS_VERSION)[0]
    if version != M2_VERSION_WOTLK:
        raise M2OpError(
            f"M2 version {version} — ops are laid out for WotLK v{M2_VERSION_WOTLK} only "
            f"(the camera struct moved in Cata v272+)"
        )


def find_cameras(data: bytes) -> tuple:
    """Locate the camera block.

    Returns (n_cameras, ofs_cameras_abs).
    """
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)

    n = struct.unpack_from('<I', data, base + OFS_N_CAMERAS)[0]
    ofs = struct.unpack_from('<I', data, base + OFS_OFS_CAMERAS)[0]
    ofs_abs = base + ofs

    if n and ofs_abs + n * CAMERA_STRIDE > len(data):
        raise M2OpError(
            f"camera block ({n} x {CAMERA_STRIDE}B at {ofs_abs}) runs past EOF {len(data)}"
        )
    return n, ofs_abs


def _op_camera_fov(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set the field-of-view of one camera, in radians.

    A retroported glue scene whose FOV is wider than the set was built for
    renders void wedges at the frame edges — see F-151 / UI_Goblin.
    """
    if 'value' not in cfg:
        raise M2OpError("m2.camera.fov requires 'value' (radians)")
    value = float(cfg['value'])
    if not (FOV_MIN <= value <= FOV_MAX):
        raise M2OpError(f"fov {value} out of range [{FOV_MIN}, {FOV_MAX}] — radians expected")

    index = int(cfg.get('index', 0))
    n, ofs_abs = find_cameras(data)
    if index >= n:
        raise M2OpError(f"camera index {index} but model has {n} camera(s)")

    at = ofs_abs + index * CAMERA_STRIDE + CAMERA_FOV_OFFSET
    before = struct.unpack_from('<f', data, at)[0]
    struct.pack_into('<f', data, at, value)
    return f"camera[{index}].fov {before:.5f} -> {value:.5f}"


# ---------------------------------------------------------------------------
# WMO ops
#
# A WMO is a flat chunk stream: 4-byte reversed magic, uint32 size, payload.
# Interior fog lives in MFOG on the *root* file; each 48-byte entry is
#
#   uint32 flags        (bit 0 = infinite radius — the group-wide fog)
#   C3Vector pos        (12B)
#   float smaller_radius, larger_radius
#   SMOFogDef fog[2]    land at +24, underwater at +36
#                       each: float end, float start_scalar, CImVector color
#
# `end` is in yards and `start_scalar` is a fraction of it, so the fog ramps
# from end*start_scalar to end.  Group headers select entries via MOGP.fogIds,
# but an entry flagged infinite-radius applies to the whole model.
# ---------------------------------------------------------------------------

WMO_VERSION = 17
MFOG_STRIDE = 48
MFOG_FOG_OFFSET = {'land': 24, 'water': 36}

# A cave you are meant to see across runs 200-670 yd in stock 3.3.5; the
# WotLK authoring default is 444.44 (16000/36).  Anything outside this band is
# almost certainly a units mistake rather than an intentional edit.
FOG_END_MIN = 1.0
FOG_END_MAX = 10000.0


def _wmo_chunks(data: bytes):
    """Yield (magic, payload_offset, size) for each top-level WMO chunk."""
    off = 0
    while off + 8 <= len(data):
        magic = bytes(data[off:off + 4])[::-1]
        size = struct.unpack_from('<I', data, off + 4)[0]
        yield magic, off + 8, size
        off += 8 + size


def find_mfog(data: bytes) -> tuple:
    """Locate the fog block of a root WMO.

    Returns (n_entries, ofs_abs).
    """
    version = None
    mfog = None
    for magic, ofs, size in _wmo_chunks(data):
        if magic == b'MVER':
            version = struct.unpack_from('<I', data, ofs)[0]
        elif magic == b'MFOG':
            mfog = (ofs, size)

    if version is None:
        raise M2OpError("no MVER chunk — not a WMO")
    if version != WMO_VERSION:
        raise M2OpError(f"WMO version {version} — ops are laid out for v{WMO_VERSION}")
    if mfog is None:
        raise M2OpError("no MFOG chunk — fog ops need the root WMO, not a group file")

    ofs, size = mfog
    return size // MFOG_STRIDE, ofs


def _mfog_field(data: bytearray, cfg: Dict[str, Any], field_offset: int) -> int:
    """Resolve one float inside an MFOG entry to an absolute byte offset."""
    index = int(cfg.get('index', 0))
    which = cfg.get('fog', 'land')
    if which not in MFOG_FOG_OFFSET:
        raise M2OpError(f"fog {which!r} — expected one of {sorted(MFOG_FOG_OFFSET)}")

    n, ofs_abs = find_mfog(data)
    if index >= n:
        raise M2OpError(f"fog index {index} but model has {n} MFOG entr{'y' if n == 1 else 'ies'}")

    return ofs_abs + index * MFOG_STRIDE + MFOG_FOG_OFFSET[which] + field_offset


def _op_wmo_fog_end(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set the distance, in yards, at which interior fog is fully opaque.

    Cataclysm-authored interiors carry fog ends the 3.3.5 renderer draws as a
    wall well short of the far side of the room — see I-353 / Gallywix Labor
    Mine, a 275 yd cave shipped with a 27.78 yd fog end.

    Pick the index off `MOGP.fogIds[0]`, not off the infinite-radius flag: the
    3.3.5 client takes fogIds literally and applies that entry across the whole
    group even when its own radius is a couple of yards.  The entry actually in
    use is the one whose fog colour you see on screen.
    """
    if 'value' not in cfg:
        raise M2OpError("wmo.fog.end requires 'value' (yards)")
    value = float(cfg['value'])
    if not (FOG_END_MIN <= value <= FOG_END_MAX):
        raise M2OpError(f"fog end {value} out of range [{FOG_END_MIN}, {FOG_END_MAX}] — yards expected")

    at = _mfog_field(data, cfg, 0)
    before = struct.unpack_from('<f', data, at)[0]
    struct.pack_into('<f', data, at, value)
    return f"fog[{cfg.get('index', 0)}].{cfg.get('fog', 'land')}.end {before:.2f} -> {value:.2f} yd"


def _op_wmo_fog_start_scalar(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set where the fog ramp begins, as a fraction of the fog end."""
    if 'value' not in cfg:
        raise M2OpError("wmo.fog.start_scalar requires 'value' (0-1 fraction of end)")
    value = float(cfg['value'])
    if not (0.0 <= value <= 1.0):
        raise M2OpError(f"start_scalar {value} out of range [0, 1]")

    at = _mfog_field(data, cfg, 4)
    before = struct.unpack_from('<f', data, at)[0]
    struct.pack_into('<f', data, at, value)
    return f"fog[{cfg.get('index', 0)}].{cfg.get('fog', 'land')}.start_scalar {before:.3f} -> {value:.3f}"


OPS: Dict[str, Callable[[bytearray, Dict[str, Any]], str]] = {
    'm2.camera.fov': _op_camera_fov,
    'wmo.fog.end': _op_wmo_fog_end,
    'wmo.fog.start_scalar': _op_wmo_fog_start_scalar,
}


def apply_ops(m2_path: Path, ops: List[Dict[str, Any]]) -> List[str]:
    """Replay ops onto an M2 in place.

    Args:
        m2_path: File to edit (a parsed-assets copy — never source-assets).
        ops: List of op dicts, each with an 'op' key naming the operation.

    Returns:
        One description string per applied op.

    Raises:
        M2OpError: unknown op, or an op that could not be applied.  The file
            is left untouched — ops are applied to a buffer and only written
            back once all of them succeed.
    """
    data = bytearray(m2_path.read_bytes())
    size_before = len(data)
    applied = []

    for cfg in ops:
        name = cfg.get('op')
        func = OPS.get(name)
        if not func:
            raise M2OpError(f"unknown op {name!r} (known: {', '.join(sorted(OPS))})")
        applied.append(func(data, cfg))

    if len(data) != size_before:
        raise M2OpError("ops changed the file size — offsets in .skin files would break")

    m2_path.write_bytes(bytes(data))
    return applied
