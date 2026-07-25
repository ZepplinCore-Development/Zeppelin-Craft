"""gen domain: item_icons — sole authority for every custom item's displayid.

Two responsibilities, resolved in one pass on the Lost Isles pass (covers the full
cross-zone remap):

1. WORN ARMOR (I-267). For each equippable armor piece, port the item's *real*
   Cataclysm ItemDisplayInfo row — geosets + the eight body texture components —
   from the Whitemane client, mint a full display row (201000+, deduped by identical
   appearance), ship the referenced TextureComponents BLPs into the zpak (they pack
   into PATCH-Z), and point item_template.displayid there. This is what makes the
   equipped item actually render on the character; without it the display row carries
   only an icon and the goblin equips into nothing (underwear bug). Body-armor texture
   components are sex-specific but race-agnostic (`_M`/`_F`/`_U`), so they wear on the
   goblin model exactly as on any standard character. Armor whose display row carries
   an attachment model (helm/shoulder M2) or references a texture component we cannot
   source falls through to the icon path below — M2s are NOT format-stable and stay a
   curated retroport step.

2. EVERYTHING ELSE (icons). Resolve the client inventory icon (Item.db2 DisplayInfoID
   -> ItemDisplayInfo InventoryIcon), then:
     * if a STOCK 3.3.5a ItemDisplayInfo row (id < 200000) already uses that icon,
       point the item at it -- reuses the real display (icon AND, for non-worn items,
       whatever model it carries);
     * otherwise mint an icon-only row (200100+, icon_1 = the Cata icon basename) and
       point the item there. Items sharing an icon share one row.

Resolution is deterministic: the stock lookup excludes our own 200100+/201000+ rows,
so it does not depend on whether a prior gen's custom rows are applied. Owns both sides:
  * DBC  (tier=base):    itemdisplayinfo 200100+ (icon) and 201000+ (worn) rows.
  * world (tier=overlay): item_template.displayid.
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
IDI_ICON_BASE = 200100     # icon-only rows (items with no worn body model)
IDI_WORN_BASE = 201000     # full worn-armor rows (geosets + texture components)

# ItemDisplayInfo column order (3.3.5a and 4.3.4 share this string layout) and which
# field indices are string offsets (resolved via get_string) when read from a WDBC.
_IDI_COLS = ["id", "left_model", "right_model", "left_model_texture", "right_model_texture",
             "icon_1", "icon_2", "geoset_group_1", "geoset_group_2", "geoset_group_3", "flags",
             "spell_visual_id", "group_sound_index", "helmet_geoset_male", "helmet_geoset_female",
             "upper_arm_texture", "lower_arm_texture", "hands_texture", "upper_torso_texture",
             "lower_torso_texture", "upper_leg_texture", "lower_leg_texture", "foot_texture",
             "item_visual", "particle_colour_id"]
_IDI_STRF = {1, 2, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22}
_TEX_FIELDS = ["upper_arm_texture", "lower_arm_texture", "hands_texture", "upper_torso_texture",
               "lower_torso_texture", "upper_leg_texture", "lower_leg_texture", "foot_texture"]
# Armor slots whose worn appearance is driven by body texture components + geosets.
# Head(1)/shoulder(3) are included but self-guard: if their display row carries an
# attachment M2 (left/right_model) we fall through to the icon path (no M2 retroport).
_WORN_SLOTS = {1, 3, 5, 6, 7, 8, 9, 10, 16, 20}
_ARMOR_CLASS = 4


def _load_full_idi(ctx):
    """did -> full ItemDisplayInfo column dict, read from the Whitemane client DBC."""
    recs, gs = ctx.read_wdbc(ctx.whitemane_dbc("ItemDisplayInfo.dbc"))
    return {r[0]: {c: (gs(r[i]) if i in _IDI_STRF else r[i])
                   for i, c in enumerate(_IDI_COLS)}
            for r in recs}


def _texcomp_index(ctx):
    """Lowercased component stem -> list of extract-relative BLP paths, for
    Item\\TextureComponents. A file `<stem>_<sex>.blp` is keyed by `<stem>`, so an
    ItemDisplayInfo texture field maps straight to every sex/unisex variant to ship.
    Cached on ctx so both zone passes share one walk."""
    idx = getattr(ctx, "_texcomp_idx", None)
    if idx is not None:
        return idx
    root = os.path.dirname(os.path.dirname(ctx.whitemane_dbc("ItemDisplayInfo.dbc")))
    idx = {}
    for dp, _dn, fns in os.walk(root):
        if "texturecomponents" not in dp.lower():
            continue
        for fn in fns:
            if not fn.lower().endswith(".blp"):
                continue
            stem = fn[:-4].rsplit("_", 1)[0].lower()   # drop ext, then trailing _sex
            idx.setdefault(stem, []).append(
                os.path.relpath(os.path.join(dp, fn), root))
    ctx._texcomp_idx = idx
    return idx


def _worn_row(wr, icon):
    """Full itemdisplayinfo column dict for a ported worn-armor display (id filled by
    caller). String fields stay strings, numeric fields stay ints; icon overridden with
    our resolved 3.3.5a icon basename."""
    row = {}
    for i, c in enumerate(_IDI_COLS):
        if c == "id":
            continue
        v = wr[c]
        row[c] = (str(v) if i in _IDI_STRF else int(v))
    row["icon_1"] = icon or ""
    row["icon_2"] = ""
    return row


def emit(ctx):
    if ctx.sfx:
        return "skipped (full remap covered on Lost Isles pass)"
    wm = _idb.WhitemaneItems(ctx)
    remap = _idb.full_remap(ctx)                      # cata -> newid (all zones)
    full_idi = _load_full_idi(ctx)
    texidx = _texcomp_index(ctx)

    icon_ids = {}                                    # icon basename -> minted 200100+ id
    worn_ids = {}                                    # appearance tuple -> (201000+ id, row)
    shipped = set()
    stock = minted = noicon = worn = worn_skip = 0

    for cata, newid in sorted(remap.items(), key=lambda kv: kv[1]):
        meta = wm.meta(cata)
        cls = int(meta.get("ClassID", -1)) if meta else -1
        inv = int(meta.get("InventoryType", 0)) if meta else 0
        did_cata = int(meta.get("DisplayInfoID", 0)) if meta else 0
        nm = wm.icon_name(cata)

        # ---- worn-armor branch: port the real Cata display + ship its textures ----
        if cls == _ARMOR_CLASS and inv in _WORN_SLOTS:
            wr = full_idi.get(did_cata)
            if wr and not (wr["left_model"] or "").strip() and not (wr["right_model"] or "").strip():
                ship, ok, any_tex = [], True, False
                for f in _TEX_FIELDS:
                    v = (wr[f] or "").strip()
                    if not v:
                        continue
                    variants = texidx.get(v.lower())
                    if not variants:
                        ok = False
                        break
                    any_tex = True
                    ship.extend(variants)
                if ok and any_tex:
                    row = _worn_row(wr, nm)
                    key = tuple(str(row[c]) for c in _IDI_COLS if c != "id")
                    if key not in worn_ids:
                        worn_ids[key] = (IDI_WORN_BASE + len(worn_ids), row)
                    wid = worn_ids[key][0]
                    for rel in ship:
                        if rel not in shipped:
                            ctx.ship_asset(rel)
                            shipped.add(rel)
                    ctx.col.put("item_template", newid, {"displayid": wid}, tier="overlay")
                    worn += 1
                    continue
                worn_skip += 1                       # unshippable/model-bearing -> icon path

        # ---- icon path (non-worn items, and worn fallbacks) ----
        if not nm:
            noicon += 1
            continue                                 # no client icon -> leave base displayid (0)
        did = wm.resolve_displayid(cata)             # stock (id < 200000) display sharing this icon, or 0
        if did:
            stock += 1
        else:
            k = nm.strip().lower()
            if k not in icon_ids:
                icon_ids[k] = (IDI_ICON_BASE + len(icon_ids), nm)
            did = icon_ids[k][0]
            minted += 1
        ctx.col.put("item_template", newid, {"displayid": did}, tier="overlay")

    for did, nm in sorted(icon_ids.values()):
        ctx.col.put("itemdisplayinfo", did, {"id": did, "icon_1": nm, "icon_2": ""},
                    tier="base", owner="item_icons")
    for wid, row in sorted(worn_ids.values()):
        ctx.col.put("itemdisplayinfo", wid, dict({"id": wid}, **row),
                    tier="base", owner="item_icons")

    return ("displayid: worn=%d (rows=%d, blps=%d) stock=%d icon=%d (rows=%d) "
            "no-icon=%d worn-fallback=%d" % (
                worn, len(worn_ids), len(shipped), stock, minted, len(icon_ids),
                noicon, worn_skip))
