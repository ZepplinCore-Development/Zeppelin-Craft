#!/usr/bin/env python3
"""
F-011 pipeline fix: creature_immunities (from mechanic_immune_mask) +
creature_template_movement (from InhabitType). migrate_creatures.py dropped both.

Immunities: one creature_immunities row per distinct goblin mechanic_immune_mask
(ID block 91100+), MechanicsMask=mask; creature_template.CreatureImmunitiesId
repointed. Restores boss CC-immunity.
Movement: InhabitType bits -> Ground(1)/Swim(2)/Flight(4=DisableGravity, keeps
air units at spawn Z). Emitted for non-default (not 0/3) InhabitType. Idempotent.
"""
import sqlite3, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
os.chdir('/workspace/project/Zeppelin-Craft')
SRC="/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite"
c=sqlite3.connect(SRC)
def i(v,d=0):
  try:return int(str(v).strip())
  except:return d
gob=set(i(r[0]) for r in c.execute("SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')"))
imm={}; move=[]
for e,mm,it in c.execute("SELECT CAST(TRIM(entry) AS INT), mechanic_immune_mask, InhabitType FROM creature_template"):
    if e not in gob: continue
    if i(mm)!=0: imm.setdefault(i(mm),[]).append(e)
    it=i(it)
    if it not in (0,3): move.append((e, 1 if it&1 else 0, 1 if it&2 else 0, 1 if it&4 else 0))
base=91100
L=["-- [F-011] creature_immunities from mechanic_immune_mask. migrate_immunities_movement.py.\n"]
for idx,(mask,ents) in enumerate(sorted(imm.items())):
    iid=base+idx
    L.append(f"DELETE FROM creature_immunities WHERE ID={iid};")
    L.append(f"INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES ({iid},0,0,{mask},0,0,0,0,'F-011 goblin boss immunities 0x{mask:X}');")
    L.append(f"UPDATE creature_template SET CreatureImmunitiesId={iid} WHERE entry IN ({','.join(map(str,sorted(ents)))});")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_creature_immunities.sql","w").write("\n".join(L)+"\n")
ents=[m[0] for m in move]
M=["-- [F-011] creature_template_movement from InhabitType. migrate_immunities_movement.py.\n",
   f"DELETE FROM creature_template_movement WHERE CreatureId IN ({','.join(map(str,sorted(ents)))});",
   "INSERT INTO creature_template_movement (CreatureId,Ground,Swim,Flight) VALUES"]
M.append(",\n".join(f"  ({e},{g},{s},{fl})" for e,g,s,fl in sorted(move))+";")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_creature_movement.sql","w").write("\n".join(M)+"\n")
print(f"immunities {len(imm)} masks / movement {len(move)} entries")
