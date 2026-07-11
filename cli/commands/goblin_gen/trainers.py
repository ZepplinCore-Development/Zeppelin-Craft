"""gen domain: trainers.

npc_trainer (Cata, neltharion) -> AC trainer / creature_default_trainer /
trainer_spell. Expands negative template refs one level; keeps only spells present
in the live 3.3.5a DBC. Reference implementation for the gen domain-module pattern:

    NAME = "<domain>"
    def emit(ctx):
        ...            # use ctx.q / ctx.dbc_query / ctx.dbc_spell_ids / ctx.fixture /
        ...            #     ctx.whitemane_dbc / ctx.read_wdbc / ctx.esc / ctx.sfx
        ctx.write("sql/zz_[AUTO,F-011]%s_<name>.sql" % ctx.sfx, body)
        return "<one-line summary>"
"""
NAME = "trainers"


def emit(ctx):
    sfx = ctx.sfx
    trainers = sorted(ctx.fixture("trainer_scope" + sfx)["trainers"])
    present = ctx.dbc_spell_ids()
    tnames = {int(r["entry"]): (r["name"] or "").strip()
              for r in ctx.q("SELECT entry,name FROM creature_template")}
    base = {"": 6600, "_K": 6700}[sfx]   # per-zone TrainerId block (Lost Isles / Kezan)

    def spells_for(entry, seen):
        if entry in seen:
            return []
        seen.add(entry)
        out = []
        for r in ctx.q("SELECT * FROM npc_trainer WHERE entry=%s", (entry,)):
            sp = int(r["spell"] or 0)
            if sp < 0:
                out += spells_for(-sp, seen)
            elif sp > 0:
                out.append((sp, int(r["spellcost"] or 0), int(r["reqskill"] or 0),
                            int(r["reqskillvalue"] or 0), int(r["reqlevel"] or 0)))
        return out

    trainer_rows, cdt_rows, ts_rows, skipped = [], [], [], 0
    tid = base
    for e in trainers:
        tid += 1
        trainer_rows.append((tid, tnames.get(e, "")))
        cdt_rows.append((e, tid))
        added = set()
        for (sp, cost, rsk, rskv, rlv) in spells_for(e, set()):
            if sp not in present:
                skipped += 1
                continue
            if sp in added:
                continue
            added.add(sp)
            ts_rows.append((tid, sp, cost, rsk, rskv, rlv))

    tids = ",".join(str(t[0]) for t in trainer_rows)
    greet = ctx.esc("Ready to learn, ?")
    b = [
        "-- F-011 Lost Isles trainers (npc_trainer -> AC trainer/creature_default_trainer/trainer_spell)",
        "-- %d trainers, %d spell rows (%d spells absent from 3.3.5a DBC skipped). TrainerId block %d+.\n"
        % (len(trainer_rows), len(ts_rows), skipped, base + 1),
        "DELETE FROM trainer_spell WHERE TrainerId IN (%s);" % tids,
        "DELETE FROM creature_default_trainer WHERE TrainerId IN (%s);" % tids,
        "DELETE FROM trainer WHERE Id IN (%s);\n" % tids,
        "INSERT INTO trainer (Id,Type,Requirement,Greeting,VerifiedBuild) VALUES",
        ",\n".join("  (%d,0,0,%s,0)" % (t, greet) for t, _nm in trainer_rows) + ";\n",
        "INSERT INTO creature_default_trainer (CreatureId,TrainerId) VALUES",
        ",\n".join("  (%d,%d)" % (cid, t) for cid, t in cdt_rows) + ";\n",
        "INSERT INTO trainer_spell (TrainerId,SpellId,MoneyCost,ReqSkillLine,ReqSkillRank,ReqAbility1,ReqAbility2,ReqAbility3,ReqLevel,VerifiedBuild) VALUES",
        ",\n".join("  (%d,%d,%d,%d,%d,0,0,0,%d,0)" % r for r in ts_rows) + ";",
    ]
    ctx.write("sql/zz_[AUTO,F-011]%s_trainers.sql" % sfx, "\n".join(b) + "\n")
    return f"trainers={len(trainer_rows)} trainer_spell={len(ts_rows)} skipped={skipped}"
