"""F-151: retail allied-race skin colours on the base race that shares their model, for the sub-races.

Dark Iron (dwarf), Void Elf (blood elf), Lightforged (draenei) and Mag'har (orc) use their base race's mesh, and
retail paints their skins in the same layout as the base race's HD skins, which are ours:

  body       retail <race><sex>skin00_NN, left half of 1024x512 -> our body atlas as it is (resized to our size)
  faces      retail faceupper00_NN (one 512x512 face square per face and skin) -> our FaceUpper 256x64 +
             FaceLower 256x128 by the per race / sex scale + offset that maps our own face 0 / colour 0 onto
             retail's base race face 0 / colour 0 (fitted here, as retail_customizations.py does for the orc)
  underwear  retail nakedpelvisskin / nakedtorsoskin as they are (256x128)
  _Extra     the skin row's texture_2: the nearest existing colour's (retail has no counterpart for most races)

A retail colour whose body is (nearly) the same as one we already offer is not added again; it is reported as the
existing colour. New colours take the next free color_index; their numbers are written to
retail_subrace_colours.json for the glue's CHAR_CREATE_SUBRACES.

Writes <Race><Sex>{Skin00,FaceUpper,FaceLower,NakedPelvisSkin00,NakedTorsoSkin00}_zs<NN>.blp to zep-skin-expansion
(PATCH-L) and [F-151]_charsections_subracecolours.sql (ids 90000-92999).

  python3 "Scripts/Character Skins/retail_subrace_colours.py"
"""
import collections
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage, signal

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib import retail  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402


def _load(name, file):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(file))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


icons = _load('icons', 'subrace_icons.py')
rc = _load('rc', 'retail_customizations.py')                    # its DB2 table cache

ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
SQL = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'dbc' / '[F-151]_charsections_subracecolours.sql'
OUT = Path(__file__).with_name('retail_subrace_colours.json')
ID_BASE, ID_END = 90000, 92999
SEXES = {0: 'Male', 1: 'Female'}
SKIN, FACE, UNDERWEAR = 0, 1, 4
FACE_TARGETS = ('4', '5')                       # ChrModelTextureTarget of the face square (draenei use 4)
SAME_COLOUR = 6.0                                 # mean |rgb| between bodies under which a colour is already offered
# our faces keep the eyeball as its own UV island, which retail's face square does not have there: the box (x0, y0,
# x1, y1 in the stacked 256x192 face) is copied from our own face of the same type in the nearest colour
EYE_BOX = {(3, 0): (0, 135, 62, 192), (3, 1): (168, 0, 252, 54), (10, 0): (0, 128, 62, 192), (10, 1): (0, 0, 62, 56),
           (11, 0): (104, 0, 152, 24), (11, 1): (0, 0, 62, 34), (2, 0): (195, 0, 256, 64), (2, 1): (165, 0, 256, 64)}
# (base race id, its folder, allied ChrRaces id, sub-race name)
PAIRS = [(3, 'Dwarf', 34, 'Dark Iron'), (10, 'BloodElf', 29, 'Void Elf'),
         (11, 'Draenei', 30, 'Lightforged'), (2, 'Orc', 36, "Mag'har")]


class Retail:
    def __init__(self):
        t = {name: rc.table(name) for name in ('ChrCustomizationOption', 'ChrCustomizationChoice',
                                                'ChrCustomizationElement', 'ChrCustomizationMaterial',
                                                'ChrRaceXChrModel', 'TextureFileData')}
        self.models = collections.defaultdict(dict)
        for r in t['ChrRaceXChrModel']:
            self.models[int(r['ChrRacesID'])][int(r['Sex'])] = r['ChrModelID']
        self.options = collections.defaultdict(dict)
        for o in t['ChrCustomizationOption']:
            self.options[o['ChrModelID']].setdefault(o['Name_lang'], o)
        self.choices = collections.defaultdict(list)
        for c in t['ChrCustomizationChoice']:
            self.choices[c['ChrCustomizationOptionID']].append(c)
        self.elements = collections.defaultdict(list)
        for e in t['ChrCustomizationElement']:
            self.elements[e['ChrCustomizationChoiceID']].append(e)
        self.materials = {m['ID']: m for m in t['ChrCustomizationMaterial']}
        self.textures = collections.defaultdict(list)
        for r in t['TextureFileData']:
            self.textures[r['MaterialResourcesID']].append(int(r['FileDataID']))

    def option(self, race, sex, name):
        o = self.options[self.models[race][sex]].get(name)
        return sorted(self.choices[o['ID']], key=lambda c: int(c['OrderIndex'])) if o else []

    def targets(self, choice_id):
        """[(target, related choice id, fdid)] for a choice."""
        out = []
        for e in self.elements[str(choice_id)]:
            m = self.materials.get(e['ChrCustomizationMaterialID'])
            if m:
                for f in self.textures[m['MaterialResourcesID']]:
                    out.append((m['ChrModelTextureTargetID'], e['RelatedChrCustomizationChoiceID'], f))
        return out

    def skins(self, race, sex):
        """[(skin choice id, {target: fdid})] in retail order."""
        out = []
        for c in self.option(race, sex, 'Skin Color'):
            tex = {}
            for target, related, f in self.targets(c['ID']):
                if related == '0':
                    tex.setdefault(target, f)
            if '1' in tex:
                out.append((c['ID'], tex))
        return out

    def faces(self, race, sex):
        """[{skin choice id: face square fdid}] per face choice, in retail order."""
        return [{related: f for target, related, f in self.targets(c['ID']) if target in FACE_TARGETS}
                for c in self.option(race, sex, 'Face')]


def edges(a):
    a = ndimage.gaussian_filter(a.astype(float), 1.0)
    return np.hypot(ndimage.sobel(a, 0), ndimage.sobel(a, 1))


def best_match(face, square, sxs, sys_):
    """The best normalised cross-correlation of face scaled by (sx, sy) inside square."""
    square = square - square.mean()
    best = None
    for sx in sxs:
        for sy in sys_:
            w, h = int(face.shape[1] * sx), int(face.shape[0] * sy)
            if w > 512 or h > 512 or w < 20:
                continue
            tpl = np.asarray(Image.fromarray(face).resize((w, h), Image.BILINEAR)).astype(float)
            tpl -= tpl.mean()
            tpl /= np.linalg.norm(tpl) + 1e-6
            energy = signal.fftconvolve(square * square, np.ones_like(tpl), mode='valid')
            ncc = signal.fftconvolve(square, tpl[::-1, ::-1], mode='valid') / np.sqrt(np.maximum(energy, 1e-6))
            i = np.unravel_index(np.argmax(ncc), ncc.shape)
            if best is None or ncc[i] > best[0]:
                best = (float(ncc[i]), float(sx), float(sy), int(i[1]), int(i[0]))
    return best


def face_fit(face, square):
    """(ncc, sx, sy, x0, y0): our face pixel (u, v) of 256x192 sits at (x0 + u*sx, y0 + v*sy) in the retail face
    square at 512x512. Matched on edges, which carry the features across differently lit textures; coarse, then
    fine. The eye island side (x 186 and up) is left out."""
    ours = edges(np.asarray(face.convert('L')))[:, :186]
    ours = (ours / ours.max() * 255).astype(np.float32)
    big = edges(np.asarray(square.convert('L').resize((512, 512))))
    big = big / big.max() * 255
    _ncc, sx, sy, _x, _y = best_match(ours, big, np.arange(0.9, 2.6, 0.05), np.arange(0.9, 2.8, 0.05))
    ncc, sx, sy, x0, y0 = best_match(ours, big, np.arange(sx - 0.06, sx + 0.061, 0.01), np.arange(sy - 0.06, sy + 0.061, 0.01))
    return round(ncc, 3), round(sx, 3), round(sy, 3), x0, y0


def image(fdid):
    return Image.open(retail.texture_file(fdid)).convert('RGBA')


def left_half(im):
    return im.crop((0, 0, im.width // 2, im.height)) if im.width > im.height else im


def warp_face(square, fit):
    _ncc, sx, sy, x0, y0 = fit
    face = square.resize((512, 512), Image.LANCZOS).transform((256, 192), Image.AFFINE, (sx, 0, x0, 0, sy, y0), Image.BILINEAR)
    return face.crop((0, 0, 256, 64)), face.crop((0, 64, 256, 192))


def main():
    r = Retail()
    files = FileResolver([ASSETS] + [p for p in EXTERNAL_ROOTS if Path(p).resolve() != ASSETS.resolve()])
    query = _dbc_query_fn('live')
    for old in ASSETS.glob('Character/*/*/*_zs[0-9]*.blp'):
        old.unlink()
    sql = ['-- F-151 Modern Character Creator: retail allied-race skin colours on their base race (sub-races).',
           '-- GENERATED by Scripts/Character Skins/retail_subrace_colours.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};']
    rid, report = ID_BASE, {}
    for base, folder, allied, subrace in PAIRS:
        for g, sex in SEXES.items():
            rows = query(f'SELECT id, base_section, type, color_index, flags, texture_1, texture_2 FROM charsections '
                         f'WHERE race = {base} AND gender = {g} AND base_section IN ({SKIN}, {FACE}, {UNDERWEAR}) '
                         f'AND id NOT BETWEEN {ID_BASE} AND {ID_END}')     # not this script's own rows
            ours = {}
            for row in sorted(rows, key=lambda x: x['id']):
                ours[(row['base_section'], row['type'], row['color_index'])] = row
            colours = sorted(c for (s, t, c) in ours if s == SKIN and t == 0)
            size = Image.open(files.find(ours[(SKIN, 0, 0)]['texture_1'])).size
            body = {c: np.asarray(Image.open(files.find(ours[(SKIN, 0, c)]['texture_1'])).convert('RGB').resize((128, 128))).astype(np.float32)
                    for c in colours}

            face = Image.new('RGB', (256, 192))
            face.paste(Image.open(files.find(ours[(FACE, 0, 0)]['texture_2'])).convert('RGB').resize((256, 64)), (0, 0))
            face.paste(Image.open(files.find(ours[(FACE, 0, 0)]['texture_1'])).convert('RGB').resize((256, 128)), (0, 64))
            base_skins, base_faces = r.skins(base, g), r.faces(base, g)
            ref = next(per[c] for per in base_faces[:1] for c, _t in base_skins if c in per)
            fit = face_fit(face, image(ref))
            box = EYE_BOX[(base, g)]
            faces = r.faces(allied, g)
            flags = {s: ours[(s, 0, 0)]['flags'] for s in (SKIN, FACE, UNDERWEAR) if (s, 0, 0) in ours}
            new, same = [], {}
            nxt = max(colours) + 1
            for k, (choice, tex) in enumerate(r.skins(allied, g)):
                skin = left_half(image(tex['1']))
                small = np.asarray(skin.convert('RGB').resize((128, 128))).astype(np.float32)
                dist = {c: float(np.abs(small - b).mean()) for c, b in body.items()}
                near = min(dist, key=dist.get)
                if dist[near] < SAME_COLOUR:
                    same[k] = near
                    continue
                c = nxt
                nxt += 1
                stem = f'Character\\{folder}\\{sex}\\{folder}{sex}'
                paths = {'skin': f'{stem}Skin00_zs{c:02d}.blp'}
                icons.write_blp_rgba(ASSETS / paths['skin'].replace('\\', '/'), skin.resize(size, Image.LANCZOS))
                sql.append(_insert(rid, base, g, SKIN, paths['skin'], ours[(SKIN, 0, near)]['texture_2'], flags[SKIN], 0, c))
                rid += 1
                for f, per_skin in enumerate(faces):
                    if choice not in per_skin:
                        continue
                    up, lo = warp_face(image(per_skin[choice]), fit)
                    src = next(ours[(FACE, t, c2)] for c2 in sorted(dist, key=dist.get) for t in (f, 0) if (FACE, t, c2) in ours)
                    for own_path, half, y0 in ((src['texture_2'], up, 0), (src['texture_1'], lo, 64)):
                        own = Image.open(files.find(own_path)).convert('RGBA').resize(half.size)
                        b = (box[0], max(box[1] - y0, 0), box[2], min(box[3] - y0, half.height))
                        if b[3] > b[1]:
                            half.paste(own.crop(b), (b[0], b[1]))
                    pu, pl = f'{stem}FaceUpper{f:02d}_zs{c:02d}.blp', f'{stem}FaceLower{f:02d}_zs{c:02d}.blp'
                    icons.write_blp_rgba(ASSETS / pu.replace('\\', '/'), up)
                    icons.write_blp_rgba(ASSETS / pl.replace('\\', '/'), lo)
                    sql.append(_insert(rid, base, g, FACE, pl, pu, flags[FACE], f, c))
                    rid += 1
                under = {}
                for target, part in (('13', 'NakedPelvisSkin00'), ('14', 'NakedTorsoSkin00')):
                    if target in tex:
                        p = f'{stem}{part}_zs{c:02d}.blp'
                        icons.write_blp_rgba(ASSETS / p.replace('\\', '/'), image(tex[target]).resize((256, 128), Image.LANCZOS))
                        under[target] = p
                if not under:
                    # retail paints none (Lightforged): the nearest colour's, so the colour stays selectable
                    # (character create offers a skin only with an underwear row)
                    donor = next(ours[(UNDERWEAR, 0, c2)] for c2 in sorted(dist, key=dist.get) if (UNDERWEAR, 0, c2) in ours)
                    under = {'13': donor['texture_1'], '14': donor['texture_2']}
                sql.append(_insert(rid, base, g, UNDERWEAR, under.get('13', ''), under.get('14', ''), flags[UNDERWEAR], 0, c))
                rid += 1
                new.append(c)
            report.setdefault(subrace, {})[sex] = {'new': new, 'already_offered': sorted(set(same.values())),
                                                   'face_fit': fit, 'faces': len(faces)}
            print(f'{subrace} {sex}: {len(new)} new colours {new}, {len(same)} already offered as {sorted(set(same.values()))}, '
                  f'{len(faces)} faces, face fit {fit}')
    if rid > ID_END:
        raise SystemExit('rows overflow the id range')
    SQL.write_text('\n'.join(sql) + '\n')
    OUT.write_text(json.dumps(report, indent=1) + '\n')
    print(f'{rid - ID_BASE} rows -> {SQL.relative_to(CRAFT)}')


def _insert(rid, race, g, section, t1, t2, flags, kind, colour):
    esc = lambda p: (p or '').replace('\\', '\\\\')  # noqa: E731
    return (f"INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, "
            f"color_index) VALUES ({rid}, {race}, {g}, {section}, '{esc(t1)}', '{esc(t2)}', '', {flags}, {kind}, {colour});")


if __name__ == '__main__':
    main()
