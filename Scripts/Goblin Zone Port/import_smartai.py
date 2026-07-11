#!/usr/bin/env python3
"""
F-011 scoped SmartAI import: bring over the source smart_scripts for quest-relevant
creatures/GOs (questgivers, enders, RequiredNpcOrGo targets) + their linked timed
action-lists. Sets AIName so the scripts run. Filters to 3.3.5a-valid event/action
types. Creature/spell/quest refs are unchanged by the port so pass through as-is.
"""
import sqlite3, json, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
scope = json.load(open(os.path.join(SCRATCH, "smartai_scope.json")))

# 3.3.5a valid ceilings (AC 3.3.5a): SMART_EVENT ~ up to 74, SMART_ACTION up to ~135
MAX_EVENT, MAX_ACTION = 74, 135

# SMART_ACTION types whose action_param1 is a spellId. A cast/aura action referencing a
# spell absent from Spell.dbc crashes the worldserver (NULL SpellInfo deref in the cast
# path) when the event fires — see I-230. Drop those actions at import time so a re-import
# can't reintroduce the crash. Mirrors zz_[I-230]_smartai_strip_missing_cast_spells.sql.
SPELL_ACTION_TYPES = {11, 28, 75, 85, 118, 134}
import struct
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
def _load_spell_ids(path="/workspace/project/data/dbc/Spell.dbc"):
    d = open(path, "rb").read()
    rec, rs = struct.unpack("<i", d[4:8])[0], struct.unpack("<i", d[12:16])[0]
    ids = set(); off = 20
    for _ in range(rec):
        ids.add(struct.unpack("<i", d[off:off+4])[0]); off += rs
    return ids
VALID_SPELLS = _load_spell_ids()
COLS = ["entryorguid","source_type","id","link","event_type","event_phase_mask","event_chance",
        "event_flags","event_param1","event_param2","event_param3","event_param4","action_type",
        "action_param1","action_param2","action_param3","action_param4","action_param5","action_param6",
        "target_type","target_param1","target_param2","target_param3","target_param4",
        "target_x","target_y","target_z","target_o","comment"]

def fetch(source_type, entry):
    return c.execute("SELECT * FROM smart_scripts WHERE TRIM(source_type)=? AND TRIM(entryorguid)=? ORDER BY CAST(id AS INT)",
                     (str(source_type), str(entry))).fetchall()

def val(v):
    v = (str(v).strip() if v is not None else "")
    if v == "" or v.lower() == "none": return "0"
    return v

rows_by_key = {}   # (source_type, entryorguid) -> list of row dicts
skipped = 0
spell_skipped = 0
def collect(source_type, entry):
    global skipped, spell_skipped
    out = []
    for r in fetch(source_type, entry):
        et = int(float(val(r["event_type"]))); at = int(float(val(r["action_type"])))
        if et > MAX_EVENT or at > MAX_ACTION:
            skipped += 1; continue
        if at in SPELL_ACTION_TYPES and int(float(val(r["action_param1"]))) not in VALID_SPELLS:
            spell_skipped += 1; continue   # I-230: unported spell -> NULL SpellInfo crash on fire
        out.append(r)
    if out:
        rows_by_key[(source_type, entry)] = out

for e in scope["cre"]: collect(0, e)
for e in scope["go"]:  collect(1, e)
for e in scope["tal"]: collect(9, e)

def esc(v):
    v = val(v)
    # numeric?
    try:
        float(v); return v if v not in ("",) else "0"
    except:
        return "'" + v.replace("\\","\\\\").replace("'","''") + "'"

with open(ZPAK + "/sql/zz_[F-011]_smartai.sql", "w") as f:
    f.write("-- F-011 scoped SmartAI (quest-relevant creatures/GOs + timed action-lists) from Neltharion.\n")
    f.write("-- %d script blocks, %d rows total. %d Cata-only rows skipped (event/action out of 3.3.5a range); %d skipped (cast/aura of unported spell, I-230).\n\n" % (
        len(rows_by_key), sum(len(v) for v in rows_by_key.values()), skipped, spell_skipped))
    cre = sorted(set(e for (st,e) in rows_by_key if st==0))
    go  = sorted(set(e for (st,e) in rows_by_key if st==1))
    # AIName so scripts run
    if cre:
        f.write("UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (%s);\n" % ",".join(map(str,cre)))
    if go:
        f.write("UPDATE gameobject_template SET AIName='SmartGameObjectAI' WHERE entry IN (%s);\n" % ",".join(map(str,go)))
    f.write("\n")
    for (st, e), rws in sorted(rows_by_key.items()):
        f.write("DELETE FROM smart_scripts WHERE source_type=%d AND entryorguid=%d;\n" % (st, e))
        f.write("INSERT INTO smart_scripts (%s) VALUES\n" % ",".join(COLS))
        vals = []
        for r in rws:
            vals.append("  (" + ",".join(esc(r[c2]) for c2 in COLS) + ")")
        f.write(",\n".join(vals) + ";\n\n")
print("script blocks: %d | rows: %d | skipped(type-range): %d | skipped(unported-spell): %d | creatures: %d GOs: %d" % (
    len(rows_by_key), sum(len(v) for v in rows_by_key.values()), skipped, spell_skipped, len(cre), len(go)))
