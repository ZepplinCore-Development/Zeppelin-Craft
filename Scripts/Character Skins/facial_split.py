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
import json
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
         MARKINGS=19, FACIALTEX=20, SCALPTEX=21, EYEBROWS=22, STUBBLE=23, JAWSKIN=24, STUDS=25)


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
    # in the HD model. One choice per mesh, every choice a mesh (user 2026-10-31): look 1 (full painted beard, no
    # mesh) migrates to beard 103; look 4's chin paint is 107's own, look 5's long sideburns 207's.
    '4_0': dict(facial=('hidden', 0, None),
                slots=[(0, 'BEARD', 1, 1, C(0, 103, 106, 107)), (1, 'EYEBROWS', 3, 3, C(0, *range(302, 308))),
                       (2, 'SIDEBURNS', 2, 2, C(0, 204, 205, 207)), (3, 'MOUSTACHE', 16, 3, C(0, 1604))],
                imply=[(304, 1604)]),
    '4_1': dict(facial=('legacy', None, 'MARKINGS'), slots=[]),
    # undead (I-433, user 2026-10-31): the jaw is a shape (closed 102 / slack 103 / missing 104) and a jaw skin. The skins
    # are the stock facial-hair textures, painted for one jaw mesh each; a skin choice carries its paint (tex=, pieces
    # from undead_jaw.py) and, where stock pairs it with its own closed / open mesh, swaps the shape to it (bone jaw
    # 102 -> 101, teeth 102 -> 105 / 103 -> 106). The skin slot's geosets 14xx are not in the model ("virtual"): they
    # only key the exclude lines, which keep each skin on the shapes it was painted for. Studs & spikes (the old face
    # features 302 / 305 and head-wrap 204) are one group, 16xx (curate_transforms relabel); 302 floats off a slack jaw
    # (user: jaw rows 3 / 8 / 10). Slot 0 (the F-230 jaw slot) is retired.
    '5_0': dict(facial=('hidden', 0, None), virtual={14},
                slots=[(1, 'JAW', 1, 1, C(102, 103, 104)),
                       (2, 'JAWSKIN', 14, 1, [(1401, None, None, None), (1402, None, None, None), (1403, None, None, None),
                                              (1404, None, 102, 101), (1405, None, 102, 105), (1406, None, 103, 106),
                                              (1407, None, None, None), (1408, None, None, None)]),
                       (3, 'FACEFEAT', 3, 3, C(0, 303, 304)), (4, 'HEADSTRAPS', 2, 2, C(0, 202)),
                       (5, 'STUDS', 16, 3, C(0, 1602, 1605, 1604))],
                exclude=[(101, [1406, 1407, 1408, 1605]), (102, [1406, 1407, 1408, 1605]), (105, [1406, 1407, 1408, 1605]),
                         (103, [1402, 1405, 1407, 1408, 1602, 1604]), (106, [1402, 1405, 1407, 1408, 1602, 1604]),
                         (104, [1401, 1402, 1403, 1404, 1405, 1406, 1602, 1604, 1605]),
                         (202, [303, 304])],
                eyeglow='eyerow'),
    # undead female: jaw 102 intact / 104 lip slit; skins as the male (stitched, bone, teeth, cheek rot); teeth only on
    # 104, the others only on 102 (stock pairs). The "facial hair" button is gone (hidden 0): the skin is its own row.
    '5_1': dict(facial=('hidden', 0, None), virtual={14},
                slots=[(0, 'JAW', 1, 1, C(102, 104)), (1, 'FACEFEAT', 3, 3, C(0, 302, 303, 304, 305)),
                       (2, 'JAWSKIN', 14, 1, C(1401, 1402, 1403, 1404, 1405))],
                exclude=[(102, [1404]), (104, [1401, 1402, 1403, 1405])],
                eyeglow='eyerow'),
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
    '4_0': {0: [None, 1, 2, 3], 1: [None, 8, 9, 10, 11, 12, 13], 2: [None, 5, 6, 7], 3: [None, 14]},
    # undead jaw skins (undead_jaw.py PIECES: whole stock facial-hair textures, one piece per skin)
    '5_0': {2: [None, 1, 2, 3, 4, 4, 5, 6]},
    '5_1': {2: [None, 1, 2, 3, 4]},
}

# migration: a legacy variation whose paint has no mesh in that slot takes a paint-only choice (choice index)
MIG_PAINT = {'4_0': {1: {0: 1}, 4: {0: 3}, 5: {2: 3}},
             # undead: each legacy row's jaw shape (slot 1 male / 0 female) and skin (slot 2) - undead_jaw.LEGACY
             '5_0': {v: {1: sh, 2: sk} for v, (sh, sk) in {0: (0, 0), 1: (0, 1), 2: (0, 0), 3: (1, 0), 4: (2, 6),
                                                            5: (0, 0), 6: (1, 0), 7: (2, 6), 8: (0, 3), 9: (1, 3),
                                                            10: (0, 4), 11: (1, 5), 12: (0, 2), 13: (1, 2), 14: (0, 0),
                                                            15: (1, 0), 16: (2, 7)}.items()},
             '5_1': {v: {2: sk} for v, sk in {0: 0, 1: 1, 2: 0, 3: 0, 4: 2, 5: 3, 6: 4, 7: 0}.items()}}

# every other race with painted facial hair (user 2026-10-31): facial_pieces.py cuts the paint by the 3D model and
# writes facial_pieces.json per race / sex: per slot the appended choices (the same mesh with another look's paint,
# paint-only choices), each choice's piece and every legacy look's slot tuple. The paint selector goes (hidden, base
# = a look with no paint and no mesh where there is one); the slot tuples reproduce every legacy look.
PIECES_STATE = Path(__file__).with_name('facial_pieces.json')
# user 2026-10-31: one choice per mesh, every choice a mesh. Values of the earlier rules (paint-only choices, the
# same mesh with other paint) that are no choice now (stored value -> the surviving choice of that mesh); applied
# once per character (zep_f230_facial_paint_done), guids <= REMAP_CUTOFF. No character held one of these values when
# this was written (2026-10-31): insurance for a creator that offered them.
REMAP = {'1_0': {0: {3: 2, 4: 2, 5: 2, 6: 2, 7: 2, 8: 2, 9: 2}, 1: {3: 2, 4: 2, 5: 2, 6: 2, 7: 2}, 2: {3: 2, 4: 2}},
         '3_0': {1: {11: 6}},
         '4_0': {0: {5: 2, 6: 4}, 2: {5: 4}},
         '7_0': {0: {7: 2}, 1: {8: 2}, 2: {7: 6, 8: 6}}}
REMAP_CUTOFF = 3763

# ---- retail facial-hair grafts (facial_graft.py: curate_transforms.json m2.graft / skin.graft) ----------------------
# Each race's grafted version of its SLOTS / PIECE_OF / MIG_PAINT entries. It replaces the stock entry only once the
# race is in LANDED (its grafted model ships in zep-hd-curated); until then every output is exactly what it was.
# Grafted ids are new in the model and named by no CharacterFacialHairStyles row, so NPCs keep their look. A painted
# legacy look with no mesh of its own migrates to the best-fitting mesh, grafted ones included (user 2026-10-31: keep
# each look's appearance). GRAFTED = the grafted geosets of the landed races (facial_pieces.py keeps them out of the
# region map, so the paint regions of the existing meshes stay as they were).
LANDED = {'1_0', '10_0', '4_0', '11_0', '6_0', '3_0', '2_0', '7_0'}
GRAFT = {
    # beards 103-108, moustaches 303-307, long sideburns 204 (retail's 202 is our 202), eyebrows 1602-1604 (retail
    # 3401-3403; group 16 so the client's slot code can hide them). Values 3.. of the old paint-only REMAP are taken
    # by the new choices (no human male held one): REMAP drops 1_0 when landed.
    '1_0': dict(grafted={*range(103, 109), *range(303, 308), 204, 1602, 1603, 1604},
                slots=[(0, 'BEARD', 1, 1, C(0, 102, *range(103, 109))), (1, 'MOUSTACHE', 3, 3, C(0, 302, *range(303, 308))),
                       (2, 'SIDEBURNS', 2, 2, C(0, 202, 204)), (3, 'EYEBROWS', 16, 0, C(0, 1602, 1603, 1604))],
                remap=None),
    # legacy BEARD row -> slots (no painted facial hair: base row 0 shows nothing); retail beards 111-113 (retail
    # 102-110 are ours), eyebrows 1602
    '10_0': dict(grafted={111, 112, 113, 1602}, facial=('hidden', 0, None),
                 slots=[(0, 'BEARD', 1, 1, C(0, *range(102, 114))), (1, 'EYEBROWS', 16, 0, C(0, 1602))]),
    # beards 108-111, eyebrows 308-311, sideburns 208/209, moustaches 1605-1608. 108 (small goatee) carries look 4's
    # chin paint (piece 3, as 107), 111 (short full beard) look 1's full painted beard (piece 4); looks 1 / 4 (paint,
    # no mesh) migrate onto them (renders 2026-10-31; before: the bigger 103 / 107)
    '4_0': dict(grafted={108, 109, 110, 111, 208, 209, 308, 309, 310, 311, 1605, 1606, 1607, 1608},
                slots=[(0, 'BEARD', 1, 1, C(0, 103, 106, 107, 108, 109, 110, 111)), (1, 'EYEBROWS', 3, 3, C(0, *range(302, 312))),
                       (2, 'SIDEBURNS', 2, 2, C(0, 204, 205, 207, 208, 209)), (3, 'MOUSTACHE', 16, 3, C(0, 1604, *range(1605, 1609)))],
                piece_of={0: [None, 1, 2, 3, 3, None, None, 4], 1: [None, 8, 9, 10, 11, 12, 13] + [None] * 4,
                          2: [None, 5, 6, 7] + [None] * 2, 3: [None, 14] + [None] * 4},
                mig_paint={1: {0: 7}, 4: {0: 4}, 5: {2: 3}}),
    # legacy BEARD row -> slots. Each legacy row is one mesh (10x) + its own paint (section 2 type x): the mesh's
    # choice carries that paint whole (facial_pieces.PIECES (2, 0)), so every legacy look is a slot tuple. Row 1 (stubble
    # paint, no mesh) goes to the grafted chin tuft 111 with its paint. Retail beards 111-115, sideburns 202-207 /
    # 209-212, nose rings 1602-1604. The beard rings stay part of their beards (see the module doc).
    '2_0': dict(grafted={111, 112, 113, 114, 115, *range(202, 208), *range(209, 213), 1602, 1603, 1604},
                facial=('hidden', 0, None),
                # slot 0 is retired (the old Beard Rings link slot)
                slots=[(1, 'BEARD', 1, 1, C(0, *range(102, 116))), (2, 'SIDEBURNS', 2, 2, C(0, *range(202, 208), *range(209, 213))),
                       (3, 'NOSERING', 16, 3, C(0, 1602, 1603, 1604))],
                piece_of={1: [None, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, None, None, None, None]},
                mig_paint={1: {1: 10}}),
    # our gnome is the retail rig x 20/23 with retail's hair atlas: retail beards 109-111, moustaches 309-313, eyebrows
    # 207-209 grafted scaled; the island-split pieces stay
    # mig_fix (renders 2026-10-31): look 1 is beard 102 + brows 202 only (its lip paint fit 303, a moustache it never
    # showed); look 2 has no beard (its chin paint fit 102, a full beard; none of 109-111 fits better than none)
    '7_0': dict(grafted={109, 110, 111, *range(309, 314), 207, 208, 209}, mig_fix={1: {3: 0}, 2: {1: 0}},
                slots=[(0, 'BEARD', 1, 1, C(0, 102, 104, 105, 106, 107, 109, 110, 111)),
                       (1, 'MOUSTACHE', 3, 1, C(0, *range(303, 309), *range(309, 314))),
                       (2, 'EYEBROWS', 2, 1, C(0, *range(202, 207), 207, 208, 209))]),
    # our tauren is the retail rig x 20/27: retail facial hair 108-112 and hair 208/209 grafted scaled
    '6_0': dict(grafted={108, 109, 110, 111, 112, 208, 209},
                slots=[(0, 'BEARD', 1, 1, C(0, 102, 103, 104, 105, 107, *range(108, 113))),
                       (1, 'HAIR', 2, 2, C(0, 202, 203, 204, 206, 208, 209)),
                       (2, 'NOSERING', 3, 3, C(0, 302, 303, 306, 309))]),
    # retail nose rings 1602-1606 (slot 3; slot 2 is retired); beards / moustaches / brows: retail's are ours
    '3_0': dict(grafted={1602, 1603, 1604, 1605, 1606},
                slots=[(0, 'BEARD', 1, 1, C(0, *range(102, 113))), (1, 'MOUSTACHE', 3, 3, C(0, *range(302, 311))),
                       (3, 'NOSERING', 16, 3, C(0, *range(1602, 1607)))]),
    # retail whiskers, cut like our 204-206: sideburns 207/209/210, moustaches 308/309/313, goatees 1610/1612/1613
    '11_0': dict(grafted={207, 209, 210, 308, 309, 313, 1610, 1612, 1613},
                 slots=[(0, 'TENDRILS', 1, 1, C(0, *range(102, 109))), (1, 'SIDEBURNS', 2, 2, C(0, *range(202, 208), 209, 210)),
                        (2, 'MOUSTACHE', 3, 2, C(0, 304, 306, 308, 309, 313)),
                        (3, 'BEARD', 16, 2, C(0, 1605, 1606, 1610, 1612, 1613))]),
}
GRAFTED = {}
MIG_FIX = {}        # race_sex -> legacy look -> slot group -> geoset (0 = none): facial_pieces.py's migration, by hand
for _k in sorted(LANDED):
    _g = GRAFT[_k]
    GRAFTED[_k] = _g['grafted']
    SLOTS[_k] = dict(SLOTS[_k], slots=_g['slots'], **({'facial': _g['facial']} if 'facial' in _g else {}))
    if 'piece_of' in _g:
        PIECE_OF[_k] = _g['piece_of']
    if 'mig_paint' in _g:
        MIG_PAINT[_k] = _g['mig_paint']
    if 'mig_fix' in _g:
        MIG_FIX[_k] = _g['mig_fix']
    if 'remap' in _g:
        REMAP.pop(_k, None)
HIDDEN_BASE = {'1_0': 8, '3_0': 0, '7_0': 0, '11_0': 0}


def apply_pieces_state():
    if not PIECES_STATE.exists():
        return
    state = json.loads(PIECES_STATE.read_text())
    for k, st in state.items():
        spec = SLOTS[k]
        spec['facial'] = ('hidden', HIDDEN_BASE[k], None)
        slots = []
        for sl in spec['slots']:
            got = st['slots'].get(str(sl[0]))
            if got and sl[2] is not None:
                sl = (sl[0], sl[1], sl[2], sl[3], list(sl[4]) + C(*got['extra']))
                PIECE_OF.setdefault(k, {})[sl[0]] = got['pieces']
            slots.append(sl)
        spec['slots'] = slots
        MIG_PAINT[k] = {int(v): {int(sl): ci for sl, ci in m.items()} for v, m in st['migration'].items()}


SLOTS_BASE = {k: dict(v, slots=list(v['slots'])) for k, v in SLOTS.items()}   # before the appended choices (facial_pieces.py reads these)
apply_pieces_state()

# slots taken out of a race/sex: never reused; the migration deletes their stored values (character_customizations
# 10 + slot). Orc / dwarf male "Beard Rings" link slots: the rings close gaps in their beards (see the doc).
# Undead male jaw slot: the jaw is the legacy facial row (jaw + its own skin).
RETIRED = {'2_0': [0], '3_0': [2], '5_0': [0]}     # 5_0 0: the 2026-10-30 jaw slot

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
              (3, 1, 4): ((0, 5, 0, 0, 0), (0, 0, 0, 2, 0)),
              # undead male studs 302 / 305 / 204 relabelled to 1602 / 1605 / 1604 (I-433)
              (5, 0, 5): ((2, 3, 4, 0, 2), (2, 3, 0, 4, 2)),
              (5, 0, 8): ((1, 2, 0, 0, 2), (1, 0, 0, 2, 2)),
              (5, 0, 9): ((3, 5, 0, 0, 2), (3, 0, 0, 5, 2))}


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
    repaint = []                                # (race, sex, facialStyle, slot, mesh-only value, paint value)
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
                if g and g not in have[k] and g // 100 not in spec.get('virtual', ()):
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
                if d not in have[k] and d // 100 not in spec.get('virtual', ()):
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
                    if cur in geos and geos.index(cur) != paint:
                        # characters migrated before the paint choices hold the mesh-only value: move them
                        repaint.append((int(r), int(s), v, sl[0], geos.index(cur) + 1, paint + 1))
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
        pre = []
        if REMAP:     # first: values of the paint-only rules move before the new-rule inserts and updates below
            pre += ['-- paint-only choices removed (user 2026-10-31): values of the rules that had them move to the mesh',
                    '-- choice carrying that paint, once per character (guid <= the cutoff)',
                    'CREATE TABLE IF NOT EXISTS zep_f230_facial_paint_done (guid INT UNSIGNED NOT NULL PRIMARY KEY);',
                    'DROP TEMPORARY TABLE IF EXISTS zep_tmp_paint_todo;',
                    'CREATE TEMPORARY TABLE zep_tmp_paint_todo (guid INT UNSIGNED NOT NULL PRIMARY KEY);',
                    'INSERT INTO zep_tmp_paint_todo (guid) SELECT guid FROM characters WHERE guid <= '
                    f'{REMAP_CUTOFF} AND guid NOT IN (SELECT guid FROM zep_f230_facial_paint_done);']
            for k, slots in sorted(REMAP.items()):
                r, s = k.split('_')
                cases = []
                for slot, m in sorted(slots.items()):
                    whens = ' '.join(f'WHEN {o} THEN {n}' for o, n in sorted(m.items()))
                    cases.append(f'WHEN cc.customization = {10 + slot} AND cc.choice IN ({", ".join(map(str, sorted(m)))}) '
                                 f'THEN CASE cc.choice {whens} END')
                pre.append('UPDATE character_customizations AS cc JOIN characters AS c ON c.guid = cc.guid JOIN '
                           'zep_tmp_paint_todo AS t ON t.guid = cc.guid SET cc.choice = CASE ' + ' '.join(cases) +
                           f' ELSE cc.choice END WHERE c.race = {r} AND c.gender = {s};')
            pre += ['INSERT IGNORE INTO zep_f230_facial_paint_done (guid) SELECT guid FROM zep_tmp_paint_todo;',
                    'DROP TEMPORARY TABLE zep_tmp_paint_todo;']
        sql = ['-- F-230: existing characters get the geoset-slot values that reproduce their current facialStyle look.',
               '-- GENERATED by Scripts/Character Skins/facial_split.py - do not edit, re-run the script.',
               *pre,
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
        if repaint:
            sql.append('-- facial-hair paint follows the slot choices (facial_pieces.py): a character migrated before that, still on')
            sql.append('-- the mesh-only value of its legacy look, moves to the choice that carries the look\'s paint')
        for r, s, v, slot, old, new in repaint:
            sql.append('UPDATE character_customizations AS cc JOIN characters AS c ON c.guid = cc.guid SET cc.choice = '
                       f'{new} WHERE c.race = {r} AND c.gender = {s} AND c.facialStyle = {v} AND cc.customization = '
                       f'{10 + slot} AND cc.choice = {old};')
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
