"""gen domain: item_icons.

Point each custom item's item_template.displayid at a dedicated custom ItemDisplayInfo
row (200100+). Icon names come from the Whitemane client (Item.db2 DisplayInfoID ->
ItemDisplayInfo InventoryIcon); items sharing an icon share one 200100+ id. Port of the
SQL half of Scripts/Goblin Zone Port/build_icons.py (the ItemDisplayInfo DBC rows + BLP
shipping are DBC/asset outputs, out of the world-SQL scope).

Scoped to this domain's items (the Lost Isles `missing_items` block). The committed
zz_[F-011]_item_icons.sql additionally covers the vendor/Kezan items appended to the remap
by other domains; those rows are contributed when those domains are ported.

Single combined file, emitted on the Lost Isles (empty-suffix) pass only.
"""
import os
import importlib.util

_spec = importlib.util.spec_from_file_location(
    "goblin_gen__itemdb", os.path.join(os.path.dirname(__file__), "_itemdb.py"))
_idb = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_idb)

NAME = "item_icons"
IDI_BASE = 200100


def emit(ctx):
    if ctx.sfx:
        return "skipped (combined file emitted on Lost Isles pass only)"
    wm = _idb.WhitemaneItems(ctx)
    missing, remap = _idb.remap(ctx)

    icon_ids = {}                     # icon basename -> assigned ItemDisplayInfo id
    item_disp = {}                    # newid -> ItemDisplayInfo id
    for cata in missing:              # remap insertion order (cata-sorted) -- stable dedup
        nm = wm.icon_name(cata)
        if not nm:
            continue
        if nm not in icon_ids:
            icon_ids[nm] = IDI_BASE + len(icon_ids)
        item_disp[remap[cata]] = icon_ids[nm]

    b = ["-- F-011 set item_template.displayid to the ItemDisplayInfo icon rows\n"]
    for newid, did in sorted(item_disp.items()):
        b.append("UPDATE item_template SET displayid=%d WHERE entry=%d;" % (did, newid))
    ctx.write("sql/zz_[AUTO,F-011]_item_icons.sql", "\n".join(b) + "\n")
    return "icons=%d distinct=%d" % (len(item_disp), len(icon_ids))
