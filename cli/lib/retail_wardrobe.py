"""F-216: the Display editor's outfitter browser - retail armour per slot, one entry per appearance.

data/v2/wardrobe/<slot>.json = [[item id, name, icon FileDataID, armour subclass, appearance id,
ItemDisplayInfo id, [geoset groups x3], {region: [male fdid, female fdid]}], ...] - the display id names
Wowhead's pre-rendered 3D snapshot (webthumbs); geosets + region textures let the Display editor draw the
item into a bake live (the classic 256 layout's regions; retail's textures are 2x, scaled down).
from wago.tools DB2 (Item, ItemSearchName, ItemModifiedAppearance, ItemAppearance) for the current
retail build, cached per build (logs/retail_cache/wardrobe_<build>.pkl). The outfit fields take
retail item ids because the F-198 wardrobe builds the bake from retail items.
"""
import json
import pickle
from pathlib import Path
from typing import Callable, Dict, List

SLOTS = {'Helm': (1,), 'Shoulders': (3,), 'Shirt': (4,), 'Chest': (5, 20), 'Belt': (6,), 'Legs': (7,),
         'Boots': (8,), 'Wrists': (9,), 'Gloves': (10,), 'Tabard': (19,), 'Cape': (16,)}
ARMOUR = {0: 'misc', 1: 'cloth', 2: 'leather', 3: 'mail', 4: 'plate', 5: 'cosmetic'}


REGIONS = ['ArmUpper', 'ArmLower', 'Hand', 'TorsoUpper', 'TorsoLower', 'LegUpper', 'LegLower', 'Foot']   # ComponentSection 0..7


def _display_textures(dids):
    """ItemDisplayInfo -> ([geoset groups x3], {region: [male fdid, female fdid]}) for the retail displays
    given: ItemDisplayInfoMaterialRes (display, section, material) -> TextureFileData (material -> files)
    -> ComponentTextureFileData (file -> gender 0 male / 1 female / 3 either, race 0 = any; a human-only
    file stands in when no any-race one exists)."""
    from lib import retail
    geo = {}
    for r in retail._csv('ItemDisplayInfo'):
        try:
            d = int(r['ID'])
            if d in dids:
                geo[d] = [int(r.get(f'GeosetGroup_{k}') or 0) for k in range(3)]
        except (KeyError, ValueError):
            continue
    mats: Dict[int, List[tuple]] = {}
    for r in retail._csv('ItemDisplayInfoMaterialRes'):
        try:
            d, sec, m = int(r['ItemDisplayInfoID']), int(r['ComponentSection']), int(r['MaterialResourcesID'])
        except (KeyError, ValueError):
            continue
        if d in dids and 0 <= sec < len(REGIONS):
            mats.setdefault(d, []).append((sec, m))
    want = {m for v in mats.values() for _, m in v}
    files: Dict[int, List[int]] = {}
    for r in retail._csv('TextureFileData'):
        try:
            m = int(r['MaterialResourcesID'])
            if m in want:
                files.setdefault(m, []).append(int(r['FileDataID']))
        except (KeyError, ValueError):
            continue
    allf = {f for v in files.values() for f in v}
    meta = {}
    for r in retail._csv('ComponentTextureFileData'):
        try:
            f = int(r['ID'])
            if f in allf:
                meta[f] = (int(r['GenderIndex']), int(r['RaceID']))
        except (KeyError, ValueError):
            continue
    out: Dict[int, dict] = {}
    for d, lst in mats.items():
        reg = {}
        for sec, m in lst:
            pick = [0, 0]
            for want_race in (0, 1):
                for f in files.get(m, []):
                    g, race = meta.get(f, (3, 0))
                    if race != want_race:
                        continue
                    for k in (0, 1):
                        if not pick[k] and g in (k, 3, 2):
                            pick[k] = f
            if any(pick):
                reg[REGIONS[sec]] = [pick[0] or pick[1], pick[1] or pick[0]]
        if reg:
            out[d] = reg
    return geo, out


def build(out_dir: Path, log: Callable = print) -> int:
    from lib import retail
    pk = retail.CACHE / f'wardrobe3_{retail.build()}.pkl'
    if pk.exists():
        data = pickle.loads(pk.read_bytes())
    else:
        inv_slot = {i: s for s, invs in SLOTS.items() for i in invs}
        items = {}
        for r in retail._csv('Item'):
            try:
                if int(r['ClassID']) != 4:
                    continue
                inv = int(r['InventoryType'])
                if inv in inv_slot:
                    items[int(r['ID'])] = (inv_slot[inv], int(r['SubclassID']), int(r['IconFileDataID'] or 0))
            except (KeyError, ValueError):
                continue
        names = {}
        for r in retail._csv('ItemSearchName'):
            try:
                if int(r['ID']) in items:
                    names[int(r['ID'])] = r['Display_lang']
            except (KeyError, ValueError):
                continue
        app_icon, app_idi = {}, {}
        for r in retail._csv('ItemAppearance'):
            try:
                app_icon[int(r['ID'])] = int(r['DefaultIconFileDataID'] or 0)
                app_idi[int(r['ID'])] = int(r['ItemDisplayInfoID'] or 0)
            except (KeyError, ValueError):
                continue
        seen: Dict[int, list] = {}
        for r in retail._csv('ItemModifiedAppearance'):
            try:
                iid, app, mod = int(r['ItemID']), int(r['ItemAppearanceID']), int(r['ItemAppearanceModifierID'])
            except (KeyError, ValueError):
                continue
            if iid not in items or not app or iid not in names:
                continue
            slot, sub, icon = items[iid]
            cur = seen.get(app)
            if cur is None or (mod == 0 and cur[6] != 0):      # one entry per appearance, base item first
                seen[app] = [iid, names[iid], icon or app_icon.get(app, 0), sub, app, app_idi.get(app, 0), mod, slot]
        geo, regions = _display_textures({e[5] for e in seen.values() if e[5]})
        data: Dict[str, List[list]] = {s: [] for s in SLOTS}
        for e in seen.values():
            data[e[7]].append(e[:6] + [geo.get(e[5], [0, 0, 0]), regions.get(e[5], {})])
        for s in data:
            data[s].sort(key=lambda e: -e[0])                   # newest items first
        retail.CACHE.mkdir(parents=True, exist_ok=True)
        pk.write_bytes(pickle.dumps(data))
    out_dir.mkdir(parents=True, exist_ok=True)
    for s, rows in data.items():
        (out_dir / f'{s.lower()}.json').write_text(json.dumps({'build': retail.build(), 'armour': ARMOUR, 'items': rows},
                                                              separators=(',', ':')))
    n = sum(len(v) for v in data.values())
    log(f'  wardrobe: {n:,} retail appearances in {len(data)} slots')
    return n
