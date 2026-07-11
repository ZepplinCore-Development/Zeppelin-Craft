#!/usr/bin/env python3
"""
F-011 pipeline fix: migrate creature_equip_template (NPC weapons/held items).

migrate_creatures.py hard-set equipment_id=0, so 137 goblin NPCs are unarmed.
Source schema is entry-keyed (entry,itemEntry1..3 -> one set). AC is (CreatureID,
ID,ItemID1..3). We emit ID=1 and set creature_template.equipment_id=1. Per the
port-or-skip rule, any itemEntry absent from AC item_template (17 Cata-only
weapons) is zeroed rather than emitted as a dangling ref (invisible-weapon /
possible display fault). Creatures left with no valid item are skipped.
Idempotent. Emits zz_[F-011]_creature_equip.sql. TODO: substitute the 17 missing
Cata weapons with stock analogs for full fidelity.
"""
import sqlite3, subprocess, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
os.chdir('/workspace/project/Zeppelin-Craft')
c=sqlite3.connect("/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite")
def i(v,d=0):
  try:return int(str(v).strip())
  except:return d
gob=[i(r[0]) for r in c.execute("SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')")]
gset=",".join(map(str,gob))
rows=c.execute(f"SELECT CAST(TRIM(entry) AS INT),itemEntry1,itemEntry2,itemEntry3 FROM creature_equip_template WHERE CAST(TRIM(entry) AS INT) IN ({gset})").fetchall()
items=set()
for e,a,b,d in rows:
  for v in (a,b,d):
    if i(v)>0: items.add(i(v))
il=",".join(map(str,items))
present=subprocess.run(['python3','-m','cli.zep','world','sql','query',f"SELECT entry FROM item_template WHERE entry IN ({il})"],capture_output=True,text=True).stdout
have=set(int(x) for x in present.split() if x.strip().isdigit())
emit=[]
for e,a,b,d in sorted(rows):
  it=[i(a) if i(a) in have else 0, i(b) if i(b) in have else 0, i(d) if i(d) in have else 0]
  if any(it): emit.append((e,it))
ents=[e for e,_ in emit]
out=["-- [F-011] creature_equip_template (NPC weapons) from Neltharion. equipment_id=1 per creature.",
     "-- Cata items absent from AC item_template zeroed (port-or-skip). Regenerate: migrate_equipment.py.\n",
     f"DELETE FROM creature_equip_template WHERE CreatureID IN ({','.join(map(str,ents))});",
     "INSERT INTO creature_equip_template (CreatureID,ID,ItemID1,ItemID2,ItemID3,VerifiedBuild) VALUES"]
out.append(",\n".join(f"  ({e},1,{it[0]},{it[1]},{it[2]},0)" for e,it in emit)+";")
out.append(f"\nUPDATE creature SET equipment_id=1 WHERE guid BETWEEN 11000000 AND 12999999 AND id IN ({','.join(map(str,ents))});")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_creature_equip.sql","w").write("\n".join(out)+"\n")
print(f"armed {len(emit)} creatures ({len(have)}/{len(items)} items valid, {len(items)-len(have)} Cata items zeroed)")
