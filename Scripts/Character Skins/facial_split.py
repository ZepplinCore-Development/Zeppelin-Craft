"""F-230: split facial features - generate Zeppelin\\CharCustomizations.txt (and the character migration).

The legacy facialStyle byte keeps indexing CharacterFacialHairStyles (NPC displays and existing characters
depend on it). On top of it a player carries up to 6 "geoset slots"; this script writes the client-only
data file that says, per race/sex, which slots exist, which geoset group each owns and what each choice
shows (grammar: F-230 implementation spec section 2.2). One table (SLOTS below) feeds both outputs:

  Zeppelin\\CharCustomizations.txt   zpaks/zep-skin-expansion/mpq/source-assets/Zeppelin/ (PATCH-L)
  migration SQL (--migration PATH)  INSERT IGNORE of the slot values that reproduce each existing
                                    character's facialStyle look (characters DB, character_customizations
                                    ids 10..15). Written only on request: it needs the server half of F-230.

Inputs, read live:
  - CharacterFacialHairStyles and CharSections base_section 2 (facial hair textures) from the DBC database
  - the geosets each shipped character model has, decoded from every LOD skin in the zpak that ships it
    (mod-worgoblin for goblin / worgen, zep-hd-curated for the rest) AFTER the F-230 relabels
    (model_transforms.json / curate_transforms.json, ops skin.geoset.relabel / skin.geoset.island_split):
    jewellery that shared a geoset id with its ear / nose now sits in 14xx / 16xx; gnome, night elf and draenei
    male facial hair is cut into beard / moustache / eyebrows / sideburns geosets.
Every geoset a choice, imply or exclude line names is checked against those skins; a miss fails the run.

  python3 "Scripts/Character Skins/facial_split.py"                       # write the data file
  python3 "Scripts/Character Skins/facial_split.py" --check               # compare, write nothing
  python3 "Scripts/Character Skins/facial_split.py" --migration out.sql   # also write the migration SQL

Slot numbers per race/sex are the storage key: never renumber a shipped slot, only add new ones. A slot taken
out goes into RETIRED (its number is never used again; the migration deletes its stored values).

A piece of jewellery is only offered on its own when its host mesh is whole without it. The orc and dwarf male
beard rings / moustache clasps are not: each ring covers a gap cut into the braid under it, so they stay part of
their beard (the 2026-10-30 "Beard Rings" slot left holes in the beards).
"""
import argparse
import struct
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

CRAFT = Path(__file__).resolve().parents[2]
ZPAKS = CRAFT / 'zpaks'
OUT = ZPAKS / 'zep-skin-expansion' / 'mpq' / 'source-assets' / 'Zeppelin' / 'CharCustomizations.txt'
RACE = ['', 'HUMAN', 'ORC', 'DWARF', 'NIGHTELF', 'SCOURGE', 'TAUREN', 'GNOME', 'TROLL', 'GOBLIN', 'BLOODELF',
        'DRAENEI', 'WORGEN']

# option type ids (spec section 1; GlueStrings ZEP_CUSTOMIZATION_TYPE_<id>)
T = dict(BEARD=1, MOUSTACHE=2, SIDEBURNS=3, CHIN=4, JAW=5, EARS=6, EARRINGS=7, NOSE=8, NOSERING=9, TUSKS=10,
         FACEFEAT=11, HEADSTRAPS=12, HAIR=13, TENDRILS=14, WHISKERS=15, HORNS=16, ORNAMENTS=17, PIERCINGS=18,
         MARKINGS=19, FACIALTEX=20, SCALPTEX=21, EYEBROWS=22, STUBBLE=23)


def C(*g):
    """Plain choices: geoset ids (0 = none)."""
    return [(x, None, None, None) for x in g]


# race_sex -> facial = (mode, baseVariation, labelType); slots = (slot, type, group, follow, choices) or, for an
# on/off link slot, (slot, type, None, follow, [(dest, src), ...]); imply = legacy (src, dst) pairs; filter = the
# texture-mode variations offered (default: first variation of each distinct facial-hair texture set);
# exclude = [(keep, [drop, ...])]: a slot-owned drop geoset never shows while keep shows (client hides it at render
# and the creator skips it); eyeglow='eyerow' = a player's eye row alone decides the eye glow (glow eye = its
# coloured glow on 1703, other eyes none: the facial row's group 17 is ignored); NPCs (CreatureDisplayInfoExtra, no
# eye choice) keep the stock glow from their facial row, so their look does not change.
# choice = (geoset, host, swapFrom, swapTo).
SLOTS = {
    '1_0': dict(facial=('texture', None, 'FACIALTEX'),
                slots=[(0, 'BEARD', 1, 1, C(0, 102)), (1, 'MOUSTACHE', 3, 3, C(0, 302)), (2, 'SIDEBURNS', 2, 2, C(0, 202))]),
    '1_1': dict(facial=('legacy', None, 'PIERCINGS'), slots=[]),
    '2_0': dict(facial=('legacy', None, 'BEARD'), slots=[]),
    '2_1': dict(facial=('legacy', None, 'EARRINGS'), slots=[]),
    # the facial textures differ only on 9 / 10 (a near copy): no row of its own beside the beard and moustache
    '3_0': dict(facial=('hidden', 0, None),
                slots=[(0, 'BEARD', 1, 1, C(0, *range(102, 113))), (1, 'MOUSTACHE', 3, 3, C(0, *range(302, 311)))]),
    '3_1': dict(facial=('hidden', 0, None),
                slots=[(0, 'EARRINGS', 3, 3, C(0, 302, 303, 304, 306)), (1, 'NOSERING', 16, 3, C(0, 1602))]),
    # group 3 is the eyebrows; 304's moustache is cut out to 1604. The painted facial hair (the old "Stubble" row)
    # is cut into pieces that travel with each choice (PIECE_OF, facial_pieces.py), so the row has no button of its
    # own (hidden 0). Appended paint-only choices (geoset 0 + a piece) keep the stock looks whose paint has no mesh
    # in the HD model: beard 5 = look 1's full painted beard, beard 6 = look 4's chin, sideburns 5 = look 5's.
    '4_0': dict(facial=('hidden', 0, None),
                slots=[(0, 'BEARD', 1, 1, C(0, 103, 106, 107, 0, 0)), (1, 'EYEBROWS', 3, 3, C(0, *range(302, 308))),
                       (2, 'SIDEBURNS', 2, 2, C(0, 204, 205, 207, 0)), (3, 'MOUSTACHE', 16, 3, C(0, 1604))],
                imply=[(304, 1604)]),
    '4_1': dict(facial=('legacy', None, 'MARKINGS'), slots=[]),
    # undead male: the jaw is the legacy facial row, never a slot. Each row is one jaw shape + the jaw skin painted
    # for it (CharSections section 2), the pairs stock 3.3.5 and retail Jaw Features agree on; a jaw slot let any
    # skin sit on any shape (teal jaw hole on an intact jaw, a bare stump on 104). filter = one row per pair.
    # exclude: pieces that float off a missing / open / closed jaw, and the 202 wrap's straps through the forehead
    # bolts and spurs (vertex-to-surface checks and renders, 2026-10-30)
    '5_0': dict(facial=('texture', None, 'JAW'), filter=[0, 1, 3, 4, 8, 9, 10, 11, 12, 13, 16],
                slots=[(1, 'FACEFEAT', 3, 3, C(0, 302, 303, 304, 305)), (2, 'HEADSTRAPS', 2, 2, C(0, 202, 204))],
                exclude=[(104, [302, 305, 204]), (101, [305]), (102, [305]), (105, [305]), (103, [204]), (106, [204]),
                         (202, [303, 304])],
                eyeglow='eyerow'),
    '5_1': dict(facial=('texture', None, 'FACIALTEX'),
                slots=[(0, 'JAW', 1, 1, C(102, 104)), (1, 'FACEFEAT', 3, 3, C(0, 302, 303, 304, 305))]),
    '6_0': dict(facial=('hidden', 0, None),
                slots=[(0, 'BEARD', 1, 1, C(0, 102, 103, 104, 105, 107)), (1, 'HAIR', 2, 2, C(0, 202, 203, 204, 206)),
                       (2, 'NOSERING', 3, 3, C(0, 302, 303, 306, 309))]),
    '6_1': dict(facial=('hidden', 0, None),
                slots=[(0, 'HAIR', 2, 2, C(0, 202, 203, 204, 205)), (1, 'EARRINGS', 3, 3, C(0, 302))]),
    # each legacy 1xx was brows + moustache + beard: cut into 1xx beard, 3xx moustache, 2xx eyebrows (103 / 108 have
    # no beard part); all follow group 1, as the bundle did
    '7_0': dict(facial=('texture', None, 'STUBBLE'),
                slots=[(0, 'BEARD', 1, 1, C(0, 102, 104, 105, 106, 107)), (1, 'MOUSTACHE', 3, 1, C(0, *range(303, 309))),
                       (2, 'EYEBROWS', 2, 1, C(0, *range(202, 207)))],
                imply=[(102, 202), (103, 203), (103, 303), (104, 204), (104, 304), (105, 205), (105, 305), (106, 206),
                       (106, 306), (107, 307), (108, 308)]),
    '7_1': dict(facial=('legacy', None, 'EARRINGS'), slots=[]),
    '8_0': dict(facial=('hidden', 0, None), slots=[(0, 'TUSKS', 3, 3, C(302, 303, 304, 305, 306))]),
    '8_1': dict(facial=('legacy', None, 'TUSKS'), slots=[]),
    '9_0': dict(facial=('hidden', 0, None),
                slots=[(0, 'CHIN', 1, 1, C(*range(102, 107))), (1, 'EARS', 2, 2, C(*range(202, 209))),
                       (2, 'EARRINGS', 14, 2, [(0, None, None, None), (1402, 203, 203, 209), (1403, 208, 208, 210),
                                               (1404, 205, 205, 211), (1405, 204, 204, 212), (1406, 202, 202, 213)]),
                       (3, 'NOSE', 3, 3, C(*range(302, 309))),
                       (4, 'NOSERING', 16, 3, [(0, None, None, None), (1602, 303, None, None), (1603, 302, None, None),
                                               (1604, 306, None, None)])],
                imply=[(209, 1402), (210, 1403), (211, 1404), (212, 1405), (213, 1406), (309, 1602), (310, 1603), (311, 1604)]),
    '9_1': dict(facial=('texture', None, 'SCALPTEX'),
                slots=[(0, 'CHIN', 1, 1, C(*range(102, 107))), (1, 'EARS', 2, 2, C(202, 203, 204, 205, 208, 209, 210)),
                       (2, 'EARRINGS', 14, 2, [(0, None, None, None)] + [(1402 + i, h, None, None) for i, h in
                                                                         enumerate([205, 205, 205, 208, 209, 210, 209, 205, 209])]),
                       (3, 'NOSE', 3, 3, C(*range(302, 307))),
                       (4, 'NOSERING', 16, 3, [(0, None, None, None)] + [(1602 + i, h, None, None) for i, h in
                                                                         enumerate([302, 303, 304, 304, 304])])],
                imply=[(205 + i, 1402 + i) for i in range(9)] + [(307 + i, 1602 + i) for i in range(5)]),
    '10_0': dict(facial=('legacy', None, 'BEARD'), slots=[]),
    '10_1': dict(facial=('legacy', None, 'EARRINGS'), slots=[]),
    # the 2xx whiskers were sideburns + moustache + goatee: moustache cut out to 3xx, goatee to 16xx
    '11_0': dict(facial=('texture', None, 'STUBBLE'),
                 slots=[(0, 'TENDRILS', 1, 1, C(0, *range(102, 109))), (1, 'SIDEBURNS', 2, 2, C(0, *range(202, 207))),
                        (2, 'MOUSTACHE', 3, 2, C(0, 304, 306)), (3, 'BEARD', 16, 2, C(0, 1605, 1606))],
                 imply=[(204, 304), (205, 1605), (206, 306), (206, 1606)]),
    '11_1': dict(facial=('legacy', None, 'HORNS'), slots=[]),
    '12_0': dict(facial=('hidden', 1, None),
                 slots=[(0, 'BEARD', 1, 1, C(0, 102, 103, 104, 105, 107, 108, 110, 111, 113, 114, 115)),
                        (1, 'EARS', 2, 2, C(*range(202, 214)))]),
    '12_1': dict(facial=('legacy', None, 'EARS'), slots=[]),
}

# race_sex -> slot -> the facial_pieces.py piece painted under each choice (None = no paint), aligned with the
# slot's choices. Written as `tex=<piece>`; the client then draws the pieces of a player's set slots instead of the
# legacy facial-hair texture (CharSections base_section 10, keyed by hair colour).
PIECE_OF = {
    '4_0': {0: [None, 1, 2, 3, 4, 3], 1: [None, 8, 9, 10, 11, 12, 13], 2: [None, 5, 6, 7, 7], 3: [None, 14]},
}

# migration: a legacy variation whose paint has no mesh in that slot takes a paint-only choice (choice index)
MIG_PAINT = {'4_0': {1: {0: 4}, 4: {0: 5}, 5: {2: 4}}}

# slots taken out of a race/sex: never reused; the migration deletes their stored values (character_customizations
# 10 + slot). Orc / dwarf male "Beard Rings" link slots: the rings close gaps in their beards (see the doc).
# Undead male jaw slot: the jaw is the legacy facial row (jaw + its own skin).
RETIRED = {'2_0': [0], '3_0': [2], '5_0': [0]}

# migration: a legacy geoset the slot offers under another id (same mesh). Goblin pierced ears / noses map to
# their host shape (the jewellery comes back through the earring / nose-ring slot); tauren 307 = 303.
ALIAS = {
    '9_0': {209: 203, 210: 208, 211: 205, 212: 204, 213: 202, 309: 303, 310: 302, 311: 306},
    '9_1': {206: 205, 207: 205, 212: 205, 211: 209, 213: 209, 307: 302, 308: 303, 309: 304, 310: 304, 311: 304},
    '6_0': {307: 303},
}

# the three stock CharacterFacialHairStyles rows F-230 edits (zep-skin-expansion/dbc/[F-230]_facial_split.sql):
# geoset columns as they must read after the edit. Applied here too, so a run before the DBC edit gives the same
# file; a live row matching neither is reported.
DBC_EDITED = {(5, 0, 10): ((0, 0, 3, 0, 0), (5, 0, 0, 0, 0)),
              (5, 0, 11): ((0, 0, 5, 0, 0), (6, 0, 0, 0, 0)),
              (3, 1, 4): ((0, 5, 0, 0, 0), (0, 0, 0, 2, 0))}


def dbc_query(sql: str):
    r = subprocess.run([sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', sql], cwd=CRAFT,
                       capture_output=True, text=True)
    if r.returncode:
        sys.exit(f'dbc query failed: {r.stderr or r.stdout}')
    rows = []
    for line in r.stdout.splitlines():
        p = line.split('\t')
        if p and p[0].strip().isdigit():
            rows.append(p)
    return rows


def model_files(race: int, sex: int):
    r, s = RACE[race], ['MALE', 'FEMALE'][sex]
    zp = 'mod-worgoblin' if race in (9, 12) else 'zep-hd-curated'
    base = ZPAKS / zp / 'mpq' / 'parsed-assets' / 'CHARACTER' / r / s / f'{r}{s}'
    return [Path(f'{base}0{i}.SKIN') for i in range(4)]


def skin_geosets(path: Path) -> set:
    b = path.read_bytes()
    n, o = struct.unpack_from('<II', b, 0x1C)
    return {struct.unpack_from('<H', b, o + 48 * k)[0] for k in range(n)}


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--check', action='store_true', help='compare with the shipped data file, write nothing')
    ap.add_argument('--migration', metavar='PATH', help='also write the characters-DB migration SQL here')
    ap.add_argument('--out', metavar='PATH', type=Path, default=OUT, help=f'data file (default: {OUT})')
    a = ap.parse_args()

    # geosets per race/sex: present in EVERY LOD skin (a choice must render at any distance)
    have, problems = {}, []
    for k in SLOTS:
        race, sex = map(int, k.split('_'))
        sets = [skin_geosets(f) for f in model_files(race, sex) if f.exists()]
        if not sets:
            sys.exit(f'{k}: no skins at {model_files(race, sex)[0].parent}')
        have[k] = set.intersection(*sets)

    rows = defaultdict(dict)
    for p in dbc_query('SELECT race, gender, variation_id, geoset_1, geoset_2, geoset_3, geoset_4, geoset_5 '
                       'FROM characterfacialhairstyles WHERE race BETWEEN 1 AND 12'):
        v = list(map(int, p[:8]))
        rows[f'{v[0]}_{v[1]}'][v[2]] = v[3:]
    for (race, sex, var), (before, after) in DBC_EDITED.items():
        cur = tuple(rows[f'{race}_{sex}'].get(var, ()))
        if cur == before:
            print(f'note: CharacterFacialHairStyles {race}/{sex}/{var} not edited yet in the DBC DB '
                  f'(apply zpaks/zep-skin-expansion/dbc/[F-230]_facial_split.sql)')
        elif cur != after:
            problems.append(f'CharacterFacialHairStyles {race}/{sex}/{var} = {cur}, expected {after}')
        rows[f'{race}_{sex}'][var] = list(after)

    pieces = defaultdict(set)
    for p in dbc_query('SELECT race, gender, type FROM charsections WHERE base_section = 10 AND race BETWEEN 1 AND 12'):
        pieces[f'{p[0]}_{p[1]}'].add(int(p[2]))

    tex = defaultdict(lambda: defaultdict(set))
    for p in dbc_query('SELECT race, gender, type, texture_1, texture_2, texture_3 FROM charsections '
                       'WHERE base_section = 2 AND race BETWEEN 1 AND 12'):
        p = (p + ['', '', ''])[:6]
        tex[f'{p[0]}_{p[1]}'][int(p[2])].add(tuple(x.strip() for x in p[3:6]))

    def texfilter(k):
        """first legacy variation of each distinct facial-hair texture set"""
        seen, out = set(), []
        for v in sorted(rows[k]):
            t = frozenset(tex[k].get(v, set()))
            if t not in seen:
                seen.add(t)
                out.append(v)
        return out

    out = ['# Zeppelin\\CharCustomizations.txt - F-230 split facial features. GENERATED, do not hand-edit.', 'version 1']
    mig = []
    for k, spec in SLOTS.items():
        r, s = k.split('_')
        mode, arg, lab = spec['facial']
        if mode == 'texture':
            flt = spec.get('filter') or texfilter(k)
            for v in spec.get('filter', []):
                if v not in rows[k]:
                    problems.append(f'{k} filter: no CharacterFacialHairStyles variation {v}')
                elif not tex[k].get(v):
                    problems.append(f'{k} filter: variation {v} has no CharSections section 2 rows')
            out.append(f'facial {r} {s} texture {T[lab]} ' + ','.join(map(str, flt)))
        elif mode == 'hidden':
            out.append(f'facial {r} {s} hidden {arg}')
        else:
            out.append(f'facial {r} {s} legacy {T[lab]}')
        for sl in spec['slots']:
            if sl[2] is None:
                out.append(f'link {r} {s} {sl[0]} {T[sl[1]]} {sl[3]} ' + ','.join(f'{d}:{src}' for d, src in sl[4]))
                continue
            if len(sl[4]) > 15:
                problems.append(f'{k} slot {sl[0]}: {len(sl[4])} choices (max 15)')
            out.append(f'slot {r} {s} {sl[0]} {T[sl[1]]} {sl[2]} {sl[3]}')
            pof = PIECE_OF.get(k, {}).get(sl[0])
            if pof is not None and len(pof) != len(sl[4]):
                problems.append(f'{k} slot {sl[0]}: PIECE_OF has {len(pof)} entries for {len(sl[4])} choices')
            for ci, (g, h, sf, st) in enumerate(sl[4]):
                if g and g not in have[k]:
                    problems.append(f'{k} slot {sl[0]}: geoset {g} not in every LOD skin')
                for x in (h, sf, st):
                    if x and x not in have[k]:
                        problems.append(f'{k} slot {sl[0]} choice {g}: host/swap geoset {x} not in the model')
                line = f'choice {r} {s} {sl[0]} {g}'
                if h:
                    line += f' host={h}'
                if sf:
                    line += f' swap={sf}:{st}'
                piece = pof[ci] if pof and ci < len(pof) else None
                if piece is not None:
                    if piece not in pieces[k]:
                        problems.append(f'{k} slot {sl[0]} choice {ci}: piece {piece} has no CharSections section 10 rows '
                                        '(run facial_pieces.py and apply its SQL)')
                    line += f' tex={piece}'
                out.append(line)
        legacy = {100 * g + v for row in rows[k].values() for g, v in zip((1, 3, 2, 16), row) if v}
        for src, dst in spec.get('imply', []):
            if dst not in have[k]:
                problems.append(f'{k} imply {src} {dst}: geoset {dst} not in every LOD skin')
            if src not in have[k] and src not in legacy:
                problems.append(f'{k} imply {src} {dst}: geoset {src} neither in the model nor on a legacy row')
            out.append(f'imply {r} {s} {src} {dst}')
        owned = {sl[2] for sl in spec['slots'] if sl[2] is not None}
        for keep, drops in spec.get('exclude', []):
            if keep not in have[k] and keep not in legacy:
                problems.append(f'{k} exclude {keep}: geoset neither in the model nor on a legacy row')
            for d in drops:
                if d not in have[k]:
                    problems.append(f'{k} exclude {keep} {d}: geoset {d} not in every LOD skin')
                if d // 100 not in owned:
                    problems.append(f'{k} exclude {keep} {d}: group {d // 100} has no slot (only slot groups drop)')
            out.append(f'exclude {r} {s} {keep} ' + ','.join(map(str, drops)))
        if spec.get('eyeglow'):
            out.append(f'eyeglow {r} {s} {spec["eyeglow"]}')

        # migration: slot values reproducing each legacy variation's look
        if not spec['slots']:
            continue
        for v, row in sorted(rows[k].items()):
            vis = {1: 100 + row[0] if row[0] else None, 3: 300 + row[1] if row[1] else None,
                   2: 200 + row[2] if row[2] else None, 16: 1600 + row[3] if row[3] else None}
            implied = {b for a_, b in spec.get('imply', []) if a_ in vis.values()}
            for g in list(vis):
                if vis[g] is not None and vis[g] not in have[k]:
                    vis[g] = None                     # a legacy reference to a geoset the model lacks = none
            vals = []
            for sl in spec['slots']:
                if sl[2] is None:
                    on = any(1400 <= b < 1500 or 1600 <= b < 1700 for b in implied)
                    vals.append((sl[0], 2 if on else 1))
                    continue
                grp = sl[2]
                # an implied piece is what the legacy look showed in that group (the split moved it there)
                cur = next((b for b in implied if b // 100 == grp), None)
                if cur is None:
                    cur = vis.get(grp) or 0
                    cur = ALIAS.get(k, {}).get(cur, cur)
                geos = [c[0] for c in sl[4]]
                paint = MIG_PAINT.get(k, {}).get(v, {}).get(sl[0])
                if paint is not None:
                    vals.append((sl[0], paint + 1))
                    continue
                if cur not in geos:
                    problems.append(f'{k} variation {v} slot {sl[0]}: legacy geoset {cur} is no choice')
                    continue
                vals.append((sl[0], geos.index(cur) + 1))
            mig.append((int(r), int(s), v, vals))

    for k, gone in RETIRED.items():
        for sl in SLOTS.get(k, {}).get('slots', []):
            if sl[0] in gone:
                problems.append(f'{k} slot {sl[0]} is retired: give the new slot another number')
    if problems:
        print('\n'.join('PROBLEM: ' + p for p in problems))
        sys.exit(1)
    text = '\n'.join(out) + '\n'
    if a.check:
        same = a.out.exists() and a.out.read_text() == text
        print(f'{a.out}: ' + ('up to date' if same else 'DIFFERS'))
        sys.exit(0 if same else 1)
    a.out.parent.mkdir(parents=True, exist_ok=True)
    a.out.write_text(text)
    print(f'wrote {a.out} ({len(out)} lines)')

    if a.migration:
        vals = [f'({r},{s},{v},{sl},{val})' for r, s, v, vv in mig for sl, val in vv]
        chunks = [', '.join(vals[i:i + 8]) for i in range(0, len(vals), 8)]
        sql = ['-- F-230: existing characters get the geoset-slot values that reproduce their current facialStyle look.',
               '-- GENERATED by Scripts/Character Skins/facial_split.py - do not edit, re-run the script.',
               'DROP TEMPORARY TABLE IF EXISTS zep_facial_split;',
               'CREATE TEMPORARY TABLE zep_facial_split (race TINYINT UNSIGNED, gender TINYINT UNSIGNED, facial TINYINT UNSIGNED,',
               '  slot TINYINT UNSIGNED, val TINYINT UNSIGNED, PRIMARY KEY (race, gender, facial, slot));',
               'INSERT INTO zep_facial_split (race, gender, facial, slot, val) VALUES',
               ',\n'.join(chunks) + ';',
               'INSERT IGNORE INTO character_customizations (guid, customization, choice)',
               'SELECT c.guid, 10 + m.slot, m.val',
               'FROM characters AS c',
               'JOIN zep_facial_split AS m ON m.race = c.race AND m.gender = c.gender AND m.facial = c.facialStyle;',
               'DROP TEMPORARY TABLE zep_facial_split;']
        if RETIRED:
            sql.append('-- retired slots (facial_split.RETIRED, numbers never reused): their stored values go')
        for k, gone in sorted(RETIRED.items()):
            r, s = k.split('_')
            sql.append('DELETE cc FROM character_customizations AS cc JOIN characters AS c ON c.guid = cc.guid '
                       f'WHERE c.race = {r} AND c.gender = {s} AND cc.customization IN '
                       f'({", ".join(str(10 + x) for x in gone)});')
        Path(a.migration).write_text('\n'.join(sql) + '\n')
        print(f'wrote {a.migration} ({len(vals)} rows)')


if __name__ == '__main__':
    main()
