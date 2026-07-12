"""gen domain: item_icons — sole authority for every custom item's displayid.

For each item in the remap, resolve the client inventory icon from the Whitemane
client (Item.db2 DisplayInfoID -> ItemDisplayInfo InventoryIcon), then:

  * if a STOCK 3.3.5a ItemDisplayInfo row (id < 200000) already uses that icon,
    point the item at it -- this reuses the real display (icon AND equipped model);
  * otherwise mint a custom icon-only row (200100+, icon_1 = the Cata icon basename)
    and point the item there. A genuinely new icon needs its BLP shipped in PATCH-Z;
    an icon whose BLP already exists in 3.3.5a but is unused by any stock display
    just gets a row that references it. Items sharing an icon share one 200100+ row.

Resolution is deterministic: the stock lookup excludes our own 200100+ rows, so it
does not depend on whether a prior gen's custom rows are applied. Owns both sides:
  * DBC  (tier=base):    itemdisplayinfo 200100+ rows.
  * world (tier=overlay): item_template.displayid.

Covers the full remap in one pass on the Lost Isles pass; the overlay-wins merge
lands each displayid on the Kezan/vendor base rows contributed on their zone pass.
"""
import os
import importlib.util

_spec = importlib.util.spec_from_file_location(
    "goblin_gen__itemdb", os.path.join(os.path.dirname(__file__), "_itemdb.py"))
_idb = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_idb)

NAME = "item_icons"
TABLES = ["item_template", "itemdisplayinfo"]
TIER = "overlay"
IDI_BASE = 200100


def emit(ctx):
    if ctx.sfx:
        return "skipped (full remap covered on Lost Isles pass)"
    wm = _idb.WhitemaneItems(ctx)
    remap = _idb.full_remap(ctx)                     # cata -> newid (all zones)

    icon_ids = {}                                    # cata-only icon basename -> minted 200100+ id
    stock, minted, noicon = 0, 0, 0
    for cata, newid in sorted(remap.items(), key=lambda kv: kv[1]):
        nm = wm.icon_name(cata)
        if not nm:
            noicon += 1
            continue                                 # no client icon -> leave base displayid (0)
        did = wm.resolve_displayid(cata)             # stock (id < 200000) display sharing this icon, or 0
        if did:
            stock += 1
        else:
            key = nm.strip().lower()
            if key not in icon_ids:
                icon_ids[key] = (IDI_BASE + len(icon_ids), nm)
            did = icon_ids[key][0]
            minted += 1
        ctx.col.put("item_template", newid, {"displayid": did}, tier="overlay")

    for did, nm in sorted(icon_ids.values()):
        ctx.col.put("itemdisplayinfo", did, {"id": did, "icon_1": nm, "icon_2": ""},
                    tier="base", owner="item_icons")

    return "displayid: stock=%d custom=%d (rows=%d) no-icon=%d" % (
        stock, minted, len(icon_ids), noicon)
