#!/usr/bin/env python3
"""
F-011 vendors: import 36 new vendor items (wago ItemSparse) appended to the reserved
block (stable remap), + npc_vendor rows. Items remapped custom->84424+.
"""
import csv, json, os, sqlite3
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"

remap = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "item_remap.json"))).items()}
SFX=os.environ.get("F011_SFX","")
new_items = json.load(open(os.environ.get("F011_VENDOR_NEW", os.path.join(SCRATCH, "vendor_new_items.json"))))
nextid = max(remap.values()) + 1
for cata in sorted(new_items):
    if cata not in remap:
        remap[cata] = nextid; nextid += 1
json.dump({str(k): v for k, v in remap.items()}, open(os.path.join(SCRATCH, "item_remap.json"), "w"))
print("appended %d vendor items -> %d..%d" % (len(new_items), min(remap[i] for i in new_items), max(remap[i] for i in new_items)))

# ---- item_template for the 36 new (compact translation, reuse migrate_items mapping) ----
item_meta = {}
with open(os.path.join(SCRATCH, "item_442.csv"), newline='', encoding='utf-8') as f:
    for r in csv.DictReader(f):
        try: i = int(r['ID'])
        except: continue
        if i in new_items: item_meta[i] = r
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
        if cata not in new_items: continue
        m = item_meta.get(cata, {}); newid = remap[cata]
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
        col["BagFamily"] = gi(s, 'BagFamily'); col["stackable"] = max(gi(s, 'Stackable', 1), 1)
        col["startquest"] = gi(s, 'StartQuestID'); col["RequiredDisenchantSkill"] = -1; col["duration"] = gi(s, 'DurationInInventory')
        rows.append((newid, cata, col))
rows.sort()
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_items_vendor.sql"), "w") as f:
    f.write("-- F-011 vendor items (wago ItemSparse 4.4.2, appended 84424+). Icons deferred.\n\n")
    for newid, cata, col in rows:
        f.write("-- Cata %d -> %d (%s)\n" % (cata, newid, col["name"]))
        f.write("DELETE FROM item_template WHERE entry = %d;\n" % newid)
        f.write("INSERT INTO item_template SET " + ", ".join("`%s`=%s" % (k, v_) for k, v_ in ((k, esc(v)) for k, v in col.items())) + ";\n\n")

# ---- npc_vendor ----
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
scope = json.load(open(os.path.join(SCRATCH, "vendor_scope%s.json" % SFX)))
vendors = scope["vendors"]
vrows = []
for e in vendors:
    for r in c.execute("SELECT * FROM npc_vendor WHERE TRIM(entry)=? ORDER BY CAST(slot AS INT)", (str(e),)):
        it = int(r["item"] or 0)
        if it <= 0: continue
        vrows.append((e, gi(r, "slot"), remap.get(it, it), gi(r, "maxcount"), gi(r, "incrtime"), gi(r, "ExtendedCost")))
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_vendors.sql"), "w") as f:
    f.write("-- F-011 Lost Isles vendor inventories (npc_vendor; custom items remapped)\n\n")
    f.write("DELETE FROM npc_vendor WHERE entry IN (%s);\n" % ",".join(str(e) for e in sorted(set(vendors))))
    f.write("INSERT INTO npc_vendor (entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) VALUES\n")
    f.write(",\n".join("  (%d,%d,%d,%d,%d,%d,0)" % v for v in vrows) + ";\n")
print("vendor items: %d, npc_vendor rows: %d across %d vendors" % (len(rows), len(vrows), len(set(v[0] for v in vrows))))
