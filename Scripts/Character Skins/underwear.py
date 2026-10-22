"""F-151: one underwear style per orc sub-race, worn by every skin colour of that sub-race.

Each style is the cloth of one donor colour's underwear (CharSections base_section 4): the donor's underwear
texture minus that colour's own skin texture at the same body region, so the skin and any body markings
painted into both cancel out and only the cloth is left. The cloth is written with 8-bit alpha (palettized BLP2)
and composited over each colour's skin, so one file per style fits every colour.

  texture_1 = pelvis (SECTION_LEG_UPPER, body atlas 256,192 256x128)
  texture_2 = torso  (SECTION_TORSO_UPPER, body atlas 256,0 256x128; females only)

Writes zpaks/zep-skin-expansion/mpq/source-assets/Character/Orc/<Sex>/OrcUnderwear<Sex><Style>{Pelvis,Torso}.blp
and zpaks/zep-skin-expansion/dbc/[F-151]_charsections_underwear.sql (UPDATEs; sorts after the [AUTO,*] files
that create the rows). The sub-race colour lists must match CHAR_CREATE_SUBRACES in PATCH-L CharacterCreate.lua.

  python3 "Scripts/Character Skins/underwear.py" [--preview DIR]
"""
import importlib.util
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
SQL = ZPAK / 'dbc' / '[F-151]_charsections_underwear.sql'
RACE, SEXES = 2, {0: 'Male', 1: 'Female'}
SECTION_SKIN, SECTION_UNDERWEAR = 0, 4
REGIONS = {'texture_1': ('Pelvis', (256, 192)), 'texture_2': ('Torso', (256, 0))}
# the donors' own underwear files, by name: the live rows point at this script's output once it is applied
DONOR = 'Character\\Orc\\{sex}\\Orc{sex}Naked{part}Skin00_{colour:02d}.blp'
CLOTH_DIFF = 40                          # |rgb| sum over which the underwear texture differs from the bare skin

# sub-race -> (donor colour, colours that wear it), per sex
STYLES = {
    0: {'Orc': (0, [0, 1, 2, 3, 4, 5, 6, 7, 8, 40]),
        'Maghar': (28, [12, 20, 21, 22, 23, 24, 29, 31, 32, 34]),
        'Blackrock': (32, [9, 14, 18, 19, 28, 30, 36, 38, 41, 42, 43, 44, 45]),
        'FelOrc': (37, [10, 25, 26, 27, 33, 35, 37, 39])},
    1: {'Orc': (0, [0, 1, 2, 3, 4, 5, 6, 7, 8, 40]),
        'Maghar': (28, [20, 21, 22, 23, 24, 29, 31, 32, 34]),
        'Blackrock': (37, [18, 19, 28, 30, 36, 38, 41, 42, 43, 44, 45]),
        'FelOrc': (40, [25, 26, 27, 33, 35, 37, 39])},
}


def rows_by_key(query):
    rows = query(f'SELECT id, gender, base_section, type, color_index, texture_1, texture_2 FROM charsections '
                 f'WHERE race = {RACE} AND base_section IN ({SECTION_SKIN}, {SECTION_UNDERWEAR})')
    skin, under = {}, {}
    for r in sorted(rows, key=lambda r: r['id']):            # duplicate keys: the highest id wins (F-225)
        if r['base_section'] == SECTION_SKIN and r['type'] == 0:
            skin[(r['gender'], r['color_index'])] = r
        elif r['base_section'] == SECTION_UNDERWEAR:
            under[(r['gender'], r['color_index'])] = r
    return skin, under


def load(files, path):
    f = files.find(path)
    if not f:
        raise FileNotFoundError(path)
    return Image.open(f).convert('RGB')


def cloth(files, skin_row, under_path, xy):
    """The donor's cloth as RGBA at the underwear texture's own size."""
    under = load(files, under_path)
    w, h = under.size
    scale = w / 256                                           # body atlas is 512 wide at underwear width 256
    body = load(files, skin_row['texture_1']).resize((int(512 * scale), int(512 * scale)), Image.LANCZOS)
    bare = body.crop((int(xy[0] * scale), int(xy[1] * scale), int(xy[0] * scale) + w, int(xy[1] * scale) + h))
    u, b = np.asarray(under).astype(np.int16), np.asarray(bare).astype(np.int16)
    mask = np.abs(u - b).sum(axis=2) > CLOTH_DIFF
    mask = ndimage.binary_opening(mask, iterations=1)
    mask = ndimage.binary_closing(mask, iterations=2)
    mask = ndimage.binary_fill_holes(mask)
    labels, n = ndimage.label(mask)
    if n:
        sizes = ndimage.sum(mask, labels, range(1, n + 1))
        mask = np.isin(labels, 1 + np.flatnonzero(sizes >= 30))
    # feathered inward only: a pixel outside the mask carries the donor's skin, which would fringe other colours
    alpha = np.clip(ndimage.uniform_filter(mask.astype(np.float32), 3) * 255 * 1.5, 0, 255).astype(np.uint8)
    alpha[~mask] = 0
    rgba = np.dstack([np.asarray(under), alpha])
    return Image.fromarray(rgba, 'RGBA'), mask.mean()


def main():
    preview = Path(sys.argv[sys.argv.index('--preview') + 1]) if '--preview' in sys.argv else None
    files = FileResolver([ASSETS] + [r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])
    skin, under = rows_by_key(_dbc_query_fn('live'))
    sql = ['-- F-151 Modern Character Creator: one underwear style per orc sub-race.',
           '-- GENERATED by Scripts/Character Skins/underwear.py - do not edit, re-run the script.']
    for g, sex in SEXES.items():
        for style, (donor, colours) in STYLES[g].items():
            paths = {}
            for col, (part, xy) in REGIONS.items():
                if not under[(g, donor)][col]:
                    paths[col] = ''
                    continue
                src = DONOR.format(sex=sex, part=part, colour=donor)
                img, cover = cloth(files, skin[(g, donor)], src, xy)
                rel = f'Character\\Orc\\{sex}\\OrcUnderwear{sex}{style}{part}.blp'
                icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), img)
                paths[col] = rel
                print(f'{sex} {style} {part}: donor colour {donor}, cloth {cover:.0%} of the texture')
                if preview:
                    preview.mkdir(parents=True, exist_ok=True)
                    img.save(preview / f'{sex}_{style}_{part}.png')
            missing = [c for c in colours if (g, c) not in under]
            if missing:
                raise SystemExit(f'{sex} {style}: no underwear row for colours {missing}')
            esc = {c: p.replace('\\', '\\\\') for c, p in paths.items()}
            sql.append(f"UPDATE charsections SET texture_1 = '{esc['texture_1']}', texture_2 = '{esc['texture_2']}' "
                       f"WHERE race = {RACE} AND gender = {g} AND base_section = {SECTION_UNDERWEAR} "
                       f"AND color_index IN ({', '.join(map(str, colours))});  -- {style}")
    SQL.write_text('\n'.join(sql) + '\n')
    print(f'-> {SQL.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
