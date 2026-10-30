"""F-151: eye colour as its own choice for every playable race (the orcs have theirs from eyes_markings.py).

An HD face paints its eyeball as a UV island of its own, so an eye colour is a layer over that island only: it
fits every face and every skin colour. This script cuts the island out of every reachable face, keeps the
distinct eyes as choices (CharSections base_section 5, colour 0; the source client pastes it after the face,
CharacterComponent::FaceLayerValid / PasteOverlay), and adds the death knight eye: the glow eye of the race's DK
colours, death knights only, with the eye glow geoset's texture recoloured to it (texture_3).
Night elf eyes glow: every night elf eye gets the race's own eye glow (NightElf<Sex>EyeGlow.blp) in its colour as
texture_3, which the source client puts on geoset 1703 (CharacterComponent GeosRenderPrep / LoadFaceLayers). The Dark
Iron full eye (dwarf male 11, female 6) gets five fire tints of itself (DARK_IRON_TINTS, after the death knight eye
so the older values keep their meaning), each with the dwarf death knight glow in its colour. These full-eye layers
cover the whole glow the glowing Dark Iron faces bake round the eyeball (glow_region), not the eyeball alone: an
eyeball-only layer left a red-orange ring of the baked glow round every other colour (user report).

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
GLOW_RACES = {4}                         # races whose every eye glows: texture_3 = the race's own glow in the eye's colour
RACE_GLOW = 'Character\\{folder}\\{sex}\\{folder}{sex}EyeGlow.blp'   # the M2's type-0 eye glow (geoset 1702)
DARK_IRON_GLOW = 'Character\\Dwarf\\{sex}\\deathKnightEyeGlow.blp'
# the Dark Iron full eye's tints: a gradient map of its luminance (dark, mid, bright sRGB), values after the DK eye
# fire tones only (user review 2026-10-30: Fel Green and Shadowflame dropped, Sulfur Yellow took Fel Green's value)
DARK_IRON_TINTS = [('Molten Orange', [(90, 18, 0), (230, 90, 10), (255, 200, 90)]),
                   ('Forge Gold', [(80, 40, 0), (225, 160, 20), (255, 240, 150)]),
                   ('White-Hot', [(150, 70, 20), (255, 210, 150), (255, 255, 245)]),
                   ('Magma Crimson', [(60, 0, 0), (190, 10, 10), (255, 110, 60)]),
                   ('Sulfur Yellow', [(90, 75, 0), (235, 215, 30), (255, 255, 180)])]
GLOW_FACE = 0.6                          # share of the island a face paints saturated red / orange: a glowing face
GLOW_REACH = 20                          # px round the island the baked glow is looked for (the eye's own glint dot)


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
    """Alpha feathered inward only: full two pixels in from the rim, half on the rim, nothing outside the mask (an
    outward feather pasted the source face's skin round the eye). The distance runs to the nearest unmasked pixel
    inside the image, so an island on the texture's edge is not feathered against the edge."""
    d = ndimage.distance_transform_edt(mask)
    return (np.clip(d / 2.0, 0, 1) * 255).astype(np.uint8)


def glow_texture(files, eye_pixels, source=STOCK_GLOW, normalise=False):
    """A stock eye glow (default the death knight one) with its luminance kept and its colour set to the eye's
    brightest pixels. normalise: every pixel keeps the source's brightness (max channel), so each colour glows as
    bright as the stock glow (the glow draws additive); otherwise the colour's own brightness scales it (DK eyes)."""
    src = np.asarray(read_blp(files.find(source)).convert('RGBA')).astype(float)
    target = eye_pixels[eye_pixels.mean(1) >= np.percentile(eye_pixels.mean(1), 80)].mean(0)
    if normalise:
        rgb = np.clip(target[None, None, :] / max(target.max(), 1) * src[..., :3].max(2)[..., None], 0, 255)
    else:
        lum = src[..., :3].mean(2)
        ref = lum[src[..., 3] > 40].mean()
        rgb = np.clip(target[None, None, :] * (lum / max(ref, 1))[..., None], 0, 255)
    return Image.fromarray(np.dstack([rgb, src[..., 3]]).astype(np.uint8), 'RGBA')


def glowing(f):
    """Saturated red / orange pixels: the glow the Dark Iron fire faces bake round the eye."""
    r, g, b = f[..., 0], f[..., 1], f[..., 2]
    return (r > 100) & (r - b > 70) & (r - g > 45)


def glow_region(files, live, mask, eyeball):
    """Where the race's glowing faces (their island mostly glow: Dark Iron 26, 27, 32) paint glow, over every face
    type: in and round the eyeball (ring, glint dot) and in the eye sockets the face art paints (dwarf male: the lids
    round the eyeball sample the painted red eyes in the middle of the face, across the FaceUpper / FaceLower seam,
    and showed as a red rim round every other colour in game). Pixels that glow on the same face type of a plain
    colour (lips, skin reds) are left out. Returns (region, glowing colours, a glowing face as the glow's source);
    (None, [], None) when no face glows."""
    near = ndimage.binary_dilation(np.pad(mask, GLOW_REACH + 2), iterations=GLOW_REACH)[GLOW_REACH + 2:-GLOW_REACH - 2,
                                                                                      GLOW_REACH + 2:-GLOW_REACH - 2]
    usable = lambda r: r['flags'] & 0x1 and all(r[k] and files.find(r[k]) for k in ('texture_1', 'texture_2'))  # noqa: E731
    rows = {c: r for (s, t, c), r in live.items() if s == 1 and t == 0 and usable(r)}
    lit = [c for c, r in rows.items() if glowing(face(files, r))[mask].mean() > GLOW_FACE]
    if not lit:
        return None, [], None
    plain = sorted(c for c in rows if c not in lit)
    region = np.zeros(mask.shape, bool)
    plain_red = {}                          # per face type: red on every plain colour (lips, skin), not glow
    for (s, t, c), r in live.items():
        if s == 1 and c in lit and usable(r):
            f = face(files, r)
            g = glowing(f)
            if t not in plain_red:
                bases = [glowing(face(files, live[(1, t, p)])) for p in plain if (1, t, p) in live and usable(live[(1, t, p)])]
                plain_red[t] = np.logical_and.reduce(bases) if bases else ~near
            region |= (g & near) | (g & ~plain_red[t])
            # the glow's darker red edge (sockets): grown from the glow into the dim red next to it
            dim = (f[..., 0] > 70) & (f[..., 0] - f[..., 2] > 45) & (f[..., 0] - f[..., 1] > 30) & ~plain_red[t]
            region |= ndimage.binary_propagation(g & ~plain_red[t], mask=dim | (g & ~plain_red[t]))
    region = ndimage.binary_fill_holes(ndimage.binary_closing(np.pad(region | eyeball, 2), iterations=1))[2:-2, 2:-2]
    return region, sorted(lit), face(files, rows[lit[0]])


def cover(im, region):
    """A full-glow layer: the image filled outward from the region's glow (so the rim is glow colour, not the source
    face's skin), alpha full over the region and half one pixel beyond it, so no baked glow shows at its edge."""
    lit = region & glowing(im) if (region & glowing(im)).any() else region
    idx = ndimage.distance_transform_edt(~lit, return_distances=False, return_indices=True)
    filled = im[idx[0], idx[1]]
    out = ndimage.distance_transform_edt(~region)
    alpha = np.where(region, 1.0, np.where(out <= 1.5, 0.5, 0.0))
    return filled, (alpha * 255).astype(np.uint8)


def tint(im, mask, stops):
    """A full-colour eye recoloured by a gradient map of its luminance (max channel): black to the dark stop to the
    island's median on the mid stop (the eye's body), the brightest pixels on the bright stop (its hot centre). A
    stretch from the darkest pixels put the body on the dark stop (a near-black eye)."""
    lum = im.max(axis=2)
    med, hi = np.percentile(lum[mask], 50), np.percentile(lum[mask], 99.5)
    t = np.where(lum <= med, lum / max(med, 1), 1 + (lum - med) / max(hi - med, 1))
    t = np.clip(t, 0, 2)
    st = np.asarray(stops, np.float32)     # dark (t 0), mid (t 1), bright (t 2)
    i = np.where(t < 1, 0, 1)
    f = (t - i)[..., None]
    return st[i] * (1 - f) + st[i + 1] * f


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
            mask = island(race, g)                  # the cut: the eyeball's UV island
            pick = island(race, g, pick=True)       # the choice: the ellipses the values were first picked with (PICK)
            inner = island(race, g, 0.7, pick=True)
            # the eyeball inside the island: what stays put when only the skin colour changes (face 0 of the stock
            # colours). The ellipse also covers skin the face uses (ear, cheek), which showed through another skin
            # colour as a patch of the source's skin (user report: trolls, Void Elf)
            stock = [face(files, live[(1, 0, c)]) for c in natural if c <= 9 and (1, 0, c) in live and ok(live[(1, 0, c)])]
            eyeball = mask
            if len(stock) >= 3:
                still = np.median(np.stack([np.abs(f - stock[0]).sum(axis=2) for f in stock[1:]]), axis=0) < EYE_STILL
                # padded: the opening treats outside the image as empty and would eat an island on the texture's edge
                m = np.pad(still & mask, 2, mode='edge')
                m = ndimage.binary_fill_holes(ndimage.binary_opening(m, iterations=1))[2:-2, 2:-2] & mask
                if m.sum() >= 0.3 * mask.sum():
                    eyeball = m
            eyes = []
            for im in imgs:
                px = im[pick]
                # a natural eye has an iris and a white: a flat ball is a glow or a black socket painted on (measured
                # inside the island, the skin round its rim would pass any ball)
                core = im[inner]
                if core.std(axis=0).mean() < MIN_DETAIL or not 25 < core.mean() < 230:
                    continue
                # the same eye: close over the island, or the same colour at its centre (the draenei faces paint one eye
                # in a dozen faint tints: user report, duplicates)
                if all(np.abs(px - e[pick]).sum(1).mean() >= SAME_EYE
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
            region, lit, lit_face = (glow_region(files, live, mask, eyeball) if (race, g) in FULL_EYE_SUBRACE
                                     else (None, [], None))
            # a race without death knight colours (undead) has no glow eye: its death knights pick the natural ones
            natural_flags = FLAGS_EYE if dk_face is not None else FLAGS_ANY
            glow_src = DARK_IRON_GLOW.format(sex=sex)
            # (image, flags, glow source, alpha): alpha None = the eyeball, feathered inward
            choices = [(im, natural_flags, RACE_GLOW.format(folder=folder, sex=sex) if race in GLOW_RACES else None,
                        None) for im in eyes]
            full_vals = report.get(f'{race}_{g}', {}).get('full', [])
            full_alpha = None
            if full_vals and region is not None:   # the full eye covers the faces' whole baked glow
                # the full eye where it glows, the glowing face's own glow elsewhere (the painted sockets)
                im = eyes[full_vals[0]]
                im = np.where((glowing(im) | ~region)[..., None], im, lit_face)
                src, full_alpha = cover(im, region)
                eyes[full_vals[0]] = src
            for v in full_vals:                    # the Dark Iron full eye glows in its own colour too
                choices[v] = (eyes[v], choices[v][1], glow_src, full_alpha if v == full_vals[0] else None)
            choices += [(dk_face, FLAGS_DK, STOCK_GLOW, None)] if dk_face is not None else []
            if full_vals:                          # its tints, after the DK eye: values 0..DK keep their meaning
                tints = {}
                for name, stops in DARK_IRON_TINTS:
                    tints[len(choices)] = name
                    choices.append((tint(eyes[full_vals[0]], eyeball, stops), FLAGS_EYE, glow_src, full_alpha))
                report[f'{race}_{g}']['full'] = full_vals + list(tints)
                report[f'{race}_{g}']['tints'] = tints
                report[f'{race}_{g}']['glow_faces'] = lit
            for i, (im, flags, glow_from, alpha) in enumerate(choices):
                rgba = np.dstack([np.clip(im, 0, 255).astype(np.uint8), soft(eyeball) if alpha is None else alpha])
                up = lo = glow = ''
                if alpha is not None:              # a full-glow layer may reach the other face half
                    has_up, has_lo = (has_up or alpha[:64].any()), (has_lo or alpha[64:].any())
                    if not (mask[:64].any() and mask[64:].any()):
                        print(f'  {folder} {sex} eye {i}: glow layer in {"upper" if alpha[:64].any() else ""}'
                              f'{"+lower" if alpha[64:].any() else ""}')
                else:
                    has_up, has_lo = mask[:64].any(), mask[64:].any()
                if has_up:
                    up = f'{stem}Eyes{i:02d}Upper.blp'
                    icons.write_blp_rgba(ASSETS / up.replace('\\', '/'), Image.fromarray(rgba[:64], 'RGBA'))
                if has_lo:
                    lo = f'{stem}Eyes{i:02d}Lower.blp'
                    icons.write_blp_rgba(ASSETS / lo.replace('\\', '/'), Image.fromarray(rgba[64:], 'RGBA'))
                if glow_from:
                    glow = f'{stem}EyeGlow{i:02d}.blp'
                    # the eye's colour from the layer's own pixels (the eyeball), not the ellipse's skin (the DK
                    # glows keep their stock read over the whole ellipse)
                    px = im[pick] if flags == FLAGS_DK else im[eyeball]
                    icons.write_blp_rgba(ASSETS / glow.replace('\\', '/'),
                                         glow_texture(files, px, glow_from, normalise=flags != FLAGS_DK))
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
