#!/usr/bin/env python3
"""
F-011 pipeline fix: skinning_loot_template + pickpocketing_loot_template.

migrate_creatures.py hard-set skinloot=pickpocketloot=0 AND load_dump.py didn't
even extract these tables (now added). Ports both for goblin creatures, converting
the old combined-column schema (ChanceOrQuestChance, mincountOrRef) to AC's
standard (Chance/QuestRequired, Reference/MinCount). Items absent from AC
item_template are skipped (port-or-skip). Sets creature_template.skinloot/
pickpocketloot. DELETE-by-entry clears stale stock rows. Idempotent.
"""
import sqlite3, subprocess, os
os.chdir('/workspace/project/Zeppelin-Craft')
c=sqlite3.connect("/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite")
def i(v,d=0):
  try:return int(str(v).strip())
  except:return d
def fl(v,d=0.0):
  try:return float(str(v).strip())
  except:return d
gob=set(i(r[0]) for r in c.execute("SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')"))
def valid_items(tbl, idset):
    items=set(i(r[0]) for r in c.execute(f"SELECT item FROM {tbl} WHERE CAST(TRIM(entry) AS INT) IN ({idset})") if i(r[0])>0)
    il=",".join(map(str,items)) or "0"
    out=subprocess.run(['python3','-m','cli.zep','world','sql','query',f"SELECT entry FROM item_template WHERE entry IN ({il})"],capture_output=True,text=True).stdout
    return set(int(x) for x in out.split() if x.strip().isdigit())

for kind,lootcol,tbl,fname in [("skin","skinloot","skinning_loot_template","zz_[F-011]_skinning_loot.sql"),
                               ("pick","pickpocketloot","pickpocketing_loot_template","zz_[F-011]_pickpocket_loot.sql")]:
    lootids={e:i(l) for e,l in ((i(r[0]),r[1]) for r in c.execute(f"SELECT CAST(TRIM(entry) AS INT), {lootcol} FROM creature_template")) if e in gob and i(l)>0}
    idset=",".join(map(str,set(lootids.values()))) or "0"
    have=valid_items(tbl, idset)
    rows=c.execute(f"SELECT entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount FROM {tbl} WHERE CAST(TRIM(entry) AS INT) IN ({idset})").fetchall()
    vals=[]
    for entry,item,coq,lm,gid,mcr,mx in rows:
        item=i(item); coq=fl(coq); mcr=i(mcr)
        ref = -mcr if mcr<0 else 0
        if ref==0 and item not in have: continue          # skip missing items (not references)
        chance = abs(coq); questreq = 1 if coq<0 else 0
        mincount = mcr if mcr>0 else 1
        vals.append(f"  ({i(entry)},{item},{ref},{chance:g},{questreq},{i(lm)},{i(gid)},{mincount},{i(mx,1)})")
    ents=sorted(set(lootids.values()))
    out=[f"-- [F-011] {tbl} from Neltharion (old->new loot schema). migrate_profession_loot.py.",
         f"-- Items absent from AC item_template skipped (port-or-skip). Idempotent.\n",
         f"DELETE FROM {tbl} WHERE Entry IN ({','.join(map(str,ents))});",
         f"INSERT INTO {tbl} (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES",
         ",\n".join(vals)+";",
         "",
         "\n".join(f"UPDATE creature_template SET {lootcol}={lid} WHERE entry={e};" for e,lid in sorted(lootids.items()))]
    open(f"zpaks/zep-goblin-start/sql/{fname}","w").write("\n".join(out)+"\n")
    print(f"{kind}: {len(lootids)} creatures, {len(vals)} loot rows emitted")
