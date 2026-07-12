"""gen domain: creature_text.

creature_text (Cata, neltharion) -> AC creature_text. Ports NPC yells/says for the
goblin zone NPCs so imported SmartAI SMART_ACTION_TALK references resolve.
BroadcastTextId forced to 0 (inline Text field is used). DELETE+INSERT per
CreatureID. Single combined file for both zones -> emitted only on the "" pass.
"""
NAME = "creature_text"
TABLES = ["creature_text"]
TIER = "base"

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

    ctx.col.delete("creature_text",
                   "CreatureID IN (%s)" % ",".join(map(str, entries)))
    for r in rows:
        ctx.col.add("creature_text", {
            "CreatureID": _i(r["entry"]), "GroupID": _i(r["groupid"]), "ID": _i(r["id"]),
            "Text": str(r["text"] or "").strip(), "Type": _i(r["type"]),
            "Language": _i(r["language"]), "Probability": _i(r["probability"], 100),
            "Emote": _i(r["emote"]), "Duration": _i(r["duration"]), "Sound": _i(r["sound"]),
            "BroadcastTextId": 0, "TextRange": _i(r["text_range"]),
            "comment": str(r["comment"] or "").strip(),
        })
    return "creature_text=%d rows across %d NPCs" % (len(rows), len(entries))
