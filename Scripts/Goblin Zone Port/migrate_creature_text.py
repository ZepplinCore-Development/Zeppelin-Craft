#!/usr/bin/env python3
"""
F-011 pipeline fix: migrate creature_text (NPC yells/says) — Neltharion -> AC.

The pipeline never emitted creature_text, so 465 lines of NPC dialogue for 78
goblin NPCs were lost, and every imported SmartAI SMART_ACTION_TALK dangled
(runtime "using non-existent Text id" spam, silent NPCs). Schema maps 1:1
(entry->CreatureID, groupid->GroupID, ...). BroadcastTextId forced to 0 (we
don't port broadcast_text; the inline Text field is used). DELETE+INSERT per
goblin CreatureID (also clears any stale stock text on collided entry IDs).
Idempotent. Emits zz_[F-011]_creature_text.sql.
"""
import sqlite3, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
os.chdir('/workspace/project/Zeppelin-Craft')
SRC="/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite"
c=sqlite3.connect(SRC); c.row_factory=sqlite3.Row
def i(v,d=0):
    try: return int(str(v).strip())
    except: return d
def esc(v):
    return "'" + str(v).strip().replace("\\","\\\\").replace("'","''") + "'"

gob=[i(r[0]) for r in c.execute(
  "SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')")]
gset=",".join(str(e) for e in sorted(gob))
rows=c.execute(f"SELECT * FROM creature_text WHERE CAST(TRIM(entry) AS INT) IN ({gset}) "
               f"ORDER BY CAST(TRIM(entry) AS INT), CAST(TRIM(groupid) AS INT), CAST(TRIM(id) AS INT)").fetchall()
entries=sorted({i(r["entry"]) for r in rows})
out=["-- [F-011] creature_text (NPC yells/says) migrated from Neltharion. Resolves SmartAI",
     "-- SMART_ACTION_TALK references (groupid) that were dangling. BroadcastTextId=0 (inline Text used).",
     "-- Regenerate with migrate_creature_text.py. Idempotent (DELETE+INSERT per CreatureID).\n",
     f"DELETE FROM creature_text WHERE CreatureID IN ({','.join(map(str,entries))});",
     "INSERT INTO creature_text (CreatureID,GroupID,ID,Text,Type,Language,Probability,Emote,Duration,Sound,BroadcastTextId,TextRange,comment) VALUES"]
vals=[]
for r in rows:
    vals.append(f"  ({i(r['entry'])},{i(r['groupid'])},{i(r['id'])},{esc(r['text'])},{i(r['type'])},"
                f"{i(r['language'])},{i(r['probability'],100)},{i(r['emote'])},{i(r['duration'])},"
                f"{i(r['sound'])},0,{i(r['text_range'])},{esc(r['comment'])})")
out.append(",\n".join(vals)+";")
open("zpaks/zep-goblin-start/sql/zz_[F-011]_creature_text.sql","w").write("\n".join(out)+"\n")
print(f"creature_text: {len(rows)} rows across {len(entries)} NPCs")
