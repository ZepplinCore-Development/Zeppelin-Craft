"""gen domain: waypoints (SmartAI escort paths).

`SMART_ACTION_ESCORT_START` (53) takes a pathID that AC resolves through
SmartWaypointMgr, which loads the **`waypoints`** table. That is a different table
from `waypoint_data` (order 43), which only feeds creature MovementType=2 paths.
The port carried `waypoint_data` and never carried `waypoints`, so every imported
escort action pointed at a path that did not exist: `StartPath` found no points,
reset the path id and returned false, and the creature just stood there.

Nothing logged, because a missing escort path is not a load-time error — it is a
runtime no-op. That is how the quest 447 Gasbot (I-274) came to summon correctly
and then never drive into the KTC building, so the
`SMART_EVENT_WAYPOINT_REACHED` row that grants the fourth objective's credit and
plays the explosion never fired.

Scope is DERIVED from the pathIDs referenced by surviving imported SAI rows
(`_spellscope.escort_paths`), the same way the spell port derives its set.

Coordinates take the same map648 -> map1 offset as creature spawns (DX/DY in
creatures.py). Verified against quest 447: source point 1 x=-8424.09 + DX lands at
-8957.42, on top of the KTC HQ goober at -8957.26.

Source `waypoints` has no orientation/delay columns; AC's does, so those default
to NULL/0 (escort paths take their facing from the movement direction).
"""
import os
import importlib.util

NAME = "waypoints"
TABLES = ["waypoints"]
TIER = "overlay"   # derived scope needs smartai's imported row set

DX, DY = -533.3333, -12800.0   # map648 -> map1 offset (mirrors creatures.py)


def _sibling(modname):
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def emit(ctx):
    if not ctx.sfx:
        return "deferred (derived scope needs both zones' templates; emitted on the _K pass)"
    scope = _sibling("_spellscope")
    wanted = scope.escort_paths(ctx)
    if not wanted:
        return "no escort paths referenced"

    ids = ",".join(str(int(p)) for p in sorted(wanted))
    rows = ctx.q("SELECT entry, pointid, position_x, position_y, position_z, point_comment "
                 "FROM waypoints WHERE entry IN (%s) ORDER BY entry, pointid" % ids)
    by_path = {}
    for r in rows:
        by_path.setdefault(int(r["entry"]), []).append(r)

    # One DELETE per ported path (not a range): these ids are source creature/actionlist
    # ids scattered across the id space, and stock AC ships its own `waypoints` rows.
    for pid in sorted(by_path):
        ctx.col.delete("waypoints", "entry = %d" % pid)
    n = 0
    for pid in sorted(by_path):
        for r in by_path[pid]:
            ctx.col.add("waypoints", {
                "entry": pid,
                "pointid": int(r["pointid"]),
                "position_x": float(r["position_x"]) + DX,
                "position_y": float(r["position_y"]) + DY,
                "position_z": float(r["position_z"]),
                "orientation": None,
                "delay": 0,
                "point_comment": (r["point_comment"] or "").strip() or "F-011 escort path",
            }, sort_key=(pid, int(r["pointid"])))
            n += 1

    missing = sorted(set(wanted) - set(by_path))
    out = "paths=%d points=%d" % (len(by_path), n)
    if missing:
        # A referenced path absent from the source is an escort that cannot work —
        # report it rather than leaving a silent no-op behind.
        out += "\n  %d referenced path(s) absent from the source `waypoints` table:" % len(missing)
        for pid in missing:
            who = ", ".join("%s %d" % ("GO" if st == 1 else "creature" if st == 0 else "actionlist", e)
                            for st, e in wanted[pid][:3])
            out += "\n    WARN path %d (referenced by %s) — escort will stand still" % (pid, who)
    return out
