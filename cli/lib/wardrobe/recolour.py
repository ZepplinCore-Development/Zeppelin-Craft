"""F-220: recolour an item texture to a rider's own colours (match by pattern, then colour-swap).

The rider skin is a classic-layout composite; each item region texture is mapped to the same region of it
in CIE Lab, in two tones: the item's darker and brighter halves (split at its median lightness) each take
the mean / spread of the matching half of the target, blended smoothly across the split - so trim stays
lighter than plate while both move to the rider's palette.
"""
from typing import Tuple

import numpy as np
from PIL import Image

# classic 256 layout: region -> (x, y, w, h)
REGION_RECT = {'ArmUpper': (0, 0, 128, 64), 'ArmLower': (0, 64, 128, 64), 'Hand': (0, 128, 128, 32),
               'TorsoUpper': (128, 0, 128, 64), 'TorsoLower': (128, 64, 128, 32), 'LegUpper': (128, 96, 128, 64),
               'LegLower': (128, 160, 128, 64), 'Foot': (128, 224, 128, 32)}
_M = np.array([[0.4124, 0.2126, 0.0193], [0.3576, 0.7152, 0.1192], [0.1805, 0.0722, 0.9505]])
_W = np.array([0.95047, 1.0, 1.08883])


def rgb2lab(rgb: np.ndarray) -> np.ndarray:
    c = rgb / 255.0
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = (c @ _M) / _W
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.stack([116 * f[..., 1] - 16, 500 * (f[..., 0] - f[..., 1]), 200 * (f[..., 1] - f[..., 2])], -1)


def lab2rgb(lab: np.ndarray) -> np.ndarray:
    fy = (lab[..., 0] + 16) / 116
    fx, fz = fy + lab[..., 1] / 500, fy - lab[..., 2] / 200
    f = lambda t: np.where(t ** 3 > 0.008856, t ** 3, (t - 16 / 116) / 7.787)
    xyz = np.stack([f(fx), f(fy), f(fz)], -1) * _W
    c = xyz @ np.linalg.inv(_M)
    c = np.where(c > 0.0031308, 1.055 * np.clip(c, 0, None) ** (1 / 2.4) - 0.055, 12.92 * c)
    return np.clip(c * 255, 0, 255)


def _stats(lab: np.ndarray, mask: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    v = lab[mask]
    if len(v) < 4:
        v = lab.reshape(-1, 3)
    return v.mean(0), v.std(0) + 1e-3


def recolour(item: Image.Image, target: Image.Image, region: str) -> Image.Image:
    """item: an item region texture (RGBA); target: the rider skin (classic layout, any size)."""
    x, y, w, h = REGION_RECT[region]
    sx, sy = target.width / 256, target.height / 256
    tgt = np.asarray(target.convert('RGB').crop((int(x * sx), int(y * sy), int((x + w) * sx), int((y + h) * sy))),
                     dtype=np.float64)
    a = np.asarray(item.convert('RGBA'), dtype=np.float64)
    S, T = rgb2lab(a[..., :3]), rgb2lab(tgt)
    sm = a[..., 3] > 128
    if sm.sum() < 4:
        return item
    ls, lt = np.median(S[..., 0][sm]), np.median(T[..., 0])
    out = np.zeros_like(S)
    maps = []
    for lo in (True, False):
        ms = sm & ((S[..., 0] <= ls) if lo else (S[..., 0] > ls))
        mt = (T[..., 0] <= lt) if lo else (T[..., 0] > lt)
        (mu_s, sd_s), (mu_t, sd_t) = _stats(S, ms), _stats(T, mt)
        r = np.clip(sd_t / sd_s, 0.5, 2.0)
        maps.append((S - mu_s) * r + mu_t)
    k = max(2.0, float(S[..., 0][sm].std()) * 0.25)
    wgt = 1 / (1 + np.exp(-(S[..., 0] - ls) / k))
    out = maps[0] * (1 - wgt[..., None]) + maps[1] * wgt[..., None]
    rgb = lab2rgb(out)
    return Image.fromarray(np.dstack([rgb, a[..., 3]]).astype(np.uint8), 'RGBA')
