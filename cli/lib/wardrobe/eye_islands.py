"""F-151: where each playable race's face paints its eyeball (its own UV island): read by eyes_all.py, which cuts the
eye colour layers, and by the skin check, which leaves the eye out of a face's colour."""
import numpy as np

# (race, sex) -> the eyeball island as an ellipse (centre x, y, radius x, y) on the 256 x 192 face (upper 0-63 over
# lower 64-191). Fitted to the eyeball's own UV island in the HD character M2 (the skin-texture triangles in the face
# rect, split into connected pieces; the eye pieces are the ones round the painted eyeball): most cover, least reach
# onto texels other geometry uses (F-151 refit 2026-10-29: human female, dwarf female, night elves, gnomes,
# trolls, draenei had partial cover or reached onto the ear / lid / cheek). Tauren keep the painted eyeball only (their
# UV island adds a brown rim the faces share); blood elf and undead were not refitted (undead: no HD face island).
ISLAND = {(1, 0): (32, 166, 29, 24), (1, 1): (238, 14, 19, 15),
          (3, 0): (31, 160, 30, 31), (3, 1): (210, 38, 36, 21),
          (4, 0): (235, 15, 28, 22), (4, 1): (20, 176, 20, 18),
          (5, 0): (47, 170, 24, 17), (5, 1): (221, 13, 21, 12),
          (6, 0): (26, 17, 23, 16), (6, 1): (26, 37, 16, 12),
          (7, 0): (210, 167, 30, 22), (7, 1): (210, 170, 27, 23),
          (8, 0): (28, 154, 22, 35), (8, 1): (90, 33, 25, 27),
          (10, 0): (29, 163, 27, 28), (10, 1): (30, 28, 28, 26),
          (11, 0): (128, 7, 17, 11), (11, 1): (28, 16, 20, 16)}
# the ellipses the eye choices were picked with (eyes_all.py: flat-ball, same-eye and full-colour tests) before the
# refit: an eye's value is stored on characters and listed in the glue, and the refit ellipses pick a different set
# (night elf male 3 -> 1 eyes, human, gnome, draenei shift), so the choice keeps these and only the cut uses ISLAND
PICK = {(1, 0): (32, 162, 31, 28), (1, 1): (237, 15, 17, 13), (3, 1): (209, 31, 36, 21),
        (4, 0): (233, 19, 18, 16), (4, 1): (23, 170, 20, 18), (7, 0): (213, 161, 32, 26), (7, 1): (210, 161, 28, 22),
        (8, 0): (28, 137, 21, 25), (8, 1): (85, 30, 25, 25), (11, 0): (127, 13, 23, 12), (11, 1): (30, 18, 28, 16)}
# goblins and worgen (wg_eyes sheet): the goblins and the worgen male draw the eyes painted on the face (the goblin
# faces' island is on no geometry: a layer there changed nothing in game); the eyeball step of eyes_all.py keeps
# the pixels that stay put across the skin / fur colours
ISLAND.update({(9, 0): (48, 70, 16, 9), (9, 1): (46, 80, 17, 10),
               (12, 0): (133, 68, 16, 8), (12, 1): (243, 176, 13, 13)})
# orcs: the bounds of eyes_markings.py eye_mask (where the death knight faces differ), FaceUpper's top right
ISLAND.update({(2, 0): (224, 30, 27, 28), (2, 1): (226, 29, 26, 27)})


def island(race, sex, scale=1.0, pick=False):
    """The island as a 192 x 256 mask on the face (upper 0-63 over lower 64-191); all False for an unknown race.
    pick: the ellipse the eye choices are picked with (PICK, else ISLAND)."""
    yy, xx = np.mgrid[:192, :256]
    if (race, sex) not in ISLAND:
        return np.zeros((192, 256), bool)
    cx, cy, rx, ry = PICK.get((race, sex), ISLAND[(race, sex)]) if pick else ISLAND[(race, sex)]
    rx, ry = rx * scale, ry * scale
    return ((xx + 0.5 - cx) / rx) ** 2 + ((yy + 0.5 - cy) / ry) ** 2 <= 1
