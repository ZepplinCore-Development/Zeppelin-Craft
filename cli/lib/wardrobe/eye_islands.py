"""F-151: where each playable race's face paints its eyeball (its own UV island): read by eyes_all.py, which cuts the
eye colour layers, and by the skin check, which leaves the eye out of a face's colour."""
import numpy as np

# (race, sex) -> the eyeball island as an ellipse (centre x, y, radius x, y) on the 256 x 192 face (upper 0-63 over
# lower 64-191), read off face 0 of every race (masks sheet). Masks found from the faces' eye-colour variation came
# out partial (C shapes) or on the skin beside the eye.
ISLAND = {(1, 0): (32, 162, 31, 28), (1, 1): (237, 15, 17, 13),
          (3, 0): (31, 160, 30, 31), (3, 1): (209, 31, 36, 21),
          (4, 0): (233, 19, 18, 16), (4, 1): (23, 170, 20, 18),
          (5, 0): (47, 170, 24, 17), (5, 1): (221, 13, 21, 12),
          (6, 0): (26, 17, 23, 16), (6, 1): (26, 37, 16, 12),
          (7, 0): (213, 161, 32, 26), (7, 1): (210, 161, 28, 22),
          (8, 0): (28, 137, 21, 25), (8, 1): (85, 30, 25, 25),
          (10, 0): (29, 163, 27, 28), (10, 1): (30, 28, 28, 26),
          (11, 0): (127, 13, 23, 12), (11, 1): (30, 18, 28, 16)}
# goblins and worgen (wg_eyes sheet): the goblins and the worgen male draw the eyes painted on the face (the goblin
# faces' island is on no geometry: a layer there changed nothing in game); the eyeball step of eyes_all.py keeps
# the pixels that stay put across the skin / fur colours
ISLAND.update({(9, 0): (48, 70, 16, 9), (9, 1): (46, 80, 17, 10),
               (12, 0): (133, 68, 16, 8), (12, 1): (243, 176, 13, 13)})
# orcs: the bounds of eyes_markings.py eye_mask (where the death knight faces differ), FaceUpper's top right
ISLAND.update({(2, 0): (224, 30, 27, 28), (2, 1): (226, 29, 26, 27)})


def island(race, sex, scale=1.0):
    """The island as a 192 x 256 mask on the face (upper 0-63 over lower 64-191); all False for an unknown race."""
    yy, xx = np.mgrid[:192, :256]
    if (race, sex) not in ISLAND:
        return np.zeros((192, 256), bool)
    cx, cy, rx, ry = ISLAND[(race, sex)]
    rx, ry = rx * scale, ry * scale
    return ((xx + 0.5 - cx) / rx) ** 2 + ((yy + 0.5 - cy) / ry) ** 2 <= 1
