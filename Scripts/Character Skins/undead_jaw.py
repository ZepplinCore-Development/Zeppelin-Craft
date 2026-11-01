"""F-230 / I-433: undead jaw shape x jaw skin, studs & spikes, eye sockets - model relabel, jaw-skin pieces,
character migration and proof renders. facial_split.py ('5_0' / '5_1') writes the CharCustomizations.txt rules.

The undead "facial hair" textures (CharSections base_section 2) are jaw skins: each stock row pairs one jaw mesh with
the skin painted for it. The creator offers the jaw shape and the jaw skin as two rows; a skin is a slot choice that
carries its paint as a piece (base_section 10, keyed by hair colour, the whole stock texture) and, where stock pairs
it with its own variant of the shape, swaps the jaw mesh (bone jaw 101, teeth 105 / 106).

  python3 "Scripts/Character Skins/undead_jaw.py" relabel     # male studs 302/305/204 -> 1602/1605/1604 (curate_transforms
                                                              # recipe + the four zep-hd-curated parsed-assets skins)
  python3 "Scripts/Character Skins/undead_jaw.py" pieces      # zep-skin-expansion/dbc/[F-230]_charsections_undead_jaw_pieces.sql
  python3 "Scripts/Character Skins/undead_jaw.py" migration   # sql_characters/zz_[F-230]_undead_jaw_migration.sql
  python3 "Scripts/Character Skins/undead_jaw.py" proof       # sheets in Scripts/Character Skins/work/undead/

Piece numbers and slot choice orders are storage keys: append, never renumber (facial_split.PIECE_OF names them).
"""
import hashlib
import json
import os
import subprocess
import sys
from pathlib import Path

CRAFT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(CRAFT / 'cli'), str(CRAFT)]

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
PIECES_SQL = ZPAK / 'dbc' / '[F-230]_charsections_undead_jaw_pieces.sql'
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-230]_undead_jaw_migration.sql'
ID_BASE, ID_END = 113000, 113499          # this script's CharSections ids
SECTION_PIECE = 10
WORK = HERE / 'work' / 'undead'

# piece -> the legacy facial-hair variation whose section-2 textures it is (per hair colour, highest id wins)
PIECES = {
    (5, 0): {1: 1,      # FacialLowerHair00 - leather jaw plate (Rot-Kissed)
             2: 12,     # 05 - bone bits (Cheeky)
             3: 8,      # 03 - dark bone jaw (Bonejawed)
             4: 10,     # 04 - exposed teeth (Toothy)
             5: 4,      # 07_00 - teal jaw hole (Drooler)
             6: 16},    # 07_03 - purple jaw hole (Slobber)
    (5, 1): {1: 1,      # FacialFemaleLowerHair00 - stitched plate (Stitched)
             2: 4,      # 03 - bone jaw (Bonejawed)
             3: 5,      # 04 - teeth (Toothy)
             4: 6},     # 05_xx - cheek rot, hair coloured (Cheeky)
}

# male slot layout (facial_split '5_0'): 1 jaw [102, 103, 104], 2 skin [none, rot-kissed, cheeky, bone, teeth (closed),
# teeth (slack), drooler, slobber], 3 face features [0, 303, 304], 4 head wrap [0, 202], 5 studs [0, 1602, 1605, 1604]
# legacy facial variation -> (jaw choice, skin choice) - also facial_split.MIG_PAINT
LEGACY_M = {0: (0, 0), 1: (0, 1), 2: (0, 0), 3: (1, 0), 4: (2, 6), 5: (0, 0), 6: (1, 0), 7: (2, 6), 8: (0, 3), 9: (1, 3),
            10: (0, 4), 11: (1, 5), 12: (0, 2), 13: (1, 2), 14: (0, 0), 15: (1, 0), 16: (2, 7)}
LEGACY_F = {0: 0, 1: 1, 2: 0, 3: 0, 4: 2, 5: 3, 6: 4, 7: 0}       # legacy variation -> skin choice (female slot 2)
# the 2026-10-30 male slots (c = character_customizations id): 10 jaw [101..106], 11 face features [0, 302, 303, 304,
# 305], 12 head wraps [0, 202, 204] -> geoset of each stored value
OLD_M = {10: [101, 102, 103, 104, 105, 106], 11: [0, 302, 303, 304, 305], 12: [0, 202, 204]}


def dbc(sql):
    from commands.wardrobe import _dbc_query_fn
    return [{k: ('' if v is None else str(v)) for k, v in r.items()} for r in _dbc_query_fn('live')(sql)]


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "''")


# ---------------------------------------------------------------------------------------------------------- relabel
RELABEL = [{'from': 302, 'to': 1602}, {'from': 305, 'to': 1605}, {'from': 204, 'to': 1604}]
PACK = Path('/workspace/project/Zeppelin-Tools/Asset Library/COMMUNITY/patch-hd-creatures-mounts/mpq/source-assets/'
            'Character/Scourge/Male')
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets' / 'CHARACTER' / 'SCOURGE' / 'MALE'
TRANSFORMS = CRAFT / 'zpaks' / 'zep-hd-curated' / 'curate_transforms.json'


def relabel():
    from lib import skin_ops
    data = json.loads(TRANSFORMS.read_text())
    model = (CURATED / 'SCOURGEMALE.M2').read_bytes()
    for i in range(4):
        key = f'character/scourge/male/scourgemale0{i}.skin'
        r = data[key]
        src = next(PACK.glob(f'ScourgeMale0{i}.skin')).read_bytes()
        if hashlib.sha256(src).hexdigest() != r['base_sha256']:
            sys.exit(f'{key}: the pack file is not the recipe base')
        op = r['ops'][0]
        assert op['op'] == 'skin.geoset.relabel'
        have = {(e['from'], e['to']) for e in op['relabel']}
        for e in RELABEL:
            if (e['from'], e['to']) not in have:
                op['relabel'].append(dict(e))
        out, log = skin_ops.apply_ops_bytes(src, model, r['ops'])
        r['result_sha256'] = hashlib.sha256(out).hexdigest()
        r['note'] = ('F-230: undead male jaw pieces 203 / 205 (group 2) relabelled into the jaw group as 105 / 106; '
                     'CharacterFacialHairStyles 5/0/10 and 5/0/11 now name geoset_1 = 5 / 6. I-433: the studs and '
                     'spikes 302 / 305 (group 3) and 204 (group 2) are one group, 1602 / 1605 / 1604; rows 5/0/5, 8, 9 '
                     'name them in geoset_4.')
        (CURATED / f'SCOURGEMALE0{i}.SKIN').write_bytes(out)
        print(key, log)
    TRANSFORMS.write_text(json.dumps(data, indent=1) + '\n')


# ----------------------------------------------------------------------------------------------------------- pieces
def pieces():
    rows, rid = [], ID_BASE
    for (race, sex), table in PIECES.items():
        src = {}
        for r in dbc(f'SELECT id, type, color_index, texture_1, texture_2, flags FROM charsections WHERE race = {race} '
                     f'AND gender = {sex} AND base_section = 2 ORDER BY id'):
            src[(int(r['type']), int(r['color_index']))] = r             # highest id wins, as in the client
        colours = sorted({int(r['color_index']) for r in dbc(f'SELECT color_index FROM charsections WHERE race = {race} '
                                                              f'AND gender = {sex} AND base_section = 3')})
        for piece, var in table.items():
            for c in colours:
                r = src.get((var, c))
                if not r or not (r['texture_1'] or r['texture_2']):
                    # a hair colour the row has no paint for (mod 907's colour 10): the jaw skin is not hair coloured
                    # (but the female cheek rot, which has every colour), so colour 0's paint
                    print(f'{race}/{sex} piece {piece}: hair colour {c} has no paint (variation {var}), colour 0 used')
                    r = src[(var, 0)]
                rows.append(f"({rid}, {race}, {sex}, {SECTION_PIECE}, '{esc(r['texture_1'])}', '{esc(r['texture_2'])}', "
                            f"'', {r['flags']}, {piece}, {c})")
                rid += 1
    if rid > ID_END:
        sys.exit('id range full')
    PIECES_SQL.write_text('\n'.join([
        '-- F-230 / I-433: undead jaw skins as facial pieces (CharSections base_section 10, type = piece, colour = hair',
        '-- colour): the whole stock facial-hair texture of the legacy row that paired the skin with its jaw.',
        '-- GENERATED by Scripts/Character Skins/undead_jaw.py pieces - do not edit, re-run the script.',
        f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
        'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, '
        'color_index) VALUES',
        ',\n'.join(rows) + ';']) + '\n')
    print(f'wrote {PIECES_SQL} ({len(rows)} rows)')


# -------------------------------------------------------------------------------------------------------- migration
def eye_values(sex):
    """(sockets eye value, the eye whose glow is nearest the stock yellow glow) from the live eye rows."""
    import numpy as np
    from lib.wardrobe.blp import read_blp
    import importlib.util
    spec = importlib.util.spec_from_file_location('skin_preview', HERE / 'skin_preview.py')
    sp = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(sp)
    files = sp.files_resolver()
    rows = dbc(f'SELECT type, texture_3 FROM charsections WHERE race = 5 AND gender = {sex} AND base_section = 5')
    sockets = [int(r['type']) for r in rows if not r['texture_3']]
    folder = ['Male', 'Female'][sex]

    def mean(path):
        a = np.asarray(read_blp(files.find(path)).convert('RGBA')).astype(float)
        w = a[..., 3:4] / 255
        return (a[..., :3] * w).sum((0, 1)) / max(w.sum(), 1)
    stock = mean(f'Character\\Scourge\\{folder}\\NightElfMaleEyeGlow.blp')
    glow = {int(r['type']): mean(r['texture_3']) for r in rows if r['texture_3']}
    yellow = min(glow, key=lambda t: np.linalg.norm(glow[t] / max(glow[t].max(), 1) - stock / max(stock.max(), 1)))
    return (sockets[0] if sockets else None), yellow


def migration():
    cutoff = int(subprocess.run([sys.executable, '-m', 'cli.zep', 'world', 'sql', 'query', 'SELECT MAX(guid) FROM characters',
                                 '-d', 'characters'], cwd=CRAFT, capture_output=True, text=True).stdout.split()[-1])
    rows = {}
    for r in dbc('SELECT gender, variation_id, geoset_1, geoset_2, geoset_3, geoset_4, geoset_5 FROM '
                 'characterfacialhairstyles WHERE race = 5'):
        rows[(int(r['gender']), int(r['variation_id']))] = [int(r[f'geoset_{i}']) for i in range(1, 6)]
    m_sock, m_yellow = eye_values(0)
    f_sock, f_yellow = eye_values(1)
    # males: one (facialStyle, old 11, old 12) -> new slots row per combination
    vals = []
    for (sex, v), row in sorted(rows.items()):
        if sex:
            continue
        jaw, skin = LEGACY_M[v]
        for o11 in range(0, 6):                   # 0 = no stored value: the legacy row's group 3 / 2
            for o12 in range(0, 4):
                g3 = OLD_M[11][o11 - 1] if o11 else (300 + row[1] if row[1] else 0)
                g2 = OLD_M[12][o12 - 1] if o12 else (200 + row[2] if row[2] else 0)
                ff = {303: 2, 304: 3}.get(g3, 1)
                wrap = 2 if g2 == 202 else 1
                stud = {302: 2, 305: 3}.get(g3) or (4 if g2 == 204 else 1)
                shape = [102, 103, 104][jaw]
                # what the 2026-10-30 rules hid stays hidden; 302 on a slack jaw goes too (user report)
                if wrap == 2 and ff > 1:
                    ff = 1
                if stud == 2 and shape != 102 or stud == 3 and shape != 103 or stud == 4 and shape != 102:
                    stud = 1
                vals.append(f'({v},{o11},{o12},{jaw + 1},{skin + 1},{ff},{wrap},{stud})')
    sql = [
        '-- F-230 / I-433: undead jaw shape + jaw skin + studs (male slots 1-5, female slot 2) and eye glow by eye row.',
        '-- GENERATED by Scripts/Character Skins/undead_jaw.py migration - do not edit, re-run the script.',
        f'-- Once per character (zep_f230_undead_jaw_done), characters that existed when generated (guid <= {cutoff}).',
        '-- Male: the legacy facial row (jaw + its skin) and the 2026-10-30 slots (10 jaw, 11 face features, 12 head wraps)',
        '-- become 11 jaw, 12 jaw skin, 13 face features, 14 head wrap, 15 studs & spikes; 10 goes.',
        '-- Female: 12 = the jaw skin of the legacy row (teeth only on the lip-slit jaw 104, the rest only on 102).',
        "-- Female eyes: the glow followed the legacy row (1702 yellow, or none). A no-glow row's character gets the",
        f'-- Sockets eye ({f_sock}); a glowing one the eye whose glow is nearest that yellow ({f_yellow}).',
        'CREATE TABLE IF NOT EXISTS zep_f230_undead_jaw_done (guid INT UNSIGNED NOT NULL PRIMARY KEY)',
        "  ENGINE=InnoDB COMMENT='F-230 / I-433 undead jaw migration: characters already migrated';",
        'DROP TABLE IF EXISTS zep_tmp_undead_m, zep_tmp_undead_todo;',
        'CREATE TABLE zep_tmp_undead_m (facial TINYINT UNSIGNED, o11 TINYINT UNSIGNED, o12 TINYINT UNSIGNED,',
        '  jaw TINYINT UNSIGNED, skin TINYINT UNSIGNED, ff TINYINT UNSIGNED, wrap TINYINT UNSIGNED, stud TINYINT UNSIGNED,',
        '  PRIMARY KEY (facial, o11, o12));',
        'INSERT INTO zep_tmp_undead_m VALUES',
        ',\n'.join(vals) + ';',
        'CREATE TABLE zep_tmp_undead_todo (guid INT UNSIGNED PRIMARY KEY, gender TINYINT UNSIGNED, facial TINYINT UNSIGNED,',
        '  o10 TINYINT UNSIGNED, o11 TINYINT UNSIGNED, o12 TINYINT UNSIGNED, glow TINYINT UNSIGNED);',
        'INSERT INTO zep_tmp_undead_todo',
        'SELECT c.guid, c.gender, c.facialStyle,',
        '  (SELECT choice FROM character_customizations WHERE guid = c.guid AND customization = 10),',
        '  COALESCE((SELECT choice FROM character_customizations WHERE guid = c.guid AND customization = 11), 0),',
        '  COALESCE((SELECT choice FROM character_customizations WHERE guid = c.guid AND customization = 12), 0),',
        '  CASE ' + ' '.join(f'WHEN c.gender = {s} AND c.facialStyle = {v} THEN {1 if row[4] else 0}'
                             for (s, v), row in sorted(rows.items())) + ' ELSE 1 END',
        f'FROM characters AS c WHERE c.race = 5 AND c.guid <= {cutoff}',
        '  AND c.guid NOT IN (SELECT guid FROM zep_f230_undead_jaw_done);',
        '-- male slots',
        'DELETE cc FROM character_customizations AS cc JOIN zep_tmp_undead_todo AS t ON t.guid = cc.guid',
        '  WHERE t.gender = 0 AND cc.customization BETWEEN 10 AND 15;',
        'INSERT INTO character_customizations (guid, customization, choice)',
        'SELECT t.guid, x.n, CASE x.n WHEN 11 THEN m.jaw WHEN 12 THEN m.skin WHEN 13 THEN m.ff WHEN 14 THEN m.wrap ELSE m.stud END',
        'FROM zep_tmp_undead_todo AS t JOIN zep_tmp_undead_m AS m ON m.facial = t.facial AND m.o11 = t.o11 AND m.o12 = t.o12',
        'JOIN (SELECT 11 AS n UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15) AS x',
        'WHERE t.gender = 0;',
        '-- female jaw skin: the legacy row\'s, unless it is not one for the stored jaw (10: 1 = 102, 2 = 104)',
        'REPLACE INTO character_customizations (guid, customization, choice)',
        'SELECT t.guid, 12, CASE',
        '  WHEN COALESCE(t.o10, 1) = 2 THEN 4',
        '  ' + ' '.join(f'WHEN t.facial = {v} THEN {sk + 1 if sk != 3 else 1}' for v, sk in sorted(LEGACY_F.items())),
        '  ELSE 1 END',
        'FROM zep_tmp_undead_todo AS t WHERE t.gender = 1;',
        '-- eyes (female; a male\'s glow has followed his eye row since client 0056)',
        'REPLACE INTO character_customizations (guid, customization, choice)',
        f'SELECT t.guid, 1, IF(t.glow = 0, {f_sock}, {f_yellow})',
        'FROM zep_tmp_undead_todo AS t WHERE t.gender = 1;',
        'INSERT IGNORE INTO zep_f230_undead_jaw_done (guid) SELECT guid FROM zep_tmp_undead_todo;',
        'DROP TABLE zep_tmp_undead_m, zep_tmp_undead_todo;',
    ]
    MIGRATION.write_text('\n'.join(sql) + '\n')
    print(f'wrote {MIGRATION} ({len(vals)} male combinations, cutoff guid {cutoff})')


# ------------------------------------------------------------------------------------------------------------ proof
def proof():
    """Every jaw shape x skin x studs / features the rules offer, as the client resolves them (swap, exclude)."""
    WORK.mkdir(parents=True, exist_ok=True)
    rules = (ZPAK / 'mpq' / 'source-assets' / 'Zeppelin' / 'CharCustomizations.txt').read_text().split('\n')
    for sex in (0, 1):
        os.environ.update(ZR='5', ZS=str(sex))
        sys.modules.pop('facial_render', None)
        sys.path.insert(0, str(HERE))
        import facial_render as r
        import numpy as np
        t = [l.split() for l in rules if l.split()[1:3] == ['5', str(sex)]]
        slots = {int(l[3]): (int(l[4]), int(l[5])) for l in t if l[0] == 'slot'}
        choices = {}
        for l in t:
            if l[0] == 'choice':
                kv = dict(x.split('=') for x in l[5:])
                sw = tuple(map(int, kv['swap'].split(':'))) if 'swap' in kv else None
                choices.setdefault(int(l[3]), []).append((int(l[4]), sw, int(kv['tex']) if 'tex' in kv else None))
        ex = [(int(l[3]), [int(x) for x in l[4].split(',')]) for l in t if l[0] == 'exclude']
        group_slot = {g: s for s, (ty, g) in slots.items()}
        r.set_hair(0, 1)

        def resolve(pick):
            geo = {}
            for s, ci in pick.items():
                g = choices[s][ci][0]
                geo[slots[s][1]] = g or slots[s][1] * 100
            for s, ci in pick.items():
                sw = choices[s][ci][1]
                if sw:
                    geo = {k: (sw[1] if v == sw[0] else v) for k, v in geo.items()}
            ok = True
            for keep, drops in ex:
                if keep in geo.values():
                    for d in drops:
                        if geo.get(d // 100) == d:
                            ok = False
            return geo, ok

        skin_slot = next(s for s, (ty, g) in slots.items() if g == 14)
        jaw_slot = next(s for s, (ty, g) in slots.items() if g == 1)
        tiles, bad = [], []
        for ji in range(len(choices[jaw_slot])):
            for si, (sg, sw, piece) in enumerate(choices[skin_slot]):
                geo, ok = resolve({jaw_slot: ji, skin_slot: si})
                if not ok:
                    continue
                # paint = the piece's texture (hair colour 0)
                var = PIECES[(5, sex)].get(piece) if piece else None
                body, extra = r.body_texture(0, 0, var)
                others = [s for s in slots if s not in (jaw_slot, skin_slot)]
                tiles.append(r.label(r.render({geo[1], 1702}, body, extra, 25, size=150,
                                              box=(0.02, 1.86 if not sex else 1.74, 0.12 if not sex else 0.09)),
                                     f'jaw{choices[jaw_slot][ji][0]} skin{si}->{geo[1]}'))
                for s in others:
                    for ci, (g, _, _) in enumerate(choices[s]):
                        if not g:
                            continue
                        geo2, ok2 = resolve({jaw_slot: ji, skin_slot: si, s: ci})
                        if ok2:
                            tiles.append(r.label(r.render({geo2[1], g, 1702}, body, extra, 25, size=150,
                                                          box=(0.02, 1.86 if not sex else 1.74, 0.12 if not sex else 0.09)),
                                                 f'jaw{geo2[1]} sk{si} +{g}'))
                        else:
                            bad.append((geo[1], si, g))
        out = WORK / f'proof_{"male" if not sex else "female"}_offered.png'
        r.sheet(tiles, 10, str(out))
        print(f'{"male" if not sex else "female"}: {len(tiles)} offered looks; hidden by exclude: {sorted(set(bad))}')
        sys.modules.pop('facial_render', None)


if __name__ == '__main__':
    {'relabel': relabel, 'pieces': pieces, 'migration': migration, 'proof': proof}[sys.argv[1]]()
