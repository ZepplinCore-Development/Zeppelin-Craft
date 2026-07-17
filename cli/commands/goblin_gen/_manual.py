"""Shared helper: hand-placed spawns for creatures the source dump never spawns.

Leading underscore -> not a gen domain; loaded by creatures.py / spellclick.py /
quest_npcs.py via their sibling-module loader.

The zone creature sweep is spawn-driven and I-242's summon sweep only catches
creatures summoned by ported spells — a creature the Neltharion dump neither
spawns nor summons is invisible to every domain even when the rest of its data
(template, spellclick, vehicle) is fully present in the source (I-246: quest
24502 "Necessary Roughness" — Bilgewater Buccaneer 37179, the rideable shredder,
has no source spawn rows; retail spawns it as static field furniture the dump
simply never captured). The manual_spawns fixture closes that hole: each row is
a hand-authored spawn (FINAL map-1 world coords — no map648 offset is applied)
whose entry joins the zone sweep exactly like a spawned creature, so template,
model/DBC ship, spellclick, vehicle and bar data all flow through the normal
domains.

Fixture guids must sit in [base+900000, base+949999] — high inside the zone's
1,000,000-guid block (far above the sequential AUTO range, so regens neither
collide with nor orphan them), and below base+950000, which is reserved for
hand-authored [I-xxx] spawn override files (e.g. the I-246 shark relocations).
"""


def manual_rows(ctx):
    """Hand-authored spawn rows (list[dict]) for the current zone pass."""
    try:
        return ctx.fixture("manual_spawns" + ctx.sfx)
    except FileNotFoundError:
        return []


def manual_entries(ctx):
    """{creature_entry} of the current pass's manual spawns."""
    return {int(r["entry"]) for r in manual_rows(ctx)}
