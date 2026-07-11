"""gen domain: spellclick.

npc_spellclick_spells + their SourceType-18 conditions (Cata, neltharion) -> AC.
The whole npc_spellclick_spells table and its 414 spellclick conditions were dropped
in the original goblin-zone import (I-234): the "use item ability on an NPC to get
quest credit" mechanic (e.g. Kezan quest 14069 "Good Help is Hard to Find", where
you shock a Defiant Troll 34830 with the Goblin All-In-1-Der Belt, spell 66306) had
its SmartAI ported but no spellclick to trigger it.

Emits, per zone (ctx.sfx), for creatures that spawn in the zone and whose spellclick
spell is present in the live 3.3.5a DBC (spells absent from 3.3.5a are skipped, exactly
like trainers.py — a click that casts a nonexistent spell is broken):

  sql/  spellclick  (npc_spellclick_spells rows + SourceType-18 conditions)

The conditions gate each click on its quest being in the player's log (ConditionType 9
= CONDITION_QUESTTAKEN), so a click is only offered to players actually on the quest.
"""
NAME = "spellclick"

ZONE = {"": "4720", "_K": "4737"}   # Lost Isles / Kezan (matches creatures.py)

_COND_COLS = ("SourceTypeOrReferenceId", "SourceGroup", "SourceEntry", "SourceId",
              "ElseGroup", "ConditionTypeOrReference", "ConditionTarget",
              "ConditionValue1", "ConditionValue2", "ConditionValue3",
              "NegativeCondition", "ErrorType", "ErrorTextId", "ScriptName", "Comment")


def emit(ctx):
    sfx = ctx.sfx
    zone = ZONE[sfx]
    present = ctx.dbc_spell_ids()

    zone_ids = {int(r["id"]) for r in
                ctx.q("SELECT DISTINCT TRIM(id) AS id FROM creature WHERE TRIM(zone)=%s", (zone,))}

    clicks, skipped = [], 0
    for r in ctx.q("SELECT npc_entry,spell_id,cast_flags,user_type FROM npc_spellclick_spells"):
        npc, spell = int(r["npc_entry"]), int(r["spell_id"])
        if npc not in zone_ids:
            continue
        if spell not in present:
            skipped += 1                     # spell absent from 3.3.5a DBC -> click would be broken
            continue
        clicks.append((npc, spell, int(r["cast_flags"] or 0), int(r["user_type"] or 0)))
    clicks.sort()
    npcs = sorted({c[0] for c in clicks})

    conds = []
    if npcs:
        ph = ",".join(["%s"] * len(npcs))
        rows = ctx.q("SELECT * FROM conditions WHERE SourceTypeOrReferenceId=18 "
                     "AND SourceGroup IN (%s) ORDER BY SourceGroup,ElseGroup,ConditionValue1" % ph, npcs)
        for r in rows:
            conds.append(tuple(r[c] for c in _COND_COLS))

    nlist = ",".join(str(n) for n in npcs) or "0"
    b = [
        "-- F-011 %s spellclick mechanics (npc_spellclick_spells + SourceType-18 conditions)"
        % ("Kezan" if sfx == "_K" else "Lost Isles"),
        "-- %d clickable NPCs, %d conditions (%d NPCs skipped: spellclick spell absent from 3.3.5a DBC)."
        % (len(clicks), len(conds), skipped),
        "-- Each click casts its spell on the NPC; the NPC's SmartAI reacts (spellhit) and gives quest credit.\n",
        "DELETE FROM npc_spellclick_spells WHERE npc_entry IN (%s);" % nlist,
    ]
    if clicks:
        b.append("INSERT INTO npc_spellclick_spells (npc_entry,spell_id,cast_flags,user_type) VALUES")
        b.append(",\n".join("  (%d,%d,%d,%d)" % c for c in clicks) + ";")
    b.append("\nDELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup IN (%s);" % nlist)
    if conds:
        b.append("INSERT INTO conditions\n  (%s)\nVALUES" % ",".join(_COND_COLS))
        out = []
        for c in conds:
            vals = []
            for col, v in zip(_COND_COLS, c):
                if col in ("ScriptName", "Comment"):
                    vals.append(ctx.esc((v or "").strip()))     # source stores ' ' -> ''
                else:
                    vals.append(str(int(v or 0)))
            out.append("  (%s)" % ",".join(vals))
        b.append(",\n".join(out) + ";")

    ctx.write("sql/zz_[AUTO,F-011]%s_spellclick.sql" % sfx, "\n".join(b) + "\n")
    return "spellclick npcs=%d conditions=%d skipped=%d" % (len(clicks), len(conds), skipped)
