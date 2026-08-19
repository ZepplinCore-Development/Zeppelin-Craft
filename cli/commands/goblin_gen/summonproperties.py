"""gen domain: summonproperties (I-285).

Cata `SummonProperties.dbc` rows referenced by the port's SUMMON effects but
absent from stock 3.3.5a -> the 3.3.5a `summonproperties` DBC table.

WHY THIS EXISTS
---------------
`Spell::EffectSummonType` looks MiscValueB up in `sSummonPropertiesStore` and
**returns before summoning anything** when the row is missing:

    SummonPropertiesEntry const* properties = sSummonPropertiesStore.LookupEntry(...);
    if (!properties) { LOG_ERROR("spells.effect", "Unhandled summon type {}"); return; }

Nothing in the port ever emitted this table, so every ported summon spell whose
Cata properties id postdates 3.3.5a was a silent no-op: 8 ids (1621, 2261, 2341,
2910, 2989, 3023, 3048, 3090) across 12 summon effects, including 68059
"Miner Troubles: Summon Frightened Miner" — the spell behind Foreman Dampwick's
"I need another miner" gossip option (quest 14021), which did nothing at all.

The row is copied VERBATIM. The 4.3.4 `SUMMON_PROP_FLAG_*` enum is bit-identical
to AC 3.3.5a's for every bit AC tests (verified against the Neltharion source
DBCEnums.h: same UNK numbering and same meanings up to 0x00100000); Cata only
appended higher bits, which AC never reads. Category/Type likewise share their
3.3.5a numbering. So there is nothing to translate — the field layout is the
same 6 columns in both builds.

Scope is DERIVED from `_summons.summon_property_ids()`, i.e. the same spell-set
walk that decides which summoned creature templates ship, so the two cannot
drift: a spell can no longer arrive with a creature and no properties row, or
the reverse. Emitted on the LAST (_K) pass, like spells.py, because the derived
scope needs both zones walked.
"""
import importlib.util
import os

NAME = "summonproperties"
TABLES = ["summonproperties"]
# Collector tables this domain READS but does not write -- the contributor
# closure must pull their producers into any partial `gen` run or the read
# comes back empty and this file ships under-populated (see I-267).
# scoped off the collected creature templates
READS = ['creature_template']
TIER = "base"

# SummonProperties.dbc field order (identical in 3.3.5a and 4.3.4).
FIELDS = ("id", "control", "faction", "title", "slot", "flags")


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def emit(ctx):
    # Zone-independent set (like spells) -> emit once, on the last pass, so the
    # derived walk has seen both zones.
    if ctx.sfx != "_K":
        return "skipped (emits on the Kezan pass)"

    # The scope is derived from the COLLECTED templates (via _spellscope), so a run
    # that did not also run creatures/spells would quietly write a near-empty
    # full-state file over a good one. Fail loudly instead — `_contributor_closure`
    # only pulls in co-writers of the same TABLE, which cannot see this dependency.
    if not ctx.col.pks("creature_template", owned=True):
        raise RuntimeError(
            "no creature_template collected — summonproperties derives its scope from "
            "the ported spell set; run a full `zep goblin gen`")

    # Narrow the pre-sweep superset to the spells spells.py actually emits: this
    # domain runs on the last pass with the collector complete, so unlike _summons
    # it CAN ask the real question, and a properties row for a rejected spell is a
    # row nothing can ever look up.
    emitted = _sibling("_spellscope").ported(ctx)
    wanted = {p: [s for s in spells if s in emitted]
              for p, spells in _sibling("_summons").summon_property_ids(ctx).items()}
    wanted = {p: spells for p, spells in wanted.items() if spells}
    if not wanted:
        return "0 rows (no summon effects in scope)"

    # STOCK, never live: what 3.3.5a already has must not depend on apply state
    # (see reference_dbc_stock_determinism / I-274).
    stock = {int(r["id"]) for r in
             ctx.stock_dbc_query("SELECT id FROM summonproperties")}
    missing = sorted(p for p in wanted if p not in stock)
    if not missing:
        return "0 rows (all %d referenced ids are stock)" % len(wanted)

    recs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SummonProperties.dbc"))
    src = {r[0]: r for r in recs}

    added, absent = 0, []
    for pid in missing:
        row = src.get(pid)
        if row is None:
            absent.append(pid)
            continue
        ctx.col.put("summonproperties", pid,
                    {c: int(row[i]) for i, c in enumerate(FIELDS)},
                    tier="base", owner=NAME,
                    note="%d <- spell %s" % (pid, ", ".join(str(s) for s in sorted(wanted[pid]))))
        added += 1

    out = "%d rows (of %d referenced ids, %d already stock)" % (
        added, len(wanted), len(wanted) - len(missing))
    if absent:
        # A referenced id in neither build is a broken source reference, not a
        # gap this emitter can close — name it rather than count it.
        out += "; NOT in the 4.3.4 client DBC: " + ", ".join(
            "%d (spells %s)" % (p, ",".join(str(s) for s in sorted(wanted[p])))
            for p in absent)
    return out
