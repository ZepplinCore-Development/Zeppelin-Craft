"""gen domain: item_spells.

Wire each custom item to its on-use spell (item_template.spellid_N / spelltrigger_N) from
the curated `item_spell_wm` fixture (newid -> [(spell, trigger)], sourced from Whitemane).
Only wires spells that actually exist now -- stock 3.3.5a (live DBC) or newly ported in the
zpak dbc/[F-011]_spell.sql. Port of Scripts/Goblin Zone Port/wire_item_spells.py.

The fixture is keyed by final F-011 item id and already spans all zones, so this reproduces
the full committed file independently of the remap. Single combined file, emitted on the
Lost Isles (empty-suffix) pass only.
"""
import os
import re

NAME = "item_spells"
TABLES = ["item_template"]
TIER = "overlay"

# cli/commands/goblin_gen/item_spells.py -> zpak dbc dir
_ZPAK = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__))))), "zpaks", "zep-goblin-start")


def _ported_spells():
    """Spell ids newly added by the zpak DBC (leading '-- <id> ' lines of [F-011]_spell.sql)."""
    path = os.path.join(_ZPAK, "dbc", "[F-011]_spell.sql")
    out = set()
    if os.path.exists(path):
        for line in open(path):
            m = re.match(r"-- (\d+) ", line)
            if m:
                out.add(int(m.group(1)))
    return out


def emit(ctx):
    # Overlay: on-use spell wiring. The fixture is keyed by final id and spans all
    # zones, so it's applied once on the Lost Isles pass (overlay-wins merge lands
    # it on Kezan base rows added on the later zone pass).
    if ctx.sfx:
        return "skipped (fixture spans all zones; applied on Lost Isles pass)"
    item_spell = ctx.fixture("item_spell_wm")          # newid -> [[spell, trigger], ...]
    usable = ctx.dbc_spell_ids() | _ported_spells()    # present in 3.3.5a OR ported by F-011

    n = 0
    for newid, pairs in item_spell.items():
        cols = {}
        for i, (sp, tr) in enumerate(pairs[:5], 1):
            if sp in usable:
                cols["spellid_%d" % i] = sp
                cols["spelltrigger_%d" % i] = tr
        if cols:
            ctx.col.put("item_template", int(newid), cols, tier="overlay")
            n += 1
    return "wired=%d" % n
