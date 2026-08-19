"""gen domain: screeneffect (I-290).

Cata `ScreenEffect.dbc` rows referenced by the port's `SPELL_AURA_SCREEN_EFFECT`
(260) auras but absent from stock 3.3.5a.

WHY THIS EXISTS
---------------
Aura 260 names a `ScreenEffect.dbc` row in its MiscValue; the client draws the
full-screen tint/vignette from that row. With no row the aura applies and draws
NOTHING — the spell "works", nothing is logged, and the player gets no feedback.

Quest 14031 "Capturing the Unknown" is exactly that: the bunny actionlist already
INVOKER_CASTs 70649 "Capturing The Unknown: Player's Screen Effect" on the player
when a painting is photographed, but its ScreenEffect 722 is Cata-only, so there
was no camera flash. Same for 68376 "Infrared Heat Focals" (623) and 74025
"Quest Phase 10" (762).

Cata's ScreenEffect.dbc carries 11 fields to 3.3.5a's 10 — the first 10 map 1:1
and the trailing Cata-only field is dropped. Everything else copies verbatim.

Scope is DERIVED: the emitted spell set is scanned for aura 260 and the MiscValue
is taken from the same rows spells.py writes, so a screen-effect spell can never
ship without its row. Emitted on the LAST (_K) pass, like spells.py, because the
derived scope needs both zones walked.
"""
import importlib.util
import os

NAME = "screeneffect"
TABLES = ["screeneffect"]
# Collector tables this domain READS but does not write -- the contributor
# closure must pull their producers into any partial `gen` run or the read
# comes back empty and this file ships under-populated (see I-267).
# scoped off the collected creature templates
READS = ['creature_template']
TIER = "base"

# 3.3.5a ScreenEffect.dbc field order (Cata appends one more field, dropped).
FIELDS = ("id", "name", "type", "colour", "screen_edge_size", "black_white_value",
          "unknown", "light_id", "sound_ambience_id", "sound_music_id")
NAME_FIELD = 1                 # the one string column
AURA_SCREEN_EFFECT = 260


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def emit(ctx):
    if ctx.sfx != "_K":
        return "skipped (emits on the Kezan pass)"

    # Same partial-run guard as summonproperties: the scope comes from the
    # collected/derived spell set, so a run without spells.py would write a
    # near-empty full-state file over a good one.
    if not ctx.col.pks("creature_template", owned=True):
        raise RuntimeError(
            "no creature_template collected — screeneffect derives its scope from "
            "the ported spell set; run a full `zep goblin gen`")

    scope = _sibling("_spellscope")
    ported = scope.ported(ctx)
    _have, eff = scope.whitemane_spells(ctx)

    wanted = {}      # screeneffect id -> [spell ids]
    for sid in sorted(ported):
        for e in eff.get(sid, {}).values():
            if e[scope.E_AURA] == AURA_SCREEN_EFFECT:
                se = e[12]           # EffectMiscValueA
                if se:
                    wanted.setdefault(se, []).append(sid)
    if not wanted:
        return "0 rows (no screen-effect auras in scope)"

    # STOCK, never live (reference_dbc_stock_determinism).
    stock = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM screeneffect")}
    missing = sorted(s for s in wanted if s not in stock)
    if not missing:
        return "0 rows (all %d referenced ids are stock)" % len(wanted)

    recs, getstr = ctx.read_wdbc(ctx.whitemane_dbc("ScreenEffect.dbc"))
    src = {r[0]: r for r in recs}

    added, absent = 0, []
    for se in missing:
        row = src.get(se)
        if row is None:
            absent.append(se)
            continue
        cols = {}
        for i, c in enumerate(FIELDS):
            cols[c] = getstr(row[i]) if i == NAME_FIELD else int(row[i])
        ctx.col.put("screeneffect", se, cols, tier="base", owner=NAME,
                    note="%d <- spell %s" % (
                        se, ", ".join(str(s) for s in sorted(wanted[se]))))
        added += 1

    out = "%d rows (of %d referenced ids, %d already stock)" % (
        added, len(wanted), len(wanted) - len(missing))
    if absent:
        out += "; NOT in the 4.3.4 client DBC: " + ", ".join(str(s) for s in absent)
    return out
