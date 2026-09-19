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
    """Rewrite a downported item's 0x8000 env batch into the classic 2-batch encoding.

    texunit lookup [0,-1]; batch A shader 0 flags 0x10 mat0 layer0 texCount2;
    batch B mat1 layer1 texCount1. Returns a short description of what changed.
    """
    m = bytearray(Path(m2_path).read_bytes())
    s = bytearray(Path(skin_path).read_bytes())
    if m[:4] != b'MD20' or struct.unpack_from('<I', m, 4)[0] != 264 or s[:4] != b'SKIN':
        raise ValueError(f'{m2_path}: expects a shipped v264 MD20 + SKIN')
    n_mat = struct.unpack_from('<I', m, 0x70)[0]
    n_tul = struct.unpack_from('<I', m, 0x88)[0]
    nb, ob = struct.unpack_from('<II', s, 0x24)
    batches = [list(struct.unpack_from(BATCH, s, ob + 24 * i)) for i in range(nb)]
    if not any(b[2] & 0x8000 for b in batches):
        bad = [b for b in batches if b[10] + b[8] > n_tul]
        if bad:
            raise ValueError(f'{skin_path}: classic batches read past the texunit lookup ({n_tul})')
        return 'classic already'
    if nb != 1 or batches[0][2] != 0x8000 or batches[0][8] != 2 or n_mat != 2:
        raise ValueError(f'{skin_path}: unhandled modern batch layout {batches} (materials={n_mat})')
    a = batches[0][:]
    a[0], a[2] = 0x10, 0
    b = a[:]
    b[6], b[7], b[8], b[9], b[10] = 1, 1, 1, 0, 0
    off = _append(s, struct.pack(BATCH, *a) + struct.pack(BATCH, *b))
    struct.pack_into('<II', s, 0x24, 2, off)
    off = _append(m, struct.pack('<hh', 0, -1))
    struct.pack_into('<II', m, 0x88, 2, off)
    Path(m2_path).write_bytes(m)
    Path(skin_path).write_bytes(s)
    return '0x8000 env batch -> classic 2-batch'


def skin_geosets(skin_path: Path) -> List[int]:
    d = Path(skin_path).read_bytes()
    n, o = struct.unpack_from('<II', d, 0x1C)
    return sorted({struct.unpack_from('<H', d, o + i * 48)[0] for i in range(n)})
