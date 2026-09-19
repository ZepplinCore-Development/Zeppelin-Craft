"""
BLP2 read/write for the wardrobe pipeline.

Pillow decodes DXT BLPs correctly but returns wrong alpha for paletted BLP2
(compression 1) with 8-bit alpha, the format of most 3.3.5 hair/scalp/item
texture components, so compression 1 is decoded here.
"""

import io
import struct

import numpy as np
from PIL import Image


def read_blp(path) -> Image.Image:
    """Decode a BLP to RGBA (mip 0)."""
    d = open(path, 'rb').read()
    if d[:4] != b'BLP2' or d[8] != 1:
        return Image.open(path).convert('RGBA')
    adepth = d[9]
    w, h = struct.unpack('<II', d[12:20])
    offs = struct.unpack('<16I', d[20:84])
    pal = np.frombuffer(d[148:148 + 1024], dtype=np.uint8).reshape(256, 4)  # BGRA
    o, n = offs[0], w * h
    rgb = pal[np.frombuffer(d[o:o + n], dtype=np.uint8)][:, [2, 1, 0]]
    if adepth == 0:
        a = np.full(n, 255, np.uint8)
    elif adepth == 8:
        a = np.frombuffer(d[o + n:o + 2 * n], dtype=np.uint8)
    elif adepth == 1:
        bits = np.unpackbits(np.frombuffer(d[o + n:o + n + (n + 7) // 8], dtype=np.uint8), bitorder='little')[:n]
        a = (bits * 255).astype(np.uint8)
    elif adepth == 4:
        b = np.frombuffer(d[o + n:o + n + (n + 1) // 2], dtype=np.uint8)
        a = np.empty(n, np.uint8)
        a[0::2] = (b & 0xF)[:len(a[0::2])] * 17
        a[1::2] = (b >> 4)[:len(a[1::2])] * 17
    else:
        raise ValueError(f'{path}: unsupported alpha depth {adepth}')
    arr = np.concatenate([rgb, a[:, None]], axis=1).reshape(h, w, 4)
    return Image.fromarray(arr.astype(np.uint8), 'RGBA')


def write_blp_dxt(img: Image.Image, path, pixel_format: str = 'DXT1') -> None:
    """Write a BLP2 (compression 2) with a full mip chain.

    DXT1 -> alphaDepth 0 (opaque bakes, like the HD pack's own NPC bakes);
    DXT5 -> alphaDepth 8 / alphaType 7.
    """
    img = img.convert('RGBA')
    w, h = img.size
    levels, lw, lh, im = [], w, h, img
    while len(levels) < 16:
        buf = io.BytesIO()
        im.save(buf, format='DDS', pixel_format=pixel_format)
        levels.append(buf.getvalue()[128:])
        if lw == 1 and lh == 1:
            break
        lw, lh = max(1, lw // 2), max(1, lh // 2)
        im = img.resize((lw, lh), Image.LANCZOS)
    adepth, atype = (0, 0) if pixel_format == 'DXT1' else (8, 7)
    hdr = bytearray(b'BLP2' + struct.pack('<I', 1) + bytes([2, adepth, atype, 1]) + struct.pack('<II', w, h))
    offs, sizes, o = [], [], 148 + 1024
    for lv in levels:
        offs.append(o)
        sizes.append(len(lv))
        o += len(lv)
    offs += [0] * (16 - len(offs))
    sizes += [0] * (16 - len(sizes))
    hdr += struct.pack('<16I', *offs) + struct.pack('<16I', *sizes) + bytes(1024)
    with open(path, 'wb') as f:
        f.write(bytes(hdr) + b''.join(levels))
