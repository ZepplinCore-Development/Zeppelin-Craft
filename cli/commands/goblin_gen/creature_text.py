"""gen domain: creature_text.

creature_text (Cata, neltharion) -> AC creature_text. Ports NPC yells/says for the
goblin zone NPCs so imported SmartAI SMART_ACTION_TALK references resolve.
BroadcastTextId forced to 0 (inline Text field is used). DELETE+INSERT per
CreatureID. Single combined file for both zones -> emitted only on the "" pass.
"""
NAME = "creature_text"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)


def _i(v, d=0):
    try:
        return int(str(v).strip())
    except Exception:
        try:                       # typed neltharion stores some cols as DOUBLE (e.g. probability=50.0)
            return int(float(str(v).strip()))
        except Exception:
            return d


def _esc(v):
    return "'" + str(v).strip().replace("\\", "\\\\").replace("'", "''") + "'"


def emit(ctx):
    if ctx.sfx == "_K":
        return "creature_text: skipped (single combined file, emitted on the Lost Isles pass)"

    gob = sorted({_i(r["id"]) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS id FROM creature "
        "WHERE TRIM(zone) IN ('%s','%s')"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % ZONES)})  # no dev/leet NPCs (I-233)
    gset = ",".join(str(e) for e in gob)
    rows = ctx.q(
        "SELECT * FROM creature_text WHERE CAST(TRIM(entry) AS SIGNED) IN (%s) "
        "ORDER BY CAST(TRIM(entry) AS SIGNED), CAST(TRIM(groupid) AS SIGNED), "
        "CAST(TRIM(id) AS SIGNED)" % gset)
    entries = sorted({_i(r["entry"]) for r in rows})

    out = [
        "-- [F-011] creature_text (NPC yells/says) migrated from Neltharion. Resolves SmartAI",
        "-- SMART_ACTION_TALK references (groupid) that were dangling. BroadcastTextId=0 (inline Text used).",
        "-- Regenerate with `zep goblin gen creature_text`. Idempotent (DELETE+INSERT per CreatureID).\n",
        "DELETE FROM creature_text WHERE CreatureID IN (%s);" % ",".join(map(str, entries)),
        "INSERT INTO creature_text (CreatureID,GroupID,ID,Text,Type,Language,Probability,"
        "Emote,Duration,Sound,BroadcastTextId,TextRange,comment) VALUES",
    ]
    vals = []
    for r in rows:
        vals.append(
            "  (%d,%d,%d,%s,%d,%d,%d,%d,%d,%d,0,%d,%s)" % (
                _i(r["entry"]), _i(r["groupid"]), _i(r["id"]), _esc(r["text"]),
                _i(r["type"]), _i(r["language"]), _i(r["probability"], 100),
                _i(r["emote"]), _i(r["duration"]), _i(r["sound"]),
                _i(r["text_range"]), _esc(r["comment"])))
    out.append(",\n".join(vals) + ";")

    ctx.write("sql/zz_[AUTO,F-011]%s_creature_text.sql" % ctx.sfx, "\n".join(out) + "\n")
    return "creature_text=%d rows across %d NPCs" % (len(rows), len(entries))
