#!/usr/bin/env python3
"""
F-011 pipeline fix: derive base armor for custom goblin armor items.

migrate_items.py hard-sets armor=0 (Cata computes armor from DBC by ilvl/quality/
slot; the wago ItemSparse pull has no usable armor value). This left 91 custom
armor pieces defenseless. We derive armor from STOCK WotLK item_template analogs:
for each custom piece, take the median armor of stock items with the same
(class, subclass, InventoryType) at the nearest ItemLevel. Armor in 3.3.5a is
driven by ilvl+slot+type (quality barely affects it), so this reproduces
Blizzlike values closely for the level 1-12 starter range.

Emits an idempotent zz_[F-011]_item_armor.sql (UPDATE per item). Re-runnable.
"""
import subprocess, json, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
os.chdir('/workspace/project/Zeppelin-Craft')
def q(sql):
    out = subprocess.run(['python3','-m','cli.zep','world','sql','query',sql],
                         capture_output=True, text=True).stdout
    rows=[]
    for i,line in enumerate(out.splitlines()):
        p=line.split('\t')
        if i==0 or not p or not p[0].strip(): continue
        rows.append(p)
    return rows

CUSTOM_LO, CUSTOM_HI = 84300, 84799
ARMOR_SLOTS = "(1,3,5,6,7,8,9,10,14)"  # head/shoulder/chest/waist/legs/feet/wrist/hands/shield

# 1. custom armor items needing derivation
items = q(f"SELECT entry,class,subclass,InventoryType,ItemLevel FROM item_template "
          f"WHERE entry BETWEEN {CUSTOM_LO} AND {CUSTOM_HI} AND class=4 "
          f"AND subclass IN (1,2,3,4,6) AND armor=0 AND InventoryType IN {ARMOR_SLOTS}")

# 2. stock analog table: (class,subclass,invtype,ilvl) -> avg armor  (exclude custom block)
stock = q(f"SELECT subclass,InventoryType,ItemLevel,ROUND(AVG(armor)) FROM item_template "
          f"WHERE class=4 AND armor>0 AND entry NOT BETWEEN {CUSTOM_LO} AND {CUSTOM_HI} "
          f"AND subclass IN (1,2,3,4,6) AND InventoryType IN {ARMOR_SLOTS} "
          f"GROUP BY subclass,InventoryType,ItemLevel")
lookup={}
for sc,it,ilvl,arm in stock:
    lookup.setdefault((int(sc),int(it)),{})[int(ilvl)]=int(float(arm))

updates=[]; missing=[]
for entry,cls,sc,it,ilvl in items:
    entry,sc,it,ilvl=int(entry),int(sc),int(it),int(ilvl)
    table=lookup.get((sc,it))
    if not table: missing.append((entry,sc,it,ilvl)); continue
    nearest=min(table, key=lambda L: abs(L-ilvl))   # nearest stock ilvl
    updates.append((entry, table[nearest], sc, it, ilvl, nearest))

lines=["-- [F-011] Derive base armor for custom goblin armor items (migrate_items.py sets armor=0).",
       "-- Armor derived from stock WotLK item_template analogs by (subclass,InventoryType) at nearest",
       "-- ItemLevel (armor is ilvl+slot+type driven in 3.3.5a). Regenerate with derive_item_armor.py.",
       "-- Idempotent; stock rows untouched.\n"]
for entry,arm,sc,it,ilvl,near in sorted(updates):
    lines.append(f"UPDATE item_template SET armor={arm} WHERE entry={entry};  -- sc{sc} inv{it} ilvl{ilvl}~stock{near}")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_item_armor.sql","w").write("\n".join(lines)+"\n")
print(f"derived armor for {len(updates)} items | no-analog: {len(missing)} {missing[:5]}")
