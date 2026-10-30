"""F-030: the worgen Hair Color mane textures (M2 texture type 6), both sexes.

The worgen M2s drew the mane, hair styles and beards with the skin's _Extra (type 8), so the mane followed skin colour
and Hair Color did nothing to it. mod-worgoblin `model_transforms.json` adds a type-6 texture to both models and moves
every fur batch of the _Extra onto it (the mouth, teeth and braid bands / wraps stay on _Extra). The type-6 texture is
the CharSections hair row's texture_1 (base_section 3, `ReplaceHairTexture`), one per hair colour; every style of a
colour uses the same file (mod-worgoblin/dbc/[F-030]_charsections.sql).

Each mane texture is the sex's colour-0 _Extra atlas (same UV layout as the model's type-8 texture) with its fur moved
to the hair colour's face fur: the male Hair Color face-fur layers (Male/WorgenMaleHairLower|Upper00_0N.blp, keyed by
worgen_male_hair_colour.py) give the target colour per hair colour, so mane and face fur keep one tone. The move is a
CIE Lab statistics transfer (the atlas fur's brightness detail scaled to the face fur's spread and centred on its mean;
the atlas's own tint mostly dropped), never a per-channel gain. The female has no face fur; she gets the same five
colours so a hair colour reads the same on both sexes.

  python3 "Scripts/Character Skins/worgen_mane_colour.py"

Writes Character/Worgen/{Male/WorgenMaleMane00_0N, Female/WorgenFemaleMane00_0N}.blp (palettized BLP2 + 8-bit alpha)
into mod-worgoblin source-assets and deletes any stale parsed-assets copy.
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from lib.wardrobe.blp import read_blp  # noqa: E402
from subrace_icons import write_blp_rgba  # noqa: E402

ZPAK = CRAFT / 'zpaks' / 'mod-worgoblin' / 'mpq'
WORGEN = ZPAK / 'source-assets' / 'Character' / 'Worgen'
PARSED = ZPAK / 'parsed-assets' / 'CHARACTER' / 'WORGEN'
COLOURS = 5
CHROMA_KEEP = 0.35          # how much of the atlas's own tint survives (its grey-blue cast would tint every colour)
# atlas regions (u0, v0, u1, v1) that are not fur: the model recipe keeps them on _Extra, so they are copied as they are
NOT_FUR = {'male': [(0.0, 0.10, 0.18, 0.66)], 'female': [(0.80, 0.10, 1.0, 0.66)]}
BANDS = [(0.44, 0.90, 0.72, 1.0), (0.72, 0.86, 0.84, 1.0)]
SEXES = {'male': ('male', 'worgenmaleskin00_00_extra.blp', 'WorgenMaleMane00_{:02d}.blp'),
         'female': ('female', 'worgenfemaleskin00_00_extra.blp', 'WorgenFemaleMane00_{:02d}.blp')}

M_XYZ = np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]])
WHITE = np.array([0.95047, 1.0, 1.08883])


def lab(rgb):
    """sRGB 0-255 (..., 3) -> CIE Lab (D65) (..., 3)."""
    c = np.asarray(rgb, np.float64) / 255
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = c @ M_XYZ.T / WHITE
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.stack([116 * f[..., 1] - 16, 500 * (f[..., 0] - f[..., 1]), 200 * (f[..., 1] - f[..., 2])], -1)


def rgb_of(L):
    """CIE Lab (..., 3) -> sRGB 0-255."""
    fy = (L[..., 0] + 16) / 116
    f = np.stack([fy + L[..., 1] / 500, fy, fy - L[..., 2] / 200], -1)
    xyz = np.where(f ** 3 > 0.008856, f ** 3, (f - 16 / 116) / 7.787) * WHITE
    c = xyz @ np.linalg.inv(M_XYZ).T
    c = np.where(c > 0.0031308, 1.055 * np.clip(c, 0, None) ** (1 / 2.4) - 0.055, 12.92 * c)
    return np.clip(c * 255, 0, 255)


def face_fur(colour):
    """Lab mean and spread of the male face-fur layers of a hair colour (their opaque pixels)."""
    px = []
    for part in ('Lower', 'Upper'):
        a = np.asarray(read_blp(str(WORGEN / 'male' / f'WorgenMaleHair{part}00_{colour:02d}.blp')).convert('RGBA'))
        px.append(a[a[..., 3] > 200][:, :3])
    L = lab(np.concatenate(px).astype(float))
    return L.mean(0), L.std(0)


def fur_mask(sex, h, w):
    m = np.ones((h, w), bool)
    for u0, v0, u1, v1 in NOT_FUR[sex] + BANDS:
        m[int(v0 * h):int(np.ceil(v1 * h)), int(u0 * w):int(np.ceil(u1 * w))] = False
    return m


def mane(sex, colour):
    folder, extra, _ = SEXES[sex]
    a = np.asarray(read_blp(str(WORGEN / folder / extra)).convert('RGBA')).astype(float)
    fur = fur_mask(sex, *a.shape[:2])
    src = lab(a[..., :3])
    mu_s, sd_s = src[fur].mean(0), src[fur].std(0)
    mu_t, sd_t = face_fur(colour)
    out = src.copy()
    out[..., 0] = mu_t[0] + (src[..., 0] - mu_s[0]) * (sd_t[0] / max(sd_s[0], 1e-3))
    out[..., 1:] = mu_t[1:] + (src[..., 1:] - mu_s[1:]) * CHROMA_KEEP
    rgb = np.where(fur[..., None], rgb_of(out), a[..., :3])
    return Image.fromarray(np.dstack([rgb, np.full(fur.shape, 255.0)]).round().astype(np.uint8), 'RGBA')


def main():
    for sex, (folder, _, name) in SEXES.items():
        for colour in range(COLOURS):
            out = WORGEN / folder / name.format(colour)
            write_blp_rgba(out, mane(sex, colour))
            stale = PARSED / folder.upper() / out.name.upper()
            if stale.exists():
                stale.unlink()
            print(out.relative_to(CRAFT))


if __name__ == '__main__':
    main()
