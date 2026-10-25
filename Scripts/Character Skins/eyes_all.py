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
import json
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
from lib.wardrobe.eye_islands import ISLAND, island  # noqa: E402,F401

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
FULL_SAT = 120                           # mean rgb spread over an eye's centre over which it is one colour all over
SAME_EYE_DE = 10                         # CIE Lab distance of two eyes' centre colour under which they are one eye
EYE_STILL = 30                           # |rgb| sum under which an island pixel is the same across the stock skin colours
MIN_DETAIL = 18                          # rgb spread over the island under which an eye is a flat ball
FOLDERS = {1: 'Human', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll',
           10: 'BloodElf', 11: 'Draenei', 12: 'Worgen'}
# not the goblin: its eyes are painted into the lids, whose shape changes with every face type, and its faces' eye
# island is on no geometry, so one pasted eye brings the source face's lids (and skin) to every other face
SEXES = {0: 'Male', 1: 'Female'}
FULL_EYE_SUBRACE = {(3, 0), (3, 1)}     # races whose full-colour eyes go to one sub-race (dwarf: Dark Iron)
REPORT = Path(__file__).with_name('eyes_all.json')


def face(files, row):
    """Upper over lower at 256 x 192, RGB float."""
    halves = [np.asarray(read_blp(files.find(row[k])).convert('RGB').resize((256, h), Image.LANCZOS)).astype(np.float32)
              for k, h in (('texture_2', 64), ('texture_1', 128))]
    return np.vstack(halves)


def has_white(px):
    """Whether an eye is iris and white rather than one colour all over: a full-colour eye (a glow, a red Dark Iron
    eye) is saturated through its centre (mean channel spread 128-206 against 43-109 for the natural eyes)."""
    return bool((px.max(axis=1) - px.min(axis=1)).mean() < FULL_SAT)


def iris(px):
    """The darker half of the island's centre: the iris and pupil, without the white."""
    lum = px.mean(axis=1)
    return px[lum <= np.median(lum)].mean(axis=0)


def lit_px(px):
    lum = px.mean(axis=1)
    return px[lum >= np.median(lum)].mean(axis=0)


def _lab_px(rgb):
    """sRGB 0-255 (N x 3) -> CIE Lab (D65)."""
    c = np.asarray(rgb, np.float64) / 255
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = c @ np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]]).T
    xyz /= np.array([0.95047, 1.0, 1.08883])
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.stack([116 * f[:, 1] - 16, 500 * (f[:, 0] - f[:, 1]), 200 * (f[:, 1] - f[:, 2])], axis=1)


def _lab(rgb):
    return _lab_px(np.asarray(rgb)[None])[0]


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
    sql = ['-- F-151 Modern Character Creator: eye colour as its own choice for every playable race but the orc (goblin, worgen too).',
           '-- GENERATED by Scripts/Character Skins/eyes_all.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
           'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES']
    values, rid, report = [], ID_BASE, {}
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
            # the eyeball inside the island: what stays put when only the skin colour changes (face 0 of the stock
            # colours). The ellipse also covers skin the face uses (ear, cheek), which showed through another skin
            # colour as a patch of the source's skin (user report: trolls, Void Elf)
            stock = [face(files, live[(1, 0, c)]) for c in natural if c <= 9 and (1, 0, c) in live and ok(live[(1, 0, c)])]
            eyeball = mask
            if len(stock) >= 3:
                still = np.median(np.stack([np.abs(f - stock[0]).sum(axis=2) for f in stock[1:]]), axis=0) < EYE_STILL
                m = ndimage.binary_fill_holes(ndimage.binary_opening(still & mask, iterations=1)) & mask
                if m.sum() >= 0.3 * mask.sum():
                    eyeball = m
            eyes = []
            for im in imgs:
                px = im[mask]
                # a natural eye has an iris and a white: a flat ball is a glow or a black socket painted on (measured
                # inside the island, the skin round its rim would pass any ball)
                core = im[inner]
                if core.std(axis=0).mean() < MIN_DETAIL or not 25 < core.mean() < 230:
                    continue
                # the same eye: close over the island, or the same colour at its centre (the draenei faces paint one eye
                # in a dozen faint tints: user report, duplicates)
                if all(np.abs(px - e[mask]).sum(1).mean() >= SAME_EYE
                       and np.linalg.norm(_lab(iris(core)) - _lab(iris(e[inner]))) >= SAME_EYE_DE for e in eyes):
                    eyes.append(im)
                if len(eyes) == MAX_EYES:
                    break
            # a full-colour eye (no white) on a race whose eyes have a white is a glow painted on by an NPC colour.
            # Not offered (user rule: gnome eye 4); the dwarves keep theirs for Dark Iron only (FULL_EYE_SUBRACE, glue
            # CHAR_CREATE_SUBRACES eyes lists, written to eyes_all.json)
            full = [has_white(e[inner]) is False for e in eyes]
            if sum(full) < len(eyes) / 2:
                if (race, g) in FULL_EYE_SUBRACE:
                    report[f'{race}_{g}'] = {'full': [i for i, f in enumerate(full) if f],
                                             'white': [i for i, f in enumerate(full) if not f]}
                else:
                    eyes = [e for e, f in zip(eyes, full) if not f]
            dk_face = next((face(files, live[(1, 0, c)]) for c in dk if (1, 0, c) in live and ok(live[(1, 0, c)])), None)
            stem = f'Character\\{folder}\\{sex}\\{folder}{sex}'
            has_up, has_lo = mask[:64].any(), mask[64:].any()
            # a race without death knight colours (undead) has no glow eye: its death knights pick the natural ones
            natural_flags = FLAGS_EYE if dk_face is not None else FLAGS_ANY
            choices = [(im, natural_flags) for im in eyes] + ([(dk_face, FLAGS_DK)] if dk_face is not None else [])
            for i, (im, flags) in enumerate(choices):
                rgba = np.dstack([np.clip(im, 0, 255).astype(np.uint8), soft(eyeball)])
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
                  f'(eyeball {int(eyeball.sum())}; {"upper" if has_up else ""}{"+" if has_up and has_lo else ""}{"lower" if has_lo else ""})')
    if rid > ID_END:
        raise SystemExit('rows overflow the id range')
    sql.append(',\n'.join(values) + ';')
    SQL.write_text('\n'.join(sql) + '\n')
    REPORT.write_text(json.dumps(report, indent=1) + '\n')
    print(f'full-colour eyes per sub-race race: {report}')
    print(f'{rid - ID_BASE} rows -> {SQL.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
