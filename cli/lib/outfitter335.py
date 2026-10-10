"""F-216: the Display editor's 3.3.5 outfitter - item displays per slot + what the browser needs to
composite a bake live (lib/wardrobe/compositor.py, ported to the page).

  data/v2/outfit335/<slot>.json  {'items': [[idi, name, icon, [geoset groups x3], {region: stem},
                                             left model, right model, left tex, right tex, helm vis m, helm vis f]],
                                  'hgvd': {id: [hair, facial1, facial2, facial3, ears masks]}}
  data/v2/outfit335/files.json   {client path: cas name} - every item TextureComponents file the slots
                                 reference (all genders) and every helm / shoulder model, skin and texture
  per character display (customise.json 'char'): 'cs' - the CharSections layers of its appearance
  (skin, face, facial hair per style, scalp per hair style, underwear) as cas names.

Item displays come from the stock DBC, plus ours (custom rows) when present in the live DBC; a slot
lists the displays real items of that slot use, and those NPC bake rows wear in that slot.
"""
import json
import struct
from pathlib import Path
from typing import Callable, Dict, List

SLOT_INV = {'helm': (1,), 'shoulders': (3,), 'shirt': (4,), 'chest': (5, 20), 'belt': (6,), 'legs': (7,),
            'boots': (8,), 'wrists': (9,), 'gloves': (10,), 'tabard': (19,), 'cape': (16,)}
CDX_COL = {'helm': 'helm_id', 'shoulders': 'shoulders_id', 'shirt': 'shirt_id', 'chest': 'chest_id', 'belt': 'belt_id',
           'legs': 'legs_id', 'boots': 'boots_id', 'wrists': 'wrists_id', 'gloves': 'gloves_id', 'tabard': 'tabard_id',
           'cape': 'cape_id'}
REGION_COL = ['ArmUpper', 'ArmLower', 'Hand', 'TorsoUpper', 'TorsoLower', 'LegUpper', 'LegLower', 'Foot']   # DBC 15..22
REGION_DIR = {'ArmUpper': 'armuppertexture', 'ArmLower': 'armlowertexture', 'Hand': 'handtexture',
              'TorsoUpper': 'torsouppertexture', 'TorsoLower': 'torsolowertexture', 'LegUpper': 'leguppertexture',
              'LegLower': 'leglowertexture', 'Foot': 'foottexture'}


def _dbc(path: Path, strings_at=()):
    data = path.read_bytes()
    n, fc, rs, _ = struct.unpack_from('<4I', data, 4)
    st = data[20 + n * rs:]
    out = []
    for i in range(n):
        r = list(struct.unpack_from(f'<{fc}I', data, 20 + i * rs))
        for k in strings_at:
            r[k] = st[r[k]:st.index(b'\0', r[k])].decode('latin-1')
        out.append(r)
    return out


def build(dep, v2: Path, log: Callable = print) -> Dict[str, dict]:
    from lib import model_viewer_deploy as mvd
    from lib.npc_outfit import Outfits
    idx = dep.ix.stock
    rows = _dbc(mvd._dbc_path('ItemDisplayInfo.dbc'), (1, 2, 3, 4, 5, 15, 16, 17, 18, 19, 20, 21, 22))
    idi = {r[0]: r for r in rows}
    _, _, hgvd = mvd._load_item_lookups()
    items = Outfits(idx, dep.ix._meta_cache(), log).items()        # displayid -> [(entry, name, inv)]
    inv_slot = {i: s for s, invs in SLOT_INV.items() for i in invs}
    by_slot: Dict[str, Dict[int, str]] = {s: {} for s in SLOT_INV}
    for did, its in items.items():
        for e, name, inv in its:
            if inv in inv_slot and did in idi:
                by_slot[inv_slot[inv]].setdefault(did, name)
    # displays NPC bakes wear (many have no item)
    for cdx in (dep.result['stock_char_dbc'][0], dep.result['effective_char_dbc'][0]):
        for x in cdx.values():
            for s, col in CDX_COL.items():
                v = int(x.get(col) or 0)
                if v in idi and v not in by_slot[s]:
                    r = idi[v]
                    by_slot[s][v] = next((t for t in r[15:23] if t), '') or (r[1].rsplit('.', 1)[0] if r[1] else f'display {v}')
    files: Dict[str, str] = {}

    def put(path: str):
        if path in files:
            return True
        f = idx.get(path) or dep.result['effective_assets'].get(path)
        if f is None:
            return False
        files[path] = dep.store.put(f)
        return True
    out_dir = v2 / 'outfit335'
    out_dir.mkdir(parents=True, exist_ok=True)
    total = 0
    for s, dids in by_slot.items():
        lst = []
        for did, name in dids.items():
            r = idi[did]
            regions = {}
            for k, stem in zip(REGION_COL, r[15:23]):
                if stem:
                    regions[k] = stem.lower()
                    for g in ('u', 'f', 'm'):
                        put(f'item/texturecomponents/{REGION_DIR[k]}/{stem.lower()}_{g}.blp')
            lm, rm = (r[1] or '').rsplit('.', 1)[0].lower(), (r[2] or '').rsplit('.', 1)[0].lower()
            lt, rt = (r[3] or '').lower(), (r[4] or '').lower()
            if s == 'shoulders':
                for m, t in ((lm, lt), (rm, rt)):
                    if m:
                        put(f'item/objectcomponents/shoulder/{m}.m2'); put(f'item/objectcomponents/shoulder/{m}00.skin')
                    if t:
                        put(f'item/objectcomponents/shoulder/{t}.blp')
            if s == 'helm' and lm:
                for p in [k for k in idx if k.startswith(f'item/objectcomponents/head/{lm}_')]:
                    put(p)
                if lt:
                    put(f'item/objectcomponents/head/{lt}.blp')
            lst.append([did, name, r[5], list(r[7:10]), regions, lm, rm, lt, rt, r[13], r[14]])
        lst.sort(key=lambda e: e[1].lower())
        (out_dir / f'{s}.json').write_text(json.dumps({'items': lst}, separators=(',', ':')))
        total += len(lst)
    (out_dir / 'hgvd.json').write_text(json.dumps({str(k): v for k, v in hgvd.items()}, separators=(',', ':')))
    (out_dir / 'files.json').write_text(json.dumps(files, separators=(',', ':')))
    log(f'  outfitter 3.3.5: {total:,} item displays in {len(by_slot)} slots, {len(files):,} files')
    return files


def char_layers(dep, x: dict, chs: Dict[int, dict]) -> dict:
    """The CharSections layers of one appearance, as cas names, for the page's compositor:
    {'skin', 'face': [lower, upper], 'facial': {style: [lower, upper]}, 'scalp': {style: [lower, upper]},
     'underwear': [legupper, torsoupper]} (lib/wardrobe/compositor.compose's layer table)."""
    race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
    sc, face, hc = int(x.get('skin_color') or 0), int(x.get('face_type') or 0), int(x.get('hair_color') or 0)
    rows = [r for r in chs.values() if int(r.get('race') or 0) == race and int(r.get('gender') or 0) == sex]

    def put(name):
        if not name:
            return ''
        p = str(name).replace('\\', '/').lower()
        f = dep.ix.stock.get(p) or dep.result['effective_assets'].get(p)
        return dep.store.put(f) if f is not None else ''

    def pick(base, typ, color):
        for r in rows:
            if int(r.get('base_section') or 0) == base and int(r.get('type') or 0) == typ and int(r.get('color_index') or 0) == color:
                return r
        return None
    out = {}
    s = pick(0, 0, sc)
    out['skin'] = put((s or {}).get('texture_1'))
    f = pick(1, face, sc)
    out['face'] = [put((f or {}).get('texture_1')), put((f or {}).get('texture_2'))]
    u = pick(4, 0, sc)
    out['underwear'] = [put((u or {}).get('texture_1')), put((u or {}).get('texture_2'))]
    # every skin colour (and its underwear) of the race / sex: a rebake keeps the ORIGINAL bake and
    # repaints only the regions an outfit change touches, in the colour that matches the bake's bare skin
    # (pack bakes are often painted off-row: display 93's row says colour 9, its bake is far paler)
    out['skins'], out['under'] = {}, {}
    for r in rows:
        b, v, c = int(r.get('base_section') or 0), int(r.get('type') or 0), int(r.get('color_index') or 0)
        if b == 0 and v == 0 and str(c) not in out['skins']:
            out['skins'][str(c)] = put(r.get('texture_1'))
        if b == 4 and v == 0 and str(c) not in out['under']:
            out['under'][str(c)] = [put(r.get('texture_1')), put(r.get('texture_2'))]
    out['color'] = sc
    out['facial'], out['scalp'] = {}, {}
    for r in rows:
        b, v, c = int(r.get('base_section') or 0), int(r.get('type') or 0), int(r.get('color_index') or 0)
        if b == 2 and c == hc:
            out['facial'][str(v)] = [put(r.get('texture_1')), put(r.get('texture_2'))]
        if b == 3 and c == hc:
            out['scalp'][str(v)] = [put(r.get('texture_2')), put(r.get('texture_3'))]
    return out
