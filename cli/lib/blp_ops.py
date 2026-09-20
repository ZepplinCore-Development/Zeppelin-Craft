"""
BLP edit ops — declarative, replayable edits to WoW 3.3.5a BLP2 textures (F-203).

Registered into `m2_ops.OPS` so `model_transforms.json` can carry them exactly
like the M2/WMO ops.

The op that lives here is `blp.alpha_bleed` (I-372).  Alpha-tested foliage
textures must have their opaque RGB *dilated* into the fully transparent
texels.  The client's alpha test plus bilinear/mip filtering pulls neighbouring
texels in, so whatever colour sits under the transparent area bleeds into every
texel that survives the cutoff.  Blizzard always bleeds the art outward, which
is why a stock ground-clutter atlas draws 0% black at every mip level; an
upscaler that leaves the transparent region pure black makes the clutter render
as black cards with patches of art.

Only RGB changes.  For DXT3/DXT5 the alpha half of each block is copied through
byte-for-byte, so alpha is bit-exact by construction and the file keeps its
original encoding, dimensions and mip count.
"""

import struct
from typing import Any, Dict, List, Optional, Tuple

BLP_MAGIC = b'BLP2'

COLOR_PAL = 1
COLOR_DXT = 2
COLOR_ARGB = 3

ALPHA_DXT1 = 0
ALPHA_DXT3 = 1
ALPHA_DXT5 = 7

HEADER_SIZE = 20
MIP_COUNT = 16
OFS_MIP_OFFSETS = 20
OFS_MIP_SIZES = 20 + MIP_COUNT * 4
PALETTE_OFFSET = 20 + MIP_COUNT * 4 * 2  # 148

# A texel at or above this alpha is "kept" by the client's alpha test and is
# therefore a legitimate source colour to bleed outward.
DEFAULT_THRESHOLD = 128


class BlpOpError(Exception):
    """A BLP op could not be applied to this file."""


# --------------------------------------------------------------------------
# header
# --------------------------------------------------------------------------

class BlpHeader:
    __slots__ = ('color_type', 'alpha_depth', 'alpha_type', 'has_mips',
                 'width', 'height', 'mip_offsets', 'mip_sizes')

    def __init__(self, data: bytes):
        if bytes(data[:4]) != BLP_MAGIC:
            raise BlpOpError(f"not a BLP2 file (magic {bytes(data[:4])!r})")
        _, ct, ad, at, hm = struct.unpack_from('<IBBBB', data, 4)
        self.color_type = ct
        self.alpha_depth = ad
        self.alpha_type = at
        self.has_mips = hm
        self.width, self.height = struct.unpack_from('<II', data, 12)
        self.mip_offsets = list(struct.unpack_from('<16I', data, OFS_MIP_OFFSETS))
        self.mip_sizes = list(struct.unpack_from('<16I', data, OFS_MIP_SIZES))

    def levels(self) -> List[Tuple[int, int, int, int, int]]:
        """(level, offset, size, width, height) for each stored mip."""
        out = []
        for i in range(MIP_COUNT):
            if self.mip_sizes[i] == 0:
                continue
            w = max(1, self.width >> i)
            h = max(1, self.height >> i)
            out.append((i, self.mip_offsets[i], self.mip_sizes[i], w, h))
        return out


# --------------------------------------------------------------------------
# DXT colour block codec
# --------------------------------------------------------------------------

def _unpack565(v: int) -> Tuple[int, int, int]:
    return (((v >> 11) & 31) * 255 // 31,
            ((v >> 5) & 63) * 255 // 63,
            (v & 31) * 255 // 31)


def _pack565(c: Tuple[int, int, int]) -> int:
    r = min(31, max(0, (c[0] * 31 + 127) // 255))
    g = min(63, max(0, (c[1] * 63 + 127) // 255))
    b = min(31, max(0, (c[2] * 31 + 127) // 255))
    return (r << 11) | (g << 5) | b


def _decode_colour_block(block: bytes, four_colour_only: bool) -> List[Tuple[int, int, int]]:
    c0, c1 = struct.unpack_from('<HH', block, 0)
    idx = struct.unpack_from('<I', block, 4)[0]
    a, b = _unpack565(c0), _unpack565(c1)
    palette = [a, b]
    if four_colour_only or c0 > c1:
        palette.append(tuple((2 * a[k] + b[k]) // 3 for k in range(3)))
        palette.append(tuple((a[k] + 2 * b[k]) // 3 for k in range(3)))
    else:
        palette.append(tuple((a[k] + b[k]) // 2 for k in range(3)))
        palette.append((0, 0, 0))
    return [palette[(idx >> (2 * j)) & 3] for j in range(16)]


def _encode_colour_block(texels: List[Tuple[int, int, int]]) -> bytes:
    """Fit 16 RGB texels with a 4-colour DXT1 block.

    Endpoints come from the extremes along the principal axis, then two
    refinement passes re-solve the endpoints by least squares against the
    current index assignment.  DXT4/5 always reads the colour half in
    4-colour mode, so c0 > c1 is enforced.
    """
    lo = [min(t[k] for t in texels) for k in range(3)]
    hi = [max(t[k] for t in texels) for k in range(3)]
    if lo == hi:
        # Flat block — a single colour, every index 0.
        v = _pack565(tuple(lo))
        # c0 must be > c1 for 4-colour mode; if packing collides, nudge c1 down.
        c0, c1 = v, v
        if c0 == 0:
            c0 = 1  # keep c0 > c1 == 0
        else:
            c1 = c0 - 1
        return struct.pack('<HHI', c0, c1, 0)

    mean = [sum(t[k] for t in texels) / 16.0 for k in range(3)]
    # Principal axis by power iteration on the 3x3 covariance.
    cov = [[0.0] * 3 for _ in range(3)]
    for t in texels:
        d = [t[k] - mean[k] for k in range(3)]
        for i in range(3):
            for j in range(3):
                cov[i][j] += d[i] * d[j]
    axis = [hi[k] - lo[k] for k in range(3)]
    for _ in range(8):
        nxt = [sum(cov[i][j] * axis[j] for j in range(3)) for i in range(3)]
        norm = max(abs(v) for v in nxt)
        if norm < 1e-9:
            break
        axis = [v / norm for v in nxt]

    proj = [sum((t[k] - mean[k]) * axis[k] for k in range(3)) for t in texels]
    imin, imax = proj.index(min(proj)), proj.index(max(proj))
    ep0, ep1 = list(texels[imax]), list(texels[imin])

    def build(e0, e1):
        a, b = tuple(int(round(v)) for v in e0), tuple(int(round(v)) for v in e1)
        return [a, b,
                tuple((2 * a[k] + b[k]) // 3 for k in range(3)),
                tuple((a[k] + 2 * b[k]) // 3 for k in range(3))]

    indices = [0] * 16
    for _ in range(2):
        pal = build(ep0, ep1)
        for j, t in enumerate(texels):
            best, bd = 0, None
            for p in range(4):
                d = sum((t[k] - pal[p][k]) ** 2 for k in range(3))
                if bd is None or d < bd:
                    best, bd = p, d
            indices[j] = best
        # Least-squares re-solve: weights 1, 0, 2/3, 1/3 on endpoint 0.
        w = (1.0, 0.0, 2.0 / 3.0, 1.0 / 3.0)
        a11 = a12 = a22 = 0.0
        b1 = [0.0] * 3
        b2 = [0.0] * 3
        for j, t in enumerate(texels):
            x = w[indices[j]]
            y = 1.0 - x
            a11 += x * x
            a12 += x * y
            a22 += y * y
            for k in range(3):
                b1[k] += x * t[k]
                b2[k] += y * t[k]
        det = a11 * a22 - a12 * a12
        if abs(det) < 1e-9:
            break
        ep0 = [max(0.0, min(255.0, (a22 * b1[k] - a12 * b2[k]) / det)) for k in range(3)]
        ep1 = [max(0.0, min(255.0, (a11 * b2[k] - a12 * b1[k]) / det)) for k in range(3)]

    c0 = _pack565(tuple(int(round(v)) for v in ep0))
    c1 = _pack565(tuple(int(round(v)) for v in ep1))
    if c0 == c1:
        if c1 > 0:
            c1 -= 1
        else:
            c0 += 1
    swapped = c0 < c1
    if swapped:
        c0, c1 = c1, c0

    pal = [_unpack565(c0), _unpack565(c1)]
    pal.append(tuple((2 * pal[0][k] + pal[1][k]) // 3 for k in range(3)))
    pal.append(tuple((pal[0][k] + 2 * pal[1][k]) // 3 for k in range(3)))
    idx = 0
    for j, t in enumerate(texels):
        best, bd = 0, None
        for p in range(4):
            d = sum((t[k] - pal[p][k]) ** 2 for k in range(3))
            if bd is None or d < bd:
                best, bd = p, d
        idx |= best << (2 * j)
    return struct.pack('<HHI', c0, c1, idx)


def _block_alpha(block: bytes, alpha_type: int) -> List[int]:
    """Per-texel alpha from the 8-byte alpha half of a DXT3/DXT5 block."""
    if alpha_type == ALPHA_DXT3:
        return [((block[j >> 1] >> (4 * (j & 1))) & 0xF) * 17 for j in range(16)]
    a0, a1 = block[0], block[1]
    bits = int.from_bytes(block[2:8], 'little')
    out = []
    for j in range(16):
        c = (bits >> (3 * j)) & 7
        if c == 0:
            out.append(a0)
        elif c == 1:
            out.append(a1)
        elif a0 > a1:
            out.append(((8 - c) * a0 + (c - 1) * a1) // 7)
        elif c == 6:
            out.append(0)
        elif c == 7:
            out.append(255)
        else:
            out.append(((6 - c) * a0 + (c - 1) * a1) // 5)
    return out


# --------------------------------------------------------------------------
# dilation
# --------------------------------------------------------------------------

def _dilate(rgb: List[Optional[Tuple[int, int, int]]], w: int, h: int) -> int:
    """Flood known colours outward over the None texels.  Returns texels filled.

    Repeated 4-neighbour passes, each filling only texels adjacent to an
    already-known one and averaging those neighbours, i.e. a nearest-known
    colour fill.  Runs until nothing is left or nothing more can be reached.
    """
    unknown = [i for i, v in enumerate(rgb) if v is None]
    if not unknown or len(unknown) == len(rgb):
        return 0
    filled = 0
    while unknown:
        pending = []
        nxt = []
        for i in unknown:
            x, y = i % w, i // w
            acc = [0, 0, 0]
            n = 0
            for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nx, ny = x + dx, y + dy
                if 0 <= nx < w and 0 <= ny < h:
                    v = rgb[ny * w + nx]
                    if v is not None:
                        acc[0] += v[0]
                        acc[1] += v[1]
                        acc[2] += v[2]
                        n += 1
            if n:
                pending.append((i, (acc[0] // n, acc[1] // n, acc[2] // n)))
            else:
                nxt.append(i)
        if not pending:
            break  # nothing reachable — image is entirely transparent
        for i, v in pending:
            rgb[i] = v
            filled += 1
        unknown = nxt
    return filled


# --------------------------------------------------------------------------
# the op
# --------------------------------------------------------------------------

def _op_alpha_bleed(data: bytearray, cfg: Dict[str, Any]) -> str:
    threshold = int(cfg.get('threshold', DEFAULT_THRESHOLD))
    hdr = BlpHeader(data)

    if hdr.color_type != COLOR_DXT:
        raise BlpOpError(
            f"colorType {hdr.color_type} not supported (only DXT, colorType {COLOR_DXT})")
    if hdr.alpha_depth in (0, 1) or hdr.alpha_type not in (ALPHA_DXT3, ALPHA_DXT5):
        raise BlpOpError(
            f"needs an 8-bit DXT3/DXT5 alpha channel "
            f"(alphaDepth={hdr.alpha_depth}, alphaType={hdr.alpha_type}) — "
            "nothing to bleed into")

    total_filled = 0
    levels = 0
    for _lvl, offset, size, w, h in hdr.levels():
        bw, bh = max(1, w // 4), max(1, h // 4)
        nblocks = bw * bh
        if nblocks * 16 > size:
            break  # truncated / sub-4px tail, leave it alone

        # Decode this level into a flat RGB + alpha image.
        rgb: List[Optional[Tuple[int, int, int]]] = [None] * (bw * 4 * bh * 4)
        alpha = [0] * (bw * 4 * bh * 4)
        iw = bw * 4
        for bi in range(nblocks):
            block = data[offset + bi * 16: offset + bi * 16 + 16]
            av = _block_alpha(block, hdr.alpha_type)
            cv = _decode_colour_block(block[8:16], four_colour_only=True)
            bx, by = (bi % bw) * 4, (bi // bw) * 4
            for j in range(16):
                x, y = bx + (j % 4), by + (j // 4)
                p = y * iw + x
                alpha[p] = av[j]
                rgb[p] = cv[j] if av[j] >= threshold else None

        filled = _dilate(rgb, iw, bh * 4)
        if not filled:
            continue
        total_filled += filled
        levels += 1

        # Re-encode colour halves; alpha halves are copied through untouched.
        for bi in range(nblocks):
            bx, by = (bi % bw) * 4, (bi // bw) * 4
            texels = []
            for j in range(16):
                x, y = bx + (j % 4), by + (j // 4)
                v = rgb[y * iw + x]
                texels.append(v if v is not None else (0, 0, 0))
            enc = _encode_colour_block(texels)
            base = offset + bi * 16 + 8
            data[base:base + 8] = enc

    if not total_filled:
        return "blp.alpha_bleed: nothing to bleed (no transparent texels)"
    return (f"blp.alpha_bleed: dilated RGB into {total_filled} transparent texels "
            f"across {levels} mip level(s), alpha untouched")


OPS: Dict[str, Any] = {
    'blp.alpha_bleed': _op_alpha_bleed,
}
