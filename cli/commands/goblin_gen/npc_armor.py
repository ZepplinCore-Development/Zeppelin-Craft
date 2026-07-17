"""gen domain: npc_armor (F-011 NPC equipment ItemDisplayInfo).

Ports the DBC half of Scripts/Goblin Zone Port/build_npc_armor.py.

The Cata-new NPC equipment referenced by the goblin-zone bakes needs its
ItemDisplayInfo rows (WotLK-identical string layout) present in our client, or the
equipped armour renders wrong (geosets: robe skirts, boot height, glove extents).
This emitter reads those rows straight out of the Whitemane 15595
ItemDisplayInfo.dbc and feeds them into the collector's itemdisplayinfo table
(shared with item_icons' minted 200100+ icon rows — the id spaces are disjoint).

The id set is DYNAMIC (I-249): every equipment id referenced by a collected
creaturedisplayinfoextra row (npc_appearance, both zones), plus the historical
curated `npc_equip_missing` fixture, minus ids the stock 3.3.5a client already
has. Overlay tier + final-pass emission so both zones' extras exist first.

Shipping the referenced component textures + attachment models from art.MPQ is an
asset side effect and stays out of the CLI (the body slots are covered by the
pre-baked BakedNpcTextures BLPs npc_appearance ships).
"""
NAME = "npc_armor"
TABLES = ["itemdisplayinfo"]
TIER = "overlay"   # reads npc_appearance's collected extras (runs after it by name)

EQUIP_FIELDS = ["helm_id", "shoulders_id", "shirt_id", "chest_id", "belt_id",
                "legs_id", "boots_id", "wrists_id", "gloves_id", "tabard_id", "cape_id"]

COLS = ["id", "left_model", "right_model", "left_model_texture", "right_model_texture",
        "icon_1", "icon_2", "geoset_group_1", "geoset_group_2", "geoset_group_3", "flags",
        "spell_visual_id", "group_sound_index", "helmet_geoset_male", "helmet_geoset_female",
        "upper_arm_texture", "lower_arm_texture", "hands_texture", "upper_torso_texture",
        "lower_torso_texture", "upper_leg_texture", "lower_leg_texture", "foot_texture",
        "item_visual", "particle_colour_id"]
STRF = {1, 2, 3, 4, 5, 6, 15, 16, 17, 18, 19, 20, 21, 22}   # string field indices


def emit(ctx):
    if ctx.sfx != "_K":
        return "deferred (emits on the final pass, after both zones' extras are collected)"

    wanted = set(ctx.fixture("npc_equip_missing"))
    for eid in ctx.col.pks("creaturedisplayinfoextra"):
        row = ctx.col.get("creaturedisplayinfoextra", eid) or {}
        for f in EQUIP_FIELDS:
            v = int(row.get(f) or 0)
            if v:
                wanted.add(v)
    stock = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM itemdisplayinfo")}
    missing = wanted - stock
    recs, get_string = ctx.read_wdbc(ctx.whitemane_dbc("ItemDisplayInfo.dbc"))

    rows = {}
    for r in recs:
        rid = r[0]
        if rid not in missing:
            continue
        vals = []
        for f in range(len(COLS)):
            vals.append(get_string(r[f]) if f in STRF else r[f])
        rows[rid] = vals

    for rid, v in rows.items():
        ctx.col.put("itemdisplayinfo", rid,
                    {c: (str(vv) if i in STRF else vv) for i, (c, vv) in enumerate(zip(COLS, v))},
                    tier="base", owner="npc_armor")

    return ("itemdisplayinfo=%d of %d missing (wanted=%d, %d already stock)" %
            (len(rows), len(missing), len(wanted), len(wanted & stock)))
