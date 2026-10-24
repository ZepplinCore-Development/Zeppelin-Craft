"""F-151: retail allied-race skin colours on the base race that shares their model, for the sub-races.

Dark Iron (dwarf), Void Elf (blood elf), Lightforged (draenei) and Mag'har (orc) use their base race's mesh, and
retail paints their skins in the same layout as the base race's HD skins, which are ours:

  body       retail <race><sex>skin00_NN, left half of 1024x512 -> our body atlas as it is (resized to our size)
  faces      ours: every face type of the nearest existing colour, recoloured to the new skin (retone), the eye
             island (EYE_BOX) kept. Retail's own face squares are not used: retail draws eyeballs as a separate
             part, so its faces have the lids painted shut and render eyeless on our model
  underwear  retail nakedpelvisskin / nakedtorsoskin as they are (256x128)
  _Extra     the skin row's texture_2: the nearest existing colour's (retail has no counterpart for most races)

A retail colour whose body is (nearly) the same as one we already offer is not added again; it is reported as the
existing colour. New colours take the next free color_index; their numbers are written to
retail_subrace_colours.json for the glue's CHAR_CREATE_SUBRACES.

Writes <Race><Sex>{Skin00,FaceUpper,FaceLower,NakedPelvisSkin00,NakedTorsoSkin00}_zs<NN>.blp to zep-skin-expansion
(PATCH-L) and [F-151]_charsections_subracecolours.sql (ids 90000-99999).

  python3 "Scripts/Character Skins/retail_subrace_colours.py"
"""
import collections
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib import retail  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402


def _load(name, file):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(file))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


icons = _load('icons', 'subrace_icons.py')
rc = _load('rc', 'retail_customizations.py')                    # its DB2 table cache

ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets'
# the HD character pack's sources since the PATCH-Q split moved them out of the zpaks (zep-hd-curated packs only a
# subset: no dwarf / draenei / blood elf faces)
COMMUNITY = [CRAFT.parent / 'Zeppelin-Tools' / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
             for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]
SQL = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'dbc' / '[F-151]_charsections_subracecolours.sql'
OUT = Path(__file__).with_name('retail_subrace_colours.json')
ID_BASE, ID_END = 90000, 99999
SEXES = {0: 'Male', 1: 'Female'}
SKIN, FACE, UNDERWEAR = 0, 1, 4
FACE_TARGETS = ('4', '5')                       # ChrModelTextureTarget of the face square (draenei use 4)
DARK = 25.0                                      # mean brightness under which a retail skin needs a material we lack (renders black)
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


def image(fdid):
    return Image.open(retail.texture_file(fdid)).convert('RGBA')


def left_half(im):
    return im.crop((0, 0, im.width // 2, im.height)) if im.width > im.height else im


def lit(body):
    """The brighter half of a body's pixels: the skin's colour without its shadows."""
    px = body.reshape(-1, 3)
    lum = px.mean(axis=1)
    return px[lum >= np.median(lum)]


def retone(im, old_body, new_body):
    """im (an _Extra: horns, tentacles, ears) moved from one skin colour to another. A pixel follows by how close its
    hue (brightness normalised out) is to the old skin's lit colour, keeping its own brightness, so metal, gems and
    eyes keep their colour (user report: Lightforged horns and tentacles in the old colour)."""
    a = np.asarray(im).astype(np.float32)
    rgb = a[..., :3]
    old, new = lit(old_body), lit(new_body)
    mo, mn = old.mean(axis=0), new.mean(axis=0)
    spread = np.linalg.norm(old.std(axis=0))
    lum = rgb.mean(axis=2, keepdims=True)
    hue = np.linalg.norm(rgb / np.maximum(lum, 1) * mo.mean() - mo, axis=2)
    w = np.exp(-(hue ** 2) / (2 * (1.2 * spread) ** 2))[..., None]
    target = lum * (mn / max(mo.mean(), 1))
    out = rgb + w * (np.clip(target, 0, 255) - rgb)
    return Image.fromarray(np.dstack([np.clip(out, 0, 255), a[..., 3]]).astype(np.uint8), 'RGBA')


def main():
    r = Retail()
    # the HD character art ships from zep-hd-curated's packed copy (its sources live in the Asset Library's COMMUNITY
    # packs, which EXTERNAL_ROOTS does not list): without it, faces resolve to the classic stock files
    first = [ASSETS, CURATED] + [p for p in COMMUNITY if p.is_dir()]
    files = FileResolver(first + [p for p in EXTERNAL_ROOTS if Path(p).resolve() not in {f.resolve() for f in first}])
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
            size = read_blp(files.find(ours[(SKIN, 0, 0)]['texture_1'])).size
            body = {c: np.asarray(read_blp(files.find(ours[(SKIN, 0, c)]['texture_1'])).convert('RGB').resize((128, 128))).astype(np.float32)
                    for c in colours}

            box = EYE_BOX[(base, g)]
            flags = {s: ours[(s, 0, 0)]['flags'] for s in (SKIN, FACE, UNDERWEAR) if (s, 0, 0) in ours}
            new, same, dark = [], {}, []
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
                nxt += 1                                 # a skipped dark colour keeps its number: later ones stay put
                if small.mean() < DARK:
                    dark.append(c)
                    continue
                stem = f'Character\\{folder}\\{sex}\\{folder}{sex}'
                paths = {'skin': f'{stem}Skin00_zs{c:02d}.blp'}
                icons.write_blp_rgba(ASSETS / paths['skin'].replace('\\', '/'), skin.resize(size, Image.LANCZOS))
                extra = ''
                # the nearest colour's _Extra (horns, tentacles, ears...) moved to this colour's skin tone
                donor_extra = next((files.find(ours[(SKIN, 0, c2)]['texture_2']) and (c2, files.find(ours[(SKIN, 0, c2)]['texture_2']))
                                    for c2 in sorted(dist, key=dist.get) if ours[(SKIN, 0, c2)]['texture_2']
                                    and files.find(ours[(SKIN, 0, c2)]['texture_2'])), None)
                if donor_extra:
                    c2, path = donor_extra
                    extra = f'{stem}Skin00_zs{c:02d}_Extra.blp'
                    icons.write_blp_rgba(ASSETS / extra.replace('\\', '/'), retone(read_blp(path), body[c2], small))
                sql.append(_insert(rid, base, g, SKIN, paths['skin'], extra, flags[SKIN], 0, c))
                rid += 1
                # faces: our own, every face type the nearest colour has, recoloured to this skin. Retail's face
                # squares do not fit: retail draws the eyeballs as their own part, so its faces have the lids
                # painted shut and render eyeless on our model (user report). The eye island stays as it is.
                def has(row):                        # both halves resolve (some rows name files no root carries)
                    return all(files.find(row[k]) for k in ('texture_1', 'texture_2') if row[k])

                donor = next(c2 for c2 in sorted(dist, key=dist.get)
                             if any((FACE, t, c2) in ours and has(ours[(FACE, t, c2)]) for t in range(32)))
                missing = []
                for f in sorted(t for (s_, t, c2) in ours if s_ == FACE and c2 == donor):
                    if not has(ours[(FACE, f, donor)]):
                        missing.append(f)
                        continue
                    src = ours[(FACE, f, donor)]
                    halves = []
                    for own_path, y0 in ((src['texture_2'], 0), (src['texture_1'], 64)):
                        own = read_blp(files.find(own_path)).convert('RGBA').resize((256, 64 if y0 == 0 else 128))
                        half = retone(own, body[donor], small)
                        b = (box[0], max(box[1] - y0, 0), box[2], min(box[3] - y0, half.height))
                        if b[3] > b[1]:
                            half.paste(own.crop(b), (b[0], b[1]))
                        halves.append(half)
                    up, lo = halves
                    pu, pl = f'{stem}FaceUpper{f:02d}_zs{c:02d}.blp', f'{stem}FaceLower{f:02d}_zs{c:02d}.blp'
                    icons.write_blp_rgba(ASSETS / pu.replace('\\', '/'), up)
                    icons.write_blp_rgba(ASSETS / pl.replace('\\', '/'), lo)
                    sql.append(_insert(rid, base, g, FACE, pl, pu, src['flags'], f, c))   # the donor face's own flags (DK faces)
                    rid += 1
                if missing:
                    print(f'   colour {c}: donor {donor} face types {missing} have no files, skipped')
                under = {}
                for target, part in (('13', 'NakedPelvisSkin00'), ('14', 'NakedTorsoSkin00')):
                    if target in tex:
                        p = f'{stem}{part}_zs{c:02d}.blp'
                        icons.write_blp_rgba(ASSETS / p.replace('\\', '/'), image(tex[target]).resize((256, 128), Image.LANCZOS))
                        under[target] = p
                if not under:
                    # retail paints none (Lightforged): the nearest colour's, so the colour stays selectable
                    # (character create offers a skin only with an underwear row). Ours paint the donor's skin
                    # round the cloth, so they are recoloured like the _Extra (preview: off-colour thighs).
                    c2 = next(c2 for c2 in sorted(dist, key=dist.get) if (UNDERWEAR, 0, c2) in ours)
                    donor = ours[(UNDERWEAR, 0, c2)]
                    for target, col, part in (('13', 'texture_1', 'NakedPelvisSkin00'), ('14', 'texture_2', 'NakedTorsoSkin00')):
                        if donor[col] and files.find(donor[col]):
                            p = f'{stem}{part}_zs{c:02d}.blp'
                            src = read_blp(files.find(donor[col])).resize((256, 128), Image.LANCZOS)
                            icons.write_blp_rgba(ASSETS / p.replace('\\', '/'), retone(src, body[c2], small))
                            under[target] = p
                sql.append(_insert(rid, base, g, UNDERWEAR, under.get('13', ''), under.get('14', ''), flags[UNDERWEAR], 0, c))
                rid += 1
                new.append(c)
            report.setdefault(subrace, {})[sex] = {'new': new, 'already_offered': sorted(set(same.values())), 'dark_skipped': dark,
                                                   }
            print(f'{subrace} {sex}: {len(new)} new colours {new}, {len(same)} already offered as {sorted(set(same.values()))}, '
                  f'dark (skipped) {dark}, '
                  f'faces from our own')
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
