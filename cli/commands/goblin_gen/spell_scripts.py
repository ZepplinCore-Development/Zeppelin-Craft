"""gen domain: spell_scripts.

Registers the core-C++ quest-credit spell scripts (zeppelin_goblin_start.cpp) in
spell_script_names. Static wiring (ported from the spell_script_names half of
Scripts/Goblin Zone Port/wire_scripts_and_spawns.py). Emitted as a SINGLE
non-SFX file — the mapping is zone-independent, matching the source script which
writes one zz_[F-011]_spell_scripts.sql regardless of zone.
"""
NAME = "spell_scripts"
TABLES = ["spell_script_names"]
TIER = "base"

# spell_id -> C++ ScriptName (zeppelin_goblin_start.cpp quest-credit handlers).
#
SCRIPTS = [
    (68211, "spell_zep_q14236_weed_whacker"),
    (68280, "spell_zep_q14031_ktc_snapflash"),
    (71170, "spell_zep_q24671_cluster_cluck"),
    (72891, "spell_zep_q24942_zombies_booster"),
]

# Spells that USED to be wired here. They stay in the emitted DELETE so a stale
# row is cleared from a database that was loaded before the wiring was dropped;
# they are never re-inserted.
#
#   67917 Nitro-Potassium Bananas (q14019 Monkey Business) — I-281. The generic
#   fixed-credit script credited the caster on ANY effect hit, so the bananas
#   paid out on any target. Credit now belongs to the fed monkey's own SmartAI,
#   which also roots/explodes/despawns it. See zz_[I-281]_monkey_business_feed.sql.
RETIRED = [67917]


def emit(ctx):
    if ctx.sfx:
        return "skipped (zone-independent; emitted on Lost Isles pass)"
    ctx.col.delete("spell_script_names",
                   "spell_id IN (%s)" % ",".join(
                       str(s) for s in sorted([s for s, _ in SCRIPTS] + RETIRED)))
    for s, n in SCRIPTS:
        ctx.col.add("spell_script_names", {"spell_id": s, "ScriptName": n})
    return "spell_script_names=%d" % len(SCRIPTS)
