"""F-151 Phase 2: split the orc face option into face, eye colour and marking.

Orc faces are three choices baked into one texture pair:
  0-8    nine face paintings, each with its own eye colour
  9-17   the same nine with the death knight glow eyes
  18-24  one of 0-8 plus a marking (war paint, bone mask, piercings, scar, black eye...)
  25-31  18-24 with the glow eyes
The eyeball is its own UV island in the top right of FaceUpper, so an eye colour is a layer covering
that island only, and fits every face and every skin colour. A marking is the marked face masked to
where it differs from its base face; the marking pixels were recoloured with the skin, so each marking
gets one layer per skin colour, taken from that colour's marked face.

New CharSections sections (the source client composites them after the face, CharacterComponent.cpp):
  base_section 5 = eyes      type = eye choice, color_index 0, texture_1 = FaceLower layer ('' unless
                             the eye glows onto the lids, as the death knight eye does), texture_2 = FaceUpper layer
  base_section 6 = markings  type = marking choice (0 = none, no row), color_index = skin colour,
                             texture_1 = FaceLower layer, texture_2 = FaceUpper layer ('' when empty)

Writes zpaks/zep-skin-expansion/mpq/source-assets/Character/Orc/<Sex>/Orc<Sex>Eyes<NN>.blp and
Orc<Sex>Marking<NN>_<CC>{Lower,Upper}.blp, zpaks/zep-skin-expansion/dbc/[AUTO,F-151]_charsections_eyes.sql
and the face split table (old face -> shape, eye, marking per skin colour) to
Scripts/Character Skins/orc_face_split.json.

With --migration it also writes zpaks/zep-skin-expansion/sql_characters/zz_[F-151]_orc_face_split.sql, which
moves every existing orc to face shape + eye colour + marking (character_customizations). Only write it when the
client and worldserver that read character_customizations ship: on an older client a moved character loses its
marking and eye colour.

  python3 "Scripts/Character Skins/eyes_markings.py" [--migration]
"""
import hashlib
import re
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402

_spec = importlib.util.spec_from_file_location('icons', Path(__file__).with_name('subrace_icons.py'))
icons = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(icons)

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
SQL = ZPAK / 'dbc' / '[AUTO,F-151]_charsections_eyes.sql'
SPLIT = Path(__file__).with_name('orc_face_split.json')
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-151]_orc_face_split.sql'
ID_BASE, ID_END = 80000, 88999                # 89000-89999: body_markings.py, retail_layers.py
# The facial markings cut from the marked faces are retired: base_section 6 is retail's tattoos now (retail_layers.py).
# The marks are still measured, because the face split (old face -> shape) needs each marked face's base shape.
EMIT_MARKINGS = False
PLAIN_SQL = ZPAK / 'dbc' / '[F-151]_charsections_plainfaces.sql'
# colours whose every face bakes in the same black face paint -> the colour whose faces give the plain shading.
# The paint becomes a facial marking and these colours get plain faces (user rule).
#   sex -> {colour: (base colour, marking, detection)}; 'dark' = much darker than the base shading (black paint),
#   'rebuild' = the old death knight colours: blue paint (male) and lit lids (both sexes) are baked in; their plain
#   face is rebuilt whole, the base face's detail in the colour's own smoothed tone, paint and glow left out
BAKED = {0: {44: (19, 8, 'dark'), 45: (19, 8, 'dark'), 15: (19, 9, 'rebuild'), 17: (19, 9, 'rebuild'), 14: (19, None, 'rebuild')},
         1: {44: (19, 8, 'dark'), 45: (19, 8, 'dark'), 11: (19, None, 'rebuild'), 13: (19, None, 'rebuild'), 12: (19, None, 'rebuild')}}
# male 14 (gold) and female 12 (blue) are custom colours with lit lids baked in, like the death knight ones (user report)
BAKED_MARKS = sorted({m for per in BAKED.values() for _b, m, _d in per.values() if m})
PAINT_BLUE = 40                          # 'rebuild': blue - (red + green) / 2 above the colour's median = paint / glow
PAINT_GOLD = 60                          # 'rebuild': (red + green) / 2 - blue above the median = gold lid glow
TONE_SIGMA = 6                           # 'rebuild': px reach of the colour's own tone
SECTION_EYES, SECTION_MARKINGS = 5, 6
FLAGS_ANY, FLAGS_DK = 0x11, 0x5          # 0x10: a death knight may pick it too; 0x4: death knight only
FLAGS_EYE = 0x1                          # natural eyes: not for death knights, whose eye colour is the glow (user rule)
STOCK_GLOW = 'Character\\BloodElf\\Female\\deathKnightEyeGlow.blp'   # the death knight eye-glow geoset's texture (type 0)
RACE, SEXES = 2, {0: 'Male', 1: 'Female'}
DK_OFFSET = 9                            # faces 9-17 = 0-8 with glow eyes, 25-31 = 18-24 with glow eyes
MARKED = range(18, 25)

# Eye choices, in creator order: (skin colour, face) whose eye island is the source. The natural eyes are
# the distinct ones of the colour-0 faces; the glows are the DK eye and the eyes the Nexus colours bake in.
EYES = {
    0: [(0, 0), (0, 2), (0, 3), (0, 4), (0, 5), (0, 18),
        (0, 9), (25, 0), (40, 0), (42, 0), (43, 0)],
    1: [(0, 0), (0, 1), (0, 2), (0, 4), (0, 7), (0, 8), (0, 18), (0, 22), (0, 23), (0, 24),
        (0, 9), (25, 0), (40, 0), (42, 0), (43, 0)],
}
EYE_DK = (0, 9)
SAME_EYE = 12                            # mean |rgb| difference under which two eye islands are the same eye
STOCK_COLOURS = range(9)                 # Blizzard's own DK faces; the later colours are generated copies
MARK_DIFF = 45                           # |rgb| sum over which a marked face differs from its base


def charsections(query):
    rows = query(f'SELECT id, gender, base_section, type, color_index, flags, texture_1, texture_2 '
                 f'FROM charsections WHERE race = {RACE} AND base_section IN (1, {SECTION_EYES}, {SECTION_MARKINGS})')
    faces = {}
    for r in sorted(rows, key=lambda r: r['id']):            # duplicate keys: the highest id wins (F-225)
        if r['base_section'] == 1:
            faces[(r['gender'], r['type'], r['color_index'])] = r
    return faces


class Faces:
    def __init__(self, faces, files):
        self.faces, self.files, self._img = faces, files, {}

    def colours(self, g):
        return sorted({c for (gg, _f, c) in self.faces if gg == g})

    def tex(self, path):
        path = path.replace('Plain.blp', '.blp')                # this script's own output: read the original
        if path not in self._img:
            f = self.files.find(path)
            if not f:
                raise FileNotFoundError(path)
            self._img[path] = np.asarray(Image.open(f).convert('RGB')).astype(np.int16)
        return self._img[path]

    def upper(self, g, f, c):
        return self.tex(self.faces[(g, f, c)]['texture_2'])

    def lower(self, g, f, c):
        return self.tex(self.faces[(g, f, c)]['texture_1'])

    def both(self, g, f, c):
        return np.vstack([self.upper(g, f, c), self.lower(g, f, c)])


def eye_mask(fc, g):
    """The eyeball island: where the glow-eye face differs from face 0, right of the brow, holes filled."""
    d = np.abs(fc.upper(g, DK_OFFSET, 0) - fc.upper(g, 0, 0)).sum(2) > 40
    d[:, :185] = False
    lab, _n = ndimage.label(d)
    m = lab == np.argmax(np.bincount(lab.ravel())[1:]) + 1
    return ndimage.binary_fill_holes(ndimage.binary_closing(m, iterations=2))


def soft(mask, grow=1):
    """Alpha 0-255: the mask grown by `grow` px with a one-pixel soft edge."""
    m = ndimage.binary_dilation(mask, iterations=grow) if grow else mask
    a = ndimage.uniform_filter(m.astype(float), 3)
    return (np.where(mask, 1.0, a) * 255).astype(np.uint8)


def glow_texture(eye_pixels):
    """The stock death knight eye glow with its brightness kept and its colour set to the eye's brightest pixels."""
    src = np.asarray(Image.open(FILES.find(STOCK_GLOW)).convert('RGBA')).astype(float)
    lum = src[..., :3].mean(2)
    e = eye_pixels.astype(float)
    target = e[e.mean(1) >= np.percentile(e.mean(1), 80)].mean(0)
    ref = lum[src[..., 3] > 40].mean()
    rgb = np.clip(target[None, None, :] * (lum / max(ref, 1))[..., None], 0, 255)
    return Image.fromarray(np.dstack([rgb, src[..., 3]]).astype(np.uint8), 'RGBA')


def soft_hd(src, mask):
    """src (192x256 face, upper over lower) and its marking mask at twice the size: alpha a smoothed matte of the
    mask, colour from the mask's interior across the edge band."""
    size = (src.shape[1] * 2, src.shape[0] * 2)
    # the paint's own speckle (the death knight paint is blue, white and black noise): a median over the paint
    calm = np.dstack([ndimage.median_filter(src[..., k], size=3) for k in range(3)])
    src = np.where(mask[..., None], calm, src)
    big = np.asarray(Image.fromarray(np.clip(src, 0, 255).astype(np.uint8)).resize(size, Image.LANCZOS)).astype(float)
    m = np.asarray(Image.fromarray(mask.astype(np.uint8) * 255).resize(size, Image.BILINEAR)).astype(float) / 255
    alpha = np.clip((ndimage.gaussian_filter(m, 1.2) - 0.25) * 2.2, 0, 1)
    core = np.asarray(Image.fromarray(ndimage.binary_erosion(mask, iterations=1).astype(np.uint8) * 255).resize(size, Image.NEAREST)) > 128
    if core.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~core, return_indices=True)
        big = np.where(core[..., None], big, big[iy, ix])
    return big, (alpha * 255).astype(np.uint8)


def rgba(rgb, alpha):
    return Image.fromarray(np.dstack([rgb.astype(np.uint8), alpha]), 'RGBA')


def glow_layer(fc, g, half, keep):
    """The light the death knight faces add around the eyes, as one colour-and-alpha layer. Per pixel,
    DK = (1 - a) * plain + a * G over every plain face and stock skin colour, so a least-squares line of DK
    against plain gives the slope 1 - a and, per channel, the intercept a * G."""
    get = fc.upper if half == 'upper' else fc.lower
    x = np.stack([get(g, f, c) for f in range(DK_OFFSET) for c in STOCK_COLOURS]).astype(float)
    y = np.stack([get(g, f + DK_OFFSET, c) for f in range(DK_OFFSET) for c in STOCK_COLOURS]).astype(float)
    xm, ym = x.mean(0), y.mean(0)
    slope = ((x - xm) * (y - ym)).sum((0, 3)) / np.maximum(((x - xm) ** 2).sum((0, 3)), 1e-6)
    a = np.clip(1 - slope, 0, 1)
    a[np.abs(ym - xm).sum(2) < 12] = 0                       # where DK and plain agree, no glow
    a[~keep] = 0
    G = np.clip((ym - (1 - a[..., None]) * xm) / np.maximum(a[..., None], 1e-3), 0, 255)
    return np.where(a[..., None] > 0, G, 0), ndimage.median_filter((a * 255).astype(np.uint8), 3)


def base_face(fc, g, f, eye):
    """The plain face (0-8) a marked face was painted on: the closest outside the eye."""
    a = fc.both(g, f, 0)
    return min(range(DK_OFFSET), key=lambda b: np.median(np.abs(a - fc.both(g, b, 0)).sum(2)[~eye]))


def marking_mask(fc, g, f, b, eye):
    d = np.abs(fc.both(g, f, 0) - fc.both(g, b, 0)).sum(2)
    m = ndimage.binary_opening((d > MARK_DIFF) & ~eye, iterations=1)
    m = ndimage.binary_closing(m, iterations=2)
    lab, n = ndimage.label(m)
    sizes = np.bincount(lab.ravel())
    m = np.isin(lab, [i for i in range(1, n + 1) if sizes[i] >= 30])
    return ndimage.binary_fill_holes(m) & ~eye


class Writer:
    """Writes each distinct layer once; a layer identical to one already written reuses its path."""

    def __init__(self):
        self.by_hash, self.files = {}, []

    def put(self, client_path, im):
        h = hashlib.sha1(im.tobytes()).hexdigest()
        if h in self.by_hash:
            return self.by_hash[h]
        icons.write_blp_rgba(ASSETS / client_path.replace('\\', '/'), im)
        self.by_hash[h] = client_path
        self.files.append(client_path)
        return client_path


def migration_sql(split):
    """Idempotent: a character keeps any customization row it has, and only faces above 8 are rewritten."""
    rows = [f'({g}, {c}, {f}, {shape}, {eye}, {mark})'
            for g, sex in SEXES.items() for c, per in split[sex].items() for f, (shape, eye, mark) in per.items()]
    out = [
        '-- F-151 Modern Character Creator, Phase 2: existing orcs move to face shape + eye colour + marking.',
        '-- GENERATED by Scripts/Character Skins/eyes_markings.py --migration - do not edit, re-run the script.',
        '-- Needs character_customizations (zz_[F-151]_character_customizations.sql, which sorts first).',
        'DROP TEMPORARY TABLE IF EXISTS zep_orc_face_split;',
        'CREATE TEMPORARY TABLE zep_orc_face_split (gender TINYINT UNSIGNED, skin TINYINT UNSIGNED, face TINYINT UNSIGNED,',
        '  shape TINYINT UNSIGNED, eye TINYINT UNSIGNED, marking TINYINT UNSIGNED, PRIMARY KEY (gender, skin, face));',
        'INSERT INTO zep_orc_face_split (gender, skin, face, shape, eye, marking) VALUES',
        ',\n'.join(rows) + ';',
    ]
    for customization, column in ((1, 'eye'), (2, 'marking')):
        out += [
            'INSERT INTO character_customizations (guid, customization, choice)',
            f'SELECT c.guid, {customization}, s.{column} FROM characters AS c',
            'JOIN zep_orc_face_split AS s ON s.gender = c.gender AND s.skin = c.skin AND s.face = c.face',
            f'WHERE c.race = {RACE} AND NOT EXISTS (SELECT 1 FROM character_customizations AS x WHERE x.guid = c.guid AND x.customization = {customization});',
        ]
    out += [
        'UPDATE characters AS c JOIN zep_orc_face_split AS s ON s.gender = c.gender AND s.skin = c.skin AND s.face = c.face',
        f'SET c.face = s.shape WHERE c.race = {RACE} AND c.face > 8;',
        'DROP TEMPORARY TABLE zep_orc_face_split;',
    ]
    return '\n'.join(out) + '\n'


def main():
    global FILES
    FILES = FileResolver([ASSETS] + [r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])
    fc = Faces(charsections(_dbc_query_fn('live')), FILES)
    for d in ASSETS.glob('Character/Orc/*/'):
        for old in d.glob('Orc*.blp'):
            if re.match(r'Orc(Male|Female)(Eyes|Marking|EyeGlow)\d', old.name) or old.name.endswith('Plain.blp') and 'Face' in old.name:
                old.unlink()
    out, rows, split, rid, plain_rows = Writer(), [], {}, ID_BASE, []
    for g, sex in SEXES.items():
        folder = f'Character\\Orc\\{sex}\\Orc{sex}'
        emask = eye_mask(fc, g)
        ealpha = soft(emask, 0)
        eye_full = np.zeros((192, 256), bool)
        eye_full[:64] = ndimage.binary_dilation(emask, iterations=2)

        eyes = []
        for i, (c, f) in enumerate(EYES[g]):
            src = fc.upper(g, f, c).astype(float)
            alpha, lower = ealpha, ''
            if (c, f) == EYE_DK:
                gu, au = glow_layer(fc, g, 'upper', ~ndimage.binary_dilation(emask, iterations=1))
                src = np.where(emask[..., None], src, gu)
                alpha = np.maximum(ealpha, au)
                gl, al = glow_layer(fc, g, 'lower', np.ones((128, 256), bool))
                lower = out.put(f'{folder}Eyes{i:02d}Lower.blp', rgba(gl, al))
            path = out.put(f'{folder}Eyes{i:02d}.blp', rgba(src, alpha))
            eyes.append(fc.upper(g, f, c)[emask])
            glow = ''
            if (c, f) == EYE_DK or c != 0:
                # a glow eye (death knight only): the stock death knight eye glow recoloured to this eye's colour
                glow = f'{folder}EyeGlow{i:02d}.blp'
                icons.write_blp_rgba(ASSETS / glow.replace('\\', '/'), glow_texture(fc.upper(g, f, c)[emask]))
            rows.append((rid, g, SECTION_EYES, lower, path, FLAGS_DK if glow else FLAGS_EYE, i, 0, glow))
            rid += 1

        def eye_of(f, c):
            e = fc.upper(g, f, c)[emask]
            dist = [np.abs(e - x).sum(1).mean() for x in eyes]
            best = int(np.argmin(dist))
            return best if dist[best] < SAME_EYE else None

        marks = []
        for k, f in enumerate(MARKED, start=1):
            b = base_face(fc, g, f, eye_full)
            m = marking_mask(fc, g, f, b, eye_full)
            marks.append((k, f, b, m))
            print(f'{sex} marking {k}: face {f} = face {b} + {m[:64].sum()} upper / {m[64:].sum()} lower px')
            alpha = soft(m)
            for c in (fc.colours(g) if EMIT_MARKINGS else ()):
                src = fc.both(g, f, c)
                lo = out.put(f'{folder}Marking{k:02d}_{c:02d}Lower.blp', rgba(src[64:], alpha[64:]))
                up = out.put(f'{folder}Marking{k:02d}_{c:02d}Upper.blp', rgba(src[:64], alpha[:64])) if m[:64].any() else ''
                rows.append((rid, g, SECTION_MARKINGS, lo, up, FLAGS_ANY, k, c, ''))
                rid += 1

        # the face paint of the BAKED colours. Read from the original face files: once applied, the live rows point
        # at the plain copies.
        paints = {}
        for c, (base, mark, mode) in BAKED[g].items():
            for f in range(DK_OFFSET):
                r = fc.faces[(g, f, c)]
                orig = {k: r[k].replace('Plain.blp', '.blp') for k in ('texture_1', 'texture_2')}
                a = np.vstack([fc.tex(orig['texture_2']), fc.tex(orig['texture_1'])]).astype(float)
                b = fc.both(g, f, base).astype(float)
                la, lb = a.mean(2), b.mean(2)
                lb = lb * np.median(la[~eye_full] / np.maximum(lb[~eye_full], 1))
                if mode == 'dark':
                    raw = la < lb * 0.55
                else:
                    # dark paint, blue well above the colour's own blue cast (its shadows are blue too), or gold glow
                    blue = a[..., 2] - (a[..., 0] + a[..., 1]) / 2
                    paint_px = (la < lb * 0.55) | (blue > np.median(blue[~eye_full]) + PAINT_BLUE)
                    raw = paint_px | (-blue > np.median(-blue[~eye_full]) + PAINT_GOLD)
                m = ndimage.binary_opening(raw & ~eye_full, iterations=1)
                m = ndimage.binary_closing(m, iterations=2)
                lab, n = ndimage.label(m)
                sizes = np.bincount(lab.ravel())
                core = ndimage.binary_fill_holes(np.isin(lab, [i for i in range(1, n + 1) if sizes[i] >= 60 or mode == 'dark' and sizes[i] >= 30])) & ~eye_full
                m = ndimage.binary_dilation(core, iterations=2) & ~eye_full    # plus the paint's light rim, for the fill
                if mark and mark not in paints and f == 0:
                    if mode == 'rebuild':
                        # the marking is the paint only, not the lid glow or the skin's cream highlights
                        pm = ndimage.binary_closing(ndimage.binary_opening(paint_px & ~eye_full, iterations=1), iterations=2)
                        lab2, n2 = ndimage.label(pm)
                        sz2 = np.bincount(lab2.ravel())
                        keep = sorted(range(1, n2 + 1), key=lambda i: -sz2[i])[:2]    # one streak under each eye
                        core = ndimage.binary_fill_holes(np.isin(lab2, keep)) & ~eye_full
                    paints[mark] = (a.copy(), core)
                if mode == 'rebuild':
                    # the base face's detail (its brightness against its own local mean) in this colour's local tone,
                    # the tone averaged without the paint / glow pixels
                    w = (~ndimage.binary_dilation(raw, iterations=4)).astype(float)
                    tone = np.dstack([ndimage.gaussian_filter(a[..., k] * w, TONE_SIGMA) for k in range(3)])
                    tone /= np.maximum(ndimage.gaussian_filter(w, TONE_SIGMA), 1e-3)[..., None]
                    lb0 = b.mean(2)
                    detail = lb0 / np.maximum(ndimage.gaussian_filter(lb0, TONE_SIGMA), 1)
                    plain = np.where(eye_full[..., None], a, np.clip(tone * detail[..., None], 0, 255))
                else:
                    # plain face: the base face's shading in this colour's tone where the paint was
                    tone = np.median(a[~m & ~eye_full], axis=0)
                    fill = np.clip(tone * lb[..., None] / max(float(np.median(lb[~m & ~eye_full])), 1.0), 0, 255)
                    w = ndimage.uniform_filter(ndimage.binary_dilation(m, iterations=1).astype(float), 3)[..., None]
                    plain = a * (1 - w) + fill * w
                for k, half in (('texture_2', plain[:64]), ('texture_1', plain[64:])):
                    rel = orig[k][:-4] + 'Plain.blp'
                    icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), rgba(half, np.full(half.shape[:2], 255, np.uint8)))
                    plain_rows.append((g, f, c, k, rel))
            print(f'{sex} colour {c}: face paint ({mode}) -> marking {mark or "none"}, plain faces written')
        for mark, (src, m) in (sorted(paints.items()) if EMIT_MARKINGS else ()):
            # cut at twice the face's size with a soft matte, written at the face's size: antialiased edges (user report: scuffed)
            hi, alpha = soft_hd(src, m)
            half = lambda a, h: np.asarray(Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).resize((256, h), Image.LANCZOS))  # noqa: E731
            lo = out.put(f'{folder}Marking{mark:02d}Lower.blp', rgba(half(hi[128:], 128), half(alpha[128:], 128)))
            up = out.put(f'{folder}Marking{mark:02d}Upper.blp', rgba(half(hi[:128], 64), half(alpha[:128], 64))) if m[:64].any() else ''
            print(f'{sex} marking {mark}: {int(m.sum())} px')
            for c in fc.colours(g):
                rows.append((rid, g, SECTION_MARKINGS, lo, up, FLAGS_ANY, mark, c, ''))
                rid += 1

        # old face -> (face, eye, marking) per skin colour. A skin colour whose faces (nearly) all share one
        # baked eye (the Nexus glow colours) keeps that eye; otherwise each face keeps its own.
        base_of = {f: (f % DK_OFFSET if f < 18 else marks[(f - 18) % 7][2]) for f in range(32)}
        mark_of = {f: (0 if f < 18 else (f - 18) % 7 + 1) for f in range(32)}
        dk_eye = EYES[g].index(EYE_DK)
        split[sex] = {}
        for c in fc.colours(g):
            own = [eye_of(f, c) for f in range(DK_OFFSET)]
            top = max(set(own), key=own.count)
            fixed = top if top is not None and own.count(top) >= 6 and len(set(own)) <= 2 else None
            if fixed is not None:
                print(f'{sex} colour {c}: every face has eye {fixed}')
            per = {}
            for f in range(32):
                dk = DK_OFFSET <= f < 18 or f >= 25
                eye = dk_eye if dk else (fixed if fixed is not None else eye_of(f, 0))
                per[f] = [base_of[f], eye, mark_of[f]]
            split[sex][c] = per
        missing = [(c, f) for c, per in split[sex].items() for f, v in per.items() if v[1] is None]
        if missing:
            raise SystemExit(f'{sex}: no eye choice matches {missing[:8]}')

    if rid > ID_END:
        raise SystemExit(f'{rid - ID_BASE} rows overflow the F-151 id range')
    lines = [
        '-- F-151 Modern Character Creator, Phase 2: orc eye colour and marking layers.',
        '-- GENERATED by Scripts/Character Skins/eyes_markings.py - do not edit, re-run the script.',
        f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
        'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES',
    ]
    esc = lambda p: p.replace('\\', '\\\\')  # noqa: E731
    lines += [f"({r}, {RACE}, {g}, {s}, '{esc(t1)}', '{esc(t2)}', '{esc(t3)}', {fl}, {ty}, {c})," for r, g, s, t1, t2, fl, ty, c, t3 in rows]
    lines[-1] = lines[-1][:-1] + ';'
    SQL.write_text('\n'.join(lines) + '\n')
    plain = ['-- F-151 Modern Character Creator: plain faces for the colours that baked in face paint (now markings '
             f'{", ".join(map(str, BAKED_MARKS))}).', '-- GENERATED by Scripts/Character Skins/eyes_markings.py - do not edit, re-run the script.']
    per_row = {}
    for g, f, c, k, rel in plain_rows:
        per_row.setdefault((g, f, c), {})[k] = rel
    plain += [f"UPDATE charsections SET texture_1 = '{esc(t['texture_1'])}', texture_2 = '{esc(t['texture_2'])}' "
              f"WHERE race = {RACE} AND gender = {g} AND base_section = 1 AND type = {f} AND color_index = {c};"
              for (g, f, c), t in sorted(per_row.items())]
    PLAIN_SQL.write_text('\n'.join(plain) + '\n')
    SPLIT.write_text(json.dumps(split, indent=1) + '\n')
    if '--migration' in sys.argv[1:]:
        MIGRATION.write_text(migration_sql(split))
        print(f'migration -> {MIGRATION.relative_to(CRAFT)}')
    print(f'{len(rows)} rows -> {SQL.relative_to(CRAFT)}; {len(out.files)} layers written; split -> {SPLIT.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
