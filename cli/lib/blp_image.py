"""BLP2 <-> numpy image helpers for the minimap generator (F-217).

`blp_ops` edits existing BLPs in place; this reads one into an RGB array and
writes a new one in the exact layout the stock minimap tiles use:
BLP2, type 1, compression 2 (DXT), alpha_depth 1, alpha_type 0, no mipmaps -
so a 256x256 tile is 1172 + 32768 = 33940 bytes, byte-for-byte the stock shape.
"""
import struct
from pathlib import Path

import numpy as np

HEADER = 1172


def decode_blp_rgb(path) -> np.ndarray:
    """Decode mip 0 of a BLP2 into an (h, w, 3) uint8 array."""
    b = Path(path).read_bytes()
    if b[:4] != b"BLP2":
        raise ValueError(f"not BLP2: {path}")
    compression, alpha_depth, alpha_type = b[8], b[9], b[10]
    w, h = struct.unpack_from("<II", b, 12)
    offs = struct.unpack_from("<16I", b, 20)
    sizes = struct.unpack_from("<16I", b, 84)
    pal = b[148:148 + 1024]
    data = b[offs[0]:offs[0] + sizes[0]]
    if compression == 1:
        idx = np.frombuffer(data[:w * h], dtype=np.uint8)
        p = np.frombuffer(pal, dtype=np.uint8).reshape(256, 4)
        return p[idx][:, [2, 1, 0]].reshape(h, w, 3).copy()
    if compression == 3:
        a = np.frombuffer(data[:w * h * 4], dtype=np.uint8).reshape(h, w, 4)
        return a[:, :, [2, 1, 0]].copy()
    if compression != 2:
        raise ValueError(f"unsupported compression {compression}")
    bpb = 8 if alpha_type == 0 else 16
    img = np.zeros((h, w, 3), dtype=np.uint8)
    pos = 0
    for by in range(0, h, 4):
        for bx in range(0, w, 4):
            blk = data[pos:pos + bpb]; pos += bpb
            cb = blk[bpb - 8:]
            c0, c1 = struct.unpack_from("<HH", cb, 0)
            bits, = struct.unpack_from("<I", cb, 4)
            def rgb(c):
                return (((c >> 11) & 31) * 255 // 31, ((c >> 5) & 63) * 255 // 63,
                        (c & 31) * 255 // 31)
            cols = [rgb(c0), rgb(c1)]
            if c0 > c1 or alpha_type != 0:
                cols.append(tuple((2 * cols[0][i] + cols[1][i]) // 3 for i in range(3)))
                cols.append(tuple((cols[0][i] + 2 * cols[1][i]) // 3 for i in range(3)))
            else:
                cols.append(tuple((cols[0][i] + cols[1][i]) // 2 for i in range(3)))
                cols.append((0, 0, 0))
            for yy in range(4):
                for xx in range(4):
                    if by + yy < h and bx + xx < w:
                        img[by + yy, bx + xx] = cols[(bits >> (2 * (4 * yy + xx))) & 3]
    return img


def _encode_dxt1(img: np.ndarray, alpha: np.ndarray = None) -> bytes:
    """Encode HxWx3 into DXT1 blocks using the 1-bit-alpha (c0 <= c1) layout.

    Stock minimap tiles declare alpha_depth 1 and use the c0 <= c1 three-colour
    layout in **100%** of their blocks. Writing the opaque c0 > c1 layout into a
    file that declares alpha is a combination the client never ships, and it
    crashed the client on entry to the Cleft of Shadow (#132, null deref). So:
    always emit c0 <= c1.

    Index 3 in that layout is TRANSPARENT, and it matters enormously: a tile's
    padding must be transparent or it paints over the neighbouring tiles. Stock
    tiles are 46-94% transparent pixels. Emitting fully opaque tiles (0%) made
    each tile's black cell occlude whatever was drawn under it - in game the
    corridor's tile wiped out the room next to it as you walked between them,
    which read as the map "popping in and out" (I-371).

    `alpha` is an HxW bool array, True where the texel is opaque. Where it is
    False the texel is written as index 3 and disappears.
    """
    h, w = img.shape[:2]
    if alpha is None:
        alpha = img.sum(axis=2) > 24
    out = bytearray()
    for by in range(0, h, 4):
        for bx in range(0, w, 4):
            blk = img[by:by + 4, bx:bx + 4].reshape(-1, 3).astype(np.int32)
            opq = alpha[by:by + 4, bx:bx + 4].reshape(-1)
            if not opq.any():
                # wholly transparent block: still a valid c0 <= c1 block, all index 3
                out += struct.pack("<HHI", 0, 0, 0xFFFFFFFF)
                continue
            vis = blk[opq]
            lo, hi = vis.min(axis=0), vis.max(axis=0)

            def pack(c):
                return ((int(c[0]) >> 3) << 11) | ((int(c[1]) >> 2) << 5) | (int(c[2]) >> 3)

            a, b = pack(lo), pack(hi)
            # 1-bit-alpha layout requires c0 <= c1
            if a > b:
                a, b = b, a
                lo, hi = hi, lo
            # ramp for c0 <= c1: c0, c1, (c0+c1)/2, transparent
            ramp = np.array([lo, hi, (lo + hi) // 2], dtype=np.int32)
            idx = ((blk[:, None, :] - ramp[None, :, :]) ** 2).sum(axis=2).argmin(axis=1)
            idx = np.where(opq, idx, 3)
            bits = 0
            for i, v in enumerate(idx):
                bits |= int(v) << (2 * i)
            out += struct.pack("<HHI", a, b, bits)
    return bytes(out)


def write_minimap_blp(path, img: np.ndarray) -> int:
    """Write an (h, w, 3) uint8 array as a stock-layout BLP2/DXT1 minimap tile."""
    h, w = img.shape[:2]
    if w % 4 or h % 4:
        raise ValueError("dimensions must be multiples of 4")
    data = _encode_dxt1(img)
    offs = [0] * 16
    sizes = [0] * 16
    offs[0], sizes[0] = HEADER, len(data)
    hdr = bytearray(b"BLP2")
    hdr += struct.pack("<I", 1)
    hdr += bytes([2, 1, 0, 0])
    hdr += struct.pack("<II", w, h)
    hdr += struct.pack("<16I", *offs)
    hdr += struct.pack("<16I", *sizes)
    hdr += bytes(1024)
    Path(path).write_bytes(bytes(hdr) + data)
    return HEADER + len(data)
