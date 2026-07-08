#!/usr/bin/env python3
"""
F-011 pipeline fix: migrate creature_template_addon (auras/mount/bytes/emote).

migrate_creatures.py never emitted addon rows, so goblin NPCs lost permanent
visual auras, mount displays, and stand/sheath/emote states; and stale STOCK
addon rows survived on collided entry IDs. This ports the entry-keyed source
creature_template_addon and (via DELETE-by-entry) also clears the stock
remnants. auras (space-separated spell list) validated against Spell.dbc —
Cata-only spells dropped (port-or-skip). path_id forced to 0 (waypoints not
ported; a dangling path breaks movement). Per-spawn creature_addon (guid-keyed)
deferred — needs source->AC guid mapping. Idempotent. Emits
zz_[F-011]_creature_template_addon.sql.
"""
import sqlite3, struct, os
os.chdir('/workspace/project/Zeppelin-Craft')
c=sqlite3.connect("/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite")
def i(v,d=0):
  try:return int(str(v).strip())
  except:return d
# spells present in client Spell.dbc
f=open('/workspace/project/data/dbc/Spell.dbc','rb').read()
rec,rs=struct.unpack('<i',f[4:8])[0],struct.unpack('<i',f[12:16])[0]
spells=set();off=20
for _ in range(rec): spells.add(struct.unpack('<i',f[off:off+4])[0]); off+=rs
gob=[i(r[0]) for r in c.execute("SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')")]
gset=",".join(map(str,gob))
rows=c.execute(f"SELECT entry,mount,bytes1,bytes2,emote,distance_visibility,auras FROM creature_template_addon WHERE CAST(TRIM(entry) AS INT) IN ({gset})").fetchall()
emit=[]; dropped=0
for entry,mount,b1,b2,emote,vis,auras in rows:
    valid=[str(s) for s in (i(x) for x in str(auras).split()) if s in spells]
    dropped += len(str(auras).split())-len(valid)
    emit.append((i(entry), i(mount), i(b1), i(b2), i(emote), i(vis), " ".join(valid)))
ents=[e[0] for e in emit]
out=["-- [F-011] creature_template_addon (auras/mount/bytes/emote) from Neltharion.",
     "-- auras validated vs Spell.dbc (Cata-only dropped); path_id=0 (waypoints deferred).",
     "-- DELETE-by-entry also clears stale stock addon rows on collided IDs. migrate_creature_addon.py.\n",
     f"DELETE FROM creature_template_addon WHERE entry IN ({','.join(map(str,ents))});",
     "INSERT INTO creature_template_addon (entry,path_id,mount,bytes1,bytes2,emote,visibilityDistanceType,auras) VALUES"]
out.append(",\n".join(f"  ({e},0,{mt},{b1},{b2},{em},{vis},'{au}')" for e,mt,b1,b2,em,vis,au in emit)+";")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_creature_template_addon.sql","w").write("\n".join(out)+"\n")
naura=sum(1 for e in emit if e[6])
print(f"template_addon: {len(emit)} entries ({naura} with valid auras), {dropped} Cata aura-spells dropped")
