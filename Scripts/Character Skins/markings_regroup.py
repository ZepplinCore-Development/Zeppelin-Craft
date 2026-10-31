"""F-230: every character marking layer regrouped by REGION, and the baked marked skins retired.

The x64 client draws three full-atlas layers over body and face (CharSections base_section 6 / 7 / 8, choice =
`type`, color_index 0, flags 0x11, 0 = none, no row; character_customizations 2 / 3 / 4 = UNIT_FIELD_PADDING bytes
1-3). Since the regroup (user design 2026-10-30) they are:

  section 6  FACE MARKINGS  face paint, face tattoos, makeup, demon hunter face runes, and the face part of every
                            whole-body design
  section 7  BODY MARKINGS  body paint, body tattoos, arm swirls, fel veins, and the body part of every whole-body design
  section 8  SCARS          real scars only (orc and night elf retail scars), whole

Every source layer is cut at the head box (FaceUpper + FaceLower, 0,320,256,192 of the 512 atlas: the compositor's
REGIONS) into a face part and a body part; an empty part (no marking pixels) is dropped. One pool per race / sex /
row: near-identical parts (same design and colour) are merged, the rest ordered by design then colour and named
(markings_regroup.json `values`).

Sources (each script only hands over images, this one owns every layer row and shipped layer BLP):
  retail_layers.py       orc retail tattoos, scars, grime, war paint
  retail_race_layers.py  retail tauren / dwarf / night elf / troll / human female / blood elf customizations
  body_markings.py       the baked markings cut out of marked skin colours (SPLITS, orc Ascension paints)
They are cached as PNGs in logs/layer_sources/ (--sources rebuilds the cache).

Baked marked skins: a colour whose marking is now layer parts is retired (taken out of CHAR_CREATE_SUBRACES; the
glue is the owner's) only if a plain colour of the same tone exists for that race / sex (median CIE Lab of the body
and of the face, marking and eyeball left out, deltaE <= TONE_DE). A unique tone first gets a clean colour: the
nearest plain colour recoloured to the marked colour's tone by a quadratic RGB map fitted outside the marking (F-222
method): skin, _Extra, every face type (eyeball kept), underwear. New color_index after the race's highest.
FORCE_CLEAN names marked colours that get a clean colour even with a plain match (undead female 22). SUBRACE_COPIES
gives sub-races left without colours (Wildhammer, Grimtotem) plain copies of chosen colours (same rows and textures,
new color_index). GATES locks designs to a sub-race: markings_regroup.json `gates` = the glue's filter 7 / 8 lists.

Writes (zep-skin-expansion, PATCH-L):
  Character/<Folder>/<Sex>/<Folder><Sex>Mark{Face,Body,Scar}NN.blp, <Folder><Sex>{Skin00,FaceLower,FaceUpper,
  NakedPelvisSkin00,NakedTorsoSkin00}..._zcNN.blp (also mirrored into parsed-assets, upper case, so the skin check
  reads them; the old layer files are deleted from both)
  dbc/[F-230]_charsections_markings.sql      ids 102000-102999 layers, 103000-103999 clean colours; deletes the
                                             retired ranges 89000-89499 and 101000-101499
  sql_characters/zz_[F-230]_markings_regroup.sql   character migration (NOT applied by this script)
  Scripts/Character Skins/markings_regroup.json    value tables with names, old -> new map, retire table

  python3 "Scripts/Character Skins/markings_regroup.py" [--sources] [--preview DIR]
"""
import importlib.util
import json
import re
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.compositor import REGIONS, SCALE  # noqa: E402
from lib.wardrobe.eye_islands import island  # noqa: E402


def _load(name, file):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(file))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


icons = _load('icons', 'subrace_icons.py')
preview_mod = _load('skin_preview', 'skin_preview.py')

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
PARSED = ZPAK / 'mpq' / 'parsed-assets'
SQL = ZPAK / 'dbc' / '[F-230]_charsections_markings.sql'
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-230]_markings_regroup.sql'
MIGRATION2 = ZPAK / 'sql_characters' / 'zz_[F-230]_markings_round2.sql'
MIGRATION3 = ZPAK / 'sql_characters' / 'zz_[F-230]_markings_round3.sql'
MIGRATION4 = ZPAK / 'sql_characters' / 'zz_[F-230]_markings_round4.sql'
STATE = Path(__file__).with_name('markings_regroup.json')
CACHE = CRAFT.parent / 'logs' / 'layer_sources'
GLUE = CRAFT / 'zpaks' / 'patch-modern-login' / 'mpq' / 'source-assets' / 'Interface' / 'GlueXML' / 'CharacterCreate.lua'
RETIRED_RANGES = [(89000, 89499), (101000, 101499)]   # body_markings / retail_layers / SPLITS, retail_race_layers
LAYER_ID, LAYER_END = 102000, 102999
SKIN_ID, SKIN_END = 103000, 103999
SKIN2_ID, SKIN2_END = 105000, 106999                 # clean colours continue here once 103000-103999 is full (round 3);
                                                     # 104000-104999 belongs to facial_hair_colours.py


def next_skin_id(rid):
    rid += 1
    return SKIN2_ID if rid == SKIN_END + 1 else rid
FLAGS_ANY = 0x11
SIZE = 512
FACE_ROW, BODY_ROW, SCAR_ROW = 6, 7, 8
ROW_FILE = {FACE_ROW: 'MarkFace', BODY_ROW: 'MarkBody', SCAR_ROW: 'MarkScar'}
ROW_NAME = {FACE_ROW: 'Face Markings', BODY_ROW: 'Body Markings', SCAR_ROW: 'Scars'}
SEXES = {0: 'Male', 1: 'Female'}
FOLDERS = {1: 'Human', 2: 'Orc', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll',
           9: 'Goblin', 10: 'BloodElf', 11: 'Draenei', 12: 'Worgen'}
GLUE_RACE = {'HUMAN': 1, 'ORC': 2, 'DWARF': 3, 'NIGHTELF': 4, 'SCOURGE': 5, 'TAUREN': 6, 'GNOME': 7, 'TROLL': 8,
             'GOBLIN': 9, 'BLOODELF': 10, 'DRAENEI': 11, 'WORGEN': 12}
# the head box on the 512 atlas: FaceUpper over FaceLower (compositor REGIONS at SCALE 2)
_fu, _fl = [tuple(v * SCALE for v in REGIONS[r]) for r in ('FaceUpper', 'FaceLower')]
HEAD = (_fu[0], _fu[1], _fu[2], _fu[3] + _fl[3])
assert HEAD == (0, 320, 256, 192), HEAD
PART_ALPHA, PART_MIN_PX = 48, 150                # a part with fewer pixels over this alpha is empty: resize bleed over the
                                                 # head box edge (blood elf arms 5-50 px); the smallest real part is 234
DUP_ALPHA, DUP_COLOUR = 0.08, 10.0               # mean |alpha| (0-1) and |premultiplied rgb| (0-255) over the union
DUP_DE = 6.0                                     # and median Lab deltaE of the solid pixels: a mean over the union is diluted
                                                 # by shading (tauren blue vs dark teal paint: mean 8, median dE ~25)
TONE_DE = 5.0                                    # median Lab deltaE (body and face) under which two tones are the same
# a marked colour that gets a clean colour of its own tone even though a plain colour is within TONE_DE (user
# 2026-10-30: undead female 22 vs 6 is dE 3.7, its tone is kept)
FORCE_CLEAN = {(5, 1, 22)}
# round 3 (2026-10-30): sub-race signature colours keep their own tone as clean colours, so Illidari, Cenarion female,
# Void Elf, Cultist gnome, Sand Troll and Eredar keep homes of their own colour
FORCE_CLEAN |= {(4, 0, c) for c in (34, 35, 36, 37)} | {(4, 1, c) for c in (26, 27, 28, 29, 30, 31, 32)} \
    | {(10, g, c) for g in (0, 1) for c in (34, 35)} | {(7, 0, 13), (7, 0, 14), (7, 1, 5), (7, 1, 13), (7, 1, 14)} \
    | {(8, g, c) for g in (0, 1) for c in (37, 38)} | {(11, g, c) for g in (0, 1) for c in (30, 31)}
# sub-races whose colours were all baked marked skins get plain copies of their own (user 2026-10-30): same textures
# and rows as the source colour under a new color_index. Wildhammer = Bronzebeard's 0-8; Grimtotem = the black and
# near-black plain tauren furs, picked from a render of every plain colour (a median-Lab tone pick chose pale grey 28 F
# and olive 3 M: the dark mane in the head box outweighs the fur)
SUBRACE_COPIES = {(3, 0): ('Wildhammer', list(range(9))), (3, 1): ('Wildhammer', list(range(9))),
                  # the tauren copies left the glue in round 4 (Grimtotem offers the darker originals themselves); the
                  # rows stay for append-only numbers and the round-4 migration moves their characters (COPIES_RETIRED)
                  (6, 0): ('Grimtotem', [0, 1, 2, 28, 29, 38]), (6, 1): ('Grimtotem', [0, 1, 28, 29, 38]),
                  # round 2: every Cenarion male colour (25-32) was colour 0 or 5 plus a body tattoo (now layers)
                  (4, 0): ('Cenarion', [0, 5])}
# layer designs locked to one sub-race (glue filter 7 face / 8 body): design prefix -> (race, sub-race)
GATES = [('Wildhammer', 3, 'Wildhammer'), ('Dark Iron tattoo', 3, 'Dark Iron'), ('Grimtotem', 6, 'Grimtotem'),
         ('Ascension', 2, "Mag'har")]
# DRAFT (F-230 second port, 2026-10-30, for user review; the glue still reads `gates`): every marking value is either
# one sub-race's exclusive signature or common to every sub-race of its race. (race, name regex, sub-race), first match
# wins, no match = common. Written to markings_regroup.json `proposed_gates`.
PROPOSED = [
    # orcs follow the dwarf colour code (user 2026-10-30): white Mag'har, red Blackrock, black (the tattoos) and the
    # dark slate teal / grey paint regular Orc, yellow Fel Orc; grime (eye bags, stubble) is every orc's
    (2, r"grime$", 'common'), (2, r"^Ascension", "Mag'har"), (2, r"\(white\)", "Mag'har"),
    (2, r"\(red\)", 'Blackrock'), (2, r"\(yellow\)", 'Fel Orc'), (2, r"\((teal|grey)\)", 'Orc'),
    (2, r"tattoo$", 'Orc'),
    # dwarves by tattoo colour (user 2026-10-30): red (Blood) and black to Dark Iron, blue (Woad) and pale blue
    # (Mithril) to Wildhammer, green (Emerald) to Bronzebeard. The Dark Iron designs are black ink or Dark Iron paint;
    # the baked Wildhammer splits go by their own ink (eye band / stripes and brow tattoo blue, red claws red,
    # green chevrons green)
    (3, r"^Dark Iron", 'Dark Iron'), (3, r"\(Blood\)|red claws", 'Dark Iron'),
    (3, r"\((Woad|Mithril)\)|eye band|eye stripes|brow tattoo", 'Wildhammer'),
    (3, r"\(Emerald\)|green chevrons", 'Bronzebeard'),
    # tauren (user 2026-10-30): Grimtotem the reds and whites, regular Tauren every other colour
    (6, r"\((red|red and blue|white)\)$", 'Grimtotem'), (6, r".", 'Tauren'),
    (8, r"^(Berserker|Fangs|Mask|Oni|Prophet|War) face paint", 'Darkspear'),
    (8, r"^(Skull|Bones) |^Zandalari", 'Sand Troll'), (8, r"^(Voodoo|Ritual) ", 'Dark Troll'),
    # troll male facial-hair paints (round 2) by theme: skulls and bone Sand Troll, war masks Darkspear, tribal
    # stripes and splashes Dark Troll; the shadow paints cut from faces stay common
    (8, r"^(Spiked skull|Bone face) paint", 'Sand Troll'), (8, r"^(Warmask|Ringed eye) paint", 'Darkspear'),
    (8, r"^(Striped|Splash) paint", 'Dark Troll'),
    (4, r"^(Suffering|Betrayer|Pain|Sacrifice|Revenge|Chaos) tattoo", 'Illidari'), (4, r"^Illidari", 'Illidari'),
    (4, r"^(Wild|Ancient|Leaf|Bear|Crane|Hawk) |^Cenarion", 'Cenarion'),
    (4, r"^(Shadow|Protector|Teldrassil) |^Nightborne", 'Kaldorei'),
    (10, r"^(Suffering|Betrayer|Pain|Sacrifice|Revenge|Chaos) tattoo \((green|dark green|red)\)", 'Blood Elf'),
    (10, r"^Arcane swirls \(red\)|^Fel veins|^Fel thorns", 'Blood Elf'),
    (10, r"^(Suffering|Betrayer|Pain|Sacrifice|Revenge|Chaos) tattoo \((purple|dark blue)\)", 'Void Elf'),
    (10, r"^Arcane swirls \((purple|black)\)", 'Void Elf'),
    (1, r"^(Bat eye paint|Tear streaks|Thorn tattoo)", 'Cultist'),
    (5, r"^Thorn tattoo", 'Forsaken'),
    (11, r"^Lightforged", 'Lightforged'),
    # round 3 signatures: void paint Void Elf, cultist paint Cultist gnome (gnome's first), fel lines Eredar (draenei's
    # second), tiger stripes and blood paint Sand Troll (Sandfury rites); night elf fel slashes / runes Illidari and
    # the leaf tattoos Cenarion come from the rules above
    (10, r"^Void ", 'Void Elf'), (7, r"^Cultist", 'Cultist'), (11, r"^Fel lines", 'Eredar'),
    (8, r"^(Tiger stripes|Blood paint)", 'Sand Troll'),
]
# sub-races whose faces leave no room for a row's common pool: they get only their own values there (user 2026-10-30:
# the Illidari male faces are all blindfolded, so face markings and scars - every night elf scar is on the face - would
# be painted over the blindfold; their only face marking is the cheek marks cut from the second blindfold face)
OWN_ONLY = {(4, 0, 'Illidari'): ('Face Markings', 'Scars')}
# retired markings whose parts are Mag'har-only in the glue (were MAGHAR_WAR_PAINT 13 / 14, user review 2026-10-25)
MAGHAR_ONLY = ('Ascension handprints', 'Ascension war paint')


# ------------------------------------------------------------------------------------------------ sources
# extra sources the last run cached that are retired (undead male jaw features: a geoset texture, not a skin layer;
# dropped from retail_race_layers.EXTRA 2026-10-30): (race, sex, design suffix)
DROP_SOURCES = [(5, 0, 'jaw features')]
# pools whose shipped values are retired as a whole (the migration clears the stored choice)
RETIRED_POOLS = {'5:0': ['Face Markings']}


def round2_only():
    """The cached sources (round 2 ones and DROP_SOURCES left out) plus body_markings.round2_sources()."""
    kept = [s for s in json.loads((CACHE / 'manifest.json').read_text())
            if not s.get('round2') and not any(s['race'] == r and s['sex'] == g and s['design'].endswith(d)
                                               for r, g, d in DROP_SOURCES)]
    for s in kept:
        s['image'] = Image.open(CACHE / s['png']).convert('RGBA')
    bm = _load('body_markings', 'body_markings.py')
    return kept + bm.round2_sources()


def build_sources(extra_only=False, round2=False):
    """All source layers, in pool order: retail (orc, then the other races), then the baked splits, then the second
    retail port (retail_race_layers.extra_layer_sources, flagged `extra`: their values come after every other).
    extra_only: keep the cached first sources as they are and rebuild only the extra ones."""
    rrl = _load('retail_race_layers', 'retail_race_layers.py')
    if round2 and (CACHE / 'manifest.json').exists():
        out = round2_only()
    elif extra_only and (CACHE / 'manifest.json').exists():
        kept = [s for s in json.loads((CACHE / 'manifest.json').read_text()) if not s.get('extra') or s.get('round2')]
        for s in kept:
            s['image'] = Image.open(CACHE / s['png']).convert('RGBA')
        out = kept + rrl.extra_layer_sources()
        out = [s for s in out if not s.get('round2')] + [s for s in out if s.get('round2')]
    else:
        rl = _load('retail_layers', 'retail_layers.py')
        bm = _load('body_markings', 'body_markings.py')
        out = (rl.layer_sources() + rrl.layer_sources() + bm.layer_sources() + rrl.extra_layer_sources()
               + bm.round2_sources())
    images = [s['image'].convert('RGBA').resize((SIZE, SIZE), Image.LANCZOS) for s in out]
    if CACHE.exists():
        for old in CACHE.glob('*.png'):
            old.unlink()
    CACHE.mkdir(parents=True, exist_ok=True)
    manifest = []
    for i, s in enumerate(out):
        name = f"{i:03d}_{s['race']}_{s['sex']}_{s['old_section']}_{s['old_type']}.png"
        images[i].save(CACHE / name)
        manifest.append({k: v for k, v in s.items() if k not in ('image', 'png')} | {'png': name})
    (CACHE / 'manifest.json').write_text(json.dumps(manifest, indent=1) + '\n')
    return load_sources()


def load_sources():
    manifest = json.loads((CACHE / 'manifest.json').read_text())
    for s in manifest:
        s['rgba'] = np.asarray(Image.open(CACHE / s['png']).convert('RGBA'))
        s['pairs'] = [tuple(p) for p in s.get('pairs') or []]
        s['face_pairs'] = [tuple(p) for p in s.get('face_pairs') or []]
    return manifest


# ------------------------------------------------------------------------------------------------ parts and pools
def head_mask():
    m = np.zeros((SIZE, SIZE), bool)
    x, y, w, h = HEAD
    m[y:y + h, x:x + w] = True
    return m


def parts(src):
    """[(row, rgba)] of a source: scars whole; markings cut into face / body, empty parts dropped."""
    rgba = src['rgba']
    if src['kind'] == 'scar':
        cands = [(SCAR_ROW, rgba)]
    else:
        head = head_mask()
        face, body = rgba.copy(), rgba.copy()
        face[~head] = 0
        body[head] = 0
        cands = [(FACE_ROW, face), (BODY_ROW, body)]
    return [(row, p) for row, p in cands if (p[..., 3] > PART_ALPHA).sum() >= PART_MIN_PX]


def small_pm(rgba):
    a = np.asarray(Image.fromarray(rgba, 'RGBA').convert('RGBa').resize((256, 256), Image.BOX)).astype(np.float32)
    solid = rgba[..., 3] > 128
    med = lab(np.median(rgba[..., :3][solid], axis=0)) if solid.any() else np.zeros(3)
    return a[..., :3], a[..., 3] / 255, med


def same(p, q):
    (cp, ap, mp), (cq, aq, mq) = p, q
    union = (ap > 0.1) | (aq > 0.1)
    if not union.any():
        return True, 0.0, 0.0
    da = float(np.abs(ap - aq)[union].mean())
    dc = float(np.abs(cp - cq)[union].mean())
    return da < DUP_ALPHA and dc < DUP_COLOUR and float(np.linalg.norm(mp - mq)) < DUP_DE, da, dc


def title(s):
    return s[:1].upper() + s[1:]


def build_pools(sources):
    """{(race, sex, row): [entry]}, entry = {value, name, design, colour, rgba, sources: [source index]};
    and per source index {row: value}."""
    pools, source_values = {}, {}
    for i, src in enumerate(sources):
        source_values[i] = {}
        for row, rgba in parts(src):
            pool = pools.setdefault((src['race'], src['sex'], row), [])
            sm = small_pm(rgba)
            for e in pool:
                dup, da, dc = same(sm, e['small'])
                if dup:
                    e['sources'].append(i)
                    source_values[i][row] = e
                    break
            else:
                e = {'design': title(src['design']), 'colour': src['colour'], 'rgba': rgba, 'small': sm,
                     'sources': [i]}
                pool.append(e)
                source_values[i][row] = e
    for pool in pools.values():
        # by design (first appearance), then colour (first appearance within the design); entries made only of
        # `extra` sources (the second retail port) after all others, so the shipped values never move
        designs = []
        for e in pool:
            if e['design'] not in designs:
                designs.append(e['design'])
        pool.sort(key=lambda e: (all(sources[i].get('extra') for i in e['sources']), designs.index(e['design'])))
        for v, e in enumerate(pool, 1):
            e['value'] = v
            e['name'] = f"{e['design']} ({e['colour']})" if e['colour'] else e['design']
    return pools, {i: {row: e['value'] for row, e in rv.items()} for i, rv in source_values.items()}


# ------------------------------------------------------------------------------------------------ glue lists
def lua_table(text, name):
    """The Lua table constructor assigned to `name` (a subset: strings, numbers, names, nested tables) as Python:
    dict for keyed entries, plus list items under integer keys 1..n. Names resolve to earlier tables."""
    tokens = re.findall(r'--\[\[.*?\]\]|--[^\n]*|"(?:[^"\\]|\\.)*"|\[\s*"[^"]*"\s*\]|[A-Za-z_][A-Za-z0-9_]*|-?\d+(?:\.\d+)?|[{}=,;]',
                        text, re.S)
    tokens = [t for t in tokens if not t.startswith('--')]
    env = {}

    def parse(i):
        t = tokens[i]
        if t == '{':
            out, n, i = {}, 1, i + 1
            while tokens[i] != '}':
                if tokens[i + 1] == '=' and tokens[i] != '{':
                    key = tokens[i].strip('[] "')
                    val, i = parse(i + 2)
                    out[key] = val
                else:
                    val, i = parse(i)
                    out[n] = val
                    n += 1
                if tokens[i] in (',', ';'):
                    i += 1
            return out, i + 1
        if t.startswith('"'):
            return t[1:-1], i + 1
        if re.fullmatch(r'-?\d+(?:\.\d+)?', t):
            return int(t) if '.' not in t else float(t), i + 1
        return env.get(t), i + 1

    i = 0
    while i < len(tokens):
        if i + 2 < len(tokens) and tokens[i + 1] == '=' and tokens[i + 2] == '{' and re.fullmatch(r'[A-Z_][A-Z0-9_]*', tokens[i]):
            val, j = parse(i + 2)
            env[tokens[i]] = val
            if tokens[i] == name:
                return val
            i = j
        else:
            i += 1
    raise SystemExit(f'{name} not found in {GLUE}')


def glue_subraces():
    """{(race, sex): [(sub-race name, [colours])]} (shared DK lists left out) from CHAR_CREATE_SUBRACES."""
    table = lua_table(GLUE.read_text(), 'CHAR_CREATE_SUBRACES')
    out = {}
    for key, subs in table.items():
        race = GLUE_RACE[key]
        for g, sex in SEXES.items():
            out[(race, g)] = [(subs[k]['name'], [subs[k][sex.upper()][j] for j in sorted(subs[k][sex.upper()])])
                              for k in sorted(k for k in subs if isinstance(k, int))]
    return out


# ------------------------------------------------------------------------------------------------ tone and clean skins
def lab(rgb):
    c = np.asarray(rgb, np.float64) / 255
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = c @ np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]]).T
    xyz /= np.array([0.95047, 1.0, 1.08883])
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.stack([116 * f[..., 1] - 16, 500 * (f[..., 0] - f[..., 1]), 200 * (f[..., 1] - f[..., 2])], axis=-1)


def regions(race, sex, marking):
    """(body, face) masks of the pixels a tone is measured on: the marking (grown) and eyeball left out."""
    head = head_mask()
    eye = np.zeros_like(head)
    x, y, w, h = HEAD
    eye[y:y + h, x:x + w] = ndimage.binary_dilation(island(race, sex), iterations=4)
    keep = ~ndimage.binary_dilation(marking, iterations=6) & ~eye
    return keep & ~head, keep & head


def tone(atlas, mask):
    px = atlas[mask]
    px = px[px.sum(axis=1) > 30]                 # unpainted black texels
    return np.median(lab(px), axis=0)


def features(rgb):
    x = rgb.reshape(-1, 3).astype(np.float64) / 255
    r, g, b = x[:, 0], x[:, 1], x[:, 2]
    return np.stack([np.ones_like(r), r, g, b, r * r, g * g, b * b, r * g, r * b, g * b], axis=1)


def fit_map(base, marked, mask):
    """Quadratic RGB map base -> marked over the mask pixels; (coefficients, mean |rgb| error)."""
    m = mask & (base.sum(axis=2) > 30) & (marked.sum(axis=2) > 30)
    a, b = features(base[m]), marked[m].reshape(-1, 3).astype(np.float64)
    coef, *_ = np.linalg.lstsq(a, b, rcond=None)
    err = float(np.abs(a @ coef - b).mean())
    return coef, err


def apply_map(im, coef, keep=None, weight=None):
    """im (RGBA PIL) through the map; keep = pixels left as they are (eyeball); weight = 0-1 per pixel blend."""
    a = np.asarray(im.convert('RGBA')).astype(np.float32)
    rgb = a[..., :3]
    moved = np.clip(features(rgb) @ coef, 0, 255).reshape(rgb.shape)
    w = np.ones(rgb.shape[:2], np.float32) if weight is None else weight
    if keep is not None:
        w = np.where(keep, 0, w)
    out = rgb + w[..., None] * (moved - rgb)
    return Image.fromarray(np.dstack([np.clip(out, 0, 255), a[..., 3]]).astype(np.uint8), 'RGBA')


def skin_weight(im, body):
    """How much each pixel of a partly-skin texture (_Extra, underwear) is skin: closeness in chroma to the body's
    lit colour (retail_subrace_colours.transfer_skin), so cloth, metal and eyes keep their colour."""
    a = np.asarray(im.convert('RGBA')).astype(np.float32)
    rgb = a[..., :3]
    px = body.reshape(-1, 3)
    lum = px.mean(axis=1)
    lit = px[lum >= np.median(lum)]
    mo, spread = lit.mean(axis=0), np.linalg.norm(lit.std(axis=0))
    l = rgb.mean(axis=2, keepdims=True)
    hue = np.linalg.norm(rgb / np.maximum(l, 1) * mo.mean() - mo, axis=2)
    return np.exp(-(hue ** 2) / (2 * (1.5 * spread) ** 2)).astype(np.float32)


# ------------------------------------------------------------------------------------------------ main
def esc(p):
    return (p or '').replace('\\', '\\\\')


def insert(rid, race, g, section, t1, t2, flags, kind, colour, comment=''):
    return (f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, "
            f"color_index) VALUES ({rid}, {race}, {g}, {section}, '{esc(t1)}', '{esc(t2)}', '', {flags}, {kind}, "
            f"{colour});" + (f'  -- {comment}' if comment else ''))


def write_blp(rel, im):
    """The shipped file, and its parsed-assets copy (the resource parser's upper-case path) for the skin check."""
    icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), im)
    dst = PARSED / rel.replace('\\', '/').upper()
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes((ASSETS / rel.replace('\\', '/')).read_bytes())


def clear_old():
    pats = ['*TattooSplit*', '*WarPaintSplit*', '*ScarsSplit*', '*RetailTattoo*', '*RetailScars*', '*RetailWarPaint*',
            'Orc*Tattoo[0-9]*', 'Orc*Scars[0-9]*', 'Orc*WarPaint[0-9]*', 'Orc*BodyMarking[0-9]*',
            '*MarkFace[0-9]*', '*MarkBody[0-9]*', '*MarkScar[0-9]*', '*_zc[0-9]*']
    n = 0
    for root in (ASSETS / 'Character', PARSED / 'CHARACTER'):
        for pat in pats:
            for f in root.glob('*/*/' + (pat.upper() if root.name.isupper() else pat)):
                f.unlink()
                n += 1
    return n


def max_character_guid():
    out = subprocess.run([sys.executable, '-m', 'cli.zep', 'world', 'sql', 'query', 'SELECT MAX(guid) FROM characters',
                          '-d', 'characters'], cwd=CRAFT, capture_output=True, text=True, check=True).stdout.split()
    return int(out[-1])


def main():
    args = sys.argv[1:]
    preview = Path(args[args.index('--preview') + 1]) if '--preview' in args else None
    if '--sources' in args or '--extra' in args or '--round2' in args or not (CACHE / 'manifest.json').exists():
        sources = build_sources(extra_only='--extra' in args and '--sources' not in args,
                                round2='--round2' in args and '--sources' not in args)
    else:
        sources = load_sources()
    previous = json.loads(STATE.read_text()).get('values', {}) if STATE.exists() else {}
    pools, src_values = build_pools(sources)
    # values are storage keys: every value the last run wrote must keep its name (new ones only append)
    moved = []
    for (race, g, row), pool in pools.items():
        was = {v['value']: v['name'] for v in previous.get(f'{race}:{g}', {}).get(ROW_NAME[row], [])}
        now = {e['value']: e['name'] for e in pool}
        moved += [f'{race}:{g} {ROW_NAME[row]} {v}: {n} -> {now.get(v)}' for v, n in was.items() if now.get(v) != n]
    for key, row_names in previous.items():
        for row_name, vals in row_names.items():
            race, g = (int(v) for v in key.split(':'))
            row = next(r for r, n in ROW_NAME.items() if n == row_name)
            if (race, g, row) not in pools and row_name not in RETIRED_POOLS.get(key, []):
                moved.append(f'{key} {row_name}: the whole pool would go')
    if moved and '--renumber' not in args:
        raise SystemExit('shipped marking values would change (--renumber to accept):\n  ' + '\n  '.join(moved))
    files = preview_mod.files_resolver()
    query = _dbc_query_fn('live')
    bm = _load('body_markings', 'body_markings.py')

    removed = clear_old()
    sql = ['-- F-230: character marking layers by region (CharSections base_section 6 face markings, 7 body markings,',
           '-- 8 scars; type = choice, 0 = none; color_index 0, flags 0x11) and clean colours for unique marked tones.',
           '-- GENERATED by Scripts/Character Skins/markings_regroup.py - do not edit, re-run the script.',
           *[f'DELETE FROM charsections WHERE id BETWEEN {a} AND {b};' for a, b in RETIRED_RANGES],
           f'DELETE FROM charsections WHERE id BETWEEN {LAYER_ID} AND {LAYER_END};',
           f'DELETE FROM charsections WHERE id BETWEEN {SKIN_ID} AND {SKIN_END};',
           f'DELETE FROM charsections WHERE id BETWEEN {SKIN2_ID} AND {SKIN2_END};']
    rid = LAYER_ID
    values = {}
    for (race, g, row) in sorted(pools):
        folder, sex = FOLDERS[race], SEXES[g]
        table = values.setdefault(f'{race}:{g}', {}).setdefault(ROW_NAME[row], [])
        for e in pools[(race, g, row)]:
            rel = f"Character\\{folder}\\{sex}\\{folder}{sex}{ROW_FILE[row]}{e['value']:02d}.blp"
            write_blp(rel, Image.fromarray(e['rgba'], 'RGBA'))
            sql.append(insert(rid, race, g, row, rel, '', FLAGS_ANY, e['value'], 0, f"{ROW_NAME[row]}: {e['name']}"))
            table.append({'value': e['value'], 'name': e['name'], 'id': rid, 'file': rel,
                          'sources': [sources[i]['source'] for i in e['sources']]})
            rid += 1
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(e['rgba'], 'RGBA').save(preview / f'{race}_{g}_{row}_{e["value"]:02d}.png')
    if rid - 1 > LAYER_END:
        raise SystemExit('layer rows overflow their id range')

    # old (customization, choice) -> new values, per race / sex: customization = old section - 4
    old_map = {}
    for i, s in enumerate(sources):
        if s['old_type'] is None:
            continue
        key = f"{s['race']}:{s['sex']}"
        v = src_values[i]
        old_map.setdefault(key, {})[f"{s['old_section'] - 4}:{s['old_type']}"] = {
            'face': v.get(FACE_ROW, 0), 'body': v.get(BODY_ROW, 0), 'scar': v.get(SCAR_ROW, 0), 'was': s['source']}

    retire, clean_rows, glue_changes, copies = retire_baked(sources, src_values, files, query, bm, preview)
    gates = gate_lists(values)
    sql += clean_rows
    SQL.write_text('\n'.join(sql) + '\n')
    # the migration's guid cutoff is fixed by the first run: a later re-run (new values appended) must not sweep in
    # characters created since, which already carry the new numbering
    cutoff = (json.loads(STATE.read_text()).get('migration_guid_cutoff') if STATE.exists() else None) or max_character_guid()
    MIGRATION.write_text(migration_sql(old_map, [e for e in retire if e.get('round', 1) == 1], cutoff))
    faces = face_retire(sources, src_values)
    paint = troll_paint_map(sources, src_values)
    state = json.loads(STATE.read_text()) if STATE.exists() else {}
    cutoff2 = state.get('round2_guid_cutoff') or max_character_guid()
    MIGRATION2.write_text(migration_round2_sql([e for e in retire if e.get('round') == 2],
                                               [f for f in faces if f.get('round', 2) == 2], paint, cutoff2))
    cutoff3 = state.get('round3_guid_cutoff') or max_character_guid()
    MIGRATION3.write_text(migration_round3_sql([e for e in retire if e.get('round') == 3], cutoff3))
    cutoff4 = state.get('round4_guid_cutoff') or max_character_guid()
    MIGRATION4.write_text(migration_round4_sql([e for e in retire if e.get('round') == 4],
                                               [f for f in faces if f.get('round') == 4], cutoff4))
    STATE.write_text(json.dumps({'rows': {str(k): v for k, v in ROW_NAME.items()}, 'values': values,
                                 'old_to_new': old_map, 'retire': retire, 'glue_changes': glue_changes,
                                 'subrace_copies': copies, 'gates': gates,
                                 'proposed_gates': proposed_gate_lists(values),
                                 'migration_guid_cutoff': cutoff, 'face_retire': faces,
                                 'troll_paint': [{'style': k[0], 'hair_colour': k[1], 'value': v}
                                                 for k, v in sorted(paint.items())],
                                 'round2_guid_cutoff': cutoff2, 'round3_guid_cutoff': cutoff3,
                                 'round4_guid_cutoff': cutoff4}, indent=1) + '\n')
    print(f'{removed} old layer files removed; {rid - LAYER_ID} layer rows -> {SQL.relative_to(CRAFT)}')
    print(f'-> {MIGRATION.relative_to(CRAFT)}, {STATE.name}')


def retire_baked(sources, src_values, files, query, bm, preview):
    """The marked colours whose marking now exists as layer parts: retire when a plain colour of the same tone is
    offered, else make a clean colour first. -> (retire table, clean colour SQL, glue list changes)."""
    glue = glue_subraces()
    marked = {}                                  # (race, sex, colour) -> [source index]
    for i, s in enumerate(sources):
        for d, _b in s['pairs']:
            marked.setdefault((s['race'], s['sex'], d), []).append(i)
    marked_set = {(r, g): {c for (r2, g2, c) in marked if (r2, g2) == (r, g)} for (r, g, _c) in marked}
    cache = {}

    def atlas(race, g, c):
        if (race, g, c) not in cache:
            cache[(race, g, c)] = bm.atlas_rgb(files, query, race, g, c)
        return cache[(race, g, c)]

    def rows_of(race, g, colour):
        return query(f'SELECT id, base_section, type, color_index, flags, texture_1, texture_2 FROM charsections '
                     f'WHERE race = {race} AND gender = {g} AND base_section IN (0, 1, 4) AND color_index = {colour} '
                     f'AND id NOT BETWEEN {SKIN_ID} AND {SKIN_END} AND id NOT BETWEEN {SKIN2_ID} AND {SKIN2_END} ORDER BY id')

    retire, sql, rid = [], [], SKIN_ID
    next_colour = {}

    # accessories.py's clean colours (ids 108100-108999) are left out of the count, so the shipped numbering here never
    # moves, and skipped when numbering a new colour
    acc = {(int(r['race']), int(r['gender']), int(r['color_index'])) for r in
           query('SELECT DISTINCT race, gender, color_index FROM charsections WHERE id BETWEEN 108100 AND 108999')}

    def take_colour(race, g):
        if (race, g) not in next_colour:
            top = query(f'SELECT MAX(color_index) AS m FROM charsections WHERE race = {race} AND gender = {g} '
                        f'AND id NOT BETWEEN {SKIN_ID} AND {SKIN_END} AND id NOT BETWEEN {SKIN2_ID} AND {SKIN2_END} '
                        f'AND id NOT BETWEEN 108100 AND 108999')[0]['m']
            next_colour[(race, g)] = int(top) + 1
        while (race, g, next_colour[(race, g)]) in acc:
            next_colour[(race, g)] += 1
        next_colour[(race, g)] += 1
        return next_colour[(race, g)] - 1
    def make_clean(entry, rid):
        race, g, base = entry['race'], entry['sex'], entry['clean_from']
        a, m = entry.pop('_fit')
        new = take_colour(race, g)
        coef, err = fit_map(atlas(race, g, base), a, m)
        b_at = atlas(race, g, base)
        gain = np.median(a[m], axis=0) / np.maximum(np.median(b_at[m], axis=0), 1.0)
        rows, rid = clean_colour(race, g, base, new, coef, files, rows_of, b_at, rid, gain)
        sql.extend(rows)
        entry.update({'replacement': new, 'map_error': round(err, 2)})
        return rid

    for (race, g, c) in sorted(marked):
        subs = glue.get((race, g), [])
        home = next((name for name, cols in subs if c in cols), None)
        plain = sorted({col for _n, cols in subs for col in cols} - marked_set[(race, g)])
        mark = np.logical_or.reduce([sources[i]['rgba'][..., 3] > 20 for i in marked[(race, g, c)]])
        body_m, face_m = regions(race, g, mark)
        a = atlas(race, g, c)
        tb, tf = tone(a, body_m), tone(a, face_m)
        dist = []
        for p in plain:
            try:
                ap = atlas(race, g, p)
            except (SystemExit, FileNotFoundError):
                continue
            db, df = float(np.linalg.norm(tone(ap, body_m) - tb)), float(np.linalg.norm(tone(ap, face_m) - tf))
            dist.append((max(db, df), db, df, p))
        dist.sort()
        layer_vals = {}
        for i in marked[(race, g, c)]:
            for row, v in src_values[i].items():
                layer_vals.setdefault(ROW_NAME[row], []).append({'value': v, 'design': sources[i]['design'],
                                                                 'colour': sources[i]['colour']})
        entry = {'race': race, 'sex': g, 'colour': c, 'sub_race': home, 'layers': layer_vals,
                 'nearest_plain': [{'colour': p, 'dE_body': round(db, 2), 'dE_face': round(df, 2)}
                                   for _m, db, df, p in dist[:3]]}
        entry['round'] = max(sources[i].get('round', 2 if sources[i].get('round2') else 1) for i in marked[(race, g, c)])
        if dist and dist[0][0] <= TONE_DE and (race, g, c) not in FORCE_CLEAN:
            entry['action'] = 'retired'
            entry['replacement'] = dist[0][3]
            entry['replacement_sub_race'] = next((n for n, cols in subs if dist[0][3] in cols), None)
        else:
            # a clean colour of this tone: the nearest plain colour (by tone) recoloured to it. Round-2 ones are
            # numbered after the sub-race copies, so the shipped colour numbers never move
            entry.update({'action': 'clean colour', 'clean_from': dist[0][3],
                          'replacement_sub_race': home or next((n for n, cols in subs if dist[0][3] in cols), None)})
            entry['_fit'] = (a, body_m)          # body only: the base's own face-to-body relation is kept (round 4)
            if entry['round'] == 1:
                rid = make_clean(entry, rid)
        retire.append(entry)
        print(f"{FOLDERS[race]} {SEXES[g]} colour {c} ({home or 'not offered'}): {entry['action']} -> "
              f"{entry.get('replacement', '(after copies)')}  nearest {entry['nearest_plain']}  layers {layer_vals}")
    copies = []
    for (race, g), (subrace, srcs) in sorted(SUBRACE_COPIES.items()):
        for src in srcs:
            new = take_colour(race, g)
            last = {}
            for r in rows_of(race, g, src):          # highest id wins (F-225)
                last[(r['base_section'], r['type'])] = r
            sql.append(f'-- {subrace} colour {new}: a plain copy of colour {src} (same textures)')
            for (section, kind), r in sorted(last.items()):
                sql.append(insert(rid, race, g, section, r['texture_1'], r['texture_2'], r['flags'], kind, new))
                rid = next_skin_id(rid)
            copies.append({'race': race, 'sex': g, 'sub_race': subrace, 'colour': new, 'copy_of': src})
            print(f'{FOLDERS[race]} {SEXES[g]} {subrace}: colour {new} = copy of {src}')
    for entry in sorted(retire, key=lambda e: e.get('round', 1)):     # round 2 numbers first: they shipped
        if '_fit' in entry:
            rid = make_clean(entry, rid)
            print(f"{FOLDERS[entry['race']]} {SEXES[entry['sex']]} colour {entry['colour']}: clean colour "
                  f"{entry['replacement']} from {entry['clean_from']}")
    if rid - 1 > SKIN2_END:
        raise SystemExit('clean colour rows overflow their id range')
    return retire, sql, glue_list_changes(glue, retire, copies), copies


def apply_gain(im, gain, weight):
    a = np.asarray(im.convert('RGBA')).astype(np.float32)
    rgb = a[..., :3]
    out = rgb + weight[..., None] * (np.clip(rgb * gain, 0, 255) - rgb)
    return Image.fromarray(np.dstack([np.clip(out, 0, 255), a[..., 3]]).astype(np.uint8), 'RGBA')


def clean_colour(race, g, base, new, coef, files, rows_of, base_atlas, rid, gain=None):
    """CharSections rows (and BLPs) of colour `new` = colour `base` recoloured to the new tone. Only skin moves (round 4,
    user report: a sand troll clean colour got yellow tusks and a lime loincloth): body skin, faces and _Extra (the HD
    head) all through ONE per-channel gain fitted on the body (the quadratic map extrapolated bone into yellow and put
    the head and body out of step), on skin pixels only: near the skin's hue and not invariant across the race's stock
    colours (tusks, horns, teeth, eyes, jewellery, cloth keep their colour). The underwear is the base's own."""
    folder, sex = FOLDERS[race], SEXES[g]
    stem = f'Character\\{folder}\\{sex}\\{folder}{sex}'
    rows = rows_of(race, g, base)
    last = {}
    for r in rows:                               # highest id wins (F-225)
        last[(r['base_section'], r['type'])] = r
    eye = island(race, g)
    # what does not change across the race's stock colours is not skin: tusks, horns, teeth, eyes, jewellery, cloth
    # (round 4: the quadratic map turned sand troll tusks yellow). Same section / type / texture of colours 0-9.
    stock = {}
    for oc in range(10):
        if oc == base:
            continue
        for r in rows_of(race, g, oc):
            stock.setdefault((r['base_section'], r['type']), {})[oc] = r

    def invariant(section, kind, col, size):
        ims = []
        for r in stock.get((section, kind), {}).values():
            f = files.find(r[col]) if r[col] else None
            if f:
                ims.append(np.asarray(read_blp(f).convert('RGB').resize(size, Image.BOX)).astype(np.float32))
        if len(ims) < 3:
            return np.zeros(size[::-1], bool)
        st = np.stack(ims)
        dev = np.abs(st - np.median(st, axis=0)).mean(axis=(0, 3))
        return ndimage.binary_dilation(dev < 6, iterations=1)
    sql = [f'-- clean colour {new}: colour {base} recoloured to a retired marked colour\'s tone']
    for (section, kind), r in sorted(last.items()):
        t = {}
        for col in ('texture_1', 'texture_2'):
            path = r[col]
            f = files.find(path) if path else None
            if not f:
                t[col] = ''
                continue
            im = read_blp(f).convert('RGBA')
            if section == 4:                     # underwear: the base colour's own
                t[col] = path
                continue
            # skin = anything near the skin's hue (shading included); cloth, teeth and bone fall out. Hard mask,
            # feathered, so dark creases do not come out half-mapped and blotchy
            fixed = invariant(section, kind, col, im.size)
            g_ = gain if gain is not None else np.ones(3)
            w = ndimage.gaussian_filter(((skin_weight(im, base_atlas) > 0.2) & ~fixed).astype(np.float32), 1.5)
            if section == 1:
                y0, h = (64, 128) if col == 'texture_1' else (0, 64)
                keep = np.asarray(Image.fromarray((eye[y0:y0 + h] * 255).astype(np.uint8)).resize(im.size, Image.NEAREST)) > 127
                out = apply_gain(im, g_, np.where(keep, 0, w))
                name = f"{stem}{'FaceLower' if col == 'texture_1' else 'FaceUpper'}{kind:02d}_zc{new:02d}.blp"
            elif section == 0 and col == 'texture_1':
                out, name = apply_gain(im, g_, w), f'{stem}Skin00_zc{new:02d}.blp'
            else:
                out = apply_gain(im, g_, w)
                name = f'{stem}Skin00_zc{new:02d}_Extra.blp'
            write_blp(name, out)
            t[col] = name
        sql.append(insert(rid, race, g, section, t['texture_1'], t['texture_2'], r['flags'], kind, new))
        rid = next_skin_id(rid)
    return sql, rid


def glue_list_changes(glue, retire, copies):
    """Per race / sex / sub-race: colours to take out and clean colours to add (the owner edits CharacterCreate.lua)."""
    out = {}
    for e in retire:
        key = f"{FOLDERS[e['race']]} {SEXES[e['sex']]}"
        if e['sub_race']:
            out.setdefault(key, {}).setdefault(e['sub_race'], {'remove': [], 'add': []})['remove'].append(e['colour'])
        if e['action'] == 'clean colour' and e['replacement_sub_race']:
            out.setdefault(key, {}).setdefault(e['replacement_sub_race'], {'remove': [], 'add': []})['add'].append(e['replacement'])
    for c in copies:
        key = f"{FOLDERS[c['race']]} {SEXES[c['sex']]}"
        out.setdefault(key, {}).setdefault(c['sub_race'], {'remove': [], 'add': []})['add'].append(c['colour'])
    for key, subs in out.items():
        race_sex = next((r, g) for r in FOLDERS for g in SEXES if f'{FOLDERS[r]} {SEXES[g]}' == key)
        for name, change in subs.items():
            cols = next(cols for n, cols in glue[race_sex] if n == name)
            change['new_list'] = [c for c in cols if c not in change['remove']] + change['add']
    return out


def gate_lists(values):
    """Per race / sex / sub-race: the face (glue filter 7) and body (filter 8) values it may offer, when GATES lock
    some designs to one sub-race; sub-races not listed take every value outside the gated ones (`others`)."""
    glue = glue_subraces()
    out = {}
    for key, rows in values.items():
        race, g = (int(v) for v in key.split(':'))
        gated = [(prefix, sub) for prefix, r, sub in GATES if r == race]
        if not gated:
            continue
        subs = [n for n, _cols in glue.get((race, g), [])]
        entry = {}
        for sub in subs + ['others']:
            lists = {}
            for row_name, filt in ((ROW_NAME[FACE_ROW], 7), (ROW_NAME[BODY_ROW], 8)):
                vals = rows.get(row_name, [])
                allowed = [0] + [v['value'] for v in vals
                                 if not any(v['name'].startswith(prefix) and sub != owner for prefix, owner in gated)]
                lists[f'filter {filt} ({row_name})'] = allowed
            entry[sub] = lists
        out[f'{FOLDERS[race]} {SEXES[g]}'] = entry
    return out


def proposed_gate_lists(values):
    """DRAFT, keyed like gate_lists: per race / sex, `assign` = {row: {value: sub-race or 'common'}} and per sub-race the
    face (filter 7), body (filter 8) and scar (filter 9) lists = 0 + the common values + its own signature values."""
    glue = glue_subraces()
    out = {}
    for key, rows in sorted(values.items(), key=lambda kv: tuple(int(v) for v in kv[0].split(':'))):
        race, g = (int(v) for v in key.split(':'))
        subs = [n for n, _cols in glue.get((race, g), [])]
        if not subs:
            continue
        assign = {}
        for row_name, vals in rows.items():
            a = {}
            for v in vals:
                owner = next((sub for r, pat, sub in PROPOSED if r == race and re.search(pat, v['name'])), 'common')
                if owner != 'common' and owner not in subs:
                    raise SystemExit(f'PROPOSED names {owner!r}, not a sub-race of {key}')
                a[str(v['value'])] = owner
            assign[row_name] = a
        entry = {'assign': assign}
        for sub in subs:
            own = OWN_ONLY.get((race, g, sub), ())
            entry[sub] = {f'filter {filt} ({row_name})': [0] + [int(v) for v, o in assign.get(row_name, {}).items()
                                                               if o == sub or (o == 'common' and row_name not in own)]
                          for row_name, filt in ((ROW_NAME[FACE_ROW], 7), (ROW_NAME[BODY_ROW], 8),
                                                 (ROW_NAME[SCAR_ROW], 9)) if row_name in assign}
        out[f'{FOLDERS[race]} {SEXES[g]}'] = entry
    return out


def face_retire(sources, src_values):
    """Face types that are another face type plus a face marking (FACE_SPLITS): [{race, sex, face, new_face, value}]."""
    out = []
    for i, src in enumerate(sources):
        for marked, base in src.get('face_pairs') or []:
            out.append({'race': src['race'], 'sex': src['sex'], 'face': marked, 'new_face': base,
                        'value': src_values[i].get(FACE_ROW, 0), 'design': src['design'],
                        'round': src.get('round', 2)})
    return out


def troll_paint_map(sources, src_values):
    """(facial style, hair colour) -> face marking value of the troll male facial-hair paint."""
    out = {}
    for i, src in enumerate(sources):
        if src.get('troll_paint'):
            style, cols = src['troll_paint']
            for c in cols:
                out[(style, c)] = src_values[i].get(FACE_ROW, 0)
    return out


def migration_round3_sql(retire, cutoff):
    """Round 3 (2026-10-30): characters on a retired baked colour move to its clean colour + the layer values. Own
    done-table: round 2 already ran (its table holds characters this must still reach)."""
    rows = []
    for e in retire:
        face = (e['layers'].get(ROW_NAME[FACE_ROW]) or [{'value': 0}])[0]['value']
        body = (e['layers'].get(ROW_NAME[BODY_ROW]) or [{'value': 0}])[0]['value']
        rows.append(f"({e['race']},{e['sex']},{e['colour']},{e['replacement']},{face},{body})")
    return '\n'.join([
        '-- F-230 round 3: the rest of the baked markings (Illidari fel / runes, Cenarion female leaf tattoos, Void Elf paint,',
        '-- Cultist gnome paint, troll stripes / blood paint, draenei fel lines) are layers; characters on those colours move',
        '-- to the clean colour of the same tone plus the marking values (only into empty slots).',
        '-- GENERATED by Scripts/Character Skins/markings_regroup.py - do not edit, re-run the script.',
        f'-- Idempotent: once per character (zep_f230_markings_round3_done), characters with guid <= {cutoff} only.',
        'CREATE TABLE IF NOT EXISTS zep_f230_markings_round3_done (guid INT UNSIGNED NOT NULL PRIMARY KEY)',
        "  ENGINE=InnoDB COMMENT='F-230 markings round 3: characters already migrated';",
        'DROP TABLE IF EXISTS zep_tmp_r3_skin, zep_tmp_r3_todo;',
        'CREATE TABLE zep_tmp_r3_skin (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
        '  new_skin TINYINT UNSIGNED, face TINYINT UNSIGNED, body TINYINT UNSIGNED, PRIMARY KEY (race, gender, skin));',
        *(['INSERT INTO zep_tmp_r3_skin VALUES', ',\n'.join(rows) + ';'] if rows else []),
        'CREATE TABLE zep_tmp_r3_todo (guid INT UNSIGNED PRIMARY KEY);',
        'INSERT INTO zep_tmp_r3_todo (guid) SELECT c.guid FROM characters AS c',
        f'WHERE c.guid <= {cutoff} AND c.guid NOT IN (SELECT guid FROM zep_f230_markings_round3_done);',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, s.face FROM characters AS c JOIN zep_tmp_r3_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r3_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.face <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 3, s.body FROM characters AS c JOIN zep_tmp_r3_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r3_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.body <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'UPDATE characters AS c JOIN zep_tmp_r3_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r3_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin SET c.skin = s.new_skin;',
        'INSERT IGNORE INTO zep_f230_markings_round3_done (guid) SELECT guid FROM zep_tmp_r3_todo;',
        'DROP TABLE zep_tmp_r3_skin, zep_tmp_r3_todo;',
    ]) + '\n'


# round 4: sub-race copies no longer offered -> (race, sex): [(copy, original)] (moved by the round-4 migration)
COPIES_RETIRED = {(6, 0): [(42, 0), (43, 1), (44, 2), (45, 28), (46, 29), (47, 38)],
                  (6, 1): [(42, 0), (43, 1), (44, 28), (45, 29), (46, 38)]}


def migration_round4_sql(retire, faces, cutoff):
    """Round 4 (2026-10-31): blood elf male marked faces 20-29 -> plain face + face marking (and any round-4 colour).
    Own done-table."""
    skin = [f"({e['race']},{e['sex']},{e['colour']},{e['replacement']},"
            f"{(e['layers'].get(ROW_NAME[FACE_ROW]) or [{'value': 0}])[0]['value']},"
            f"{(e['layers'].get(ROW_NAME[BODY_ROW]) or [{'value': 0}])[0]['value']})" for e in retire]
    skin += [f'({r},{g},{cp},{orig},0,0)' for (r, g), pairs in sorted(COPIES_RETIRED.items()) for cp, orig in pairs]
    face = [f"({f['race']},{f['sex']},{f['face']},{f['new_face']},{f['value']})" for f in faces]
    return '\n'.join([
        '-- F-230 round 4: blood elf male faces that baked scars, runes and fel thorns are a plain face + a face marking;',
        '-- the Grimtotem tauren copies (42-47 / 42-46) are retired: Grimtotem offers the dark originals themselves.',
        '-- GENERATED by Scripts/Character Skins/markings_regroup.py - do not edit, re-run the script.',
        f'-- Idempotent: once per character (zep_f230_markings_round4_done), characters with guid <= {cutoff} only.',
        'CREATE TABLE IF NOT EXISTS zep_f230_markings_round4_done (guid INT UNSIGNED NOT NULL PRIMARY KEY)',
        "  ENGINE=InnoDB COMMENT='F-230 markings round 4: characters already migrated';",
        'DROP TABLE IF EXISTS zep_tmp_r4_skin, zep_tmp_r4_face, zep_tmp_r4_todo;',
        'CREATE TABLE zep_tmp_r4_skin (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
        '  new_skin TINYINT UNSIGNED, face TINYINT UNSIGNED, body TINYINT UNSIGNED, PRIMARY KEY (race, gender, skin));',
        *(['INSERT INTO zep_tmp_r4_skin VALUES', ',\n'.join(skin) + ';'] if skin else []),
        'CREATE TABLE zep_tmp_r4_face (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, face TINYINT UNSIGNED,',
        '  new_face TINYINT UNSIGNED, mark TINYINT UNSIGNED, PRIMARY KEY (race, gender, face));',
        *(['INSERT INTO zep_tmp_r4_face VALUES', ',\n'.join(face) + ';'] if face else []),
        'CREATE TABLE zep_tmp_r4_todo (guid INT UNSIGNED PRIMARY KEY);',
        'INSERT INTO zep_tmp_r4_todo (guid) SELECT c.guid FROM characters AS c',
        f'WHERE c.guid <= {cutoff} AND c.guid NOT IN (SELECT guid FROM zep_f230_markings_round4_done);',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, s.face FROM characters AS c JOIN zep_tmp_r4_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r4_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.face <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 3, s.body FROM characters AS c JOIN zep_tmp_r4_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r4_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.body <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'UPDATE characters AS c JOIN zep_tmp_r4_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r4_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin SET c.skin = s.new_skin;',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, f.mark FROM characters AS c JOIN zep_tmp_r4_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r4_face AS f ON f.race = c.race AND f.gender = c.gender AND f.face = c.face WHERE f.mark <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'UPDATE characters AS c JOIN zep_tmp_r4_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r4_face AS f ON f.race = c.race AND f.gender = c.gender AND f.face = c.face SET c.face = f.new_face;',
        'INSERT IGNORE INTO zep_f230_markings_round4_done (guid) SELECT guid FROM zep_tmp_r4_todo;',
        'DROP TABLE zep_tmp_r4_skin, zep_tmp_r4_face, zep_tmp_r4_todo;',
    ]) + '\n'


def migration_round2_sql(retire, faces, paint, cutoff):
    skin_rows = []
    for e in retire:
        face = (e['layers'].get(ROW_NAME[FACE_ROW]) or [{'value': 0}])[0]['value']
        body = (e['layers'].get(ROW_NAME[BODY_ROW]) or [{'value': 0}])[0]['value']
        skin_rows.append(f"({e['race']},{e['sex']},{e['colour']},{e['replacement']},{face},{body})")
    face_rows = [f"({f['race']},{f['sex']},{f['face']},{f['new_face']},{f['value']})" for f in faces]
    paint_rows = [f'({style},{c},{v})' for (style, c), v in sorted(paint.items())]
    clear = [(int(k.split(':')[0]), int(k.split(':')[1]), cust) for k, rows in RETIRED_POOLS.items()
             for cust, name in ((2, ROW_NAME[FACE_ROW]), (3, ROW_NAME[BODY_ROW]), (4, ROW_NAME[SCAR_ROW]))
             if name in rows]
    return '\n'.join([
        '-- F-230 round 2: baked markings found by the skin check detector (cli/lib/baked_marks.py), split into layers.',
        '-- 1. characters on a retired baked skin colour move to the plain (or new clean) colour of the same tone plus',
        '--    the face / body marking values of what it baked in (only where that marking slot is empty);',
        '-- 2. characters on a retired marked face type move to its plain face type plus the face marking;',
        '-- 3. troll males with facial-hair paint (styles 5-10) get that paint as a face marking (by hair colour);',
        '-- 4. retired marking pools (undead male face markings) are cleared.',
        '-- GENERATED by Scripts/Character Skins/markings_regroup.py - do not edit, re-run the script.',
        f'-- Idempotent: once per character (zep_f230_markings_round2_done), characters with guid <= {cutoff} only.',
        'CREATE TABLE IF NOT EXISTS zep_f230_markings_round2_done (guid INT UNSIGNED NOT NULL PRIMARY KEY)',
        "  ENGINE=InnoDB COMMENT='F-230 markings round 2: characters already migrated';",
        'DROP TABLE IF EXISTS zep_tmp_r2_skin, zep_tmp_r2_face, zep_tmp_r2_paint, zep_tmp_r2_todo;',
        'CREATE TABLE zep_tmp_r2_skin (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
        '  new_skin TINYINT UNSIGNED, face TINYINT UNSIGNED, body TINYINT UNSIGNED, PRIMARY KEY (race, gender, skin));',
        *(['INSERT INTO zep_tmp_r2_skin VALUES', ',\n'.join(skin_rows) + ';'] if skin_rows else []),
        'CREATE TABLE zep_tmp_r2_face (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, face TINYINT UNSIGNED,',
        '  new_face TINYINT UNSIGNED, mark TINYINT UNSIGNED, PRIMARY KEY (race, gender, face));',
        *(['INSERT INTO zep_tmp_r2_face VALUES', ',\n'.join(face_rows) + ';'] if face_rows else []),
        'CREATE TABLE zep_tmp_r2_paint (style TINYINT UNSIGNED, hair TINYINT UNSIGNED, mark TINYINT UNSIGNED,',
        '  PRIMARY KEY (style, hair));',
        *(['INSERT INTO zep_tmp_r2_paint VALUES', ',\n'.join(paint_rows) + ';'] if paint_rows else []),
        'CREATE TABLE zep_tmp_r2_todo (guid INT UNSIGNED PRIMARY KEY);',
        'INSERT INTO zep_tmp_r2_todo (guid) SELECT c.guid FROM characters AS c',
        f'WHERE c.guid <= {cutoff} AND c.guid NOT IN (SELECT guid FROM zep_f230_markings_round2_done);',
        '-- 4. retired pools first, so a split below can fill the slot',
        *[f'DELETE x FROM character_customizations AS x JOIN characters AS c ON c.guid = x.guid JOIN zep_tmp_r2_todo AS t '
          f'ON t.guid = c.guid WHERE c.race = {r} AND c.gender = {g} AND x.customization = {cust};' for r, g, cust in clear],
        '-- 1. skins: marking values into empty slots, then the colour',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, s.face FROM characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.face <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 3, s.body FROM characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin WHERE s.body <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'UPDATE characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_skin AS s ON s.race = c.race AND s.gender = c.gender AND s.skin = c.skin SET c.skin = s.new_skin;',
        '-- 2. faces',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, f.mark FROM characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_face AS f ON f.race = c.race AND f.gender = c.gender AND f.face = c.face WHERE f.mark <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'UPDATE characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_face AS f ON f.race = c.race AND f.gender = c.gender AND f.face = c.face SET c.face = f.new_face;',
        '-- 3. troll male facial-hair paint (the facial style itself is facial_split.py\'s migration)',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT c.guid, 2, p.mark FROM characters AS c JOIN zep_tmp_r2_todo AS t ON t.guid = c.guid',
        'JOIN zep_tmp_r2_paint AS p ON p.style = c.facialStyle AND p.hair = c.hairColor',
        'WHERE c.race = 8 AND c.gender = 0 AND p.mark <> 0',
        'ON DUPLICATE KEY UPDATE choice = IF(choice = 0, VALUES(choice), choice);',
        'INSERT IGNORE INTO zep_f230_markings_round2_done (guid) SELECT guid FROM zep_tmp_r2_todo;',
        'DROP TABLE zep_tmp_r2_skin, zep_tmp_r2_face, zep_tmp_r2_paint, zep_tmp_r2_todo;',
    ]) + '\n'


def migration_sql(old_map, retire, cutoff):
    layer_rows = []
    for key, m in sorted(old_map.items()):
        race, g = key.split(':')
        for k, v in sorted(m.items(), key=lambda kv: tuple(int(x) for x in kv[0].split(':'))):
            cust, choice = k.split(':')
            layer_rows.append(f"({race},{g},{cust},{choice},{v['face']},{v['body']},{v['scar']})")
    skin_rows = []
    for e in retire:
        face = (e['layers'].get(ROW_NAME[FACE_ROW]) or [{'value': 0}])[0]['value']
        body = (e['layers'].get(ROW_NAME[BODY_ROW]) or [{'value': 0}])[0]['value']
        skin_rows.append(f"({e['race']},{e['sex']},{e['colour']},{e['replacement']},{face},{body})")
    return '\n'.join([
        '-- F-230: character marking layers regrouped by region. character_customizations 2 = face markings, 3 = body',
        '-- markings, 4 = scars (CharSections base_section 6 / 7 / 8; were tattoo / scars / war paint). Old stored values',
        '-- move to the face / body / scar values of the same layer; characters on a retired baked marked skin move to the',
        '-- plain (or new clean) colour of the same tone plus the layer values of its marking.',
        '-- GENERATED by Scripts/Character Skins/markings_regroup.py - do not edit, re-run the script.',
        f'-- Idempotent: a character is migrated once (zep_f230_markings_regroup_done), and only characters that existed',
        f'-- when this was generated (guid <= {cutoff}), so later characters keep the values they were created with.',
        'CREATE TABLE IF NOT EXISTS zep_f230_markings_regroup_done (guid INT UNSIGNED NOT NULL PRIMARY KEY)',
        "  ENGINE=InnoDB COMMENT='F-230 markings regroup: characters already migrated';",
        'DROP TABLE IF EXISTS zep_tmp_layer_map, zep_tmp_skin_map, zep_tmp_todo, zep_tmp_new;',
        'CREATE TABLE zep_tmp_layer_map (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, customization TINYINT UNSIGNED,',
        '  choice TINYINT UNSIGNED, face TINYINT UNSIGNED, body TINYINT UNSIGNED, scar TINYINT UNSIGNED,',
        '  PRIMARY KEY (race, gender, customization, choice));',
        'INSERT INTO zep_tmp_layer_map (race, gender, customization, choice, face, body, scar) VALUES',
        ',\n'.join(layer_rows) + ';',
        'CREATE TABLE zep_tmp_skin_map (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
        '  new_skin TINYINT UNSIGNED, face TINYINT UNSIGNED, body TINYINT UNSIGNED, PRIMARY KEY (race, gender, skin));',
        'INSERT INTO zep_tmp_skin_map (race, gender, skin, new_skin, face, body) VALUES',
        ',\n'.join(skin_rows) + ';',
        '-- the characters to migrate: a non-zero layer choice or a retired skin, not migrated before',
        'CREATE TABLE zep_tmp_todo (guid INT UNSIGNED PRIMARY KEY, race TINYINT UNSIGNED, gender TINYINT UNSIGNED,',
        '  skin TINYINT UNSIGNED);',
        'INSERT INTO zep_tmp_todo (guid, race, gender, skin)',
        'SELECT c.guid, c.race, c.gender, c.skin FROM characters AS c',
        f'WHERE c.guid <= {cutoff} AND c.guid NOT IN (SELECT guid FROM zep_f230_markings_regroup_done)',
        '  AND (EXISTS (SELECT 1 FROM character_customizations AS x WHERE x.guid = c.guid AND x.customization BETWEEN 2 AND 4',
        '               AND x.choice <> 0)',
        '       OR EXISTS (SELECT 1 FROM zep_tmp_skin_map AS s WHERE s.race = c.race AND s.gender = c.gender AND s.skin = c.skin));',
        '-- new values: a face / body part from the old tattoo first, then war paint, then scars; then the retired skin\'s marking',
        'CREATE TABLE zep_tmp_new (guid INT UNSIGNED PRIMARY KEY, face TINYINT UNSIGNED, body TINYINT UNSIGNED,',
        '  scar TINYINT UNSIGNED, new_skin TINYINT UNSIGNED);',
        'INSERT INTO zep_tmp_new (guid, face, body, scar, new_skin)',
        'SELECT t.guid,',
        '  COALESCE(NULLIF(m2.face, 0), NULLIF(m4.face, 0), NULLIF(m3.face, 0), NULLIF(s.face, 0), 0),',
        '  COALESCE(NULLIF(m2.body, 0), NULLIF(m4.body, 0), NULLIF(m3.body, 0), NULLIF(s.body, 0), 0),',
        '  COALESCE(NULLIF(m3.scar, 0), NULLIF(m2.scar, 0), NULLIF(m4.scar, 0), 0),',
        '  s.new_skin',
        'FROM zep_tmp_todo AS t',
        'LEFT JOIN character_customizations AS x2 ON x2.guid = t.guid AND x2.customization = 2',
        'LEFT JOIN zep_tmp_layer_map AS m2 ON m2.race = t.race AND m2.gender = t.gender AND m2.customization = 2 AND m2.choice = x2.choice',
        'LEFT JOIN character_customizations AS x3 ON x3.guid = t.guid AND x3.customization = 3',
        'LEFT JOIN zep_tmp_layer_map AS m3 ON m3.race = t.race AND m3.gender = t.gender AND m3.customization = 3 AND m3.choice = x3.choice',
        'LEFT JOIN character_customizations AS x4 ON x4.guid = t.guid AND x4.customization = 4',
        'LEFT JOIN zep_tmp_layer_map AS m4 ON m4.race = t.race AND m4.gender = t.gender AND m4.customization = 4 AND m4.choice = x4.choice',
        'LEFT JOIN zep_tmp_skin_map AS s ON s.race = t.race AND s.gender = t.gender AND s.skin = t.skin;',
        'DELETE x FROM character_customizations AS x JOIN zep_tmp_new AS n ON n.guid = x.guid WHERE x.customization BETWEEN 2 AND 4;',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT guid, 2, face FROM zep_tmp_new WHERE face <> 0',
        'UNION ALL SELECT guid, 3, body FROM zep_tmp_new WHERE body <> 0',
        'UNION ALL SELECT guid, 4, scar FROM zep_tmp_new WHERE scar <> 0;',
        'UPDATE characters AS c JOIN zep_tmp_new AS n ON n.guid = c.guid SET c.skin = n.new_skin WHERE n.new_skin IS NOT NULL;',
        'INSERT IGNORE INTO zep_f230_markings_regroup_done (guid) SELECT guid FROM zep_tmp_todo;',
        'DROP TABLE zep_tmp_layer_map, zep_tmp_skin_map, zep_tmp_todo, zep_tmp_new;',
    ]) + '\n'


if __name__ == '__main__':
    main()
