"""gen domain: items.

Whitemane 4.3.4 Item-sparse.db2 + Item.db2 -> AC 3.3.5a item_template for the F-011
custom items (the `missing_items` fixture -- ids referenced by the port but absent from
the Neltharion source), renumbered into the reserved 84300+ block. Icons (displayid) are
resolved straight from client data (Item.db2 DisplayInfoID -> Whitemane ItemDisplayInfo
InventoryIcon -> live 3.3.5a itemdisplayinfo). Port of Scripts/Goblin Zone Port/
migrate_items.py.

append_items.py (the Kezan `_K` variant) is NOT folded in here: it does not append to
this file, it emits a separate zz_[F-011]_K_items.sql whose ids come from the post-vendor
remap extension (migrate_vendors + append_items), which is owned by other domains -- so it
belongs with the vendor port, not here.

Single combined file, emitted on the Lost Isles (empty-suffix) pass only.
"""
import os
import importlib.util

_spec = importlib.util.spec_from_file_location(
    "goblin_gen__itemdb", os.path.join(os.path.dirname(__file__), "_itemdb.py"))
_idb = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_idb)

NAME = "items"


def emit(ctx):
    if ctx.sfx:                       # combined non-suffixed file: emit once, on Lost Isles
        return "skipped (combined file emitted on Lost Isles pass only)"
    wm = _idb.WhitemaneItems(ctx)
    _missing, remap = _idb.remap(ctx)

    rows = []                         # (newid, cata, cols) for items present in the client
    missing_from_client = []
    for cata in sorted(remap, key=lambda c: remap[c]):
        if not wm.sp.has(cata):
            missing_from_client.append(cata)
            continue
        rows.append((remap[cata], cata, _idb.item_cols(wm, cata, remap[cata])))
    rows.sort()

    b = [
        "-- F-011 Lost Isles custom items (from Whitemane 4.3.4 Item-sparse.db2, renumbered to 84300+)",
        "-- %d items. Owned custom rows: DELETE+INSERT. Icons (displayid) resolved from each" % len(rows),
        "-- item's client DisplayInfoID via ItemDisplayInfo -> live 3.3.5a itemdisplayinfo.\n",
    ]
    for newid, cata, cols in rows:
        b.append("-- Cata %d -> %d  (%s)" % (cata, newid, cols["name"]))
        b.append("DELETE FROM item_template WHERE entry = %d;" % newid)
        b.append("INSERT INTO item_template SET")
        b.append(",\n".join("  `%s` = %s" % (k, _idb.esc(v)) for k, v in cols.items()) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]_items.sql", "\n".join(b) + "\n")

    resolved = sum(1 for _, _, c in rows if c["displayid"])
    extra = " (%d absent from client DB2)" % len(missing_from_client) if missing_from_client else ""
    return "items=%d icons=%d/%d%s" % (len(rows), resolved, len(rows), extra)
