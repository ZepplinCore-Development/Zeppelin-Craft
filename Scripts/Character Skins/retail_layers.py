"""F-151: retail's orc tattoos, scars, grime and war paint as our CharSections layers.

Reads the layers retail_customizations.py grabbed (retail_orc_customizations.json) and writes one 512x512 atlas
per choice, in our character texture layout: the body from the left half of the retail layer (our orc skins are
retail's own, so the body regions line up as they are), the head sections (FaceUpper at 0,320 and FaceLower at
0,384, stacked 256x192) from the right half warped by the per-sex face fit. Our eye island is left clear.

Retail's blend modes become plain alpha, so the client needs one paste: a multiply by grey c is a black layer at
alpha 1 - c/255, and an overlay darkens below grey 128 and lightens above it (black / white at |2c - 255| / 255).
War paint is already alpha. Tattoos and scars therefore follow the skin colour; war paint keeps its own.

  base_section 6 = Tattoo     type 1.. (retail order), colour 0
  base_section 7 = Scars      type 1.. (retail Scars, then the male Grime)
  base_section 8 = War Paint  type 1 + 4 * (pattern - 1) + colour, 12 choices
  0 = none, no row. texture_1 = the atlas, flags 0x11.

F-230 (2026-10-30): a SOURCE only. layer_sources() hands the layers to markings_regroup.py, which cuts them into
face / body parts (scars whole), dedupes and owns every layer row and shipped BLP. This script writes no SQL and no
zpak files any more ([F-151]_charsections_retaillayers.sql is retired).

  python3 "Scripts/Character Skins/retail_layers.py" [--preview DIR]
"""
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
_spec = importlib.util.spec_from_file_location('icons', Path(__file__).with_name('subrace_icons.py'))
icons = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(icons)

CACHE = CRAFT.parent / 'logs' / 'retail_cache' / 'orc_customizations' / 'tex'
MANIFEST = Path(__file__).with_name('retail_orc_customizations.json')
ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'

RACE, SEXES = 2, {0: 'Male', 1: 'Female'}
# ids 89100-89299 were this script's rows before the F-230 regroup; markings_regroup.py deletes them
FLAGS_ANY = 0x11
SIZE = 512
HEAD = (0, 320, 256, 192)                         # FaceUpper + FaceLower, stacked
EYE = (185, 0, 256, 64)                           # our eye island, inside FaceUpper: left clear
SECTIONS = {'Tattoo': (6, 'Tattoo'), 'Scars': (7, 'Scars'), 'Grime': (7, 'Scars'), 'War Paint Color': (8, 'WarPaint')}


def premul_resize(im, size):
    return im.convert('RGBa').resize(size, Image.LANCZOS).convert('RGBA')


def to_alpha(layer, blend):
    """Retail RGBA layer -> RGBA to alpha-blend: multiply / overlay as black and white with alpha."""
    a = np.asarray(layer).astype(np.float32)
    rgb, alpha = a[..., :3], a[..., 3:] / 255
    if blend == 'alpha':
        return layer
    lum = rgb.mean(axis=2, keepdims=True)
    if blend == 'multiply':
        out_rgb, out_a = np.zeros_like(rgb), (1 - lum / 255) * alpha
    else:                                         # overlay: 128 is neutral
        dark = lum < 128
        out_rgb = np.where(dark, 0.0, 255.0) * np.ones_like(rgb)
        out_a = np.abs(2 * lum - 255) / 255 * alpha
    return Image.fromarray(np.dstack([out_rgb, np.clip(out_a * 255, 0, 255)]).astype(np.uint8), 'RGBA')


def atlas(path, fit, blend):
    src = Image.open(path).convert('RGBA')
    body = premul_resize(src.crop((0, 0, src.width // 2, src.height)), (SIZE, SIZE))
    face_sq = premul_resize(src.crop((src.width // 2, 0, src.width, src.height)), (512, 512))
    _ncc, sx, sy, x0, y0 = fit
    face = face_sq.transform((HEAD[2], HEAD[3]), Image.AFFINE, (sx, 0, x0, 0, sy, y0), Image.BILINEAR)
    out = body.copy()
    head = Image.new('RGBA', (HEAD[2], HEAD[3]), (0, 0, 0, 0))
    head.paste(face, (0, 0))
    clear = Image.new('RGBA', (EYE[2] - EYE[0], EYE[3] - EYE[1]), (0, 0, 0, 0))
    head.paste(clear, (EYE[0], EYE[1]))
    out.paste(head, (HEAD[0], HEAD[1]))
    return to_alpha(out, blend)


def pattern_names():
    """retail ChrCustomizationChoice id -> name (the war paint patterns) and id -> swatch (its colours)."""
    import csv
    path = CRAFT.parent / 'logs' / 'retail_cache' / 'orc_customizations' / 'db2' / 'ChrCustomizationChoice.csv'
    names, swatch = {}, {}
    for r in csv.DictReader(path.open()):
        names[int(r['ID'])] = r['Name_lang']
        swatch[int(r['ID'])] = int(r.get('SwatchColor_0') or 0)
    return names, swatch


def layer_sources():
    """F-230: the orc retail layers as sources for markings_regroup.py (which owns the CharSections rows):
    [{race, sex, old_section, old_type, kind ('marking' | 'scar'), design, colour, label, image (512 RGBA)}].
    old_section / old_type: the row this layer had before the regroup (character migration)."""
    manifest = json.loads(MANIFEST.read_text())
    layers = [r for r in manifest['layers'] if r['race'] == 'orc' and r['option'] in SECTIONS]
    names, swatch = pattern_names()
    out = []
    for g, sex in SEXES.items():
        mine = [r for r in layers if r['sex'] == sex]
        patterns = sorted({r['related_choice'] for r in mine if r['option'] == 'War Paint Color'})
        types = {6: 0, 7: 0}
        for r in sorted(mine, key=lambda r: (list(SECTIONS).index(r['option']), r['order'], r['related_choice'])):
            section, _name = SECTIONS[r['option']]
            if section == 8:
                kind = 1 + 4 * patterns.index(r['related_choice']) + r['order']
                design = f"{names.get(r['related_choice'], 'Pattern')} war paint"
                colour = r['choice'] or colour_label(swatch.get(r['choice_id'], 0)) or f"colour {r['order'] + 1}"
            else:
                types[section] += 1
                kind = types[section]
                design, colour = f"{r['choice']} {r['option'].lower()}", ''
            im = atlas(CACHE / r['file'], manifest['face_fit'][sex], r['blend'])
            out.append({'race': RACE, 'sex': g, 'old_section': section, 'old_type': kind,
                        'kind': 'scar' if r['option'] == 'Scars' else 'marking', 'design': design, 'colour': colour,
                        'order': r['order'], 'source': f"orc retail {r['option']} (retail {r['fdid']}, {r['blend']})",
                        'image': im})
    return out


def colour_label(swatch):
    if not swatch:
        return ''
    import colorsys
    s = swatch & 0xffffff
    r, g, b = ((s >> 16) & 255) / 255, ((s >> 8) & 255) / 255, (s & 255) / 255
    h, sat, v = colorsys.rgb_to_hsv(r, g, b)
    if sat < 0.2:
        return 'white' if v > 0.75 else 'grey' if v > 0.35 else 'black'
    for top, n in [(15, 'red'), (40, 'orange'), (65, 'yellow'), (150, 'green'), (190, 'teal'), (250, 'blue'),
                   (290, 'purple'), (335, 'magenta'), (360, 'red')]:
        if h * 360 <= top:
            return f'dark {n}' if v < 0.45 else n
    return ''


def main():
    """Previews only: the CharSections rows and shipped BLPs are markings_regroup.py's (F-230 regroup by region)."""
    preview = Path(sys.argv[sys.argv.index('--preview') + 1]) if '--preview' in sys.argv else None
    for src in layer_sources():
        print(f"{SEXES[src['sex']]} old s{src['old_section']} t{src['old_type']}: {src['design']} {src['colour']}")
        if preview:
            preview.mkdir(parents=True, exist_ok=True)
            src['image'].save(preview / f"{SEXES[src['sex']]}_{src['old_section']}_{src['old_type']:02d}.png")


if __name__ == '__main__':
    main()
