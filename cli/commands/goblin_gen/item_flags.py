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
TABLES = ["item_template"]
TIER = "overlay"


def emit(ctx):
    # Overlay: authoritative item Flags from the Whitemane source, masked to
    # WotLK-valid bits (0x7FFFFFFF drops the Cata sign bit). Covers the full remap
    # (Lost Isles + Kezan + vendor) in one pass on Lost Isles; overlay-wins merge
    # means it lands on Kezan base rows added on the later zone pass.
    if ctx.sfx:
        return "skipped (full remap covered on Lost Isles pass)"
    wm = _idb.WhitemaneItems(ctx)
    remap = _idb.full_remap(ctx)

    n = 0
    for cata, newid in sorted(remap.items(), key=lambda kv: kv[1]):
        if not wm.sp.has(cata):
            continue
        flags = wm.sp.i(cata, 2) & 0x7FFFFFFF
        if flags:
            ctx.col.put("item_template", newid, {"Flags": flags}, tier="overlay")
            n += 1
    return "flag rows=%d (full remap)" % n
