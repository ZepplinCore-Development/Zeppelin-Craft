"""F-151: orc body markings as their own choice, cut out of the skin colours that baked them in.

The Nexus skin colours come in families: a plain base colour plus copies with paint, tattoos, scars or
piercings. Each marking is the difference between a marked colour's skin texture and its base colour's
(after matching their overall tone), written as one full-atlas layer (512x512, palettized BLP2 + 8-bit alpha):

  paint, tattoos, metal   the marked pixels as they are: a fixed colour on every skin (user rule)
  scars                   black or white with alpha, so they darken or lighten whatever skin is underneath and
                          follow the skin colour (user rule)

CharSections base_section 7 = body markings: type = marking (1-9; 0 = none, no row), color_index 0,
texture_1 = the layer. The source client pastes it over the skin in every body section, under underwear and items.

Also writes the skin repair for colour 9 (its red loincloth was painted into the skin: user rule "plain skin")
and the old-colour -> (base colour, marking) table used by the migration.

  python3 "Scripts/Character Skins/body_markings.py" [--preview DIR] [--migration]
"""
import importlib.util
import json
import subprocess
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
SQL = ZPAK / 'dbc' / '[F-151]_charsections_bodymarkings.sql'
SPLIT = Path(__file__).with_name('orc_body_split.json')
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-151]_orc_body_split.sql'
RACE, SEXES = 2, {0: 'Male', 1: 'Female'}
SECTION_SKIN, SECTION_BODY_MARKINGS = 0, 7
ID_BASE = 89000                                  # 89000-89099, inside F-151's 80000-89999
FLAGS_ANY = 0x11
SKIN_TEX = 'Character\\Orc\\{sex}\\Orc{sex}Skin00_{colour:02d}.blp'
MARK_DIFF = 42                                   # |rgb| sum over which a marked skin differs from its base
TONE_SIGMA = 24                                  # px (of 512): reach of the local tone match
STRONG = 150                                     # |rgb| a paint or ink region must reach somewhere
STRONG_P90 = 100                                 # ... and over most of it: c41 ink p90 115+, its darker toes 67
SIZE = 512
OUT = 1024                                       # markings are cut at twice the skin's size for soft edges, then written at
                                                 # SIZE: the client composites the body at 512, and a 1024 layer crashed it (I-422)
HEAD = [((0, 320), (256, 64)), ((0, 384), (256, 128))]   # head sections: the face textures cover them

# marking -> (name, donor colour, base colour, mode[, smallest region kept, closing px]); mode 'fixed' keeps the
# colours, 'shade' follows the skin
MARKINGS = {
    1: ('Handprints', 28, 19, 'fixed'),
    2: ('War paint', 30, 19, 'fixed'),
    3: ('Small tribal', 32, 22, 'fixed'),
    4: ('Large tribal', 34, 22, 'fixed'),
    5: ('Scars', 36, 19, 'shade'),
    6: ('Piercings', 38, 19, 'pierce'),
    7: ('Black tattoo', 41, 19, 'fixed'),
    8: ('Green runes', 42, 19, 'fixed', 300, 4),
    9: ('Orange runes', 43, 19, 'fixed', 300, 4),
}
# old skin colour -> (base colour, marking): the colours that are a base plus a body marking
SPLIT_COLOURS = {28: (19, 1), 29: (22, 1), 30: (19, 2), 31: (22, 2), 32: (22, 3), 33: (26, 3), 34: (22, 4),
                 35: (26, 4), 36: (19, 5), 37: (26, 5), 38: (19, 6), 39: (26, 6), 40: (0, 7), 41: (19, 7),
                 42: (19, 8), 43: (19, 9)}
# sex -> {colour with a painted-in loincloth: (its original skin file, colour whose shading fills it)}
PLAIN_REPAIR = {0: {9: ('Character\\Orc\\Male\\OrcMaleSkin00_100.blp', 0)}}


def load(files, path):
    f = files.find(path)
    if not f:
        raise FileNotFoundError(path)
    return np.asarray(Image.open(f).convert('RGB').resize((SIZE, SIZE), Image.LANCZOS)).astype(np.float32)


def clean(mask, grow=0):
    mask = ndimage.binary_opening(mask, iterations=1)
    mask = ndimage.binary_closing(mask, iterations=2)
    labels, n = ndimage.label(mask)
    if n:
        sizes = ndimage.sum(mask, labels, range(1, n + 1))
        mask = np.isin(labels, 1 + np.flatnonzero(sizes >= 40))
    # small enclosed holes: tattoo interiors whose colour happens to be close to the base skin
    holes, n = ndimage.label(ndimage.binary_fill_holes(mask) & ~mask)
    if n:
        sizes = ndimage.sum(holes > 0, holes, range(1, n + 1))
        mask |= np.isin(holes, 1 + np.flatnonzero(sizes < 400))
    for (x, y), (w, h) in HEAD:
        mask[y:y + h, x:x + w] = False
    return ndimage.binary_dilation(mask, iterations=grow) if grow else mask


def feather(mask):
    a = np.clip(ndimage.uniform_filter(mask.astype(np.float32), 3) * 255 * 1.5, 0, 255)
    a[~mask] = 0
    return a


def marking(donor, base, mode, min_blob=0, close=0):
    """RGBA layer (uint8) of donor minus base."""
    # tone: a first pass on the global offset finds the marking, then the offset is averaged locally over the
    # unmarked pixels only, so a colour whose tone drifts across the body (c41 legs) is not read as a marking
    off = np.median((donor - base).reshape(-1, 3), axis=0)
    first = clean(np.abs(donor - np.clip(base + off, 0, 255)).sum(axis=2) > MARK_DIFF, grow=2)
    w = (~first).astype(np.float32)
    local = np.dstack([ndimage.gaussian_filter((donor - base)[..., k] * w, TONE_SIGMA) for k in range(3)])
    local /= np.maximum(ndimage.gaussian_filter(w, TONE_SIGMA), 1e-3)[..., None]
    matched = np.clip(base + local, 0, 255)
    diff = np.abs(donor - matched).sum(axis=2)
    mask = clean(diff > MARK_DIFF, grow=1)
    if mode == 'fixed':
        # paint and ink have strong cores; a region that only differs a little is the donor's own shading
        labels, n = ndimage.label(mask)
        if n:
            peak = ndimage.maximum(diff, labels, range(1, n + 1))
            p90 = ndimage.labeled_comprehension(diff, labels, range(1, n + 1), lambda v: np.percentile(v, 90), float, 0)
            sizes = ndimage.sum(mask, labels, range(1, n + 1))
            mask = np.isin(labels, 1 + np.flatnonzero((peak >= STRONG) & (p90 >= STRONG_P90) & (sizes >= min_blob)))
        if close:
            # ragged designs (the runes): merge the fragments into solid shapes
            mask = ndimage.binary_fill_holes(ndimage.binary_closing(np.pad(mask, close, mode='edge'), iterations=close))[close:-close, close:-close]
    if mode == 'fixed':
        return soft_layer(donor, matched, mask), mask.mean()
    rgb = donor.copy()
    alpha = feather(mask)
    if mode in ('shade', 'pierce'):
        # shading as black / white over the skin: ratio < 1 darkens (black at 1-ratio), > 1 lightens (white)
        lum_d, lum_b = donor.mean(axis=2), matched.mean(axis=2)
        ratio = (lum_d + 1) / (lum_b + 1)
        shade = mask.copy()
        if mode == 'pierce':
            # metal: grey and brighter than the skin, kept as it is
            sat = donor.max(axis=2) - donor.min(axis=2)
            metal = mask & (lum_d > lum_b + 25) & (sat < 40)
            shade &= ~ndimage.binary_dilation(metal, iterations=1)
        dark = shade & (ratio < 1)
        light = shade & (ratio >= 1)
        rgb[dark] = 0
        rgb[light] = 255
        a_shade = np.where(dark, (1 - ratio) * 255 * 1.2, np.clip((ratio - 1), 0, 1) * 255 * 0.8)
        alpha = np.where(shade, np.clip(a_shade, 0, 255) * (alpha / 255), alpha)
    layer = Image.fromarray(np.dstack([rgb, alpha]).astype(np.uint8), 'RGBA').resize((OUT, OUT), Image.LANCZOS)
    return np.asarray(layer), mask.mean()


def up(a):
    """A float RGB / grey array at OUT size, LANCZOS."""
    if a.ndim == 2:
        return np.asarray(Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).resize((OUT, OUT), Image.LANCZOS)).astype(np.float32)
    return np.asarray(Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).resize((OUT, OUT), Image.LANCZOS)).astype(np.float32)


def soft_layer(donor, matched, mask):
    """Paint / ink at OUT size with a soft matte: alpha from how far each pixel is from the tone-matched base (full
    inside the marking, fading over its edge), colour unmixed from the base, so edges are antialiased, not stepped."""
    d, m = up(donor), up(matched)
    diff = np.abs(d - m).sum(axis=2)
    region = up(ndimage.binary_dilation(mask, iterations=2).astype(np.float32) * 255) / 255
    inner = up(ndimage.binary_erosion(mask, iterations=1).astype(np.float32) * 255) / 255
    t = np.clip((diff - MARK_DIFF * 0.5) / (MARK_DIFF * 1.1), 0, 1)
    a = np.maximum(t * t * (3 - 2 * t), inner) * np.clip(region, 0, 1)
    rgb = np.where(a[..., None] > 0.08, (d - (1 - a[..., None]) * m) / np.maximum(a[..., None], 0.08), d)
    # the edge band takes the colour of the marking's interior: unmixing a thin edge amplifies its light rim
    core = (up(ndimage.binary_erosion(mask, iterations=2).astype(np.float32) * 255) > 128) & (a > 0.85)
    if core.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~core, return_indices=True)
        rgb = np.where(core[..., None], rgb, rgb[iy, ix])
    return np.dstack([np.clip(rgb, 0, 255), np.clip(a * 255, 0, 255)]).astype(np.uint8)


def repair(skin, filler):
    """skin with its painted-in red cloth replaced by the filler colour's shading, in skin's tone."""
    red = (skin[..., 0] > skin[..., 1] + 25) & (skin[..., 0] > skin[..., 2] + 25)
    mask = clean(red, grow=4)
    keep = ~ndimage.binary_dilation(mask, iterations=6)
    # the filler's shading (brightness) in skin's own colour: a per-channel scale would carry the filler's hue
    tone = np.median(skin[keep], axis=0)
    lum = filler.mean(axis=2, keepdims=True)
    fill = np.clip(tone * lum / max(float(np.median(lum[keep])), 1.0), 0, 255)
    a = ndimage.uniform_filter(mask.astype(np.float32), 5)[..., None]
    return (skin * (1 - a) + fill * a).astype(np.uint8), mask.mean()


# skin colours whose faces baked in face paint, now facial marking BAKED_MARK (eyes_markings.py BAKED)
BAKED_FACE = {'colours': (44, 45), 'marking': 8}


def max_character_guid():
    out = subprocess.run([sys.executable, '-m', 'cli.zep', 'world', 'sql', 'query', 'SELECT MAX(guid) FROM characters',
                          '-d', 'characters'], cwd=CRAFT, capture_output=True, text=True, check=True).stdout.split()
    return int(out[-1])


def migration_sql(split, cutoff):
    lines = ['-- F-151 Modern Character Creator: orcs on a skin colour that baked a body marking move to the',
             '-- base colour + that marking (character_customizations 3).',
             '-- GENERATED by Scripts/Character Skins/body_markings.py --migration - do not edit, re-run the script.',
             'DROP TEMPORARY TABLE IF EXISTS zep_orc_body_split;',
             'CREATE TEMPORARY TABLE zep_orc_body_split (gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
             '  base TINYINT UNSIGNED, marking TINYINT UNSIGNED, PRIMARY KEY (gender, skin));',
             'INSERT INTO zep_orc_body_split (gender, skin, base, marking) VALUES',
             ',\n'.join(f'({g}, {c}, {b}, {m})' for g in SEXES for c, (b, m) in sorted(split.items())) + ';',
             'INSERT INTO character_customizations (guid, customization, choice)',
             'SELECT c.guid, 3, s.marking FROM characters AS c',
             'JOIN zep_orc_body_split AS s ON s.gender = c.gender AND s.skin = c.skin',
             'WHERE c.race = 2 AND NOT EXISTS (SELECT 1 FROM character_customizations AS x WHERE x.guid = c.guid AND x.customization = 3);',
             'UPDATE characters AS c JOIN zep_orc_body_split AS s ON s.gender = c.gender AND s.skin = c.skin',
             'SET c.skin = s.base WHERE c.race = 2;',
             'DROP TEMPORARY TABLE zep_orc_body_split;',
             f'-- the face paint colours {BAKED_FACE["colours"]} draw plain faces now: their orcs get facial marking '
             f'{BAKED_FACE["marking"]}. Only characters that existed when',
             f'-- this was generated (guid <= {cutoff}), so a later character that chose no marking keeps none.',
             f'UPDATE character_customizations AS x JOIN characters AS c ON c.guid = x.guid SET x.choice = {BAKED_FACE["marking"]}',
             f'WHERE c.race = 2 AND c.skin IN ({", ".join(map(str, BAKED_FACE["colours"]))}) AND x.customization = 2 '
             f'AND x.choice = 0 AND c.guid <= {cutoff};']
    return '\n'.join(lines) + '\n'


def main():
    preview = Path(sys.argv[sys.argv.index('--preview') + 1]) if '--preview' in sys.argv else None
    files = FileResolver([ASSETS] + [r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])
    sql = ['-- F-151 Modern Character Creator: orc body markings (CharSections base_section 7).',
           '-- GENERATED by Scripts/Character Skins/body_markings.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_BASE + 99};']
    rid = ID_BASE
    for g, sex in SEXES.items():
        skins = {}

        def skin(c):
            if c not in skins:
                skins[c] = load(files, SKIN_TEX.format(sex=sex, colour=c))
            return skins[c]

        for n, (name, donor, base, mode, *opts) in MARKINGS.items():
            layer, cover = marking(skin(donor), skin(base), mode, *opts)
            rel = f'Character\\Orc\\{sex}\\Orc{sex}BodyMarking{n:02d}.blp'
            layer = np.asarray(Image.fromarray(layer, 'RGBA').resize((SIZE, SIZE), Image.LANCZOS))
            icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), Image.fromarray(layer, 'RGBA'))
            print(f'{sex} {n} {name}: colour {donor} over {base} ({mode}), {cover:.1%} of the body')
            sql.append(f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, "
                       f"type, color_index) VALUES ({rid}, {RACE}, {g}, {SECTION_BODY_MARKINGS}, "
                       f"'{rel.replace(chr(92), chr(92) * 2)}', '', '', {FLAGS_ANY}, {n}, 0);  -- {name}")
            rid += 1
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(layer, 'RGBA').save(preview / f'{sex}_{n:02d}.png')
        for c, (original, filler) in PLAIN_REPAIR.get(g, {}).items():
            fixed, cover = repair(load(files, original), skin(filler))
            rel = f'Character\\Orc\\{sex}\\Orc{sex}Skin00_{c:02d}Plain.blp'
            icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), Image.fromarray(fixed, 'RGB').convert('RGBA'))
            print(f'{sex} colour {c}: painted-in cloth ({cover:.1%}) replaced with colour {filler} shading')
            sql.append(f"UPDATE charsections SET texture_1 = '{rel.replace(chr(92), chr(92) * 2)}' WHERE race = {RACE} "
                       f"AND gender = {g} AND base_section = {SECTION_SKIN} AND type = 0 AND color_index = {c};  -- plain skin")
            if preview:
                Image.fromarray(fixed, 'RGB').save(preview / f'{sex}_skin{c}_plain.png')
    SQL.write_text('\n'.join(sql) + '\n')
    SPLIT.write_text(json.dumps({str(c): v for c, v in SPLIT_COLOURS.items()}, indent=1) + '\n')
    print(f'-> {SQL.relative_to(CRAFT)}, {SPLIT.name}')
    if '--migration' in sys.argv:
        MIGRATION.write_text(migration_sql(SPLIT_COLOURS, max_character_guid()))
        print(f'-> {MIGRATION.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
