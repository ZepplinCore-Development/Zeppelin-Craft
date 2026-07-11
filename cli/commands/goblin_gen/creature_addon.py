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

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)


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
        "WHERE TRIM(zone) IN ('%s','%s')" % ZONES)}
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

    ents = [e[0] for e in emit_rows]
    out = [
        "-- [F-011] creature_template_addon (auras/mount/bytes/emote) from Neltharion.",
        "-- auras validated vs 3.3.5a DBC (Cata-only dropped); path_id=0 (waypoints deferred).",
        "-- DELETE-by-entry also clears stale stock addon rows on collided IDs. "
        "Regenerate: `zep goblin gen creature_addon`.\n",
        "DELETE FROM creature_template_addon WHERE entry IN (%s);" % ",".join(map(str, ents)),
        "INSERT INTO creature_template_addon (entry,path_id,mount,bytes1,bytes2,emote,"
        "visibilityDistanceType,auras) VALUES",
    ]
    out.append(",\n".join(
        "  (%d,0,%d,%d,%d,%d,%d,'%s')" % (e, mt, b1, b2, em, vis, au)
        for e, mt, b1, b2, em, vis, au in emit_rows) + ";")

    ctx.write("sql/zz_[AUTO,F-011]%s_creature_template_addon.sql" % ctx.sfx, "\n".join(out) + "\n")
    naura = sum(1 for e in emit_rows if e[6])
    return ("creature_template_addon=%d entries (%d with valid auras), %d Cata aura-spells dropped"
            % (len(emit_rows), naura, dropped))
