"""F-222: face + underwear textures for gnome female skin colours 5/6 (_100 / _101).

The HD skin atlases GnomeFemaleSkin00_100/_101 are pixel-aligned recolours of the
playable tones, so a quadratic RGB map fitted on the body (atlas minus the face
block) carries any colour-2 / colour-4 texture onto the new tone (~2/255 error).

  face 0      the face already painted in the target atlas (x0..256, y320..512)
  faces 1-13  source tone's face, recoloured; eyeballs/lids keep their own colours
              unless the pixel is skin-like (irises, DK glow stay as painted)
  underwear   source tone's NakedPelvis/NakedTorso, recoloured
  _Extra      the pack's misnamed GnomeFemaleSkin00_10x_HD.blp (mouth interior, I-397)

Output BLPs match stock: BLP2 palettized, alpha_depth 0, alpha_type 8, full mips.

  python3 "Scripts/Character Skins/gnome_female_extra_skins.py" <src_dir> <out_dir>
  src_dir = HD pack Character/Gnome/Female (patch-hd-everything source-assets)
  out_dir = zpaks/zep-models/mpq/source-assets/Character/Gnome/Female
"""
import os
import shutil
import struct
import sys

import numpy as np
from PIL import Image

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))
from cli.lib.blp_image import decode_blp_rgb  # noqa: E402

SRC = {'100': '02', '101': '04'}          # target tone -> closest playable tone
FACE = {'FaceUpper': (320, 64), 'FaceLower': (384, 128)}


class Pack:
    def __init__(self, d):
        self.d = d
        self.ls = {f.lower(): f for f in os.listdir(d)}

    def path(self, name):
        return os.path.join(self.d, self.ls[(name + '.blp').lower()])

    def load(self, name):
        return decode_blp_rgb(self.path(name)).astype(float)


def feats(x):
    r, g, b = x[..., 0] / 255, x[..., 1] / 255, x[..., 2] / 255
    return np.stack([np.ones_like(r), r, g, b, r * r, g * g, b * b, r * g, r * b, g * b], -1)


def body_mask():
    m = np.ones((512, 512), bool)
    m[320:, :256] = False                 # face block differs (face paint on _100)
    return m


def fit(pack, target):
    a, b = pack.load('GnomeFemaleSkin00_' + SRC[target]), pack.load('GnomeFemaleSkin00_' + target)
    w, *_ = np.linalg.lstsq(feats(a[body_mask()]), b[body_mask()], rcond=None)
    return w


def skin_distance(pack, tone):
    """Distance (RGB units, 4-level bins) from any colour to the tone's body-skin colours."""
    px = pack.load('GnomeFemaleSkin00_' + tone)[body_mask()]
    g = np.zeros((64, 64, 64), bool)
    g[tuple(np.unique((px // 4).astype(int), axis=0).T)] = True
    d = np.full(g.shape, 99.0)
    d[g] = 0
    cur = g.copy()
    for step in range(1, 12):
        n = cur.copy()
        for ax in range(3):
            n |= np.roll(cur, 1, ax)
            n |= np.roll(cur, -1, ax)
        d[n & ~cur] = step * 4
        cur = n
    return d


def eye_region(part):
    if part == 'FaceUpper':
        m = np.zeros((64, 256), bool)
        m[:, :200] = True                 # brows / lids, not the ear
        return m
    m = np.zeros((128, 256), bool)
    m[0:40, 40:165] = True                # lower lids
    yy, xx = np.mgrid[0:128, 0:256]
    m |= (xx - 213) ** 2 + (yy - 103) ** 2 <= 37 ** 2   # eyeball disc
    return m


def recolour(img, w, dist=None, region=None):
    out = np.clip(feats(img) @ w, 0, 255)
    if dist is None:
        return out
    b = (img // 4).astype(int).clip(0, 63)
    keep = np.clip(1 - (dist[b[..., 0], b[..., 1], b[..., 2]] - 12) / 24, 0, 1)[..., None]
    keep = np.maximum(keep, (~region)[..., None].astype(float))
    return keep * out + (1 - keep) * img


def write_blp(path, rgb):
    im = Image.fromarray(rgb.astype(np.uint8), 'RGB')
    q = im.quantize(256, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)
    pal = (q.getpalette()[:768] + [0] * 768)[:768]
    w, h = im.size
    mips, cw, ch = [], w, h
    while True:
        m = q if (cw, ch) == (w, h) else im.resize((cw, ch), Image.BOX).quantize(palette=q, dither=Image.Dither.NONE)
        mips.append(m.tobytes())
        if cw == 1 or ch == 1:            # stock chains stop when a side reaches 1
            break
        cw, ch = cw // 2, ch // 2
    offs, sizes, o = [0] * 16, [0] * 16, 1172
    for i, m in enumerate(mips[:16]):
        offs[i], sizes[i], o = o, len(m), o + len(m)
    hdr = b'BLP2' + struct.pack('<I', 1) + bytes([1, 0, 8, 1]) + struct.pack('<II', w, h)
    hdr += struct.pack('<16I', *offs) + struct.pack('<16I', *sizes)
    palb = b''.join(bytes([pal[3 * i + 2], pal[3 * i + 1], pal[3 * i], 0]) for i in range(256))
    with open(path, 'wb') as f:
        f.write(hdr + palb + b''.join(mips[:16]))


def main(src_dir, out_dir):
    pack = Pack(src_dir)
    os.makedirs(out_dir, exist_ok=True)
    n = 0
    for target, tone in SRC.items():
        w, atlas, dist = fit(pack, target), pack.load('GnomeFemaleSkin00_' + target), skin_distance(pack, tone)
        for t in range(14):
            for part, (y, h) in FACE.items():
                img = atlas[y:y + h, :256] if t == 0 else recolour(
                    pack.load('GnomeFemale%s%02d_%s' % (part, t, tone)), w, dist, eye_region(part))
                write_blp(os.path.join(out_dir, 'GnomeFemale%s%02d_%s.blp' % (part, t, target)), img)
                n += 1
        for part in ('NakedPelvisSkin', 'NakedTorsoSkin'):
            write_blp(os.path.join(out_dir, 'GnomeFemale%s00_%s.blp' % (part, target)),
                      recolour(pack.load('GnomeFemale%s00_%s' % (part, tone)), w))
            n += 1
        shutil.copy(pack.path('GnomeFemaleSkin00_%s_HD' % target),
                    os.path.join(out_dir, 'GnomeFemaleSkin00_%s_Extra.blp' % target))
        n += 1
    print('%d files -> %s' % (n, out_dir))


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
