"""gen domain: creature_text.

creature_text (Cata, neltharion) -> AC creature_text. Ports NPC yells/says for the
goblin zone NPCs so imported SmartAI SMART_ACTION_TALK references resolve.
BroadcastTextId forced to 0 (inline Text field is used). DELETE+INSERT per
CreatureID. Single combined file for both zones -> emitted only on the "" pass.

Voice-over (F-011): a line's Sound is a Cata SoundEntries id (Gallywix/Thrall VO,
19555+) that stock 3.3.5a lacks. The row is ported verbatim from the Whitemane
SoundEntries.dbc (first 30 fields = the 3.3.5a layout; the 5 appended Cata
variation fields and the SoundEntriesAdvanced ref are dropped, as in I-242) and its
.ogg files ship in the zpak (PATCH-Z). Only a sound whose row or files are absent
from the Cata client is shipped as 0 — AC logs a missing SoundEntries id at load.

Scope is the zone spawn sweep UNION the port's summon closure (I-288): a creature
that only ever exists as a spell summon has no `creature` row, so it never entered
`gob` and shipped with no dialogue at all — the same hole I-277 found for
creature_addon and I-285 for templates, one table over. 35813 Frightened Miner
(quest 14021) needs its 13 text groups for the escort to say anything.
"""
import importlib.util
import os
import struct

NAME = "creature_text"
TABLES = ["creature_text", "soundentries"]
TIER = "base"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)

# 3.3.5a SoundEntries.dbc field order = Cata 4.3.4 fields 0..29 (Cata appends 5).
SOUND_FIELDS = (["id", "sound_type", "name"]
                + ["file_%d" % i for i in range(1, 11)]
                + ["frequency_%d" % i for i in range(1, 11)]
                + ["base_dir", "volume", "flags", "min_distance", "distance_cutoff",
                   "eax_def", "advanced_id"])
SOUND_STR = {2, 23} | set(range(3, 13))
SOUND_FLOAT = {24, 26, 27}


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


def _f32(u):
    return round(struct.unpack("<f", struct.pack("<I", u))[0], 4)


def _port_sounds(ctx, wanted):
    """Port the Cata SoundEntries rows in `wanted` (absent from STOCK 3.3.5a) and
    ship their audio. Returns (ported ids, unresolved ids)."""
    recs, gs = ctx.read_wdbc(ctx.whitemane_dbc("SoundEntries.dbc"))
    src = {r[0]: r for r in recs}
    ported, gaps = set(), []
    for sid in sorted(wanted):
        r = src.get(sid)
        if r is None:
            gaps.append("%d (no 4.3.4 row)" % sid)
            continue
        base = gs(r[23])
        files = [gs(r[i]) for i in range(3, 13) if r[i] and gs(r[i])]
        state = [ctx.ship_asset("%s/%s" % (base, f)) for f in files]
        if not files or "missing" in state:
            gaps.append("%d %s (audio not in the 4.3.4 extract)" % (sid, gs(r[2])))
            continue
        cols = {}
        for i, c in enumerate(SOUND_FIELDS):
            v = r[i]
            cols[c] = (gs(v) if v else "") if i in SOUND_STR else (
                _f32(v) if i in SOUND_FLOAT else int(v))
        cols["advanced_id"] = 0            # Cata SoundEntriesAdvanced not ported
        ctx.col.put("soundentries", sid, cols, tier="base", owner=NAME,
                    note="%d %s (creature_text VO)" % (sid, cols["name"]))
        ported.add(sid)
    return ported, gaps


def emit(ctx):
    if ctx.sfx == "_K":
        return "creature_text: skipped (single combined file, emitted on the Lost Isles pass)"

    gob = sorted({_i(r["id"]) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS id FROM creature "
        "WHERE TRIM(zone) IN ('%s','%s')"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % ZONES)})  # no dev/leet NPCs (I-233)
    # Summon-only creatures have no spawn row -> invisible to the sweep (I-288).
    # Plus the summons the closure cannot derive (GO data-field spells, I-277) —
    # 34748 Goblin Survivor's actionlist 3474800 TALKs group 0 (I-383).
    gob = sorted(set(gob) | set(_sibling("_summons").summoned_entries(ctx))
                 | _sibling("creature_addon").SUMMON_ONLY_EXTRA)
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
    # Cata voice-over SoundEntries (Gallywix 19555+, Thrall) are not in stock
    # SoundEntries.dbc: port the row + audio. STOCK, never live, so a re-run still
    # emits what an earlier run applied (reference_dbc_stock_determinism).
    sounds = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM soundentries")}
    vo, vo_gaps = _port_sounds(
        ctx, {_i(r["sound"]) for r in rows} - sounds - {0})
    sounds |= vo

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
            "Emote": _i(r["emote"]), "Duration": _i(r["duration"]), "Sound": _i(r["sound"]) if _i(r["sound"]) in sounds else 0,
            "BroadcastTextId": 0, "TextRange": _i(r["text_range"]),
            "comment": comment,
        })
    out = ("creature_text=%d rows across %d NPCs\n  %s\n  voice-over: %d SoundEntries"
           " ported" % (len(rows), len(entries), en.summary(), len(vo)))
    if vo_gaps:
        out += "; shipped as 0: " + ", ".join(vo_gaps)
    return out
