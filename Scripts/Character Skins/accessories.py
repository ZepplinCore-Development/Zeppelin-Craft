"""F-230: Accessories - the harness / chains / silk that baked skin colours carried, as a layer that can be off.

Some mod 907 colours are a skin plus clothing or jewellery painted into the skin, its underwear and its faces
(undead female 25 / 26: a spiked leather harness; night elf female 33 / 34: moonsilver chains and silk). This script
cuts each one into

  an Accessories layer   CharSections base_section 9, type = value (1..; 0 = none, no row), color_index 0, flags 0x11,
                         texture_1 = a 512 full-atlas layer (palettized BLP2 + 8-bit alpha). The source client pastes
                         it over the skin and markings, over the underwear on the torso / upper legs, under items
                         (character_customizations 5, OBJECT_FIELD_PADDING byte 3, glue customization 10).
  a clean colour         the baked colour without it, in its own tone: its skin and faces with the accessory pixels
                         replaced by the plain base colour moved to the baked colour's local tone (body_markings.cut's
                         `matched`); the base colour's underwear moved to that tone (markings_regroup.apply_map, skin
                         pixels only), since the baked underwear is the clothing itself; _Extra unchanged.

The baked colour leaves the creator (glue lists: the clean colour takes its place) and characters on it move to the
clean colour + the accessory (migration). The baked rows stay in CharSections: NPC displays may use them.

Cut: body_markings.cut of the baked composite WITH its underwear (opaque, it carries part of the clothing) against the
base composite WITHOUT underwear, so the base's own underwear garment never reads as accessory.
A `partner` colour with the same design on another tone keeps only body pixels both cuts agree on, which drops skin
art that differs between the two bases (the undead harness pair).

Outputs:
  zpaks/zep-skin-expansion/dbc/[F-230]_charsections_accessories.sql   ids 108000-108099 layers, 108100-108999 colours
  zpaks/zep-skin-expansion/sql_characters/zz_[F-230]_accessories.sql   migration (idempotent)
  textures Character\\<Folder>\\<Sex>\\<Folder><Sex>Accessory<NN>.blp and <Folder><Sex>*_za<colour>.blp

Values and clean colour numbers are storage keys: append, never renumber (they are fixed in ACCESSORIES).

  python3 "Scripts/Character Skins/accessories.py" [--preview DIR] [--check]
"""
import argparse
import importlib.util
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
from lib.wardrobe.eye_islands import island  # noqa: E402


def _load(name):
    if name in sys.modules:
        return sys.modules[name]
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(f'{name}.py'))
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    spec.loader.exec_module(mod)
    return mod


ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
PARSED = ZPAK / 'mpq' / 'parsed-assets'
SQL = ZPAK / 'dbc' / '[F-230]_charsections_accessories.sql'
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-230]_accessories.sql'
LAYER_ID, LAYER_END = 108000, 108099
COLOUR_ID, COLOUR_END = 108100, 108999
SECTION = 9
FLAGS_ANY = 0x11
SIZE = 512
FOLDERS = {4: 'NightElf', 5: 'Scourge'}
SEXES = {0: 'Male', 1: 'Female'}
TORSO, LEGS = (256, 0, 256, 128), (256, 192, 256, 128)    # TorsoUpper / LegUpper on the 512 atlas: the underwear
HEAD = (0, 320, 256, 192)

# (race, sex) -> [(value, name, baked colour, plain base colour, clean colour, partner colour or None)]
# bases: the plain colour whose skin art fits best (affine RGB fit, 2026-10-31); clean colours: the next free
# colour numbers when this was written (undead F 27, night elf F 41 were the last).
ACCESSORIES = {
    (5, 1): [(1, 'Spiked harness, violet', 25, 12, 28, 26),
             (2, 'Spiked harness, crimson', 26, 12, 29, 25)],
    (4, 1): [(1, 'Moonsilver and silk', 33, 6, 42, None),
             (2, 'Moonsilver and velvet', 34, 5, 43, None)],
}


def esc(s):
    return (s or '').replace('\\', '\\\\').replace("'", "''")


class Atlas:
    def __init__(self, files, query, race, sex):
        self.files, self.query, self.race, self.sex = files, query, race, sex

    def row(self, section, kind, colour):
        r = self.query(f'SELECT id, texture_1, texture_2, flags FROM charsections WHERE race = {self.race} AND '
                       f'gender = {self.sex} AND base_section = {section} AND type = {kind} AND color_index = {colour} '
                       f'AND id NOT BETWEEN {COLOUR_ID} AND {COLOUR_END} ORDER BY id DESC LIMIT 1')
        return r[0] if r else None

    def img(self, path):
        f = self.files.find(path) if path else None
        if not f:
            raise FileNotFoundError(path)
        return read_blp(f).convert('RGBA')

    def composite(self, colour, underwear=True):
        """512 RGB: skin, the type-0 face in the head box, the underwear over the torso and upper legs."""
        skin, face, uw = self.row(0, 0, colour), self.row(1, 0, colour), self.row(4, 0, colour)
        canvas = self.img(skin['texture_1']).resize((SIZE, SIZE), Image.LANCZOS)
        canvas.alpha_composite(self.img(face['texture_2']).resize((256, 64), Image.LANCZOS), (0, 320))
        canvas.alpha_composite(self.img(face['texture_1']).resize((256, 128), Image.LANCZOS), (0, 384))
        for col, (x, y, w, h) in (('texture_2', TORSO), ('texture_1', LEGS)):
            if underwear and uw and uw[col]:
                canvas.alpha_composite(self.img(uw[col]).resize((w, h), Image.LANCZOS), (x, y))
        return np.asarray(canvas.convert('RGB')).astype(np.float32)


def cut_all(at, race, sex, specs):
    """value -> (512 RGBA layer, accessory mask, tone-matched base composite) for one race / sex."""
    bm = _load('body_markings')
    raw = {}
    for value, name, baked, base, _clean, _partner in specs:
        donor, plain = at.composite(baked), at.composite(base, underwear=False)
        layer, mask, _valid, matched = bm.cut(donor, plain, race, sex, 'body+face', (120, 80))
        raw[baked] = (value, donor, plain, mask, matched)
    out = {}
    head = np.zeros((SIZE, SIZE), bool)
    x, y, w, h = HEAD
    head[y:y + h, x:x + w] = True
    for value, name, baked, base, _clean, partner in specs:
        _v, donor, plain, mask, matched = raw[baked]
        if partner in raw:
            # body pixels the partner cut agrees on (same design, another tone): drops skin art the two bases differ in
            agree = ndimage.binary_dilation(raw[partner][3], iterations=4)
            mask = np.where(head, mask, mask & agree)
        lab, n = ndimage.label(mask)
        if n:
            sizes = ndimage.sum(mask, lab, range(1, n + 1))
            mask = np.isin(lab, 1 + np.flatnonzero(sizes >= 24))
        layer = bm.soft_layer(donor, matched, mask)
        layer = np.asarray(Image.fromarray(layer, 'RGBA').resize((SIZE, SIZE), Image.LANCZOS)).copy()
        eye = np.zeros_like(head)
        eye[y:y + h, x:x + w] = ndimage.binary_dilation(island(race, sex), iterations=3)
        layer[..., 3][~ndimage.binary_dilation(mask, iterations=2) | eye] = 0
        out[value] = (layer, mask, matched)
    return out


def inpaint(im, region, layer_alpha, matched, region_box=None):
    """im (RGBA PIL, any size) covering atlas box region_box: the accessory pixels replaced by `matched` (512 atlas)."""
    x, y, w, h = region_box
    a = np.asarray(Image.fromarray(layer_alpha[y:y + h, x:x + w]).resize(im.size, Image.LANCZOS)).astype(np.float32) / 255
    a = np.clip(ndimage.gaussian_filter(np.maximum(a, ndimage.grey_dilation(a, size=3)), 0.6) * 1.2, 0, 1)
    m = np.asarray(Image.fromarray(matched[y:y + h, x:x + w].astype(np.uint8)).resize(im.size, Image.LANCZOS)).astype(np.float32)
    src = np.asarray(im).astype(np.float32)
    rgb = src[..., :3] * (1 - a[..., None]) + m * a[..., None]
    return Image.fromarray(np.dstack([np.clip(rgb, 0, 255), src[..., 3]]).astype(np.uint8), 'RGBA')


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--preview', type=Path, help='write PNGs of each layer and each clean / baked composite here')
    ap.add_argument('--check', action='store_true', help='compare the SQL with the shipped one, write nothing')
    a = ap.parse_args()
    bm = _load('body_markings')
    icons = _load('subrace_icons')
    files = bm.resolver()
    query = _dbc_query_fn('live')

    writes, layer_sql, colour_sql, mig = [], [], [], []
    lid, cid = LAYER_ID, COLOUR_ID
    for (race, sex), specs in ACCESSORIES.items():
        folder, sx = FOLDERS[race], SEXES[sex]
        stem = f'Character\\{folder}\\{sx}\\{folder}{sx}'
        at = Atlas(files, query, race, sex)
        cuts = cut_all(at, race, sex, specs)
        for value, name, baked, base, clean, _partner in specs:
            layer, mask, matched = cuts[value]
            used = query(f'SELECT id FROM charsections WHERE race = {race} AND gender = {sex} AND color_index = {clean} '
                         f'AND base_section IN (0, 1, 4) AND id NOT BETWEEN {COLOUR_ID} AND {COLOUR_END} LIMIT 1')
            if used:
                sys.exit(f'{folder} {sx}: clean colour {clean} is taken by row {used[0]["id"]}')
            rel = f'{stem}Accessory{value:02d}.blp'
            writes.append((rel, Image.fromarray(layer, 'RGBA')))
            layer_sql.append(f"({lid}, {race}, {sex}, {SECTION}, '{esc(rel)}', '', '', {FLAGS_ANY}, {value}, 0)")
            lid += 1
            alpha = layer[..., 3]
            # the clean colour: every skin / face / underwear row of the baked colour (highest id wins, F-225)
            last = {}
            for r in query(f'SELECT id, base_section, type, flags, texture_1, texture_2 FROM charsections WHERE '
                           f'race = {race} AND gender = {sex} AND color_index = {baked} AND base_section IN (0, 1, 4) '
                           f'AND id NOT BETWEEN {COLOUR_ID} AND {COLOUR_END} ORDER BY id'):
                last[(int(r['base_section']), int(r['type']))] = r
            colour_sql.append(f'-- {folder} {sx} colour {clean}: colour {baked} without "{name}" (Accessories {value})')
            made = {}
            for (section, kind), r in sorted(last.items()):
                if section == 4:
                    continue                    # the underwear row is the base colour's, below
                t = {'texture_1': r['texture_1'] or '', 'texture_2': r['texture_2'] or ''}
                if section == 0:
                    box = (0, 0, SIZE, SIZE)
                    key = r['texture_1']
                    if key not in made:
                        made[key] = f'{stem}Skin00_za{clean:02d}.blp'
                        writes.append((made[key], inpaint(at.img(key), None, alpha, matched, box)))
                    t['texture_1'] = made[key]
                else:
                    boxes = {'texture_1': (0, 384, 256, 128), 'texture_2': (0, 320, 256, 64)}
                    for col, box in boxes.items():
                        key = r[col]
                        x, y, w, h = box
                        if not key or not (alpha[y:y + h, x:x + w] > 8).any():
                            continue            # no accessory pixel on it: the baked file as it is
                        if key not in made:
                            base_name = key.rsplit('\\', 1)[-1].rsplit('.', 1)[0]
                            made[key] = f'{stem[:stem.rfind(chr(92))]}\\{base_name}_za{clean:02d}.blp'
                            writes.append((made[key], inpaint(at.img(key), None, alpha, matched, box)))
                        t[col] = made[key]
                if cid > COLOUR_END:
                    sys.exit('clean colour id range full')
                colour_sql.append(f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, "
                                  f"texture_3, flags, type, color_index) VALUES ({cid}, {race}, {sex}, {section}, "
                                  f"'{esc(t['texture_1'])}', '{esc(t['texture_2'])}', '', {r['flags']}, {kind}, {clean});")
                cid += 1
            # underwear: the base colour's, moved to the baked colour's tone over its skin pixels
            mr = _load('markings_regroup')
            keep = ~ndimage.binary_dilation(mask, iterations=6)
            hx, hy, hw, hh = HEAD
            keep[hy:hy + hh, hx:hx + hw] = False
            coef, err = mr.fit_map(at.composite(base, underwear=False), at.composite(baked, underwear=False), keep)
            uw = at.row(4, 0, base)
            t = {}
            for col in ('texture_1', 'texture_2'):
                if uw and uw[col]:
                    im = at.img(uw[col])
                    t[col] = f'{stem}NakedPelvisSkin00_za{clean:02d}.blp' if col == 'texture_1' else f'{stem}NakedTorsoSkin00_za{clean:02d}.blp'
                    writes.append((t[col], mr.apply_map(im, coef, weight=mr.skin_weight(im, at.composite(base, underwear=False)))))
                else:
                    t[col] = ''
            colour_sql.append(f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, "
                              f"texture_3, flags, type, color_index) VALUES ({cid}, {race}, {sex}, 4, "
                              f"'{esc(t['texture_1'])}', '{esc(t['texture_2'])}', '', {last[(4, 0)]['flags']}, 0, {clean});"
                              f"  -- underwear of colour {base} (map error {err:.1f})")
            cid += 1
            mig.append((race, sex, baked, clean, value, name))
            print(f'{folder} {sx}: colour {baked} -> clean {clean} + Accessories {value} "{name}" '
                  f'({int(mask.sum())} px, {len(last)} rows)')
            if a.preview:
                a.preview.mkdir(parents=True, exist_ok=True)
                bg = np.zeros((SIZE, SIZE, 3), np.float32)
                bg[..., 1] = 255
                Image.fromarray(np.hstack([at.composite(baked), bm.over(bg, layer), matched]).astype(np.uint8)).save(
                    a.preview / f'{folder}{sx}_{value}.png')

    sql = ['-- F-230: Accessories - CharSections base_section 9 layers (type = value, colour 0) and the clean colours of',
           '-- the baked accessory skins. GENERATED by Scripts/Character Skins/accessories.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {LAYER_ID} AND {LAYER_END};',
           f'DELETE FROM charsections WHERE id BETWEEN {COLOUR_ID} AND {COLOUR_END};',
           'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, '
           'color_index) VALUES', ',\n'.join(layer_sql) + ';'] + colour_sql
    text = '\n'.join(sql) + '\n'
    if a.check:
        same = SQL.exists() and SQL.read_text() == text
        print(f'{SQL.name}: ' + ('up to date' if same else 'DIFFERS'))
        sys.exit(0 if same else 1)
    for d, upper in ((ASSETS, False), (PARSED, True)):
        for race, sex in ACCESSORIES:
            folder, sx = FOLDERS[race], SEXES[sex]
            root = d / ('CHARACTER' if upper else 'Character') / (folder.upper() if upper else folder) / (sx.upper() if upper else sx)
            pats = [f'{folder}{sx}Accessory*', f'*_za[0-9][0-9].blp']
            for pat in pats:
                for f in root.glob(pat.upper() if upper else pat):
                    f.unlink()
    for rel, im in writes:
        src = ASSETS / rel.replace('\\', '/')
        icons.write_blp_rgba(src, im)
        dst = PARSED / rel.replace('\\', '/').upper()
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes(src.read_bytes())
    SQL.write_text(text)
    m = ['-- F-230: characters on a baked accessory colour move to its clean colour + that accessory (customization 5).',
         '-- GENERATED by Scripts/Character Skins/accessories.py - do not edit, re-run the script. Idempotent: the',
         '-- customization is stored first, keyed by the baked colour, then the colour moves.']
    for race, sex, baked, clean, value, name in mig:
        m.append(f'-- {FOLDERS[race]} {SEXES[sex]} {baked} -> {clean} + Accessories {value} ({name})')
        m.append('INSERT INTO character_customizations (guid, customization, choice) '
                 f'SELECT guid, 5, {value} FROM characters WHERE race = {race} AND gender = {sex} AND skin = {baked} '
                 f'ON DUPLICATE KEY UPDATE choice = {value};')
        m.append(f'UPDATE characters SET skin = {clean} WHERE race = {race} AND gender = {sex} AND skin = {baked};')
    MIGRATION.write_text('\n'.join(m) + '\n')
    print(f'wrote {SQL.name} ({len(layer_sql)} layers, {cid - COLOUR_ID} colour rows, {len(writes)} textures), {MIGRATION.name}')


if __name__ == '__main__':
    main()
