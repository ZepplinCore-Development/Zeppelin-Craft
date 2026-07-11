#!/usr/bin/env python3
"""
F-011 trainers: npc_trainer (Cata) -> AC trainer + creature_default_trainer + trainer_spell.
Resolves negative template refs; filters to spells that exist in the client Spell DBC.
"""
import sqlite3, json, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
SFX=os.environ.get("F011_SFX","")
TRAINER_BASE = int(os.environ.get("F011_TRAINER_BASE","6600"))
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
scope = json.load(open(os.path.join(SCRATCH, "trainer_scope%s.json" % SFX)))
trainers = sorted(scope["trainers"])
present = set(int(l) for l in open(os.path.join(SCRATCH, "trainer_spells_present.txt")) if l.strip().isdigit())
tnames = {int(r["entry"]): (r["name"] or "").strip() for r in c.execute("SELECT entry,name FROM creature_template")}

def gi(r, k, d=0):
    try: return int(float(r[k])) if r[k] not in (None, "") else d
    except: return d

def spells_for(entry, seen):
    """Resolve a trainer's spell rows, expanding negative template refs one level."""
    out = []
    if entry in seen: return out
    seen.add(entry)
    for r in c.execute("SELECT * FROM npc_trainer WHERE TRIM(entry)=?", (str(entry),)):
        sp = gi(r, "spell")
        if sp < 0:
            out.extend(spells_for(-sp, seen))
        elif sp > 0:
            out.append((sp, gi(r, "spellcost"), gi(r, "reqskill"), gi(r, "reqskillvalue"), gi(r, "reqlevel")))
    return out

def esc(v):
    if isinstance(v, str): return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    return str(v)

trainer_rows = []; cdt_rows = []; ts_rows = []
tid = TRAINER_BASE
skipped = 0
for e in trainers:
    tid += 1
    trainer_rows.append((tid, tnames.get(e, "")))
    cdt_rows.append((e, tid))
    seen = set()
    added = set()
    for (sp, cost, rsk, rskv, rlv) in spells_for(e, seen):
        if sp not in present or sp in added:
            if sp not in present: skipped += 1
            continue
        added.add(sp)
        ts_rows.append((tid, sp, cost, rsk, rskv, rlv))

with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_trainers.sql"), "w") as f:
    f.write("-- F-011 Lost Isles trainers (npc_trainer -> AC trainer/creature_default_trainer/trainer_spell)\n")
    f.write("-- %d trainers, %d spell rows (%d Cata-only spells skipped). TrainerId block %d+.\n\n" % (
        len(trainer_rows), len(ts_rows), skipped, TRAINER_BASE + 1))
    tids = ",".join(str(t[0]) for t in trainer_rows)
    f.write("DELETE FROM trainer_spell WHERE TrainerId IN (%s);\n" % tids)
    f.write("DELETE FROM creature_default_trainer WHERE TrainerId IN (%s);\n" % tids)
    f.write("DELETE FROM trainer WHERE Id IN (%s);\n\n" % tids)
    f.write("INSERT INTO trainer (Id,Type,Requirement,Greeting,VerifiedBuild) VALUES\n")
    f.write(",\n".join("  (%d,0,0,%s,0)" % (t, esc("Ready to learn, %s?" % ("$C" if False else ""))) for t, nm in trainer_rows) + ";\n\n")
    f.write("INSERT INTO creature_default_trainer (CreatureId,TrainerId) VALUES\n")
    f.write(",\n".join("  (%d,%d)" % (cid, t) for cid, t in cdt_rows) + ";\n\n")
    f.write("INSERT INTO trainer_spell (TrainerId,SpellId,MoneyCost,ReqSkillLine,ReqSkillRank,ReqAbility1,ReqAbility2,ReqAbility3,ReqLevel,VerifiedBuild) VALUES\n")
    f.write(",\n".join("  (%d,%d,%d,%d,%d,0,0,0,%d,0)" % (t, sp, cost, rsk, rskv, rlv) for (t, sp, cost, rsk, rskv, rlv) in ts_rows) + ";\n")

print("trainers: %d, trainer_spell rows: %d, Cata-only spells skipped: %d" % (len(trainer_rows), len(ts_rows), skipped))
