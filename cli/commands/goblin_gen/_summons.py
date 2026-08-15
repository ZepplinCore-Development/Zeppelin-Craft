"""Shared helper: creatures summoned by the spells the F-011 port carries.

Leading underscore -> not a gen domain; loaded by creatures.py / creature_addon.py
/ spellclick.py via their sibling-module loader.

The zone creature sweep is spawn-driven (`creature` rows in zone 4720/4737), so
a creature that only ever exists as a SPELL SUMMON never enters the collected
set — its template, spellclick and vehicle data all silently drop (I-242: quest
14071 "Rolling with my Homies" key item casts 66393, which summons Hot Rod
34840; no template row -> no car). This helper closes that hole: the port's
spell set is scanned in the Whitemane SpellEffect.dbc for effect 28 (SUMMON),
and the summoned creature entries are returned so the sweeps can include them.

SCOPE IS DERIVED (I-285). This used to read the `missing_spells` fixture, which
stopped being the port's spell set when I-274 replaced it with the derived
`_spellscope` walk and left it as an ADDITIONS list — 67 hand-listed ids against
210 actually ported. Every summon reached only by the derived walk therefore lost
its creature template, and the spell then summoned an entry the world DB did not
have: 19 of the port's 34 summon effects, including 35813 Frightened Miner
(quest 14021 "Miner Troubles" — Foreman Dampwick's "I need another miner" gossip
option was a dead click, with no error anywhere because AC's EffectSummonType
only logs the missing SummonProperties, never the missing creature).

`_spellscope.presweep_required()` is the scope, NOT `ported()`: this runs before
any template is collected, so the collected-scope walk is unavailable (and would
be circular — the whole point is to decide what gets collected). It is a
superset of the ported set, which is the safe direction: an extra entry offered
to the sweep is dropped if the source lacks it, whereas a missing one is a dead
summon. Validation still happens in spells.py — a summon spell rejected there
just leaves an unused template behind.

Entries are filtered to rows that exist in the Neltharion creature_template and
to real content ids (< 1000000, the I-233 dev/leet filter). The NOISE name
filter is deliberately NOT applied: if a ported spell summons an invisible
trigger bunny, that bunny must exist for the spell to work.
"""

import importlib.util
import os

SPELLEFFECT_SPELLID = 24    # SpellEffect.dbc: SpellID field
SPELLEFFECT_EFFECT = 1      # Effect kind
SPELLEFFECT_MISC_A = 12     # EffectMiscValueA (creature entry for effect 28)
SPELLEFFECT_MISC_B = 13     # EffectMiscValueB (SummonProperties id for effect 28)
EFFECT_SUMMON = 28

# Creatures a donor C++ script summons with `me->SummonCreature(...)` instead of a
# spell. The effect-28 walk below cannot see them: there is no SUMMON effect to
# scan, so they never enter the sweep and arrive with NO creature_template at all
# — and unlike a missing SummonProperties, AC never logs the missing creature
# (I-285). Whenever a donor script is re-implemented (as SmartAI here or as C++ in
# creatures.SCRIPT_NAME_PORTS), grep its body for SummonCreature and list the
# entries here, or the re-implementation summons nothing.
#
# {entry: donor script that summons it}
CPP_SUMMONS = {
    # I-336, quest 24868 "Surrender or Else!" — npc_ace_surrender_escort
    # (lost_isles.cpp:1204). Ace 38455 summons four hatchlings on IsSummonedBy and
    # the Faceless + its void zone at waypoint 35.
    38457: "npc_ace_surrender_escort",   # Naga Hatchling (the four that follow Ace)
    38450: "npc_ace_surrender_escort",   # Faceless of the Deep Void Zone
}


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def _scope(ctx):
    """Spell ids whose summons must exist, widest safe derivation (see module doc)."""
    scope = _sibling("_spellscope").presweep_required(ctx)
    return set(scope) | {int(s) for s in ctx.fixture("missing_spells")}


def _summon_effects(ctx):
    """[(spell_id, creature_entry, summonproperties_id)] for the port's summons."""
    cached = getattr(ctx.col, "_summon_effects_cache", None)
    if cached is not None:
        return cached
    scope = _scope(ctx)
    recs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SpellEffect.dbc"))
    known = {int(r["entry"]) for r in
             ctx.q("SELECT entry FROM creature_template WHERE entry < 1000000")}
    out = []
    for r in recs:
        if r[SPELLEFFECT_SPELLID] in scope and r[SPELLEFFECT_EFFECT] == EFFECT_SUMMON:
            entry = r[SPELLEFFECT_MISC_A]
            if entry in known:
                out.append((r[SPELLEFFECT_SPELLID], entry, r[SPELLEFFECT_MISC_B]))
    out.sort()
    ctx.col._summon_effects_cache = out
    return out


def summoned_entries(ctx):
    """{creature_entry: summoning_spell_id} for summon effects of ported spells.

    Plus CPP_SUMMONS (spell id 0) — script-summoned entries with no SUMMON effect
    to derive them from. `summon_property_ids()` deliberately does not see these:
    a `SummonCreature()` call takes no SummonProperties row.
    """
    cached = getattr(ctx, "_summoned_entries_cache", None)
    if cached is not None:
        return cached
    out = {}
    for sid, entry, _props in _summon_effects(ctx):
        out.setdefault(entry, sid)
    if CPP_SUMMONS:
        ids = ",".join(str(int(e)) for e in sorted(CPP_SUMMONS))
        for r in ctx.q("SELECT entry FROM creature_template WHERE entry IN (%s)" % ids):
            out.setdefault(int(r["entry"]), 0)
    ctx._summoned_entries_cache = out
    return out


def summon_property_ids(ctx):
    """{summonproperties_id: [spell ids]} referenced by the port's summon effects.

    AC's `Spell::EffectSummonType` returns early when `SummonProperties` has no
    row for MiscValueB, so a Cata-only properties id is a summon that never
    happens (I-285). Consumed by the summonproperties domain.
    """
    out = {}
    for sid, _entry, props in _summon_effects(ctx):
        if props:
            out.setdefault(props, []).append(sid)
    return out
