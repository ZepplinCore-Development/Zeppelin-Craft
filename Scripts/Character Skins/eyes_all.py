"""F-151: eye colour as its own choice for every playable race (the orcs have theirs from eyes_markings.py).

An HD face paints its eyeball as a UV island of its own, so an eye colour is a layer over that island only: it
fits every face and every skin colour. This script cuts the island out of every reachable face, keeps the
distinct eyes as choices (CharSections base_section 5, colour 0; the source client pastes it after the face,
CharacterComponent::FaceLayerValid / PasteOverlay), and adds the death knight eye: the glow eye of the race's DK
colours, death knights only, with the eye glow geoset's texture recoloured to it (texture_3).

  island       per race and sex, an ellipse read off the faces (ISLAND)
  rows         texture_1 = FaceLower layer, texture_2 = FaceUpper layer ('' where the island has none)

Writes zpaks/zep-skin-expansion/mpq/source-assets/Character/<Race>/<Sex>/<Race><Sex>Eyes<NN>{Upper,Lower}.blp
(+ EyeGlow<NN>.blp) and zpaks/zep-skin-expansion/dbc/[F-151]_charsections_eyes_all.sql.

  python3 "Scripts/Character Skins/eyes_all.py"
"""
import hashlib
import importlib.util
import re
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402

_spec = importlib.util.spec_from_file_location('icons', Path(__file__).with_name('subrace_icons.py'))
icons = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(icons)

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets'
COMMUNITY = [CRAFT.parent / 'Zeppelin-Tools' / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
             for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]
SQL = ZPAK / 'dbc' / '[F-151]_charsections_eyes_all.sql'
ID_BASE, ID_END = 100000, 100999
SECTION_EYES = 5
FLAGS_EYE, FLAGS_DK = 0x1, 0x5           # natural eyes: not for death knights, whose eye is the glow (user rule)
FLAGS_ANY = 0x11                         # 0x10: a death knight may pick it too
STOCK_GLOW = 'Character\\BloodElf\\Female\\deathKnightEyeGlow.blp'
SAME_EYE = 12                            # mean |rgb| over the island under which two eyes are the same eye
MAX_EYES = 16
MIN_DETAIL = 18                          # rgb spread over the island under which an eye is a flat ball
FOLDERS = {1: 'Human', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll',
           10: 'BloodElf', 11: 'Draenei'}
# (race, sex) -> the eyeball island as an ellipse (centre x, y, radius x, y) on the 256 x 192 face (upper 0-63 over
# lower 64-191), read off face 0 of every race (masks sheet). Masks found from the faces' eye-colour variation came
# out partial (C shapes) or on the skin beside the eye.
ISLAND = {(1, 0): (32, 162, 31, 28), (1, 1): (237, 15, 17, 13),
          (3, 0): (31, 160, 30, 31), (3, 1): (209, 31, 36, 21),
          (4, 0): (233, 19, 18, 16), (4, 1): (23, 170, 20, 18),
          (5, 0): (47, 170, 24, 17), (5, 1): (221, 13, 21, 12),
          (6, 0): (26, 17, 23, 16), (6, 1): (26, 37, 16, 12),
          (7, 0): (213, 161, 32, 26), (7, 1): (210, 161, 28, 22),
          (8, 0): (25, 139, 23, 44), (8, 1): (85, 30, 25, 25),
          (10, 0): (29, 163, 27, 28), (10, 1): (30, 28, 28, 26),
          (11, 0): (127, 13, 23, 12), (11, 1): (30, 18, 28, 16)}
SEXES = {0: 'Male', 1: 'Female'}


def face(files, row):
    """Upper over lower at 256 x 192, RGB float."""
    halves = [np.asarray(read_blp(files.find(row[k])).convert('RGB').resize((256, h), Image.LANCZOS)).astype(np.float32)
              for k, h in (('texture_2', 64), ('texture_1', 128))]
    return np.vstack(halves)


def island(race, sex, scale=1.0):
    cx, cy, rx, ry = ISLAND[(race, sex)]
    rx, ry = rx * scale, ry * scale
    yy, xx = np.mgrid[:192, :256]
    return ((xx + 0.5 - cx) / rx) ** 2 + ((yy + 0.5 - cy) / ry) ** 2 <= 1


def soft(mask):
    a = ndimage.uniform_filter(mask.astype(float), 3)
    return (np.where(mask, 1.0, a) * 255).astype(np.uint8)


def glow_texture(files, eye_pixels):
    """The stock death knight eye glow, brightness kept, colour set to the eye's brightest pixels."""
    src = np.asarray(read_blp(files.find(STOCK_GLOW)).convert('RGBA')).astype(float)
    lum = src[..., :3].mean(2)
    target = eye_pixels[eye_pixels.mean(1) >= np.percentile(eye_pixels.mean(1), 80)].mean(0)
    ref = lum[src[..., 3] > 40].mean()
    rgb = np.clip(target[None, None, :] * (lum / max(ref, 1))[..., None], 0, 255)
    return Image.fromarray(np.dstack([rgb, src[..., 3]]).astype(np.uint8), 'RGBA')


def main():
    first = [ASSETS, CURATED] + [p for p in COMMUNITY if p.is_dir()]
    files = FileResolver(first + [p for p in EXTERNAL_ROOTS if Path(p).resolve() not in {f.resolve() for f in first}])
    query = _dbc_query_fn('live')
    for folder in FOLDERS.values():
        for old in ASSETS.glob(f'Character/{folder}/*/{folder}*.blp'):
            if re.match(rf'{folder}(Male|Female)(Eyes|EyeGlow)\d', old.name):
                old.unlink()
    esc = lambda p: p.replace('\\', '\\\\')  # noqa: E731
    sql = ['-- F-151 Modern Character Creator: eye colour as its own choice for every playable race but the orc.',
           '-- GENERATED by Scripts/Character Skins/eyes_all.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
           'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES']
    values, rid = [], ID_BASE
    for race, folder in FOLDERS.items():
        for g, sex in SEXES.items():
            rows = query(f'SELECT id, base_section, type, color_index, flags, texture_1, texture_2 FROM charsections '
                         f'WHERE race = {race} AND gender = {g} AND base_section IN (0, 1) AND id NOT BETWEEN {ID_BASE} AND {ID_END}')
            live = {}
            for r in sorted(rows, key=lambda r: r['id']):            # duplicate keys: the highest id wins (F-225)
                live[(r['base_section'], r['type'], r['color_index'])] = r
            skins = {c: r['flags'] for (s, t, c), r in live.items() if s == 0 and t == 0}
            natural = sorted(c for c, fl in skins.items() if fl & 0x1 and not fl & 0x4)
            dk = sorted(c for c, fl in skins.items() if fl & 0x4)

            def ok(r):
                return all(files.find(r[k]) for k in ('texture_1', 'texture_2') if r[k]) and r['texture_1'] and r['texture_2']

            # eye candidates in creator order: colour 0's faces, then face 0 of every other natural colour
            cands = [live[(1, t, 0)] for t in sorted(t for (s, t, c) in live if s == 1 and c == 0)]
            cands += [live[(1, 0, c)] for c in natural if c != 0 and (1, 0, c) in live]
            cands = [r for r in cands if r['flags'] & 0x1 and ok(r)]
            imgs = [face(files, r) for r in cands]
            mask = island(race, g)
            inner = island(race, g, 0.7)
            alpha = soft(mask)
            eyes = []
            for im in imgs:
                px = im[mask]
                # a natural eye has an iris and a white: a flat ball is a glow or a black socket painted on (measured
                # inside the island, the skin round its rim would pass any ball)
                core = im[inner]
                if core.std(axis=0).mean() < MIN_DETAIL or not 25 < core.mean() < 230:
                    continue
                if all(np.abs(px - e[mask]).sum(1).mean() >= SAME_EYE for e in eyes):
                    eyes.append(im)
                if len(eyes) == MAX_EYES:
                    break
            dk_face = next((face(files, live[(1, 0, c)]) for c in dk if (1, 0, c) in live and ok(live[(1, 0, c)])), None)
            stem = f'Character\\{folder}\\{sex}\\{folder}{sex}'
            has_up, has_lo = mask[:64].any(), mask[64:].any()
            # a race without death knight colours (undead) has no glow eye: its death knights pick the natural ones
            natural_flags = FLAGS_EYE if dk_face is not None else FLAGS_ANY
            choices = [(im, natural_flags) for im in eyes] + ([(dk_face, FLAGS_DK)] if dk_face is not None else [])
            for i, (im, flags) in enumerate(choices):
                rgba = np.dstack([np.clip(im, 0, 255).astype(np.uint8), alpha])
                up = lo = glow = ''
                if has_up:
                    up = f'{stem}Eyes{i:02d}Upper.blp'
                    icons.write_blp_rgba(ASSETS / up.replace('\\', '/'), Image.fromarray(rgba[:64], 'RGBA'))
                if has_lo:
                    lo = f'{stem}Eyes{i:02d}Lower.blp'
                    icons.write_blp_rgba(ASSETS / lo.replace('\\', '/'), Image.fromarray(rgba[64:], 'RGBA'))
                if flags == FLAGS_DK:
                    glow = f'{stem}EyeGlow{i:02d}.blp'
                    icons.write_blp_rgba(ASSETS / glow.replace('\\', '/'), glow_texture(files, im[mask]))
                values.append(f"({rid}, {race}, {g}, {SECTION_EYES}, '{esc(lo)}', '{esc(up)}', '{esc(glow)}', {flags}, {i}, 0)")
                rid += 1
            print(f'{folder} {sex}: {len(eyes)} eye colours from {len(cands)} faces'
                  f'{", death knight eye" if dk_face is not None else ""}; island {int(mask.sum())} px '
                  f'({"upper" if has_up else ""}{"+" if has_up and has_lo else ""}{"lower" if has_lo else ""})')
    if rid > ID_END:
        raise SystemExit('rows overflow the id range')
    sql.append(',\n'.join(values) + ';')
    SQL.write_text('\n'.join(sql) + '\n')
    print(f'{rid - ID_BASE} rows -> {SQL.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
