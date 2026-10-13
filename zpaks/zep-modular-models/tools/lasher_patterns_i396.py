#!/usr/bin/env python3
"""I-396: paint the desert lasher's petal pattern textures (lasher_spots.blp, lasher_stripes.blp).

The skin.overlay geosets 102/103 draw one of these over the flower part (texture_variation_2) on a
Mod2x material: grey 128 leaves the skin's colour unchanged, darker greys darken it, so one texture
tints with whatever flower colour a display wears.

Reads the RECIPE OUTPUT (parsed-assets model + skin00, after `zep build patch-mpq -p X --parse`),
because the flower part only exists after skin.uv_split. Each flower UV island (instanced petals
and leaves share one) gets island-local coordinates: t = 0 at its base (the end nearest the stem /
beak parts in 3D) to 1 at its tip, s = -1..1 across its width. Spots thin out and shrink toward the
tip; stripes are five veins that fan out from the base and fade at the tip. Seeded, so a rerun
writes the same files.

Writes palettized BLP2 (256 greys, 8-bit alpha, alpha_type 8, full mip chain) into source-assets.
alpha_type must be 8: with 0 the F-216 viewer engine aborts (memory access out of bounds).

    python3 zpaks/zep-modular-models/tools/lasher_patterns_i396.py [--preview DIR]
"""
import argparse
import collections
import struct
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw

ZPAK = Path(__file__).resolve().parents[1]
PARSED = ZPAK / 'mpq/parsed-assets/CREATURE/DESERTLASHERORCHID_MODULAR'
OUT = ZPAK / 'mpq/source-assets/Creature/desertlasherorchid_modular'
N = 512                                   # the skins are 512x512
FLOWER, OTHER = 2, (0, 1)                 # skin.uv_split submeshes: stem, beak, flower


def load():
    m = (PARSED / 'DESERTLASHERORCHID_MODULAR.M2').read_bytes()
    s = (PARSED / 'DESERTLASHERORCHID_MODULAR00.SKIN').read_bytes()
    arr = lambda b, o: struct.unpack_from('<II', b, o)
    n, o = arr(m, 0x3C)
    pos = np.array([struct.unpack_from('<3f', m, o + 48 * i) for i in range(n)])
    uv = np.array([struct.unpack_from('<2f', m, o + 48 * i + 32) for i in range(n)]) % 1.0
    n, o = arr(s, 4)
    look = struct.unpack_from('<%dH' % n, s, o)
    n, o = arr(s, 12)
    idx = struct.unpack_from('<%dH' % n, s, o)
    n, o = arr(s, 28)
    subs = [struct.unpack_from('<10H', s, o + 48 * j) for j in range(n)]

    def tris(j):
        f = subs[j]
        return [tuple(look[v] for v in idx[t:t + 3]) for t in range(f[4], f[4] + f[5], 3)]
    return pos, uv, tris(FLOWER), sorted({v for j in OTHER for t in tris(j) for v in t})


def island_coords(pos, uv, flower, other):
    """-> T (0 base .. 1 tip), S (-1..1 across), inside mask, all N x N."""
    par = {}

    def find(x):
        while par.setdefault(x, x) != x:
            par[x] = par[par[x]]
            x = par[x]
        return x
    for t in flower:
        a = find(t[0])
        for v in t[1:]:
            par[find(v)] = a
    isl = collections.defaultdict(list)
    for t in flower:
        isl[find(t[0])].append(t)
    by_uv = collections.defaultdict(list)            # instanced petals share one UV island
    for tl in isl.values():
        vs = np.array(sorted({v for t in tl for v in t}))
        by_uv[tuple(np.round(uv[vs].mean(0), 2))].append(vs)
    q_other = pos[np.array(other)]

    def dist_other(vs):
        return np.sqrt(((pos[vs][:, None, :] - q_other[None, :, :]) ** 2).sum(-1)).min(1)
    T = np.zeros((N, N))
    S = np.zeros((N, N))
    inside = np.zeros((N, N), bool)
    for key in sorted(by_uv):
        insts = by_uv[key]
        c = uv[insts[0]]
        cen = c.mean(0)
        _, V = np.linalg.eigh(np.cov((c - cen).T))
        ax, perp = V[:, 1], V[:, 0]
        # base = the end nearest the stem / beak, over every instance
        a_all = np.concatenate([(uv[vs] - cen) @ ax for vs in insts])
        d_all = np.concatenate([dist_other(vs) for vs in insts])
        if np.corrcoef(a_all, d_all)[0, 1] > 0:
            ax = -ax
        a = (c - cen) @ ax
        amin, amax = a.min(), a.max()
        mask = Image.new('L', (N, N))
        draw = ImageDraw.Draw(mask)
        vset = set(insts[0].tolist())
        for t in flower:
            if t[0] in vset:
                draw.polygon([tuple(uv[v] * N) for v in t], fill=255)
        yy, xx = np.nonzero(np.array(mask) > 0)
        q = np.stack([(xx + .5) / N, (yy + .5) / N], 1) - cen
        tt = ((q @ ax) - amin) / (amax - amin)
        ww = q @ perp
        bins = np.clip((tt * 40).astype(int), 0, 39)
        hw = np.array([np.abs(ww[bins == b]).max() if (bins == b).any() else 1e-3 for b in range(40)])
        hw = np.maximum(np.convolve(hw, np.ones(3) / 3, 'same'), 1e-3)
        T[yy, xx] = np.clip(tt, 0, 1)
        S[yy, xx] = np.clip(ww / hw[bins], -1, 1)
        inside[yy, xx] = True
    return T, S, inside


def spots(T, S, inside):
    rng = np.random.default_rng(396)
    mul = np.ones((N, N))
    yy, xx = np.nonzero(inside)
    pts = []
    for i in rng.permutation(len(yy))[:len(yy) // 3]:
        y, x = yy[i], xx[i]
        t = T[y, x]
        if rng.random() > (0.9 * (1 - t) ** 1.6 + 0.05) * 0.3:
            continue
        r = (2.8 + 6.0 * (1 - t) ** 1.3) * rng.uniform(0.75, 1.25)
        if any((y - py) ** 2 + (x - px) ** 2 < (1.15 * (r + pr)) ** 2 for py, px, pr in pts[-400:]):
            continue
        pts.append((y, x, r))
    Y, X = np.mgrid[0:N, 0:N]
    for y, x, r in pts:
        y0, y1 = max(0, int(y - 2 * r) - 1), min(N, int(y + 2 * r) + 2)
        x0, x1 = max(0, int(x - 2 * r) - 1), min(N, int(x + 2 * r) + 2)
        d = np.sqrt((Y[y0:y1, x0:x1] - y) ** 2 + (X[y0:y1, x0:x1] - x) ** 2) / r
        dark = rng.uniform(0.38, 0.58)
        f = np.clip(1.6 - 1.6 * d, 0, 1) ** 0.8               # soft rim
        mul[y0:y1, x0:x1] = np.minimum(mul[y0:y1, x0:x1], 1 - (1 - dark) * f)
    return mul


def stripes(T, S, inside):
    spread = np.minimum(1, 0.25 + 1.1 * T)                    # veins fan out from the base
    width = 0.11 * (1.15 - 0.55 * T)
    fade = np.clip((0.95 - T) / 0.25, 0, 1) * np.clip(T / 0.04, 0, 1)
    acc = np.zeros((N, N))
    for si, k in ((0.0, 0.62), (0.34, 0.55), (-0.34, 0.55), (0.68, 0.48), (-0.68, 0.48)):
        acc = np.maximum(acc, k * np.exp(-((S - si * spread) / width) ** 2))
    mul = 1 - acc * fade
    mul[~inside] = 1
    return mul


def write_blp(path: Path, g: np.ndarray) -> None:
    pal = b''.join(bytes((i, i, i, 255)) for i in range(256))
    mips, im = [], Image.fromarray(g)
    while True:
        a = np.array(im, dtype=np.uint8)
        mips.append(a.tobytes() + b'\xff' * a.size)
        if im.size == (1, 1):
            break
        im = im.resize((max(1, im.size[0] // 2), max(1, im.size[1] // 2)), Image.BOX)
    offs, sizes, off = [], [], 1172
    for b in mips:
        offs.append(off)
        sizes.append(len(b))
        off += len(b)
    offs += [0] * (16 - len(offs))
    sizes += [0] * (16 - len(sizes))
    hdr = (b'BLP2' + struct.pack('<I', 1) + bytes((1, 8, 8, 1)) + struct.pack('<II', *g.shape[::-1])
           + struct.pack('<16I', *offs) + struct.pack('<16I', *sizes) + pal)
    path.write_bytes(hdr + b''.join(mips))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--preview', help='also write PNGs of each pattern over orchid_red here')
    args = ap.parse_args()
    T, S, inside = island_coords(*load())
    for name, fn in (('spots', spots), ('stripes', stripes)):
        g = np.clip(np.round(fn(T, S, inside) * 128), 0, 255).astype(np.uint8)   # Mod2x: 2*128/255 ~ 1
        write_blp(OUT / f'lasher_{name}.blp', g)
        print(f'wrote {OUT / f"lasher_{name}.blp"}')
        if args.preview:
            base = np.array(Image.open(PARSED / 'ORCHID_RED.BLP').convert('RGB')).astype(float)
            Image.fromarray(np.clip(base * (2 * g[..., None].astype(float) / 255), 0, 255).astype(np.uint8)) \
                .save(Path(args.preview) / f'lasher_{name}_orchid_red.png')


if __name__ == '__main__':
    main()
