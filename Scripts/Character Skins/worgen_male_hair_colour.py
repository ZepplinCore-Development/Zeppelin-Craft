"""F-030: the worgen male Hair Color layers.

The worgen M2s have no hair texture (type 6): the mane draws with the skin's _Extra, so a hair colour row's
texture_1 changes nothing. On the male, Hair Color shows only through its facial hair rows (CharSections section 2,
keyed by hair colour), which paste over the face's lower and upper boxes. Blizzard's colour textures for that
(Character/Worgen/Male/FacialLowerHair00_0N / FacialUpperHair00_0N, retail fdid 452038-452047) are palettized with
no alpha: the area round the fur is a flat matte (45, 48, 50), which pasted as is would paint over the whole face.

This keys the matte out (feathered alpha), and writes the layers to new names the facial hair rows point at
(mod-worgoblin/dbc/[F-030]_charsections.sql): WorgenMaleHairLower00_0N.blp / WorgenMaleHairUpper00_0N.blp.

  python3 "Scripts/Character Skins/worgen_male_hair_colour.py"
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from lib.wardrobe.blp import read_blp  # noqa: E402
from subrace_icons import write_blp_rgba  # noqa: E402

MALE = CRAFT / 'zpaks' / 'mod-worgoblin' / 'mpq' / 'source-assets' / 'Character' / 'Worgen' / 'male'
MATTE = np.array([45, 48, 50])        # the flat fill round the fur in every colour of both boxes
COLOURS = 5


def keyed(path):
    """The texture with its matte transparent: alpha ramps in over 3-21 colour units off the matte, then is
    feathered (a 3 px blur) so the fur's edge fades into the face under it instead of a cut line."""
    rgb = np.asarray(read_blp(str(path)).convert('RGB')).astype(float)
    alpha = np.clip((np.linalg.norm(rgb - MATTE, axis=2) - 3) / 18, 0, 1)
    alpha = np.minimum(alpha, ndimage.gaussian_filter(alpha, 3.0) * 1.15).clip(0, 1)
    return Image.fromarray(np.dstack([rgb, alpha * 255]).astype(np.uint8), 'RGBA')


def main():
    for colour in range(COLOURS):
        for src, dst in (('faciallowerhair', 'WorgenMaleHairLower'), ('facialupperhair', 'WorgenMaleHairUpper')):
            out = MALE / f'{dst}00_{colour:02d}.blp'
            write_blp_rgba(out, keyed(MALE / f'{src}00_{colour:02d}.blp'))
            print(out.relative_to(CRAFT))


if __name__ == '__main__':
    main()
