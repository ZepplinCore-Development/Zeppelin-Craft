"""
Retail item model conversion for the wardrobe pipeline.

The offline WXL downport rewrites the .m2 but passes the .skin through, so modern
env-mapped items keep one batch with shader_id 0x8000 / flags 0x90 and a texture-unit
lookup shorter than the batch reads - they ship invisible in 3.3.5 (F-198 round 1).
`classic_env_batches` rewrites them to the pattern 410 working HD-pack item models use.
"""

import struct
import subprocess
from pathlib import Path
from typing import Dict, List, Tuple

BATCH = '<BbHHHhHHHHHHH'  # flags prio shader sec geo color mat layer texCount texCombo texCoordCombo weight transform
_HERE = Path(__file__).parent


def chunks(data: bytes) -> Dict[str, bytes]:
    out, o = {}, 0
    while o + 8 <= len(data):
        tag = data[o:o + 4].decode('latin1')
        size = struct.unpack_from('<I', data, o + 4)[0]
        out[tag] = data[o + 8:o + 8 + size]
        o += 8 + size
    return out


def modern_refs(m2_path: Path) -> Tuple[List[int], List[int]]:
    """(skin FDIDs, hardcoded TXID FDIDs) of an MD21 model."""
    c = chunks(Path(m2_path).read_bytes())
    arr = lambda b: [x for x in struct.unpack(f'<{len(b) // 4}I', b)] if b else []
    return arr(c.get('SFID', b'')), [x for x in arr(c.get('TXID', b'')) if x]


def attachment_pos(path: Path, attach_id: int):
    """(x, y, z) of an attachment point in an M2 (MD20 file or MD21 container), or None."""
    d = Path(path).read_bytes()
    md = chunks(d)['MD21'] if d[:4] == b'MD21' else d
    n, o = struct.unpack_from('<II', md, 0xF0)
    for i in range(n):
        aid, _bone, x, y, z = struct.unpack_from('<IIfff', md, o + 40 * i)
        if aid == attach_id:
            return (x, y, z)
    return None


def ensure_harness(cache_dir: Path, wxl_core: Path) -> Path:
    """Compile the downport harness against the WXL sources once (g++, ~2 s)."""
    exe = Path(cache_dir) / 'wxl_downport'
    src = _HERE / 'downport_harness.cpp'
    if exe.exists() and exe.stat().st_mtime >= src.stat().st_mtime:
        return exe
    m2dir = wxl_core / 'scripts' / 'wxl-modern-assets' / 'shared' / 'models' / 'm2'
    units = [str(m2dir / f'{n}.cpp') for n in ('Md21', 'Downport', 'Animations', 'Cameras', 'Particles', 'Ribbons', 'Textures')]
    cmd = ['g++', '-std=c++20', '-DWXL_HOST', '-O1', '-I', str(m2dir), '-I', str(wxl_core / 'src'),
           '-I', str(wxl_core / 'scripts' / 'wxl-modern-assets' / 'shared'), '-o', str(exe), str(src)] + units
    subprocess.run(cmd, check=True, capture_output=True, text=True)
    return exe


def downport(harness: Path, src: Path, dst: Path, fdid_paths: Dict[int, str]) -> None:
    """MD21 -> shipped v264 MD20 with hardcoded texture names inlined."""
    dst.parent.mkdir(parents=True, exist_ok=True)
    mapfile = dst.with_suffix('.fdidmap')
    mapfile.write_text(''.join(f'{k};{v}\n' for k, v in fdid_paths.items()))
    try:
        r = subprocess.run([str(harness), str(src), str(dst), str(mapfile)], capture_output=True, text=True)
        if r.returncode != 0 or 'UNRESOLVED' in r.stderr:
            raise RuntimeError(f'downport failed for {src}: {r.stderr.strip() or r.stdout.strip()}')
    finally:
        mapfile.unlink(missing_ok=True)


def _append(buf: bytearray, payload: bytes) -> int:
    while len(buf) % 4:
        buf += b'\0'
    off = len(buf)
    buf += payload
    return off


def classic_env_batches(m2_path: Path, skin_path: Path) -> str:
    """Rewrite a downported item's modern batches into the classic 3.3.5 encoding.

    Modern env-mapped skins carry batches with shader_id 0x8000 and a texture-unit lookup too
    short for the batch's second texture. 3.3.5 wants, per two-texture batch, the pair that
    working HD-pack items use: the diffuse pass, then a second pass through the model's
    env-overlay material (flags 0x10, blend 2).

    The overlay material is looked up in the model rather than assumed to be index 1: on a helm
    material 1 is a mod2x shadow layer, and reusing it painted the whole helm dark; on a buckle
    it drew the diffuse twice (Zeppelin 2026-10-01). Models with no such material get no second
    pass. Every batch also drops the modern shader id and batch flag 0x80.
    """
    m = bytearray(Path(m2_path).read_bytes())
    s = bytearray(Path(skin_path).read_bytes())
    if m[:4] != b'MD20' or struct.unpack_from('<I', m, 4)[0] != 264 or s[:4] != b'SKIN':
        raise ValueError(f'{m2_path}: expects a shipped v264 MD20 + SKIN')
    n_mat, o_mat = struct.unpack_from('<II', m, 0x70)
    materials = [struct.unpack_from('<HH', m, o_mat + 4 * i) for i in range(n_mat)]
    env_mat = next((i for i, (flags, blend) in enumerate(materials) if flags & 0x10 and blend == 2), None)
    nb, ob = struct.unpack_from('<II', s, 0x24)
    batches = [list(struct.unpack_from(BATCH, s, ob + 24 * i)) for i in range(nb)]
    if not any((b[2] & 0x8000) or b[0] & 0x80 or b[8] > 1 for b in batches):
        return 'classic already'

    out, pairs = bytearray(), 0
    for b in batches:
        a = b[:]
        a[0] = (a[0] & ~0x80) | 0x10      # drop the modern batch flag
        a[2] = 0                          # shader id: let the client pick from texCount/materials
        out += struct.pack(BATCH, *a)
        if a[8] == 2 and env_mat is not None:        # diffuse+env batch -> add the overlay pass
            second = a[:]
            second[6], second[7], second[8], second[9], second[10] = env_mat, 1, 1, 0, 0
            out += struct.pack(BATCH, *second)
            pairs += 1
    off = _append(s, bytes(out))
    struct.pack_into('<II', s, 0x24, len(out) // 24, off)

    need = max((b[10] + b[8] for b in batches), default=1)
    n_tul = struct.unpack_from('<I', m, 0x88)[0]
    if n_tul < need:
        lut = struct.pack('<h', 0) + struct.pack('<h', -1) * (need - 1)
        off = _append(m, lut)
        struct.pack_into('<II', m, 0x88, need, off)
    Path(m2_path).write_bytes(m)
    Path(skin_path).write_bytes(s)
    return f'{len(batches)} batch(es) classicised, {pairs} env pair(s), overlay mat {env_mat}'


def skin_geosets(skin_path: Path) -> List[int]:
    d = Path(skin_path).read_bytes()
    n, o = struct.unpack_from('<II', d, 0x1C)
    return sorted({struct.unpack_from('<H', d, o + i * 48)[0] for i in range(n)})
