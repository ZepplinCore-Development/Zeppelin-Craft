"""
M2 Vertex Shifter — shift vertex positions in WoW 3.3.5a M2 model files.

Reads the MD20/MD21 header to locate the vertex block, detects stride,
and applies DX/DY/DZ offsets to every vertex position in-place.
"""

import math
import struct
from pathlib import Path
from typing import Optional


# M2 header: first 68 bytes from base offset (little-endian)
#   0: magic  (4s)  "MD20"
#   4: version (I)
#   8: name_len, name_ofs (II)
#  16: global_flags (I)
#  20: n_globalseq, ofs_globalseq (II)
#  28: n_anims, ofs_anims (II)
#  36: n_animlookup, ofs_animlookup (II)
#  44: n_bones, ofs_bones (II)
#  52: n_keybone_lookup, ofs_keybone_lookup (II)
#  60: n_vertices (I)
#  64: ofs_vertices (I)  — relative to base
HEADER_FMT = '<4sIIIIIIIIIIIIIIII'
HEADER_SIZE = struct.calcsize(HEADER_FMT)  # 68

CANDIDATE_STRIDES = [48, 40, 32]
MIN_VALID_VERTICES = 5
COORD_LIMIT = 100_000.0


def read_m2_header(data: bytes) -> dict:
    """
    Locate the MD20/MD21 header and parse vertex block metadata.

    MD21 wraps MD20 with an 8-byte prefix (tag + size), so the actual
    MD20 header starts at md21_pos + 8.

    Returns dict with keys: base_offset, n_vertices, ofs_vertices_abs.
    Raises ValueError if no valid header found.
    """
    # Prefer MD21 (newer container format)
    pos = data.find(b'MD21')
    if pos >= 0:
        base = pos + 8  # skip MD21 tag (4) + chunk size (4)
    else:
        pos = data.find(b'MD20')
        if pos >= 0:
            base = pos
        else:
            raise ValueError("No MD20 or MD21 magic found in file")

    if base + HEADER_SIZE > len(data):
        raise ValueError(f"File too small for M2 header (need {base + HEADER_SIZE}, have {len(data)})")

    fields = struct.unpack_from(HEADER_FMT, data, base)
    magic = fields[0]
    if magic != b'MD20':
        raise ValueError(f"Expected MD20 at base offset {base}, got {magic!r}")

    n_vertices = fields[15]   # index 15 = offset 60
    ofs_vertices = fields[16]  # index 16 = offset 64

    if n_vertices == 0:
        raise ValueError("M2 has 0 vertices")

    ofs_vertices_abs = base + ofs_vertices

    if ofs_vertices_abs >= len(data):
        raise ValueError(f"Vertex offset {ofs_vertices_abs} beyond file size {len(data)}")

    return {
        'base_offset': base,
        'n_vertices': n_vertices,
        'ofs_vertices_abs': ofs_vertices_abs,
    }


def detect_stride(data: bytes, ofs_vertices_abs: int, n_vertices: int) -> int:
    """
    Detect vertex stride by testing candidates against the data.

    For each candidate stride, reads the first N vertex positions and
    checks that floats are finite and within reasonable coordinate bounds.

    Returns the best-matching stride, or raises ValueError.
    """
    test_count = min(n_vertices, 20)

    for stride in CANDIDATE_STRIDES:
        # Check that the vertex block fits in the file
        block_end = ofs_vertices_abs + (n_vertices * stride)
        if block_end > len(data):
            continue

        valid = 0
        for i in range(test_count):
            ofs = ofs_vertices_abs + (i * stride)
            if ofs + 12 > len(data):
                break
            x, y, z = struct.unpack_from('<fff', data, ofs)
            if (math.isfinite(x) and math.isfinite(y) and math.isfinite(z)
                    and abs(x) < COORD_LIMIT and abs(y) < COORD_LIMIT and abs(z) < COORD_LIMIT):
                valid += 1

        if valid >= min(test_count, MIN_VALID_VERTICES):
            return stride

    raise ValueError(f"Could not detect vertex stride (tried {CANDIDATE_STRIDES})")


def transform_vertices(
    m2_path: Path,
    dx: float = 0.0,
    dy: float = 0.0,
    dz: float = 0.0,
    scale: float = 1.0,
    backup: bool = True,
    output_path: Optional[Path] = None,
) -> int:
    """
    Transform all vertex positions in an M2 file.

    Scale is applied first (around the model's centroid), then shift.

    Args:
        m2_path:     Path to the .m2 file.
        dx, dy, dz:  Offset to add to each vertex position.
        scale:       Uniform scale factor (1.0 = no change).
        backup:      Create a .bak file before overwriting (default True).
        output_path: Write to a different path instead of overwriting.

    Returns:
        Number of vertices transformed.

    Raises:
        FileNotFoundError, ValueError on errors.
    """
    m2_path = Path(m2_path)
    if not m2_path.is_file():
        raise FileNotFoundError(f"M2 file not found: {m2_path}")

    data = bytearray(m2_path.read_bytes())

    header = read_m2_header(data)
    n_verts = header['n_vertices']
    ofs_abs = header['ofs_vertices_abs']

    stride = detect_stride(data, ofs_abs, n_verts)

    # If scaling, compute centroid first
    if scale != 1.0:
        cx, cy, cz = 0.0, 0.0, 0.0
        for i in range(n_verts):
            ofs = ofs_abs + (i * stride)
            x, y, z = struct.unpack_from('<fff', data, ofs)
            cx += x
            cy += y
            cz += z
        cx /= n_verts
        cy /= n_verts
        cz /= n_verts

    # Transform every vertex: scale around centroid, then shift
    for i in range(n_verts):
        ofs = ofs_abs + (i * stride)
        x, y, z = struct.unpack_from('<fff', data, ofs)
        if scale != 1.0:
            x = cx + (x - cx) * scale
            y = cy + (y - cy) * scale
            z = cz + (z - cz) * scale
        struct.pack_into('<fff', data, ofs, x + dx, y + dy, z + dz)

    # Write output
    dest = output_path or m2_path
    if backup and dest == m2_path:
        bak = m2_path.with_suffix(m2_path.suffix + '.bak')
        if not bak.exists():
            m2_path.rename(bak)
        # else keep existing backup untouched

    dest.write_bytes(data)
    return n_verts


# Backwards-compatible alias
shift_vertices = transform_vertices
