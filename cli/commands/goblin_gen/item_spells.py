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
    if ctx.sfx:
        return "skipped (combined file emitted on Lost Isles pass only)"
    item_spell = ctx.fixture("item_spell_wm")          # newid -> [[spell, trigger], ...]
    usable = ctx.dbc_spell_ids() | _ported_spells()    # present in 3.3.5a OR ported by F-011

    rows = []
    for newid, pairs in item_spell.items():
        sets = []
        for i, (sp, tr) in enumerate(pairs[:5], 1):
            if sp in usable:
                sets.append("spellid_%d=%d, spelltrigger_%d=%d" % (i, sp, i, tr))
        if sets:
            rows.append((int(newid), sets))
    rows.sort()

    b = [
        "-- F-011 wire custom items to on-use spells (stock + ported Whitemane 4.3.4 spells)",
        "-- %d items wired.\n" % len(rows),
    ]
    for newid, sets in rows:
        b.append("UPDATE item_template SET %s WHERE entry=%d;" % (", ".join(sets), newid))
    ctx.write("sql/zz_[AUTO,F-011]_item_spells.sql", "\n".join(b) + "\n")
    return "wired=%d" % len(rows)
