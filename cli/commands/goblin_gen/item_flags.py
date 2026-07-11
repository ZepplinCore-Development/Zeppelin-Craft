"""gen domain: item_flags.

Restore item_template.Flags for the custom items from the Whitemane source ItemSparse
Flags field, masked to WotLK-valid bits (0x7FFFFFFF -- drops the Cata sign bit). The low
bits (conjured / player-cast / party-loot / millable / prospectable ...) are stable
3.3.5 <-> 4.x. Emits one UPDATE per item with a non-zero mask.

No standalone source script emits zz_[F-011]_item_flags.sql -- it restores the same masked
Flags the items emitter already writes into item_template SET. Kept as its own idempotent
file (loads after, overrides if needed), matching the committed layout.

Scoped to this domain's items (Lost Isles `missing_items` block); the committed file also
carries the vendor/Kezan items appended to the remap by other domains.

Single combined file, emitted on the Lost Isles (empty-suffix) pass only.
"""
import os
import importlib.util

_spec = importlib.util.spec_from_file_location(
    "goblin_gen__itemdb", os.path.join(os.path.dirname(__file__), "_itemdb.py"))
_idb = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_idb)

NAME = "item_flags"


def emit(ctx):
    if ctx.sfx:
        return "skipped (combined file emitted on Lost Isles pass only)"
    wm = _idb.WhitemaneItems(ctx)
    missing, remap = _idb.remap(ctx)

    rows = []
    for cata in sorted(remap, key=lambda c: remap[c]):
        if not wm.sp.has(cata):
            continue
        flags = wm.sp.i(cata, 2) & 0x7FFFFFFF
        if flags:
            rows.append((remap[cata], flags))
    rows.sort()

    b = [
        "-- [F-011] Restore item_template.Flags for custom items from the Whitemane source.",
        "-- Whitemane ItemSparse Flags masked to WotLK-valid bits (0x7FFFFFFF; drops the Cata sign bit).",
        "-- Low bits (conjured/playercast/party-loot/millable/prospectable) are stable 3.3.5<->4.x. Idempotent.\n",
    ]
    for newid, flags in rows:
        b.append("UPDATE item_template SET Flags=%d WHERE entry=%d;" % (flags, newid))
    ctx.write("sql/zz_[AUTO,F-011]_item_flags.sql", "\n".join(b) + "\n")
    return "flag rows=%d" % len(rows)
