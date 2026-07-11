#!/usr/bin/env python3
"""Append a list of new custom items to item_remap (stable) + emit item_template.
Env: F011_NEW_ITEMS (json path), F011_SFX (output suffix)."""
import csv, json, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
SFX = os.environ.get("F011_SFX", "")
NEW = json.load(open(os.environ["F011_NEW_ITEMS"]))
remap = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "item_remap.json"))).items()}
nextid = max(remap.values()) + 1
for cata in sorted(NEW):
    if cata not in remap:
        remap[cata] = nextid; nextid += 1
json.dump({str(k): v for k, v in remap.items()}, open(os.path.join(SCRATCH, "item_remap.json"), "w"))

meta = {}
with open(os.path.join(SCRATCH, "item_442.csv"), newline='', encoding='utf-8') as f:
    for r in csv.DictReader(f):
        try: i = int(r['ID'])
        except: continue
        if i in NEW: meta[i] = r
def gi(r, k, d=0):
    try: return int(float(r.get(k, d) or d))
    except: return d
def gf(r, k, d=0.0):
    try: return float(r.get(k, d) or d)
    except: return d
def esc(v):
    if v is None: return "NULL"
    if isinstance(v, str): return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float): return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)

rows = []
with open(os.path.join(SCRATCH, "itemsparse_442.csv"), newline='', encoding='utf-8') as f:
    for s in csv.DictReader(f):
        try: cata = int(s['ID'])
        except: continue
        if cata not in NEW: continue
        m = meta.get(cata, {}); newid = remap[cata]
        col = {"entry": newid, "class": gi(m, 'ClassID'), "subclass": gi(m, 'SubclassID'),
               "SoundOverrideSubclass": -1, "name": (s.get('Display_lang') or '').strip(), "displayid": 0,
               "Quality": gi(s, 'OverallQualityID'), "Flags": 0, "FlagsExtra": 0,
               "BuyCount": max(gi(s, 'VendorStackCount', 1), 1), "BuyPrice": gi(s, 'BuyPrice'), "SellPrice": gi(s, 'SellPrice'),
               "InventoryType": gi(s, 'InventoryType') or gi(m, 'InventoryType'),
               "AllowableClass": gi(s, 'AllowableClass', -1) or -1, "AllowableRace": gi(s, 'AllowableRace', -1) or -1,
               "ItemLevel": gi(s, 'ItemLevel'), "RequiredLevel": gi(s, 'RequiredLevel'),
               "maxcount": gi(s, 'MaxCount'), "stackable": max(gi(s, 'Stackable', 1), 1), "ContainerSlots": gi(s, 'ContainerSlots')}
        for n in range(1, 11):
            st = gi(s, 'StatModifier_bonusStat_%d' % (n-1)); sv = gi(s, 'StatModifier_bonusAmount_%d' % (n-1))
            if st < 0 or st > 255: st, sv = 0, 0
            col["stat_type%d" % n] = st; col["stat_value%d" % n] = sv
        col["dmg_min1"] = gf(s, 'MinDamage_0'); col["dmg_max1"] = gf(s, 'MaxDamage_0'); col["dmg_type1"] = gi(s, 'DamageType')
        col["bonding"] = gi(s, 'Bonding'); col["description"] = (s.get('Description_lang') or '').strip()
        col["Material"] = gi(s, 'Material') or gi(m, 'Material'); col["sheath"] = gi(s, 'SheatheType') or gi(m, 'SheatheType')
        col["BagFamily"] = gi(s, 'BagFamily'); col["startquest"] = gi(s, 'StartQuestID')
        col["RequiredDisenchantSkill"] = -1; col["duration"] = gi(s, 'DurationInInventory')
        rows.append((newid, cata, col))
rows.sort()
with open(os.path.join(ZPAK, "sql/zz_[F-011]%s_items.sql" % SFX), "w") as f:
    f.write("-- F-011 custom items (wago ItemSparse 4.4.2, appended). Icons deferred.\n\n")
    for newid, cata, col in rows:
        f.write("-- Cata %d -> %d (%s)\n" % (cata, newid, col["name"]))
        f.write("DELETE FROM item_template WHERE entry = %d;\n" % newid)
        f.write("INSERT INTO item_template SET " + ", ".join("`%s`=%s" % (k, esc(v)) for k, v in col.items()) + ";\n\n")
print("appended %d items -> %d..%d" % (len(rows), min(remap[i] for i in NEW), max(remap[i] for i in NEW)))
