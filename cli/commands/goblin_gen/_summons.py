"""Shared helper: creatures summoned by ported (missing_spells) Cata spells.

Leading underscore -> not a gen domain; loaded by creatures.py / spellclick.py
via their sibling-module loader.

The zone creature sweep is spawn-driven (`creature` rows in zone 4720/4737), so
a creature that only ever exists as a SPELL SUMMON never enters the collected
set — its template, spellclick and vehicle data all silently drop (I-242: quest
14071 "Rolling with my Homies" key item casts 66393, which summons Hot Rod
34840; no template row -> no car). This helper closes that hole: every spell in
the missing_spells fixture (the F-011 ported-spell set) is scanned in the
Whitemane SpellEffect.dbc for effect 28 (SUMMON), and the summoned creature
entries are returned so the sweeps can include them.

Entries are filtered to rows that exist in the Neltharion creature_template and
to real content ids (< 1000000, the I-233 dev/leet filter). The NOISE name
filter is deliberately NOT applied: if a ported spell summons an invisible
trigger bunny, that bunny must exist for the spell to work.
"""

SPELLEFFECT_SPELLID = 24    # SpellEffect.dbc: SpellID field
SPELLEFFECT_EFFECT = 1      # Effect kind
SPELLEFFECT_MISC_A = 12     # EffectMiscValueA (creature entry for effect 28)
EFFECT_SUMMON = 28


def summoned_entries(ctx):
    """{creature_entry: summoning_spell_id} for summon effects of ported spells.

    Cached on ctx (one Whitemane SpellEffect.dbc parse per zone pass at most).
    """
    cached = getattr(ctx, "_summoned_entries_cache", None)
    if cached is not None:
        return cached
    ported = set(ctx.fixture("missing_spells"))
    recs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SpellEffect.dbc"))
    known = {int(r["entry"]) for r in
             ctx.q("SELECT entry FROM creature_template WHERE entry < 1000000")}
    out = {}
    for r in recs:
        if r[SPELLEFFECT_SPELLID] in ported and r[SPELLEFFECT_EFFECT] == EFFECT_SUMMON:
            entry = r[SPELLEFFECT_MISC_A]
            if entry in known:
                out[entry] = r[SPELLEFFECT_SPELLID]
    ctx._summoned_entries_cache = out
    return out
