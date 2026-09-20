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

    Modern env-mapped item/collection skins carry one batch per geoset with
    shader_id 0x8000, flags 0x90 and texCount 2, and the model's texture-unit lookup
    is too short for the batch's second texture (the read runs past EOF). No working
    3.3.5 item model does either (0/6165 HD-pack item models). Each such batch becomes
    the pair 410 HD-pack models with the same textures (type 2 + type 0 env) use:
        texunit lookup [0, -1]
        A: shader 0, flags 0x10, mat 0, layer 0, texCount 2
        B: shader 0, flags 0x10, mat 1, layer 1, texCount 1
    (a third material, as helms carry, stays unused - 178 working HD-pack helms do the same)
    Batches that are already classic are left alone; anything else aborts.
    """
    m = bytearray(Path(m2_path).read_bytes())
    s = bytearray(Path(skin_path).read_bytes())
    if m[:4] != b'MD20' or struct.unpack_from('<I', m, 4)[0] != 264 or s[:4] != b'SKIN':
        raise ValueError(f'{m2_path}: expects a shipped v264 MD20 + SKIN')
    n_mat = struct.unpack_from('<I', m, 0x70)[0]
    n_tul = struct.unpack_from('<I', m, 0x88)[0]
    nb, ob = struct.unpack_from('<II', s, 0x24)
    batches = [list(struct.unpack_from(BATCH, s, ob + 24 * i)) for i in range(nb)]
    modern = [b for b in batches if b[2] & 0x8000]
    if not modern:
        bad = [b for b in batches if b[10] + b[8] > n_tul]
        if bad:
            raise ValueError(f'{skin_path}: classic batches read past the texunit lookup ({n_tul})')
        return 'classic already'
    if n_mat < 2 or any(b[2] != 0x8000 or b[8] != 2 or b[10] != 0 for b in modern):
        raise ValueError(f'{skin_path}: unhandled modern batch layout {modern} (materials={n_mat})')
    out = bytearray()
    for b in batches:
        if not (b[2] & 0x8000):
            out += struct.pack(BATCH, *b)
            continue
        a = b[:]
        a[0], a[2] = 0x10, 0
        second = a[:]
        second[6], second[7], second[8], second[9], second[10] = 1, 1, 1, 0, 0
        out += struct.pack(BATCH, *a) + struct.pack(BATCH, *second)
    off = _append(s, bytes(out))
    struct.pack_into('<II', s, 0x24, len(out) // 24, off)
    if n_tul < 2:
        off = _append(m, struct.pack('<hh', 0, -1))
        struct.pack_into('<II', m, 0x88, 2, off)
    Path(m2_path).write_bytes(m)
    Path(skin_path).write_bytes(s)
    return f'{len(modern)} x 0x8000 batch -> classic pairs'


def skin_geosets(skin_path: Path) -> List[int]:
    d = Path(skin_path).read_bytes()
    n, o = struct.unpack_from('<II', d, 0x1C)
    return sorted({struct.unpack_from('<H', d, o + i * 48)[0] for i in range(n)})
