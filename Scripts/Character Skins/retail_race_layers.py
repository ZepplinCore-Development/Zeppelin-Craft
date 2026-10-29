"""F-230 plan A (step 5): retail texture customizations of the other races as our CharSections layers 6-8.

retail_layers.py did this for the orc; this does tauren, dwarf, night elf, troll, human female and blood elf. Retail
paints each customization as its own texture with a blend mode and a target (ChrModelTextureLayer): the target's
section mask says which part of retail's 2:1 character atlas the texture covers:

  0x1000         the body square (left half)      -> our 512 body atlas as it is (our skins are retail's HD layout;
                                                     checked per race and sex: `body_ncc` in the fit JSON)
  0x200/400/800  the face square (right half)     -> our FaceUpper + FaceLower (256x192 at 0,320), by an axis-aligned
                                                     scale + offset fitted per race and sex (`face_fit`)
  0xffffffff     the whole 2:1 atlas              -> both of the above

The face fit is redone for every race and sex: normalised cross-correlation of our face 0 / colour 0 (eyeball island
blanked) against retail's first face (transparent pixels blanked), coarse to fine. Our eyeball island
(lib/wardrobe/eye_islands.py) is left clear in every layer.

Blend modes become plain alpha (one paste in the client): alpha (9, 15) as it is; multiply (4) and overlay (6, keyed
on the layer like retail_layers.py) as the
alpha a and colour C that reproduce the blend exactly for a grey layer on any skin (black / white with alpha), and for
a coloured one (makeup) on the race's colour-0 skin tone.

The client reads layer rows at colour 0 only (CCharacterComponent::FaceLayerValid: `int32_t color = 0`), so a
pattern x colour choice is flattened into `type`: pattern-major, a subset of colours where retail has many. New types
are appended after the existing ones of each race / sex / section (body_markings.py SPLITS), never renumbered.

  python3 "Scripts/Character Skins/retail_race_layers.py" [--refit] [--preview DIR] [--only RACE:SEX,...]

Writes <Folder><Sex>Retail{Tattoo,Scars,WarPaint}NN.blp to zep-skin-expansion (PATCH-L),
[F-230]_charsections_retailraces.sql (ids 101000-101499) and retail_race_layers.json (fits + every row's source).
"""
import collections
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage, signal

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import _dbc_query_fn  # noqa: E402
from lib import retail  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.eye_islands import island  # noqa: E402


def _load(name, file):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(file))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


icons = _load('icons', 'subrace_icons.py')
rc = _load('rc', 'retail_customizations.py')          # the retail DB2 table cache
preview_mod = _load('skin_preview', 'skin_preview.py')  # files_resolver: HD art first

ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
SQL = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'dbc' / '[F-230]_charsections_retailraces.sql'
STATE = Path(__file__).with_name('retail_race_layers.json')
ID_BASE, ID_END = 101000, 101499                 # after eyes_all.py's 100000-100999
FLAGS_ANY = 0x11
SIZE = 512
HEAD = (0, 320, 256, 192)                         # FaceUpper (0,320,256,64) over FaceLower (0,384,256,128)
SEXES = {0: 'Male', 1: 'Female'}
FOLDERS = {1: 'Human', 3: 'Dwarf', 4: 'NightElf', 6: 'Tauren', 8: 'Troll', 10: 'BloodElf'}
NAMES = {6: 'Tattoo', 7: 'Scars', 8: 'WarPaint'}
FACE_MASKS = {0x200, 0x400, 0x800}
BODY_MASK, FULL_MASK = 0x1000, 0xffffffff

# (race, sex) -> [(section, pattern option, colour option or None, patterns (retail names, in order) or None = all,
#                  colours (retail OrderIndex of the colour choice, in order) or None = all)]
# Colour subsets keep the type count of a section sensible (<= ~30, retail's own count where asked for).
TAUREN = [(8, 'Face Paint', 'Paint Color', ['Kodo', 'Otter', 'Hawk'], [0, 1, 2, 4, 5]),   # 3: dark red = 1's swatch
          (8, 'Body Paint', 'Paint Color', ['Kodo', 'Hawk', 'Otter'], [0, 1, 2, 4, 5])]
DWARF = [(6, 'Tattoo', 'Tattoo Color', None, None)]
PICKS = {
    (6, 0): TAUREN, (6, 1): TAUREN,
    (3, 0): DWARF, (3, 1): DWARF,
    (4, 0): [(6, 'Tattoo', None, ['Moon', 'Ancient', 'Wild', 'Owl'], None),
             (6, 'Tattoo', 'Tattoo Color', ['Suffering', 'Betrayer', 'Pain', 'Sacrifice', 'Revenge', 'Chaos'], [1, 3]),
             (7, 'Scars', None, None, None),
             (8, 'Markings', None, None, None)],
    (4, 1): [(6, 'Tattoo', 'Tattoo Color', ['Suffering', 'Betrayer', 'Pain', 'Sacrifice', 'Revenge', 'Chaos'], [1, 3]),
             (6, 'Tattoo', 'Tattoo Color', ['Wild', 'Ancient', 'Owl', 'Moon'], [7]),
             (7, 'Scars', None, None, None),
             (8, 'Markings', 'Markings Color', None, [3]),
             (8, 'Markings', 'Markings Color', ['Bear', 'Crane', 'Leaf', 'Wings', 'Owl'], [5])],
    (8, 0): [(8, 'Face Paint', 'Face Paint Color', ['Berserker', 'Fangs', 'Mask', 'Oni', 'Prophet', 'War'], [1, 6]),
             (8, 'Face Paint', 'Face Paint Color', ['Voodoo', 'Skull', 'Ritual'], [15, 16]),
             (8, 'Body Paint', 'Body Paint Color', None, [1, 2])],
    (8, 1): [(8, 'Face Paint', 'Face Paint Color', None, [1, 2, 4]),
             (8, 'Body Paint', 'Body Paint Color', None, [1, 2, 4])],
    (1, 1): [(8, 'Makeup', None, None, None)],
    (10, 0): [(6, 'Tattoo', 'Tattoo Color', None, [1, 3])],
    (10, 1): [(6, 'Tattoo', 'Tattoo Color', None, [1, 3])],
}
HUES = [(15, 'red'), (40, 'orange'), (65, 'yellow'), (150, 'green'), (190, 'teal'), (250, 'blue'), (290, 'purple'),
        (335, 'magenta'), (360, 'red')]


class Retail:
    def __init__(self):
        t = {n: rc.table(n) for n in ('ChrCustomizationOption', 'ChrCustomizationChoice', 'ChrCustomizationElement',
                                      'ChrCustomizationMaterial', 'ChrRaceXChrModel', 'TextureFileData', 'ChrModel',
                                      'ChrModelTextureLayer')}
        self.model = {(int(r['ChrRacesID']), int(r['Sex'])): r['ChrModelID'] for r in t['ChrRaceXChrModel']}
        self.layout = {m['ID']: m['CharComponentTextureLayoutID'] for m in t['ChrModel']}
        self.layer = {}
        for r in t['ChrModelTextureLayer']:
            for k in ('ChrModelTextureTargetID_0', 'ChrModelTextureTargetID_1'):
                if r[k] != '0':
                    self.layer[(r['CharComponentTextureLayoutsID'], r[k])] = (
                        int(r['BlendMode']), int(r['TextureSectionTypeBitMask']) & 0xffffffff)
        self.options = collections.defaultdict(dict)
        for o in t['ChrCustomizationOption']:
            self.options[o['ChrModelID']][o['Name_lang']] = o['ID']
        self.choices = collections.defaultdict(list)
        self.choice = {}
        for c in t['ChrCustomizationChoice']:
            self.choices[c['ChrCustomizationOptionID']].append(c)
            self.choice[c['ID']] = c
        self.elements = collections.defaultdict(list)
        for e in t['ChrCustomizationElement']:
            self.elements[e['ChrCustomizationChoiceID']].append(e)
        self.materials = {m['ID']: m for m in t['ChrCustomizationMaterial']}
        self.textures = collections.defaultdict(list)
        for r in t['TextureFileData']:
            self.textures[r['MaterialResourcesID']].append((int(r['UsageType']), int(r['FileDataID'])))

    def option(self, race, sex, name):
        oid = self.options[self.model[(race, sex)]].get(name)
        return sorted(self.choices[oid], key=lambda c: int(c['OrderIndex'])) if oid else []

    def texture(self, material):
        """The diffuse (usage 0) file of a material: the newest one when there are several."""
        tex = sorted(self.textures[material['MaterialResourcesID']])
        diffuse = [f for u, f in tex if u == 0]
        return max(diffuse) if diffuse else tex[0][1]

    def elements_of(self, layout, choice_id, related=None):
        """[(target, blend, mask, fdid)] of a choice (only the elements tied to the related choice, if given)."""
        out = []
        for e in self.elements[choice_id]:
            if related is not None and e['RelatedChrCustomizationChoiceID'] != related:
                continue
            m = self.materials.get(e['ChrCustomizationMaterialID'])
            if not m:
                continue
            blend, mask = self.layer.get((layout, m['ChrModelTextureTargetID']), (15, FULL_MASK))
            out.append((m['ChrModelTextureTargetID'], blend, mask, self.texture(m)))
        return out

    def picks(self, race, sex, pattern_opt, colour_opt, patterns, colours):
        """[(label, [(target, blend, mask, fdid)], retail choice ids)] in pattern-major order."""
        layout = self.layout[self.model[(race, sex)]]
        pats = [c for c in self.option(race, sex, pattern_opt) if c['Name_lang'] != 'None' and int(c['OrderIndex']) > 0]
        if patterns is not None:
            by_name = {c['Name_lang']: c for c in pats}
            pats = [by_name[n] for n in patterns]
        out = []
        for p in pats:
            if colour_opt is None:
                els = self.elements_of(layout, p['ID'])
                if els:
                    out.append((p['Name_lang'], els, [int(p['ID'])]))
                continue
            cols = [c for c in self.option(race, sex, colour_opt) if c['Name_lang'] != 'None']
            if colours is not None:
                by_ord = {int(c['OrderIndex']): c for c in cols}
                cols = [by_ord[o] for o in colours if o in by_ord]
            for c in cols:
                els = self.elements_of(layout, c['ID'], related=p['ID'])
                if els:
                    out.append((f"{p['Name_lang']} {c['Name_lang'] or colour_name(int(c['SwatchColor_0']))}", els, [int(p['ID']), int(c['ID'])]))
        return out

    def face_square(self, race, sex):
        """Retail's first face of its first skin colour (the face square), RGBA."""
        skin = self.option(race, sex, 'Skin Color')[0]['ID']
        for c in self.option(race, sex, 'Face'):
            for e in self.elements[c['ID']]:
                m = self.materials.get(e['ChrCustomizationMaterialID'])
                if m and e['RelatedChrCustomizationChoiceID'] == skin and m['ChrModelTextureTargetID'] in ('4', '5'):
                    return Image.open(retail.texture_file(self.texture(m))).convert('RGBA')
        return None

    def skin(self, race, sex):
        c = self.option(race, sex, 'Skin Color')[0]['ID']
        for e in self.elements[c]:
            m = self.materials.get(e['ChrCustomizationMaterialID'])
            if m and m['ChrModelTextureTargetID'] == '1' and e['RelatedChrCustomizationChoiceID'] == '0':
                return Image.open(retail.texture_file(self.texture(m))).convert('RGBA')
        return None


def colour_name(swatch):
    """A label for a retail swatch (SQL comments only): grey levels, else a hue bin, 'dark' when deep."""
    import colorsys
    r, g, b = ((swatch >> 16) & 255) / 255, ((swatch >> 8) & 255) / 255, (swatch & 255) / 255
    h, sat, v = colorsys.rgb_to_hsv(r, g, b)
    if sat < 0.2:
        return 'white' if v > 0.75 else 'grey' if v > 0.35 else 'black'
    name = next(n for top, n in HUES if h * 360 <= top)
    return f'dark {name}' if v < 0.45 else name


# ---------------------------------------------------------------- fits
def ours(files, query, race, sex):
    """Our colour 0: the 512 body atlas (RGB) and the 256x192 face (face 0)."""
    def row(section):
        return query(f'SELECT texture_1, texture_2 FROM charsections WHERE race = {race} AND gender = {sex} AND '
                     f'base_section = {section} AND type = 0 AND color_index = 0 ORDER BY id DESC LIMIT 1')[0]
    body = read_blp(files.find(row(0)['texture_1'])).convert('RGB').resize((SIZE, SIZE), Image.LANCZOS)
    f = row(1)
    face = Image.new('RGB', (256, 192))
    face.paste(read_blp(files.find(f['texture_2'])).convert('RGB').resize((256, 64), Image.LANCZOS), (0, 0))
    face.paste(read_blp(files.find(f['texture_1'])).convert('RGB').resize((256, 128), Image.LANCZOS), (0, 64))
    return body, face


def ncc(a, b, valid):
    a, b = a[valid] - a[valid].mean(), b[valid] - b[valid].mean()
    return float((a * b).sum() / np.sqrt((a * a).sum() * (b * b).sum() + 1e-9))


def body_check(body, retail_skin):
    """NCC of our body against retail's body square, the head box left out (our skins paint the face there)."""
    a = np.asarray(body.convert('L')).astype(float)
    sq = retail_skin.crop((0, 0, retail_skin.width // 2, retail_skin.height)).convert('L').resize((SIZE, SIZE))
    b = np.asarray(sq).astype(float)
    valid = np.ones_like(a, bool)
    x, y, w, h = HEAD
    valid[y:y + h, x:x + w] = False
    return round(ncc(a, b, valid), 3)


def _search(big, tpl_src, sxs, sys_, scale):
    best = None
    energy_cache = {}
    for sx in sxs:
        for sy in sys_:
            w, h = int(round(256 * sx * scale)), int(round(192 * sy * scale))
            if w > big.shape[1] or h > big.shape[0] or w < 8 or h < 8:
                continue
            tpl = np.asarray(Image.fromarray(tpl_src).resize((w, h), Image.BILINEAR)).astype(float)
            tpl -= tpl.mean()
            tpl /= np.linalg.norm(tpl) + 1e-6
            key = (w, h)
            if key not in energy_cache:
                s1 = signal.fftconvolve(big, np.ones((h, w)), mode='valid')
                s2 = signal.fftconvolve(big * big, np.ones((h, w)), mode='valid')
                energy_cache[key] = np.sqrt(np.maximum(s2 - s1 * s1 / (w * h), 1e-6))
            n = signal.fftconvolve(big, tpl[::-1, ::-1], mode='valid') / energy_cache[key]
            i = np.unravel_index(np.argmax(n), n.shape)
            if best is None or n[i] > best[0]:
                best = (float(n[i]), float(sx), float(sy), i[1] / scale, i[0] / scale)
    return best


def face_fit(face, square, race, sex):
    """(ncc, sx, sy, x0, y0): our face pixel (u, v) of 256x192 sits at (x0 + u*sx, y0 + v*sy) in retail's face
    square at 512x512. Our eyeball and retail's transparent pixels are blanked to the mean."""
    tpl = np.asarray(face.convert('L')).astype(float)
    eye = ndimage.binary_dilation(island(race, sex), iterations=4)
    tpl[eye] = tpl[~eye].mean()
    tpl = tpl.astype(np.uint8)
    sq = square.resize((512, 512), Image.LANCZOS)
    a = np.asarray(sq).astype(float)
    big = a[..., :3].mean(axis=2)
    valid = a[..., 3] > 16
    big[~valid] = big[valid].mean()
    # coarse at half size (at a quarter, dwarf female locked onto the wrong scale: eyes on, nose and mouth 20 px
    # off), then +-0.06 at full size
    small = np.asarray(Image.fromarray(big.astype(np.uint8)).resize((256, 256), Image.LANCZOS)).astype(float)
    c = _search(small, tpl, np.arange(0.8, 2.01, 0.05), np.arange(1.0, 2.71, 0.05), 0.5)
    sxs = np.arange(c[1] - 0.06, c[1] + 0.061, 0.02)
    sys_ = np.arange(c[2] - 0.06, c[2] + 0.061, 0.02)
    f = _search(big, tpl, sxs, sys_, 1.0)
    return [round(f[0], 3), round(f[1], 3), round(f[2], 3), int(f[3]), int(f[4])]


# ---------------------------------------------------------------- layers
def to_alpha(rgba, blend, ref):
    """Retail RGBA layer (float 0-1) -> straight RGBA to alpha-blend. ref: the skin tone (0-1 RGB) a coloured
    multiply / overlay is made exact on; a grey one is exact on every skin."""
    rgb, al = rgba[..., :3], rgba[..., 3:]
    if blend not in (4, 6):
        return rgba
    b = ref[None, None, :]
    if blend == 4:
        target = b * rgb
    else:
        # blend 6 keyed on the layer (hard light), as retail_layers.py reads it: a layer under 0.5 darkens. Keyed on
        # the skin (true overlay), a dark paint on a pale skin hardly shows (human makeup is dark plum / emerald ink)
        target = np.where(rgb < 0.5, 2 * b * rgb, 1 - 2 * (1 - b) * (1 - rgb))
    # the least alpha that reaches the target with a colour in range: for a grey layer this is 1 - l (multiply) and
    # |2l - 1| (overlay) on every skin, i.e. exact everywhere; a coloured one is exact on ref
    d = target - b
    room = np.where(d < 0, b, 1 - b)
    a0 = (np.abs(d) / np.maximum(room, 1e-3)).max(axis=2, keepdims=True).clip(0, 1)
    ok = a0 > 1e-3
    colour = np.clip(np.where(ok, b + d / np.maximum(a0, 1e-3), 0), 0, 1)
    return np.dstack([colour, np.where(ok, a0, 0) * al])


def premul(im):
    a = np.asarray(im.convert('RGBA')).astype(np.float32) / 255
    a[..., :3] *= a[..., 3:]
    return a


def unpremul(a):
    out = a.copy()
    out[..., :3] = np.where(a[..., 3:] > 1e-4, a[..., :3] / np.maximum(a[..., 3:], 1e-4), 0)
    return out


def resize_pm(a, size):
    """Resize a premultiplied float RGBA array."""
    return np.dstack([np.asarray(Image.fromarray(a[..., k]).resize(size, Image.LANCZOS)) for k in range(4)]).clip(0, 1)


def build_layer(elements, fit, eye, ref):
    """Our 512 atlas (straight RGBA float) of one choice's retail textures."""
    body = np.zeros((SIZE, SIZE, 4), np.float32)
    square = np.zeros((1024, 1024, 4), np.float32)
    for _target, blend, mask, fdid in elements:
        src = Image.open(retail.texture_file(fdid)).convert('RGBA')
        a = np.asarray(src).astype(np.float32) / 255
        a = to_alpha(a, blend, ref)                     # straight alpha, blend resolved
        a[..., :3] *= a[..., 3:]                        # premultiplied from here
        h, w = a.shape[:2]
        if mask == BODY_MASK:
            parts = [('body', a)]
        elif mask in FACE_MASKS:
            parts = [('face', a)]
        else:
            parts = [('body', a[:, :w // 2]), ('face', a[:, w // 2:])]
        for where, p in parts:
            if where == 'body':
                p = resize_pm(p, (SIZE, SIZE))
                body = p + body * (1 - p[..., 3:])
            else:
                p = resize_pm(p, (1024, 1024))
                square = p + square * (1 - p[..., 3:])
    out = body.copy()
    x, y, w, h = HEAD
    out[y:y + h, x:x + w] = 0
    if square[..., 3].any():
        _n, sx, sy, x0, y0 = fit
        # our face at twice its size, sampled from the 1024 square (fit is in 512 units), then down to 256x192
        hi = np.dstack([np.asarray(Image.fromarray(square[..., k]).transform(
            (w * 2, h * 2), Image.AFFINE, (sx, 0, x0 * 2, 0, sy, y0 * 2), Image.BILINEAR)) for k in range(4)])
        head = resize_pm(hi, (w, h))
        head[eye] = 0
        out[y:y + h, x:x + w] = head
    return unpremul(out)


def to_image(a):
    a = (a.clip(0, 1) * 255 + 0.5).astype(np.uint8)
    a[a[..., 3] == 0, :3] = 0
    return Image.fromarray(a, 'RGBA')


def main():
    args = sys.argv[1:]
    refit = '--refit' in args
    preview = Path(args[args.index('--preview') + 1]) if '--preview' in args else None
    only = None
    if '--only' in args:
        only = {tuple(int(v) for v in p.split(':')) for p in args[args.index('--only') + 1].split(',')}
    state = json.loads(STATE.read_text()) if STATE.exists() else {}
    fits = state.get('fits', {})
    r = Retail()
    files = preview_mod.files_resolver()
    query = _dbc_query_fn('live')

    sql = ['-- F-230 step 5: retail texture customizations of tauren, dwarf, night elf, troll, human female and blood elf',
           '-- as CharSections layers (base_section 6 tattoo, 7 scars, 8 war paint; colour 0, flags 0x11).',
           '-- GENERATED by Scripts/Character Skins/retail_race_layers.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};']
    rows_out, rid = [], ID_BASE
    for (race, g), picks in PICKS.items():
        folder, sex = FOLDERS[race], SEXES[g]
        key = f'{race}:{g}'
        body, face = ours(files, query, race, g)
        if refit or key not in fits:
            fits[key] = {'body_ncc': body_check(body, r.skin(race, g)),
                         'face_fit': face_fit(face, r.face_square(race, g), race, g)}
            print(f'{folder} {sex}: {fits[key]}', flush=True)
        fit = fits[key]['face_fit']
        eye = ndimage.binary_dilation(island(race, g), iterations=3)
        b = np.asarray(body).reshape(-1, 3)
        ref = np.median(b[b.sum(axis=1) > 30], axis=0) / 255
        existing = query(f'SELECT base_section, MAX(type) AS t FROM charsections WHERE race = {race} AND gender = {g} '
                         f'AND base_section IN (6, 7, 8) AND id NOT BETWEEN {ID_BASE} AND {ID_END} GROUP BY base_section')
        nxt = {6: 1, 7: 1, 8: 1}
        for e in existing:
            nxt[int(e['base_section'])] = int(e['t']) + 1
        if only is None or (race, g) in only:
            for old in ASSETS.glob(f'Character/{folder}/{sex}/{folder}{sex}Retail*.blp'):
                old.unlink()
        for section, popt, copt, pats, cols in picks:
            for label, els, ids in r.picks(race, g, popt, copt, pats, cols):
                kind = nxt[section]
                nxt[section] += 1
                rel = f'Character\\{folder}\\{sex}\\{folder}{sex}Retail{NAMES[section]}{kind:02d}.blp'
                if only is None or (race, g) in only:
                    im = to_image(build_layer(els, fit, eye, ref))
                    icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), im)
                    if preview:
                        preview.mkdir(parents=True, exist_ok=True)
                        im.save(preview / f'{race}_{g}_{section}_{kind:02d}.png')
                text = f'{popt} {label}'
                sql.append(f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, "
                           f"flags, type, color_index) VALUES ({rid}, {race}, {g}, {section}, "
                           f"'{rel.replace(chr(92), chr(92) * 2)}', '', '', {FLAGS_ANY}, {kind}, 0);  -- {text} "
                           f"(retail {', '.join(str(e[3]) for e in els)})")
                rows_out.append({'id': rid, 'race': race, 'sex': g, 'section': section, 'type': kind, 'name': text,
                                 'retail_choices': ids, 'fdids': [e[3] for e in els],
                                 'blend': sorted({e[1] for e in els}), 'mask': sorted({hex(e[2]) for e in els})})
                print(f'{folder} {sex} section {section} type {kind}: {text}', flush=True)
                rid += 1
    if rid - 1 > ID_END:
        raise SystemExit('rows overflow the id range')
    SQL.write_text('\n'.join(sql) + '\n')
    STATE.write_text(json.dumps({'fits': fits, 'rows': rows_out}, indent=1) + '\n')
    print(f'{rid - ID_BASE} rows -> {SQL.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
