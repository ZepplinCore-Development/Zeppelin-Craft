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
    (72891, "spell_zep_q24942_zombies_booster"),
    # I-340. 72887 is the CONTROL_VEHICLE spell for the boots and carries a DUMMY
    # effect on the RIDER; that rider aura is the only thing co-terminous with the
    # ride, because a CAN_CONTROL seat charms the vehicle and charming sets
    # `IsAIEnabled = false`, which kills every CreatureAI hook (PassengerBoarded,
    # UpdateAI) for the whole ride. The script lights the boots' burning aura 72885
    # on apply and strips it on remove.
    (72887, "spell_zep_q24942_boots_ride"),
]

# Spells that USED to be wired here. They stay in the emitted DELETE so a stale
# row is cleared from a database that was loaded before the wiring was dropped;
# they are never re-inserted.
#
#   67917 Nitro-Potassium Bananas (q14019 Monkey Business) — I-281. The generic
#   fixed-credit script credited the caster on ANY effect hit, so the bananas
#   paid out on any target. Credit now belongs to the fed monkey's own SmartAI,
#   which also roots/explodes/despawns it. See zz_[I-281]_monkey_business_feed.sql.
#
#   71170 Remote Control Fireworks (q24671 Cluster Cluck) — I-318. Same defect,
#   same shape as I-281: the fixed-credit script paid the caster on ANY effect
#   hit, so clicking the item with no clucker targeted (the spell self-casts)
#   banked a free credit, and a real capture paid TWICE — once from the script,
#   once from the clucker's own imported SmartAI. Credit belongs solely to the
#   Wild Clucker (38111) SPELLHIT 71170 -> actionlist 3811100 -> action 33,
#   which also clears the spellclick flag, straps on the jetpack visual and
#   flies the bird off. See zz_[I-318]_cluster_cluck_credit.sql.
RETIRED = [67917, 71170]


def emit(ctx):
    if ctx.sfx:
        return "skipped (zone-independent; emitted on Lost Isles pass)"
    ctx.col.delete("spell_script_names",
                   "spell_id IN (%s)" % ",".join(
                       str(s) for s in sorted([s for s, _ in SCRIPTS] + RETIRED)))
    for s, n in SCRIPTS:
        ctx.col.add("spell_script_names", {"spell_id": s, "ScriptName": n})
    return "spell_script_names=%d" % len(SCRIPTS)
