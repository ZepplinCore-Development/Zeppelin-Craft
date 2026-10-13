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

# Offsets within the v264 camera struct.  Each M2Track is 20 bytes:
#   uint32 type; float fov; float far_clip; float near_clip;   -> 16
#   M2Track positions;                                         -> 36
#   C3Vector position_base;                                    -> 48
#   M2Track target_position;                                   -> 68
#   C3Vector target_base;                                      -> 80
#   M2Track roll;                                              -> 100
CAMERA_POSITION_TRACK_OFFSET = 16
CAMERA_POSITION_BASE_OFFSET = 36
CAMERA_TARGET_TRACK_OFFSET = 48
CAMERA_TARGET_BASE_OFFSET = 68

# Aim shifts are small: a glue-scene camera sits ~8 units from its subject, so
# a whole frame height is ~3 units.  Anything past this is a units mistake.
PAN_ABS_MAX = 5.0

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



def _track_is_zero(data: bytes, base: int, track_at: int) -> bool:
    """True if a camera position/target track carries no non-zero key.

    The track animates the camera *relative to* its base vector, so the base
    is only the effective position/aim when every key is zero.  Glue scenes
    ship 2-key all-zero tracks (a 33s loop that never moves), which is why
    editing the base works at all — but check, never assume.
    """
    interp, _gs = struct.unpack_from('<HH', data, track_at)
    _nts, _ots, nvs, ovs = struct.unpack_from('<IIII', data, track_at + 4)
    stride = 36 if interp > 1 else 12  # M2SplineKey<C3Vector> vs plain C3Vector
    for k in range(nvs):
        n2, o2 = struct.unpack_from('<II', data, base + ovs + 8 * k)
        for j in range(n2):
            v = struct.unpack_from('<3f', data, base + o2 + stride * j)
            if any(abs(c) > 1e-6 for c in v):
                return False
    return True


def _op_camera_pan(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Tilt a camera by offsetting its aim point, leaving the camera put.

    `dz` is in world units on the target.  **Negative dz aims lower, which
    moves the scene UP in frame and opens margin below the subject** — that is
    a "pan down".  `dx`/`dy` swing it horizontally.  The camera position is
    untouched, so distance and perspective do not change; only the framing
    does.

    To convert a share-of-frame into units: the frame is
    `2 * dist * tan(fov/2)` wide at the subject and that over the aspect ratio
    tall, so 10% of the frame height at 16:9 is
    `0.10 * (2 * dist * tan(fov/2)) / (16/9)`.
    """
    dx = float(cfg.get('dx', 0.0))
    dy = float(cfg.get('dy', 0.0))
    dz = float(cfg.get('dz', 0.0))
    if not any((dx, dy, dz)):
        raise M2OpError("m2.camera.pan requires a non-zero dx, dy or dz")
    for name, v in (('dx', dx), ('dy', dy), ('dz', dz)):
        if abs(v) > PAN_ABS_MAX:
            raise M2OpError(
                f"pan {name}={v} exceeds +/-{PAN_ABS_MAX} world units — units mistake?"
            )

    index = int(cfg.get('index', 0))
    n, ofs_abs = find_cameras(data)
    if index >= n:
        raise M2OpError(f"camera index {index} but model has {n} camera(s)")
    cam = ofs_abs + index * CAMERA_STRIDE
    base = read_m2_header(data)['base_offset']

    # The base vector is only the effective aim if the track adds nothing.
    for label, track_off in (('position', CAMERA_POSITION_TRACK_OFFSET),
                             ('target', CAMERA_TARGET_TRACK_OFFSET)):
        if not _track_is_zero(data, base, cam + track_off):
            raise M2OpError(
                f"camera[{index}] {label} track carries non-zero keys — the base "
                f"vector is not the effective value, so panning it would not move "
                f"the camera as intended"
            )

    at = cam + CAMERA_TARGET_BASE_OFFSET
    before = struct.unpack_from('<3f', data, at)
    after = (before[0] + dx, before[1] + dy, before[2] + dz)
    struct.pack_into('<3f', data, at, *after)

    pos = struct.unpack_from('<3f', data, cam + CAMERA_POSITION_BASE_OFFSET)
    import math as _math
    d_before = _math.dist(pos, before)
    d_after = _math.dist(pos, after)
    return (f"camera[{index}].target "
            f"({before[0]:.4f}, {before[1]:.4f}, {before[2]:.4f}) -> "
            f"({after[0]:.4f}, {after[1]:.4f}, {after[2]:.4f})  "
            f"dist {d_before:.3f} -> {d_after:.3f}")


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
MOGP_HEADER_SIZE = 68
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


def _op_wmo_group_drop_chunk(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Remove one sub-chunk from a WMO group file's MOGP and fix the MOGP size.

    The 3.3.5 client never reads WMO chunk magics — Wow.exe carries no constant
    for MOGP, MOPY, MODR, MOBN or any other — it walks the optional sub-chunks
    after MOBA by position, in the order the group flags imply.  Cataclysm
    inserted MOBS straight after MOBA, so on a raw 4.x group the client reads
    MOBS as MODR, MODR as MOBN, MOBN as MOBR and so on.  The BSP it builds is
    garbage, so it cannot tell the camera is inside an interior group and the
    tower's inner walls vanish (I-370).  Stock 3.3.5 has no MOBS in 8288 groups;
    Open Azeroth's converted Cata WMOs are byte-identical to the 4.3.4 files
    with only MOBS removed.
    """
    name = cfg.get('chunk')
    if not name or len(name) != 4:
        raise M2OpError("wmo.group.drop_chunk requires 'chunk' (4-letter magic, e.g. MOBS)")
    want = name.encode('ascii')

    version = None
    mogp = None
    for magic, ofs, size in _wmo_chunks(data):
        if magic == b'MVER':
            version = struct.unpack_from('<I', data, ofs)[0]
        elif magic == b'MOGP':
            mogp = (ofs, size)
    if version != WMO_VERSION:
        raise M2OpError(f"WMO version {version} — ops are laid out for v{WMO_VERSION}")
    if mogp is None:
        raise M2OpError("no MOGP chunk — drop_chunk needs a WMO group file, not the root")

    mogp_ofs, mogp_size = mogp
    if mogp_ofs + mogp_size != len(data):
        raise M2OpError("MOGP does not end at EOF — truncated or padded group file")

    off = mogp_ofs + MOGP_HEADER_SIZE
    end = mogp_ofs + mogp_size
    while off + 8 <= end:
        magic = bytes(data[off:off + 4])[::-1]
        size = struct.unpack_from('<I', data, off + 4)[0]
        if magic == want:
            del data[off:off + 8 + size]
            struct.pack_into('<I', data, mogp_ofs - 4, mogp_size - 8 - size)
            return f"MOGP.{name} removed ({8 + size} bytes)"
        off += 8 + size

    raise M2OpError(f"no {name} sub-chunk in MOGP")


def _op_bounds_sphere_radius(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set the M2 bounding-sphere radius (header +0xB8).

    WHY: the 3.3.5 client frustum-culls a doodad by this sphere. Cata-era models ship it
    UNDERSIZED - measured median stored/true ratio 0.74 across the Whitemane World/Azeroth
    set and 0.65 across our retroported Lost Isles doodads, against 1.36 for stock 3.3.5
    models (which are deliberately generous). An undersized sphere culls a model while its
    geometry still fills the screen, and it bites hardest CLOSE UP on LARGE models, because
    that is when the sphere centre most easily leaves the frustum while the mesh does not.

    `value` may be a number, or "auto" to recompute from the model's own vertices (the max
    distance from the origin), which is what the field is meant to hold. The bounding BOX
    (+0xA0..+0xB8) is already correct on these models and is left alone.

    Check the I-322 precedent before trusting a bounding-radius theory: a radius correlation
    there was confidently reported and WRONG (the real cause was anim[0].length = 0). That
    was an oversized radius and a model that would not go away - the opposite sign and the
    opposite symptom - but verify in-client on ONE model before sweeping the set.
    """
    _require_wotlk(data, 0)
    n_verts, ofs_verts = struct.unpack_from('<II', data, 0x3C)
    old = struct.unpack_from('<f', data, 0xB8)[0]

    value = cfg.get('value', 'auto')
    auto = isinstance(value, str) and value.lower() == 'auto'
    if auto:
        if n_verts == 0 or ofs_verts + n_verts * 48 > len(data):
            raise M2OpError("m2.bounds.sphere_radius auto: vertex block out of range "
                            f"(n={n_verts}, ofs={ofs_verts}, size={len(data)})")
        best = 0.0
        for i in range(n_verts):
            x, y, z = struct.unpack_from('<3f', data, ofs_verts + i * 48)
            best = max(best, (x * x + y * y + z * z) ** 0.5)
        new = best
    else:
        new = float(value)

    if new <= 0.0:
        raise M2OpError(f"m2.bounds.sphere_radius: refusing a non-positive radius ({new})")
    struct.pack_into('<f', data, 0xB8, new)
    src = f" (auto, from {n_verts} vertices)" if auto else ""
    return f"m2.bounds.sphere_radius: {old:.3f} -> {new:.3f}{src}"



# ---------------------------------------------------------------------------
# Bone / global-flag ops (I-364)
#
# An HD replacement mesh converted down from a modern build can arrive with two
# defects that a WotLK client only trips over when it plays a COMBAT animation,
# which is why they survive casual testing and then hang the client mid-attack
# (the failure mode recorded in I-191):
#
#   * a modern bit left in `globalFlags` that 3.3.5a does not know; the project's
#     own m2_head_rebase.py already masks these to & 0x1F.
#   * a lost `keyBoneId`, so the client cannot resolve a key bone it expects.
#
# Both are pure in-place field writes — no size change, so .skin offsets are safe.

OFS_GLOBAL_FLAGS = 0x10
OFS_N_BONES = 0x2C
OFS_OFS_BONES = 0x30
BONE_STRIDE = 88
BONE_KEYBONE_OFFSET = 0     # int32 keyBoneId
BONE_PARENT_OFFSET = 8      # int16 parent
BONE_PIVOT_OFFSET = 76      # 3 x float


def _op_global_flags_mask(data: bytearray, cfg: Dict[str, Any]) -> str:
    """AND `globalFlags` with a mask, dropping bits a WotLK client cannot read."""
    if 'mask' not in cfg:
        raise M2OpError("m2.global_flags.mask requires 'mask'")
    mask = int(cfg['mask'])
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)

    at = base + OFS_GLOBAL_FLAGS
    before = struct.unpack_from('<I', data, at)[0]
    after = before & mask
    struct.pack_into('<I', data, at, after)
    return f"globalFlags {before:#x} -> {after:#x} (mask {mask:#x})"


def _op_bone_keybone(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set one bone's `keyBoneId`.

    Guarded by `expect_parent_keybone` and `expect_pivot` where given: a bone
    index is only meaningful for the exact mesh the recipe was written against,
    so assert the shape before writing rather than silently tagging the wrong
    bone if an upstream pack changes.
    """
    if 'index' not in cfg or 'value' not in cfg:
        raise M2OpError("m2.bone.keybone requires 'index' and 'value'")
    index, value = int(cfg['index']), int(cfg['value'])

    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    n = struct.unpack_from('<I', data, base + OFS_N_BONES)[0]
    ofs = base + struct.unpack_from('<I', data, base + OFS_OFS_BONES)[0]
    if index >= n:
        raise M2OpError(f"bone index {index} but model has {n} bone(s)")
    if ofs + n * BONE_STRIDE > len(data):
        raise M2OpError(f"bone block runs past EOF ({len(data)})")

    at = ofs + index * BONE_STRIDE

    expect_pivot = cfg.get('expect_pivot')
    if expect_pivot is not None:
        piv = struct.unpack_from('<3f', data, at + BONE_PIVOT_OFFSET)
        tol = float(cfg.get('pivot_tolerance', 0.05))
        if any(abs(a - float(b)) > tol for a, b in zip(piv, expect_pivot)):
            raise M2OpError(
                f"bone {index} pivot {tuple(round(v, 3) for v in piv)} does not match "
                f"expected {tuple(expect_pivot)} within {tol} — wrong bone, refusing"
            )

    expect_pk = cfg.get('expect_parent_keybone')
    if expect_pk is not None:
        parent = struct.unpack_from('<h', data, at + BONE_PARENT_OFFSET)[0]
        if parent < 0 or parent >= n:
            raise M2OpError(f"bone {index} has no parent, expected one with keyBoneId {expect_pk}")
        pk = struct.unpack_from('<i', data, ofs + parent * BONE_STRIDE + BONE_KEYBONE_OFFSET)[0]
        if pk != int(expect_pk):
            raise M2OpError(
                f"bone {index} parent {parent} has keyBoneId {pk}, expected {expect_pk} "
                f"— wrong bone, refusing"
            )

    before = struct.unpack_from('<i', data, at + BONE_KEYBONE_OFFSET)[0]
    struct.pack_into('<i', data, at + BONE_KEYBONE_OFFSET, value)
    return f"bone[{index}].keyBoneId {before} -> {value}"



OFS_N_SEQUENCES = 0x1C
OFS_OFS_SEQUENCES = 0x20
SEQUENCE_STRIDE = 64
SEQ_ANIM_ID_OFFSET = 0      # uint16
SEQ_SUB_ID_OFFSET = 2       # uint16
SEQ_FLAGS_OFFSET = 12       # uint32
SEQ_ALIAS_NEXT_OFFSET = 62  # uint16

SEQ_FLAG_PRIMARY = 0x20     # sequence carries its own bone data
SEQ_FLAG_ALIAS = 0x40       # data lives in the sequence named by aliasNext


def _op_sequence_flags(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set one animation sequence's flags.

    An alias (0x40) with no primary (0x20) anywhere it resolves to leaves the
    client with no sequence that claims to own the data.  I-364: the HD shredder's
    two Attack1H sequences are flagged 0x40 pointing at sequence 54, which is
    flagged 0x0 and whose aliasNext is ITSELF — so resolution never terminates and
    the client hangs the moment an attack plays.  Both attacks in fact carry their
    own data (940 and 835 keyframes), so the repair is to stop lying about it.

    `expect_anim_id` guards the write: sequence indices only mean anything for the
    exact mesh the recipe was written against.
    """
    if 'index' not in cfg or 'value' not in cfg:
        raise M2OpError("m2.sequence.flags requires 'index' and 'value'")
    index, value = int(cfg['index']), int(cfg['value'])

    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    n = struct.unpack_from('<I', data, base + OFS_N_SEQUENCES)[0]
    ofs = base + struct.unpack_from('<I', data, base + OFS_OFS_SEQUENCES)[0]
    if index >= n:
        raise M2OpError(f"sequence index {index} but model has {n} sequence(s)")
    if ofs + n * SEQUENCE_STRIDE > len(data):
        raise M2OpError(f"sequence block runs past EOF ({len(data)})")

    at = ofs + index * SEQUENCE_STRIDE
    anim_id = struct.unpack_from('<H', data, at + SEQ_ANIM_ID_OFFSET)[0]

    expect = cfg.get('expect_anim_id')
    if expect is not None and anim_id != int(expect):
        raise M2OpError(
            f"sequence {index} has animID {anim_id}, expected {expect} — wrong "
            f"sequence, refusing"
        )

    before = struct.unpack_from('<I', data, at + SEQ_FLAGS_OFFSET)[0]
    struct.pack_into('<I', data, at + SEQ_FLAGS_OFFSET, value)
    return f"sequence[{index}] (animID {anim_id}).flags {before:#x} -> {value:#x}"


OFS_N_TEXTURES = 0x50
TEXTURE_STRIDE = 16


def _op_texture_set(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set one texture record's type and/or filename.

    F-216: patch-hd-everything's golemcannonstone combines its skin with a hardcoded texture
    whose filename was lost in conversion (type 0, empty name -> black); its sibling golemstone
    carries the same layer intact as Creature\\Golemstone\\orbreflect02.blp. A new name is
    APPENDED at the end of the file (nothing moves; .skin files index vertices, not file offsets).

    `expect_type` / `expect_name` guard the write: texture indices only mean anything for the exact
    file the recipe was written against.
    """
    if 'index' not in cfg or ('type' not in cfg and 'name' not in cfg):
        raise M2OpError("m2.texture.set requires 'index' and 'type' and/or 'name'")
    index = int(cfg['index'])
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    n, ofs = struct.unpack_from('<II', data, base + OFS_N_TEXTURES)
    if index >= n:
        raise M2OpError(f"texture index {index} but model has {n} texture(s)")
    at = base + ofs + TEXTURE_STRIDE * index
    typ, flags, ln, no = struct.unpack_from('<4I', data, at)
    old_name = bytes(data[base + no:base + no + ln - 1]).decode('latin1') if ln else ''
    if 'expect_type' in cfg and typ != int(cfg['expect_type']):
        raise M2OpError(f"texture {index} is type {typ}, expected {cfg['expect_type']} — wrong file, refusing")
    if 'expect_name' in cfg and old_name != str(cfg['expect_name']):
        raise M2OpError(f"texture {index} is named {old_name!r}, expected {cfg['expect_name']!r} — refusing")
    new_type = int(cfg.get('type', typ))
    if 'name' in cfg:
        raw = str(cfg['name']).encode('latin1') + b'\0'
        while (len(data) - base) % 16:
            data.append(0)
        name_at = len(data) - base
        data += raw
        ln, no = len(raw), name_at
    struct.pack_into('<4I', data, at, new_type, flags, ln, no)
    new_name = cfg.get('name', old_name)
    return f"texture[{index}] type {typ} -> {new_type}, name {old_name!r} -> {new_name!r}"


OFS_N_REPLACEABLE_LOOKUP = 0x68
OFS_N_TEXTURE_LOOKUP = 0x80


def _relocate_array(data: bytearray, base: int, header_at: int, blob: bytes, count: int) -> None:
    """Write an array at the end of the file (16-aligned) and repoint its header (count, offset)."""
    while (len(data) - base) % 16:
        data.append(0)
    struct.pack_into('<II', data, base + header_at, count, len(data) - base)
    data += blob


def _op_texture_add(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Append one texture record: the texture table moves to the end of the file (append-only).

    I-396: the HD lasher samples one creature skin (type 11) on its single submesh; the
    per-region split adds types 12/13 so a display's texture_variation_2/3 colour the other
    parts. A replaceable type (> 0) is also entered in the replaceable-texture lookup (header
    0x68, indexed by type), which grows to cover it. `expect_count` guards the current count.
    """
    if 'type' not in cfg:
        raise M2OpError("m2.texture.add requires 'type'")
    typ, flags = int(cfg['type']), int(cfg.get('flags', 0))
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    n, ofs = struct.unpack_from('<II', data, base + OFS_N_TEXTURES)
    if 'expect_count' in cfg and n != int(cfg['expect_count']):
        raise M2OpError(f"model has {n} texture(s), expected {cfg['expect_count']} — refusing")
    ln = no = 0
    if cfg.get('name'):
        raw = str(cfg['name']).encode('latin1') + b'\0'
        while (len(data) - base) % 16:
            data.append(0)
        ln, no = len(raw), len(data) - base
        data += raw
    table = bytes(data[base + ofs:base + ofs + TEXTURE_STRIDE * n]) + struct.pack('<4I', typ, flags, ln, no)
    _relocate_array(data, base, OFS_N_TEXTURES, table, n + 1)
    note = ''
    if typ > 0:
        rn, ro = struct.unpack_from('<II', data, base + OFS_N_REPLACEABLE_LOOKUP)
        look = list(struct.unpack_from('<%dh' % rn, data, base + ro))
        if typ < rn and look[typ] != -1:
            raise M2OpError(f"replaceable type {typ} already maps to texture {look[typ]} — refusing")
        look += [-1] * (typ + 1 - rn)
        look[typ] = n
        _relocate_array(data, base, OFS_N_REPLACEABLE_LOOKUP, struct.pack('<%dh' % len(look), *look), len(look))
        note = f", replaceable lookup[{typ}] = {n}"
    return f"texture[{n}] added: type {typ}, flags {flags}, name {cfg.get('name', '')!r}{note}"


def _op_texlookup_set(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Replace the texture lookup table (batch textureComboIndex -> texture index), append-only.

    I-396: each split part's batches point their combo at their own (skin N, env layer) pair.
    `expect` guards the current table.
    """
    if 'values' not in cfg:
        raise M2OpError("m2.texlookup.set requires 'values'")
    values = [int(v) for v in cfg['values']]
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    n, ofs = struct.unpack_from('<II', data, base + OFS_N_TEXTURE_LOOKUP)
    before = list(struct.unpack_from('<%dH' % n, data, base + ofs))
    if 'expect' in cfg and before != [int(v) for v in cfg['expect']]:
        raise M2OpError(f"texture lookup is {before}, expected {cfg['expect']} — refusing")
    ntex = struct.unpack_from('<I', data, base + OFS_N_TEXTURES)[0]
    if any(v >= ntex for v in values):
        raise M2OpError(f"texture lookup {values} names a texture past the {ntex} in the model")
    _relocate_array(data, base, OFS_N_TEXTURE_LOOKUP, struct.pack('<%dH' % len(values), *values), len(values))
    return f"texture lookup {before} -> {values}"


OFS_N_VIEWS = 0x44


def _op_views_count(data: bytearray, cfg: Dict[str, Any]) -> str:
    """Set the number of skin profiles (LODs) the model declares.

    F-216: several community-pack models (patch-hd-* drakemount2grand*) declare 2-4 skin profiles but
    ship only <name>00.skin; the client asks for the missing LOD file at distance. Declaring only the
    shipped ones is what the files can support. `expect` guards the current count.
    """
    if 'value' not in cfg:
        raise M2OpError("m2.views.count requires 'value'")
    value = int(cfg['value'])
    base = read_m2_header(data)['base_offset']
    _require_wotlk(data, base)
    before = struct.unpack_from('<I', data, base + OFS_N_VIEWS)[0]
    if 'expect' in cfg and before != int(cfg['expect']):
        raise M2OpError(f"model declares {before} skin profiles, expected {cfg['expect']} — refusing")
    if not 1 <= value <= before:
        raise M2OpError(f"skin profile count {value} must be 1..{before}")
    struct.pack_into('<I', data, base + OFS_N_VIEWS, value)
    return f"skin profiles {before} -> {value}"


# ops that only ever APPEND to the file (allowed to grow it)
APPEND_ONLY = {'m2.texture.set', 'm2.texture.add', 'm2.texlookup.set', 'm2.views.count'}

OPS: Dict[str, Callable[[bytearray, Dict[str, Any]], str]] = {
    'm2.texture.set': _op_texture_set,
    'm2.texture.add': _op_texture_add,
    'm2.texlookup.set': _op_texlookup_set,
    'm2.views.count': _op_views_count,
    'm2.camera.fov': _op_camera_fov,
    'm2.camera.pan': _op_camera_pan,
    'm2.bounds.sphere_radius': _op_bounds_sphere_radius,
    'm2.global_flags.mask': _op_global_flags_mask,
    'm2.bone.keybone': _op_bone_keybone,
    'm2.sequence.flags': _op_sequence_flags,
    'wmo.fog.end': _op_wmo_fog_end,
    'wmo.fog.start_scalar': _op_wmo_fog_start_scalar,
    'wmo.group.drop_chunk': _op_wmo_group_drop_chunk,
}

# BLP texture ops live in their own module (codec-heavy) but share the op
# namespace so model_transforms.json can carry them like any other edit.
from lib.blp_ops import OPS as _BLP_OPS  # noqa: E402

OPS.update(_BLP_OPS)

# ops that read another model / skin (patch_builder passes their bytes as cfg['_donor_model'] / ['_donor_skin'])
from lib.skin_ops import import_vertices as _import_vertices, table_append as _table_append, \
    vertices_slice as _vertices_slice  # noqa: E402

OPS['m2.import_vertices'] = _import_vertices
OPS['m2.table.append'] = _table_append
OPS['m2.vertices.slice'] = _vertices_slice
APPEND_ONLY.update({'m2.import_vertices', 'm2.table.append', 'm2.vertices.slice'})


def apply_ops_bytes(data: bytes, ops: List[Dict[str, Any]]) -> tuple:
    """apply_ops on a buffer: -> (new bytes, descriptions). Same size rules."""
    buf = bytearray(data)
    size_before = len(buf)
    applied = []
    for cfg in ops:
        func = OPS.get(cfg.get('op'))
        if not func:
            raise M2OpError(f"unknown op {cfg.get('op')!r} (known: {', '.join(sorted(OPS))})")
        applied.append(func(buf, cfg))
    if len(buf) != size_before and bytes(buf[:4]) == b'MD20' and \
            not (len(buf) > size_before and all(c.get('op') in APPEND_ONLY for c in ops)):
        raise M2OpError("ops changed the file size — offsets in .skin files would break")
    return bytes(buf), applied


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

    # .skin files hold offsets into the .m2; a WMO group file has nothing pointing into it.
    if len(data) != size_before and bytes(data[:4]) == b'MD20' and \
            not (len(data) > size_before and all(c.get('op') in APPEND_ONLY for c in ops)):
        raise M2OpError("ops changed the file size — offsets in .skin files would break")

    m2_path.write_bytes(bytes(data))
    return applied
