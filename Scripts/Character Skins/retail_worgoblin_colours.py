"""F-230 phase 2: retail's newer goblin and worgen skin / fur colours on our Cataclysm-era models.

Retail added goblin skin colours (Shadowlands) and worgen fur colours (Shadowlands, 10.1.5), but paints
them only in the 1024x512 layout of its HD goblin / worgen models. Our models use the classic 512x512
layout, which retail also still ships for the old colours. So each new colour is carried over by fit:

  1. retail HD body atlas of the new colour N, and of each colour k we already offer
  2. k = the colour whose retail HD body is nearest in tone to N
  3. quadratic RGB map fitted from retail HD body k to retail HD body N (pixel-aligned atlases)
  4. every CharSections texture of our colour k (body, _Extra, faces of every type, underwear) put
     through that map; only skin/fur-like pixels change, so eyes and DK glow keep their paint (F-222)

The colours come from ChrCustomizationChoice (retail option "Skin Color" / "Fur Color"); transmog-only
choices and the NPC colours are skipped. Retail DB2 csv is read from wago.tools, textures from the local
CASC store (zep model retail-casc).

Writes zpaks/zep-skin-expansion/dbc/[AUTO,F-230]_charsections_retail.sql (ids from ID_BASE) and the
textures under zpaks/zep-skin-expansion/mpq/source-assets/ (names <stem>_zr<colour>.blp).

  python3 "Scripts/Character Skins/retail_worgoblin_colours.py"
"""
import collections
import importlib.util
import struct
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS  # noqa: E402
from lib import casc_store, retail  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402
from cli.lib.blp_image import decode_blp_rgb  # noqa: E402

_spec = importlib.util.spec_from_file_location('gfx', Path(__file__).with_name('gnome_female_extra_skins.py'))
gfx = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(gfx)

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
SQL = ZPAK / 'dbc' / '[AUTO,F-230]_charsections_retail.sql'
OURS = Path('/workspace/project/data/dbc/CharSections.dbc')
ID_BASE = 60000
# our race -> (retail race, {sex: retail customization option})
RACES = {9: (9, {0: 100, 1: 105}), 12: (22, {0: 203, 1: 208})}
BODY_TARGET = '1'           # ChrModelTextureTarget of the body atlas
COLS = ('id', 'race', 'gender', 'base', 't1', 't2', 't3', 'flags', 'type', 'color')


def load_dbc(path):
    b = Path(path).read_bytes()
    n, _fc, rs, _ss = struct.unpack('<4I', b[4:20])
    st = b[20 + n * rs:]

    def s(o):
        return st[o:st.index(b'\0', o)].decode('latin1')
    return [dict(zip(COLS, (f[0], f[1], f[2], f[3], s(f[4]), s(f[5]), s(f[6]), f[7], f[8], f[9])))
            for f in (struct.unpack_from('<10I', b, 20 + i * rs) for i in range(n))]


def retail_bodies(option):
    """[(order index, body atlas fdid, is_transmog)] for one retail skin / fur option."""
    choices = [c for c in retail._csv('ChrCustomizationChoice') if c['ChrCustomizationOptionID'] == str(option)]
    ids = {c['ID'] for c in choices}
    elems = collections.defaultdict(list)
    for e in retail._csv('ChrCustomizationElement'):
        if e['ChrCustomizationChoiceID'] in ids:
            elems[e['ChrCustomizationChoiceID']].append(e['ChrCustomizationMaterialID'])
    mats = {m['ID']: m for m in retail._csv('ChrCustomizationMaterial')}
    want = {mats[m]['MaterialResourcesID'] for es in elems.values() for m in es
            if m in mats and mats[m]['ChrModelTextureTargetID'] == BODY_TARGET}
    tex = {t['MaterialResourcesID']: int(t['FileDataID']) for t in retail._csv('TextureFileData')
           if t['MaterialResourcesID'] in want}
    out = []
    for c in choices:
        body = [tex[mats[m]['MaterialResourcesID']] for m in elems[c['ID']]
                if m in mats and mats[m]['ChrModelTextureTargetID'] == BODY_TARGET and mats[m]['MaterialResourcesID'] in tex]
        if body:
            out.append((int(c['OrderIndex']), body[0], c['Name_lang'] == 'Transmog'))
    return sorted(out)


def rgb(path):
    return decode_blp_rgb(str(path)).astype(float)


def keep_map(px):
    """Distance (4-level RGB bins) from any colour to a set of body pixels."""
    g = np.zeros((64, 64, 64), bool)
    g[tuple(np.unique((px // 4).astype(int), axis=0).T)] = True
    d = np.full(g.shape, 99.0)
    d[g] = 0
    cur = g.copy()
    for step in range(1, 12):
        n = cur.copy()
        for ax in range(3):
            n |= np.roll(cur, 1, ax)
            n |= np.roll(cur, -1, ax)
        d[n & ~cur] = step * 4
        cur = n
    return d


def main():
    feats, write_blp = gfx.feats, gfx.write_blp
    ours = load_dbc(OURS)
    files = FileResolver([ASSETS] + [r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])
    rows, nid = [], ID_BASE
    for race, (rrace, options) in RACES.items():
        for g, option in options.items():
            mine = collections.defaultdict(dict)       # colour -> {(base, type): row}, highest id wins
            for r in sorted(ours, key=lambda r: r['id']):
                if r['race'] == race and r['gender'] == g and r['base'] in (0, 1, 4):
                    mine[r['color']][(r['base'], r['type'])] = r
            playable = sorted(c for c, rs in mine.items() if (0, 0) in rs and rs[(0, 0)]['flags'] & 1 and (4, 0) in rs)
            bodies = retail_bodies(option)
            by_order = {o: fd for o, fd, _ in bodies}
            known = [k for k in playable if k in by_order and casc_store.path(by_order[k])]
            new = [(o, fd) for o, fd, tm in bodies if not tm and o not in mine and o > max(playable)]
            hd = {k: rgb(casc_store.path(by_order[k])) for k in known}
            colour = max(mine) + 1
            for o, fd in new:
                p = casc_store.path(fd)
                if p is None:
                    print(f'  race {race} g {g}: retail colour {o} fdid {fd} not in the CASC store - skipped')
                    continue
                tgt = rgb(p)
                k = min(known, key=lambda k: np.abs(hd[k].mean((0, 1)) - tgt.mean((0, 1))).sum())
                a, b = hd[k].reshape(-1, 3), tgt.reshape(-1, 3)
                w, *_ = np.linalg.lstsq(feats(a), b, rcond=None)
                err = np.abs(np.clip(feats(a) @ w, 0, 255) - b).mean()
                ours_body = rgb(files.find(mine[k][(0, 0)]['t1']))
                dist = keep_map(ours_body.reshape(-1, 3))
                made = 0
                for (base, typ), r in sorted(mine[k].items()):
                    out = dict(r, color=colour, id=nid)
                    nid += 1
                    for col in ('t1', 't2', 't3'):
                        if not r[col]:
                            continue
                        f = files.find(r[col])
                        if f is None:
                            out[col] = r[col]
                            continue
                        im = rgb(f)
                        bins = (im // 4).astype(int).clip(0, 63)
                        keep = np.clip(1 - (dist[bins[..., 0], bins[..., 1], bins[..., 2]] - 12) / 24, 0, 1)[..., None]
                        res = keep * np.clip(feats(im) @ w, 0, 255) + (1 - keep) * im
                        name = r[col][:-4] + f'_zr{colour}.blp'
                        dst = ASSETS / name.replace('\\', '/')
                        dst.parent.mkdir(parents=True, exist_ok=True)
                        write_blp(str(dst), res)
                        out[col] = name
                        made += 1
                    rows.append(out)
                print(f'race {race} g {g}: retail colour {o} -> our colour {colour} from our {k} '
                      f'(fit error {err:.1f}/255, {made} textures)')
                colour += 1

    q = lambda s: "'" + s.replace('\\', '\\\\').replace("'", "''") + "'"
    lines = ['-- F-230 Expanded Character Skin Options: retail goblin / worgen colours on our classic-layout models.',
             '-- GENERATED by Scripts/Character Skins/retail_worgoblin_colours.py - do not edit, re-run the script.',
             f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_BASE + 9999};']
    if rows:
        lines.append('INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, '
                     'flags, type, color_index) VALUES')
        lines.append(',\n'.join(f"({r['id']}, {r['race']}, {r['gender']}, {r['base']}, {q(r['t1'])}, {q(r['t2'])}, "
                                f"{q(r['t3'])}, {r['flags']}, {r['type']}, {r['color']})" for r in rows) + ';')
    SQL.write_text('\n'.join(lines) + '\n')
    print(f'{len(rows)} rows -> {SQL.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
