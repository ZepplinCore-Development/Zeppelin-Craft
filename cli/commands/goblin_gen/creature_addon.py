"""gen domain: creature_addon.

creature_template_addon (Cata, neltharion) -> AC creature_template_addon
(auras / mount / bytes / emote) for the goblin zone NPCs. auras (space-separated
spell list) validated against the live 3.3.5a DBC -- Cata-only spells dropped
(port-or-skip). path_id forced to 0 (waypoints not ported). DELETE-by-entry also
clears stale stock addon rows on collided IDs. Per-spawn creature_addon
(guid-keyed) is not emitted here (needs source->AC guid mapping). Single combined
file for both zones -> emitted only on the "" pass.

Row ORDER matches the source dump insertion order: the source query has no
ORDER BY, so we full-scan creature_template_addon (selecting non-indexed columns
to force the clustered scan) and filter in Python, rather than a WHERE ... IN
range scan which MySQL returns in entry-sorted order.
"""
NAME = "creature_addon"
TABLES = ["creature_template_addon"]
TIER = "base"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)

# I-277: summon-only NPCs whose addon the spawn-driven sweep above cannot see.
# Same hole _summons.py documents for templates (I-242 Hot Rod), one table over:
# a creature that only ever exists as a spell summon has no `creature` row, so it
# never enters `gob` and its addon — auras, emote, bytes — is silently dropped.
#
# `summoned_entries()` now closes this from the DERIVED spell scope (I-285 —
# it used to read the missing_spells fixture and miss every derived summon), and
# it is collector-independent, so it is valid here even though this domain must
# run FIRST in the base wave (creatures.py unions the collected template-addon
# auras into its per-guid creature_addon rows, I-249/I-266). The list below is
# only for summons the spell walk cannot reach at all.
SUMMON_ONLY_EXTRA = {
    # 34748 Goblin Survivor, summoned by 66137 out of escape pod 195188 (I-277).
    # Its source addon carries aura 37744 "Emote State: Swim" — without it the
    # survivor stands on the water surface instead of floating, and the SAI
    # actionlist 3474800 row that REMOVES 37744 five seconds in is removing an
    # aura that was never applied.
    34748,
}


def _i(v, d=0):
    try:
        return int(str(v).strip())
    except Exception:
        return d


def _undetectable_invisibility(ctx):
    """Spell IDs whose only effect on a spawned creature is to hide it from everyone.

    Retail 4.x parks quest props under a `Quest Invisibility <n>` aura
    (SPELL_AURA_MOD_INVISIBILITY = 18, invisibility type in misc value) and reveals
    them again with the matching `Quest Invisibility Detect` (aura 19, same type)
    granted by the quest phase spells — which live in the unportable 1511xx range
    (I-274). Port the hide half without the reveal half and the creature is invisible
    to every player, permanently, with nothing in the game able to detect it — and the
    `present` filter below happily keeps it, because the spell IS in Spell.dbc.

    I-246: Bilgewater Buccaneer 37179 carried 90940 "Quest Invisibility 17" (type 25).
    The aura only started shipping once I-311's derived-spell walk ported 90940 into
    the DBC, which is what un-hid this defect three weeks after the quest was verified.

    So: drop an invisibility aura when NONE of its types has a detect spell in the
    target DBC. Types that do (0-5, 7-11, 36 in stock 3.3.5a) are left alone.
    """
    rows = ctx.dbc_query(
        "SELECT id, effect_apply_aura_name_1 a1, effect_misc_value_a_1 m1,"
        " effect_apply_aura_name_2 a2, effect_misc_value_a_2 m2,"
        " effect_apply_aura_name_3 a3, effect_misc_value_a_3 m3 FROM spell"
        " WHERE 18 IN (effect_apply_aura_name_1, effect_apply_aura_name_2, effect_apply_aura_name_3)"
        " OR 19 IN (effect_apply_aura_name_1, effect_apply_aura_name_2, effect_apply_aura_name_3)")
    detect, hide = set(), {}
    for r in rows:
        for i in (1, 2, 3):
            aura, misc = _i(r["a%d" % i]), _i(r["m%d" % i])
            if aura == 19:
                detect.add(misc)
            elif aura == 18:
                hide.setdefault(_i(r["id"]), set()).add(misc)
    return {sid for sid, types in hide.items() if not (types & detect)}


def emit(ctx):
    if ctx.sfx == "_K":
        return "creature_addon: skipped (single combined file, emitted on the Lost Isles pass)"

    gob = {_i(r["id"]) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS id FROM creature "
        "WHERE TRIM(zone) IN ('%s','%s')"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % ZONES)}  # no dev/leet NPCs (I-233)
    # I-277: summon-only NPCs have no spawn row — pull their addons in too.
    import importlib.util as _ilu
    import os as _os
    _p = _os.path.join(_os.path.dirname(_os.path.abspath(__file__)), "_summons.py")
    _s = _ilu.spec_from_file_location("goblin_gen__summons", _p)
    _m = _ilu.module_from_spec(_s); _s.loader.exec_module(_m)
    gob |= set(_m.summoned_entries(ctx)) | SUMMON_ONLY_EXTRA
    present = ctx.dbc_spell_ids()
    # I-246: a ported spell can still be unusable — see _undetectable_invisibility.
    blind = _undetectable_invisibility(ctx)

    # Full scan (non-indexed columns force the clustered/insertion-order scan);
    # filter by the goblin set in Python to preserve the source dump row order.
    emit_rows, dropped = [], 0
    for r in ctx.q("SELECT entry,mount,bytes1,bytes2,emote,auras "
                   "FROM creature_template_addon"):
        entry = _i(r["entry"])
        if entry not in gob:
            continue
        auras = str(r["auras"] if r["auras"] is not None else "").split()
        valid = [str(s) for s in (_i(x) for x in auras)
                 if s in present and s not in blind]
        dropped += len(auras) - len(valid)
        emit_rows.append((entry, _i(r["mount"]), _i(r["bytes1"]), _i(r["bytes2"]),
                          _i(r["emote"]), " ".join(valid)))

    # visibilityDistanceType is ALWAYS 0 (Normal, 100yd) — I-337.
    # It used to carry the donor's `distance_visibility` verbatim, which is NOT the same
    # field: that column is a table-wide constant in the source (2 on 25078 of 25080 rows,
    # 0 on the other two), while AC reads this column as the VisibilityDistanceType enum
    # where 2 == Small == **50 yards** (ObjectDefines.h). The copy therefore halved
    # visibility for all 299 emitted goblin-zone creatures, and nothing in the source
    # actually asked for it. If a specific creature needs a wider range, set it in a
    # zz_[I-xxx] override, not here.
    for e, mt, b1, b2, em, au in emit_rows:
        ctx.col.put("creature_template_addon", e, {
            "entry": e, "path_id": 0, "mount": mt, "bytes1": b1, "bytes2": b2,
            "emote": em, "visibilityDistanceType": 0, "auras": au,
        }, tier="base", owner="creature_addon")
    naura = sum(1 for e in emit_rows if e[5])
    return ("creature_template_addon=%d entries (%d with valid auras), %d Cata aura-spells dropped"
            % (len(emit_rows), naura, dropped))
