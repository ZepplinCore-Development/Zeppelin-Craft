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
# `summoned_entries()` closes most of it, but it is driven by the missing_spells
# FIXTURE, so it cannot see a summon spell the port reached by DERIVATION (the
# I-275 GO data-field walk). Resolving those here would need the collector, and
# this domain cannot read it: creatures.py unions the collected template-addon
# auras into its per-guid creature_addon rows (I-249/I-266) and therefore
# requires creature_addon to run FIRST in the base wave — which is before both
# gameobjects.py and spells.py have collected anything. Hence the explicit list.
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

    # Full scan (non-indexed columns force the clustered/insertion-order scan);
    # filter by the goblin set in Python to preserve the source dump row order.
    emit_rows, dropped = [], 0
    for r in ctx.q("SELECT entry,mount,bytes1,bytes2,emote,distance_visibility,auras "
                   "FROM creature_template_addon"):
        entry = _i(r["entry"])
        if entry not in gob:
            continue
        auras = str(r["auras"] if r["auras"] is not None else "").split()
        valid = [str(s) for s in (_i(x) for x in auras) if s in present]
        dropped += len(auras) - len(valid)
        emit_rows.append((entry, _i(r["mount"]), _i(r["bytes1"]), _i(r["bytes2"]),
                          _i(r["emote"]), _i(r["distance_visibility"]), " ".join(valid)))

    for e, mt, b1, b2, em, vis, au in emit_rows:
        ctx.col.put("creature_template_addon", e, {
            "entry": e, "path_id": 0, "mount": mt, "bytes1": b1, "bytes2": b2,
            "emote": em, "visibilityDistanceType": vis, "auras": au,
        }, tier="base", owner="creature_addon")
    naura = sum(1 for e in emit_rows if e[6])
    return ("creature_template_addon=%d entries (%d with valid auras), %d Cata aura-spells dropped"
            % (len(emit_rows), naura, dropped))
