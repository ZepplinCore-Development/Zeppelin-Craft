"""
M2 edit ops — declarative, replayable edits to WoW 3.3.5a M2 model files (F-203).

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


OPS: Dict[str, Callable[[bytearray, Dict[str, Any]], str]] = {
    'm2.camera.fov': _op_camera_fov,
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
