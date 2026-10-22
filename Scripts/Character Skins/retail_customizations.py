"""F-151: grab retail's orc and Mag'har customization layers (scars, tattoos, war paint, grime, underwear).

Retail paints each customization as its own layer texture with a blend mode (ChrModelTextureLayer.BlendMode:
4 multiply = tattoo, 6 overlay = scars / grime, 9 alpha = war paint, 15 alpha = underwear), so nothing has to be
cut out of a baked skin. The layers are 1024x512: the left half is the body in exactly our 512x512 body atlas
(our orc skins are retail's HD skins), the right half is retail's face square, which maps onto our
FaceUpper + FaceLower (256x192 stacked) by an axis-aligned scale + offset per sex, fitted here by normalised
cross-correlation of our face 0 / colour 0 against retail's skin colour 1.

Writes logs/retail_cache/orc_customizations/: db2/*.csv, tex/<race>_<sex>/*.blp, and
Scripts/Character Skins/retail_orc_customizations.json (every choice -> texture, option, blend, target) with the
face fits.

  python3 "Scripts/Character Skins/retail_customizations.py"
"""
import collections
import csv
import json
import shutil
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import signal

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS  # noqa: E402
from lib import retail  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402

CACHE = CRAFT.parent / 'logs' / 'retail_cache' / 'orc_customizations'
MANIFEST = Path(__file__).with_name('retail_orc_customizations.json')
ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
TABLES = ('ChrCustomizationOption', 'ChrCustomizationChoice', 'ChrCustomizationElement', 'ChrCustomizationMaterial',
          'ChrModelTextureLayer', 'ChrRaceXChrModel', 'TextureFileData', 'CharComponentTextureSections')
MODELS = {'3': ('orc', 'Male'), '4': ('orc', 'Female'), '71': ('maghar', 'Male'), '72': ('maghar', 'Female')}
OPTIONS = {'Scars', 'Grime', 'Tattoo', 'War Paint Color', 'Skin Color'}
BLEND = {1: 'blit', 4: 'multiply', 6: 'overlay', 9: 'alpha', 15: 'alpha'}
TARGET_SKIN, UNDERWEAR = '1', {'13': 'pelvis', '14': 'torso'}


def table(name):
    path = CACHE / 'db2' / f'{name}.csv'
    if not path.exists():
        rows = list(retail._csv(name))
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open('w', newline='') as f:
            w = csv.DictWriter(f, fieldnames=rows[0].keys())
            w.writeheader()
            w.writerows(rows)
    return list(csv.DictReader(path.open()))


def face_fit(face, retail_skin):
    """(ncc, scale x, scale y, x0, y0): our face pixel (u, v) of 256x192 sits at (x0 + u*sx, y0 + v*sy) in retail's
    face square at 512x512. The eye island (right of x 190) is left out: it is a separate island in retail."""
    right = retail_skin.convert('L').crop((retail_skin.width // 2, 0, retail_skin.width, retail_skin.height)).resize((512, 512))
    ours = np.asarray(face.convert('L')).astype(float)[:, :190]
    big = np.asarray(right).astype(float)
    big -= big.mean()
    energy = None
    best = None
    for sx in np.arange(0.9, 2.4, 0.05):
        for sy in np.arange(1.0, 2.8, 0.05):
            w, h = int(190 * sx), int(192 * sy)
            if w > 512 or h > 512:
                continue
            tpl = np.asarray(Image.fromarray(ours.astype(np.uint8)).resize((w, h))).astype(float)
            tpl -= tpl.mean()
            tpl /= np.linalg.norm(tpl) + 1e-6
            energy = signal.fftconvolve(big * big, np.ones_like(tpl), mode='valid')
            ncc = signal.fftconvolve(big, tpl[::-1, ::-1], mode='valid') / np.sqrt(np.maximum(energy, 1e-6))
            i = np.unravel_index(np.argmax(ncc), ncc.shape)
            if best is None or ncc[i] > best[0]:
                best = (round(float(ncc[i]), 3), round(float(sx), 3), round(float(sy), 3), int(i[1]), int(i[0]))
    return best


def main():
    t = {name: table(name) for name in TABLES}
    choices = collections.defaultdict(list)
    for c in t['ChrCustomizationChoice']:
        choices[c['ChrCustomizationOptionID']].append(c)
    elements = collections.defaultdict(list)
    for e in t['ChrCustomizationElement']:
        elements[e['ChrCustomizationChoiceID']].append(e)
    materials = {m['ID']: m for m in t['ChrCustomizationMaterial']}
    textures = collections.defaultdict(list)
    for r in t['TextureFileData']:
        textures[r['MaterialResourcesID']].append(int(r['FileDataID']))
    blend = {}
    for layer in t['ChrModelTextureLayer']:
        for k in ('ChrModelTextureTargetID_0', 'ChrModelTextureTargetID_1'):
            blend[(layer['CharComponentTextureLayoutsID'], layer[k])] = int(layer['BlendMode'])
    layouts = {'3': '105', '4': '106', '71': '147', '72': '148'}
    names = retail.listfile()[1]

    out, skins = [], {}
    for o in t['ChrCustomizationOption']:
        if o['ChrModelID'] not in MODELS or o['Name_lang'] not in OPTIONS:
            continue
        race, sex = MODELS[o['ChrModelID']]
        for c in sorted(choices[o['ID']], key=lambda c: int(c['OrderIndex'])):
            for e in elements[c['ID']]:
                m = materials.get(e['ChrCustomizationMaterialID'])
                if not m:
                    continue
                target = m['ChrModelTextureTargetID']
                if o['Name_lang'] == 'Skin Color' and target not in UNDERWEAR:
                    if target == TARGET_SKIN and (race, sex) not in skins:
                        skins[(race, sex)] = textures[m['MaterialResourcesID']][0]
                    continue
                for fdid in textures[m['MaterialResourcesID']]:
                    src = retail.texture_file(fdid)
                    name = str(names.get(fdid, fdid)).split('/')[-1]
                    dst = CACHE / 'tex' / f'{race}_{sex}' / name
                    dst.parent.mkdir(parents=True, exist_ok=True)
                    if src:
                        shutil.copy(src, dst)
                    mode = blend.get((layouts[o['ChrModelID']], target), 15)
                    out.append({'race': race, 'sex': sex, 'option': o['Name_lang'], 'choice': c['Name_lang'],
                                'choice_id': int(c['ID']), 'order': int(c['OrderIndex']),
                                'related_choice': int(e['RelatedChrCustomizationChoiceID']),
                                'target': UNDERWEAR.get(target, target), 'blend': BLEND.get(mode, mode),
                                'fdid': fdid, 'file': f'{race}_{sex}/{name}' if src else None})
    files = FileResolver([ASSETS] + [r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])
    fits = {}
    for sex in ('Male', 'Female'):
        face = Image.new('RGB', (256, 192))
        face.paste(Image.open(files.find(f'Character\\Orc\\{sex}\\Orc{sex}FaceUpper00_00.blp')).convert('RGB').resize((256, 64)), (0, 0))
        face.paste(Image.open(files.find(f'Character\\Orc\\{sex}\\Orc{sex}FaceLower00_00.blp')).convert('RGB').resize((256, 128)), (0, 64))
        fits[sex] = face_fit(face, Image.open(retail.texture_file(skins[('orc', sex)])).convert('RGB'))
        print(f'{sex} face fit (ncc, sx, sy, x0, y0): {fits[sex]}')
    MANIFEST.write_text(json.dumps({'face_fit': fits, 'layers': out}, indent=1) + '\n')
    counts = collections.Counter((r['race'], r['sex'], r['option']) for r in out)
    for k, v in sorted(counts.items()):
        print(*k, v)
    print(f'{len(out)} layers, {sum(1 for r in out if not r["file"])} missing -> {MANIFEST.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
