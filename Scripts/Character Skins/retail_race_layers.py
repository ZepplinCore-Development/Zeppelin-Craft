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

F-230 regroup (2026-10-30): a SOURCE only. layer_sources() hands the layers to markings_regroup.py, which cuts them
into face / body parts (scars whole), dedupes and owns every layer row and shipped BLP. This script writes only
retail_race_layers.json: the fits, and `rows` = the retired pre-regroup numbering (ids 101000-101250), kept as the
old (section, type) of each layer for the character migration. [F-230]_charsections_retailraces.sql is retired.
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


rc = _load('rc', 'retail_customizations.py')          # the retail DB2 table cache
preview_mod = _load('skin_preview', 'skin_preview.py')  # files_resolver: HD art first

STATE = Path(__file__).with_name('retail_race_layers.json')
# ids 101000-101499 were this script's rows before the F-230 regroup; markings_regroup.py deletes them
SIZE = 512
HEAD = (0, 320, 256, 192)                         # FaceUpper (0,320,256,64) over FaceLower (0,384,256,128)
SEXES = {0: 'Male', 1: 'Female'}
FOLDERS = {1: 'Human', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 8: 'Troll', 10: 'BloodElf', 11: 'Draenei'}
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
# F-230 second port (2026-10-30): more retail options, appended after the PICKS sources (markings_regroup.py numbers
# them after every existing value, so stored values keep their meaning). Each entry names the retail race it comes
# from, so an allied race's option lands on our base race through a fit of THAT race's art onto our atlas:
# (race, sex) -> [(retail race, pattern option, colour option or None, patterns or None, colours or None, opts)]
# opts: 'names' = {colour OrderIndex: label} where the swatch name misleads; 'design' = a name format ({pattern}); 'glow' = the texture is an emissive mask
# (alpha peaks at 17-89 / 255, retail lights it): alpha is stretched to GLOW_PEAK; 'body' / 'face' = False drops that
# half (it did not fit). Colour subsets (theme, <= ~40 values a row):
#   troll M face paint 6 tribal designs + red, black (orange, blue shipped; dropped amber, yellow, two greens,
#     purple, greys, slate, mauve); Voodoo / Skull / Ritual + purple, orange (dropped green, blue); body paint all 6
#   troll F face / body paint + green, orange, purple (all 6)
#   blood elf demon hunter tattoos + dark green (fel), red, dark blue (void); dropped the second bright green
#   night elf M demon hunter tattoos + dark green, red; F + red (dropped dark blue, bright green); F Cenarion
#     tattoos + dark teal (dropped 9 other greens / reds / purples)
#   tauren paint colour 3 = red and blue (PICKS skipped it as a copy of red: its swatch is, its texture is not)
TROLL_TRIBAL = ['Berserker', 'Fangs', 'Mask', 'Oni', 'Prophet', 'War']
DH = ['Suffering', 'Betrayer', 'Pain', 'Sacrifice', 'Revenge', 'Chaos']
EXTRA = {
    (8, 0): [(8, 'Face Paint', 'Face Paint Color', TROLL_TRIBAL, [8, 10], {}),
             (8, 'Face Paint', 'Face Paint Color', ['Voodoo', 'Skull', 'Ritual'], [20, 19], {}),
             (8, 'Body Paint', 'Body Paint Color', None, [3, 4, 5, 6], {})],
    (8, 1): [(8, 'Face Paint', 'Face Paint Color', None, [3, 5, 6], {}),
             (8, 'Body Paint', 'Body Paint Color', None, [3, 5, 6], {}),
             (31, 'Tattoo', None, None, None, {})],
    (10, 0): [(10, 'Tattoo', 'Tattoo Color', DH, [2, 5, 6], {})],
    (10, 1): [(10, 'Tattoo', 'Tattoo Color', DH, [2, 5, 6], {})],
    (4, 0): [(4, 'Tattoo', 'Tattoo Color', DH, [2, 5], {}),
             (27, 'Face Tattoo', None, None, None, {'glow': True})],
    (4, 1): [(4, 'Tattoo', 'Tattoo Color', DH, [5], {}),
             (4, 'Tattoo', 'Tattoo Color', ['Wild', 'Ancient', 'Owl', 'Moon'], [9], {}),
             (27, 'Face Tattoo', None, None, None, {'glow': True}),
             (27, 'Body Tattoo', None, None, None, {'glow': True}),
             (27, 'Luminous Hands', None, None, None, {'glow': True})],
    (6, 0): [(6, 'Face Paint', 'Paint Color', ['Kodo', 'Otter', 'Hawk'], [3], {'names': {3: 'red and blue'}}),
             (6, 'Body Paint', 'Paint Color', ['Kodo', 'Hawk', 'Otter'], [3], {'names': {3: 'red and blue'}})],
    (6, 1): [(6, 'Face Paint', 'Paint Color', ['Kodo', 'Otter', 'Hawk'], [3], {'names': {3: 'red and blue'}}),
             (6, 'Body Paint', 'Paint Color', ['Kodo', 'Hawk', 'Otter'], [3], {'names': {3: 'red and blue'}})],
    (3, 0): [(34, 'Tattoo', None, None, None, {})],
    (3, 1): [(34, 'Tattoo', None, None, None, {})],
    (11, 0): [(30, 'Tattoo', None, None, None, {'glow': True})],
    (11, 1): [(30, 'Tattoo', None, None, None, {'glow': True})],
}
# Rejected (F-230 second port, fit scores in retail_race_layers.json `fits`, renders in the review sheets):
#   undead jaw features (M, retired 2026-10-30): the same art as the undead male facial-hair jaw skins, which the Jaw
#     button now pairs with their jaw shape; as face markings they stacked a second jaw skin on any jaw
#   Highmountain body paint (tauren M/F): arms and torso regions NCC 0.22-0.70 against our tauren; what survives
#     the region cut is a few dots on the muzzle, not the design
#   Zandalari tattoo (troll M): body-only, on the arms (region NCC 0.26-0.49); troll F keeps 2 of 3 (chest collar)
#   Nightborne body tattoos and luminous hands (night elf M): every body region except two under 0.75
#   undead jaw features (F): face fit 0.58 (M 0.79 is kept)
#   Void Elf tattoo colours: the same files as blood elf's (ported from there); tentacles = hair texture strip
#   Dark Iron piercings, undead face features, Highmountain horn markings, Mechagnome paint: textures for geosets,
#     horns or the mech parts atlas, not skin layers
RETAIL_RACE = {5: 'Undead', 27: 'Nightborne', 28: 'Highmountain', 29: 'Void Elf', 30: 'Lightforged', 31: 'Zandalari',
               34: 'Dark Iron', 37: 'Mechagnome'}
GLOW_PEAK = 0.85
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

    def picks(self, race, sex, pattern_opt, colour_opt, patterns, colours, names=None):
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
                    label = (names or {}).get(int(c['OrderIndex'])) or c['Name_lang'] or colour_name(int(c['SwatchColor_0']))
                    out.append((f"{p['Name_lang']} {label}", els, [int(p['ID']), int(c['ID'])]))
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


def build_layer(elements, fit, eye, ref, glow=False, halves=('body', 'face')):
    """Our 512 atlas (straight RGBA float) of one choice's retail textures. glow: an emissive mask (alpha peaks far
    under 1) has its alpha stretched to GLOW_PEAK; halves: the parts kept (a half that did not fit is left out)."""
    body = np.zeros((SIZE, SIZE, 4), np.float32)
    square = np.zeros((1024, 1024, 4), np.float32)
    for _target, blend, mask, fdid in elements:
        src = Image.open(retail.texture_file(fdid)).convert('RGBA')
        a = np.asarray(src).astype(np.float32) / 255
        if glow and a[..., 3].max() > 0:
            a[..., 3] = np.clip(a[..., 3] * (GLOW_PEAK / a[..., 3].max()), 0, 1)
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
            if where not in halves:
                continue
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


def layer_sources(refit=False, only=None, files=None, query=None):
    """F-230: every pick as a source for markings_regroup.py (which owns the CharSections rows and shipped BLPs):
    [{race, sex, old_section, old_type, kind ('marking' | 'scar'), design, colour, source, image (512 RGBA)}].
    old_section / old_type: the row the layer had before the regroup, from the legacy `rows` in the state JSON."""
    state = json.loads(STATE.read_text()) if STATE.exists() else {}
    fits = state.setdefault('fits', {})
    legacy = {(r['race'], r['sex'], r['section'], r['name']): r['type'] for r in state.get('rows', [])}
    r = Retail()
    files = files or preview_mod.files_resolver()
    query = query or _dbc_query_fn('live')
    out = []
    for (race, g), picks in PICKS.items():
        if only is not None and (race, g) not in only:
            continue
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
        for section, popt, copt, pats, cols in picks:
            for label, els, ids in r.picks(race, g, popt, copt, pats, cols):
                text = f'{popt} {label}'
                pattern = r.choice[str(ids[0])]['Name_lang']
                colour = label[len(pattern):].strip()
                design = f'{pattern} {popt.lower()}' if popt.lower() not in pattern.lower() else pattern
                out.append({'race': race, 'sex': g, 'old_section': section,
                            'old_type': legacy.get((race, g, section, text)),
                            'kind': 'scar' if popt == 'Scars' else 'marking', 'design': design, 'colour': colour,
                            'source': f"retail {text} (retail {', '.join(str(e[3]) for e in els)})",
                            'image': to_image(build_layer(els, fit, eye, ref))})
    STATE.write_text(json.dumps(state, indent=1) + '\n')
    return out


BODY_OK, FACE_OK = 0.85, 0.6                      # fits under these are not shipped (the half is dropped)
# a race with its own model (Zandalari, Highmountain, Nightborne: body NCC 0.63-0.83 overall) is judged region by
# region of the body atlas, as it is (a scale + offset search per region only locked onto search-window edges):
# a region whose NCC is under REGION_OK gets none of the layer, and a choice that loses more than KEEP_MASS of its
# body paint that way loses its whole body part (half a design is not a marking)
REGION_OK, KEEP_MASS = 0.75, 0.3
BODY_REGIONS = ('ArmUpper', 'ArmLower', 'Hand', 'TorsoUpper', 'TorsoLower', 'LegUpper', 'LegLower', 'Foot')


def region_rects():
    from lib.wardrobe.compositor import REGIONS, SCALE
    return {k: tuple(v * SCALE for v in REGIONS[k]) for k in BODY_REGIONS}


def region_check(body, retail_skin):
    """{region: NCC} of our body atlas against retail's body square, region by region, as it is."""
    a = np.asarray(body.convert('L')).astype(float)
    sq = retail_skin.crop((0, 0, retail_skin.width // 2, retail_skin.height)).convert('L').resize((SIZE, SIZE))
    b = np.asarray(sq).astype(float)
    out = {}
    for k, (x, y, w, h) in region_rects().items():
        out[k] = round(ncc(a[y:y + h, x:x + w], b[y:y + h, x:x + w], np.ones((h, w), bool)), 3)
    return out


def keep_regions(layer, regions):
    """(layer, lost): layer (straight RGBA float 512) with the body regions not in `regions` cleared; lost = it dropped
    more than KEEP_MASS of its body alpha, so all of the body is cleared (the face part stays)."""
    if regions is None:
        return layer, False
    out = layer.copy()
    total = dropped = 0.0
    for k, (x, y, w, h) in region_rects().items():
        m = float(layer[y:y + h, x:x + w, 3].sum())
        total += m
        if k not in regions:
            dropped += m
            out[y:y + h, x:x + w] = 0
    if total and dropped / total > KEEP_MASS:
        hx, hy, hw, hh = HEAD
        out = np.zeros_like(layer)
        out[hy:hy + hh, hx:hx + hw] = layer[hy:hy + hh, hx:hx + hw]
        return out, True
    return out, False


def extra_fit(fits, r, files, query, race, g, src, refit=False):
    """The body NCC and face fit of retail race `src`'s art on our race / sex: fits key 'race:sex' for our own race
    (shared with PICKS), 'race:sex:src' for an allied race (its own model and UVs)."""
    key = f'{race}:{g}' if src == race else f'{race}:{g}:{src}'
    if refit or key not in fits:
        body, face = ours(files, query, race, g)
        fits[key] = {'body_ncc': body_check(body, r.skin(src, g)),
                     'face_fit': face_fit(face, r.face_square(src, g), race, g)}
        print(f'{FOLDERS[race]} {SEXES[g]} <- retail {src}: {fits[key]}', flush=True)
    if src != race and 'regions' not in fits[key]:
        body, _face = ours(files, query, race, g)
        fits[key]['regions'] = region_check(body, r.skin(src, g))
    return fits[key]


def extra_layer_sources(refit=False, only=None, files=None, query=None):
    """F-230 second port: the EXTRA picks as sources for markings_regroup.py, flagged `extra` (numbered after every
    existing value). A half whose fit is under BODY_OK / FACE_OK is dropped, and noted in the source."""
    state = json.loads(STATE.read_text()) if STATE.exists() else {}
    fits = state.setdefault('fits', {})
    r = Retail()
    files = files or preview_mod.files_resolver()
    query = query or _dbc_query_fn('live')
    out = []
    for (race, g), picks in EXTRA.items():
        if only is not None and (race, g) not in only:
            continue
        body, _face = ours(files, query, race, g)
        eye = ndimage.binary_dilation(island(race, g), iterations=3)
        b = np.asarray(body).reshape(-1, 3)
        ref = np.median(b[b.sum(axis=1) > 30], axis=0) / 255
        for src, popt, copt, pats, cols, opts in picks:
            fit = extra_fit(fits, r, files, query, race, g, src, refit)
            regions = None
            if fit['body_ncc'] < BODY_OK and 'regions' in fit:
                regions = {k for k, v in fit['regions'].items() if v >= REGION_OK}
            body_ok = (fit['body_ncc'] >= BODY_OK or regions) and opts.get('body', True)
            # our own race's fit is trusted where PICKS layers already ship on it (tauren female 0.48, render-checked)
            trusted = src == race and (race, g) in PICKS
            halves = tuple(h for h, ok in (('body', body_ok),
                                           ('face', (trusted or fit['face_fit'][0] >= FACE_OK)
                                            and opts.get('face', True))) if ok)
            who = RETAIL_RACE.get(src, '') if src != race else ''
            for label, els, ids in r.picks(src, g, popt, copt, pats, cols, opts.get('names')):
                pattern = r.choice[str(ids[0])]['Name_lang']
                colour = label[len(pattern):].strip()
                design = f'{pattern} {popt.lower()}' if popt.lower() not in pattern.lower() else pattern
                if who:
                    design = f'{who} {design}'
                if 'design' in opts:
                    design = opts['design'].format(pattern=pattern)
                dropped = sorted({'body', 'face'} - set(halves))
                layer = build_layer(els, fit['face_fit'], eye, ref, opts.get('glow', False), halves)
                if regions is not None and 'body' in halves:
                    before = layer[..., 3].sum()
                    layer, lost = keep_regions(layer, regions)
                    if lost:
                        dropped.append('body (regions)')
                    elif layer[..., 3].sum() < before - 1:
                        dropped.append('regions ' + ','.join(sorted(set(BODY_REGIONS) - regions)))
                out.append({'race': race, 'sex': g, 'old_section': 6, 'old_type': None, 'extra': True,
                            'kind': 'marking', 'design': design, 'colour': colour,
                            'source': f"retail {who or 'own race'} {popt} {label} (retail "
                                      f"{', '.join(str(e[3]) for e in els)})"
                                      + (f" [not fitted: {'; '.join(dropped)}]" if dropped else ''),
                            'image': to_image(layer)})
    STATE.write_text(json.dumps(state, indent=1) + '\n')
    return out


def main():
    """Fits (--refit) and previews only: the CharSections rows and shipped BLPs are markings_regroup.py's (F-230)."""
    args = sys.argv[1:]
    preview = Path(args[args.index('--preview') + 1]) if '--preview' in args else None
    only = None
    if '--only' in args:
        only = {tuple(int(v) for v in p.split(':')) for p in args[args.index('--only') + 1].split(',')}
    for src in layer_sources('--refit' in args, only):
        print(f"{FOLDERS[src['race']]} {SEXES[src['sex']]} old s{src['old_section']} t{src['old_type']}: "
              f"{src['design']} / {src['colour']}")
        if preview:
            preview.mkdir(parents=True, exist_ok=True)
            src['image'].save(preview / f"{src['race']}_{src['sex']}_{src['old_section']}_{src['old_type']}.png")


if __name__ == '__main__':
    main()
