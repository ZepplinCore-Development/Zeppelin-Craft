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
TABLES = ["trainer", "creature_default_trainer", "trainer_spell"]
TIER = "base"


def emit(ctx):
    sfx = ctx.sfx
    trainers = sorted(ctx.fixture("trainer_scope" + sfx)["trainers"])
    present = ctx.dbc_spell_ids()
    base = {"": 6600, "_K": 6700}[sfx]   # per-zone TrainerId block (Lost Isles / Kezan)

    # I-260: class/first-aid trainers point at STOCK 3.3.5a trainer profiles so
    # goblins get WotLK spell ranks/levels, not the rank-less Cata npc_trainer
    # lists. Entries not in the fixture keep a gen-built profile from Neltharion.
    stock = {int(e): int(tid)
             for tid, entries in ctx.fixture("trainer_stock_profiles")["profiles"].items()
             for e in entries}

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
        tid += 1   # slot stays reserved even when stock-mapped, so gen'd ids are stable
        if e in stock:
            cdt_rows.append((e, stock[e]))
            continue
        trainer_rows.append(tid)
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

    # Delete the whole per-zone TrainerId block (not just emitted ids) so profiles
    # dropped by a rerun — e.g. the pre-I-260 Cata class lists — are purged too.
    blk = "BETWEEN %d AND %d" % (base + 1, base + 99)
    ctx.col.delete("trainer_spell", "TrainerId %s" % blk)
    ctx.col.delete("creature_default_trainer",
                   "CreatureId IN (%s)" % ",".join(str(e) for e in trainers))
    ctx.col.delete("trainer", "Id %s" % blk)
    for t in trainer_rows:
        ctx.col.add("trainer", {"Id": t, "Type": 0, "Requirement": 0,
                                "Greeting": "Ready to learn, ?", "VerifiedBuild": 0})
    for cid, t in cdt_rows:
        ctx.col.add("creature_default_trainer", {"CreatureId": cid, "TrainerId": t})
    for t, sp, cost, rsk, rskv, rlv in ts_rows:
        ctx.col.add("trainer_spell", {
            "TrainerId": t, "SpellId": sp, "MoneyCost": cost, "ReqSkillLine": rsk,
            "ReqSkillRank": rskv, "ReqAbility1": 0, "ReqAbility2": 0, "ReqAbility3": 0,
            "ReqLevel": rlv, "VerifiedBuild": 0,
        })
    return (f"trainers={len(trainer_rows)} stock_mapped={len(cdt_rows) - len(trainer_rows)} "
            f"trainer_spell={len(ts_rows)} skipped={skipped}")
