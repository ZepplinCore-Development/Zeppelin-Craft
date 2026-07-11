"""gen domain: spell_scripts.

Registers the core-C++ quest-credit spell scripts (zeppelin_goblin_start.cpp) in
spell_script_names. Static wiring (ported from the spell_script_names half of
Scripts/Goblin Zone Port/wire_scripts_and_spawns.py). Emitted as a SINGLE
non-SFX file — the mapping is zone-independent, matching the source script which
writes one zz_[F-011]_spell_scripts.sql regardless of zone.
"""
NAME = "spell_scripts"

# spell_id -> C++ ScriptName (zeppelin_goblin_start.cpp quest-credit handlers).
SCRIPTS = [
    (67917, "spell_zep_q14019_monkey_business"),
    (68211, "spell_zep_q14236_weed_whacker"),
    (68280, "spell_zep_q14031_ktc_snapflash"),
    (71170, "spell_zep_q24671_cluster_cluck"),
    (72891, "spell_zep_q24942_zombies_booster"),
]


def emit(ctx):
    b = [
        "-- F-011 register core-C++ quest-credit spell scripts (zeppelin_goblin_start.cpp)\n",
        "DELETE FROM spell_script_names WHERE spell_id IN (%s);"
        % ",".join(str(s) for s, _ in SCRIPTS),
        "INSERT INTO spell_script_names (spell_id, ScriptName) VALUES",
        ",\n".join("  (%d,'%s')" % (s, n) for s, n in SCRIPTS) + ";\n",
    ]
    ctx.write("sql/zz_[AUTO,F-011]_spell_scripts.sql", "\n".join(b))
    return "spell_script_names=%d" % len(SCRIPTS)
