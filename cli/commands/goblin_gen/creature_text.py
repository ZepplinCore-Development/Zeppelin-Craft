"""gen domain: creature_text.

creature_text (Cata, neltharion) -> AC creature_text. Ports NPC yells/says for the
goblin zone NPCs so imported SmartAI SMART_ACTION_TALK references resolve.
BroadcastTextId forced to 0 (inline Text field is used). DELETE+INSERT per
CreatureID. Single combined file for both zones -> emitted only on the "" pass.

Scope is the zone spawn sweep UNION the port's summon closure (I-288): a creature
that only ever exists as a spell summon has no `creature` row, so it never entered
`gob` and shipped with no dialogue at all — the same hole I-277 found for
creature_addon and I-285 for templates, one table over. 35813 Frightened Miner
(quest 14021) needs its 13 text groups for the escort to say anything.
"""
import importlib.util
import os

NAME = "creature_text"
TABLES = ["creature_text"]
TIER = "base"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


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
    # Summon-only creatures have no spawn row -> invisible to the sweep (I-288).
    gob = sorted(set(gob) | set(_sibling("_summons").summoned_entries(ctx)))
    gset = ",".join(str(e) for e in gob)
    rows = ctx.q(
        "SELECT * FROM creature_text WHERE CAST(TRIM(entry) AS SIGNED) IN (%s) "
        "ORDER BY CAST(TRIM(entry) AS SIGNED), CAST(TRIM(groupid) AS SIGNED), "
        "CAST(TRIM(id) AS SIGNED)" % gset)
    entries = sorted({_i(r["entry"]) for r in rows})

    # I-302: the Neltharion dump is double-encoded and partly French. Unlike gossip,
    # creature_text CANNOT be auto-repaired from tdb434 -- Neltharion renumbered
    # GroupIDs and the ported SmartAI TALK actions reference *its* numbering, so a
    # (CreatureID, GroupID, ID) lookup would swap NPC lines around. demojibake +
    # the hand-verified text_overrides fixture only; see _entext.py.
    en = _sibling("_entext").EnglishText(ctx)

    ctx.col.delete("creature_text",
                   "CreatureID IN (%s)" % ",".join(map(str, entries)))
    for r in rows:
        cid, gid, tid = _i(r["entry"]), _i(r["groupid"]), _i(r["id"])
        text, comment = en.creature_line(cid, gid, tid,
                                         str(r["text"] or "").strip(),
                                         str(r["comment"] or "").strip())
        ctx.col.add("creature_text", {
            "CreatureID": cid, "GroupID": gid, "ID": tid,
            "Text": text, "Type": _i(r["type"]),
            "Language": _i(r["language"]), "Probability": _i(r["probability"], 100),
            "Emote": _i(r["emote"]), "Duration": _i(r["duration"]), "Sound": _i(r["sound"]),
            "BroadcastTextId": 0, "TextRange": _i(r["text_range"]),
            "comment": comment,
        })
    return ("creature_text=%d rows across %d NPCs\n  %s"
            % (len(rows), len(entries), en.summary()))
