"""gen domain: fallback_models (F-011 retroported fallback creature models).

Ports the DBC/SQL-wiring half of Scripts/Goblin Zone Port/fallback_models.py.

The standalone script retroports 8 fallback creature M2s (Whitemane 4.3.4 v272 ->
WotLK v264 via MultiConverter) and ships them; the heavy asset conversion is a
side effect that stays out of the CLI. This emitter reproduces only the SQL/DBC
wiring for the converted models, driven by the `fb_plan` fixture's `needmodel`
list (the curated plan of which creature -> display -> model -> client path),
fed into the collector: creaturemodeldata + creaturedisplayinfo +
creature_model_info (owned rows), creature_template_model repoints as overlays
on the creatures-domain base rows.

Zone-independent (the plan is global); emitted once, on the Lost Isles pass.
Overlay wave so the creatures base rows exist when the repoints land.

NOTE: the standalone script only wired models that actually converted to v264
(conv_ok). Every model in the committed fb_plan converted successfully, so this
emitter treats the whole needmodel list as converted. Conversion failures cannot
be detected here (no wine/MultiConverter); a failed retroport would need the plan
entry pruned from the fixture.
"""
NAME = "fallback_models"
TABLES = ["creaturemodeldata", "creaturedisplayinfo", "creature_model_info",
          "creature_template_model"]
TIER = "overlay"

MD_COLS = ["id", "flags", "model_path", "size_class", "model_scale", "blood_id",
           "footprint_texture_id", "footprint_texture_length", "footprint_texture_width",
           "footprint_particle_scale", "foley_material_id", "footstep_shake_size",
           "death_thud_shake_size", "sound_data", "collision_width", "collision_height",
           "mount_height", "geo_box_min_x", "geo_box_min_y", "geo_box_min_z",
           "geo_box_max_x", "geo_box_max_y", "geo_box_max_z", "world_effect_scale",
           "attached_effect_scale", "missile_collision_radius", "missile_collision_push",
           "missile_collision_raise"]
DI_COLS = ["id", "model_id", "sound_id", "extended_display_info_id", "creature_model_scale",
           "creature_model_alpha", "texture_variation_1", "texture_variation_2",
           "texture_variation_3", "portrait_texture_name", "blood_level", "blood_id",
           "npc_sound_id", "praticle_color_id", "creature_geoset_data", "obj_effect_package_id"]


def emit(ctx):
    if ctx.sfx == "_K":
        return "skipped (zone-independent; emitted on Lost Isles pass)"

    needmodel = ctx.fixture("fb_plan")["needmodel"]

    # dedup distinct models by path (mirrors bymodel in the source)
    bymodel = {}
    for e, n, d0, mid, p in needmodel:
        bymodel.setdefault(p, (d0, mid, p))
    conv_ok = {}
    for path, (d0, mid, p) in bymodel.items():
        rel = p.replace("\\", "/")
        m2_internal = rel[:-4] + ".m2" if rel.lower().endswith(".mdx") else rel
        conv_ok[path] = (d0, mid, m2_internal.replace("/", "\\"), True)

    mds, dis, minfo, repoint2 = {}, {}, [], []
    for e, n, d0, mid, p in needmodel:
        if p not in conv_ok:
            continue
        _, _, mpath, _atk = conv_ok[p]
        mds[mid] = mpath
        dis[d0] = mid
        minfo.append(d0)
        repoint2.append((e, d0))

    # ---- creaturemodeldata (retroported, minimal 3.3.5a rows) ----
    # fb_plan entries can be flagged needmodel because the Cata *display* is missing
    # from WotLK while the *model* is stock (forest troll, infernal, ...). The stock
    # row is authoritative — emitting the minimal row over it zeroes sound_data and
    # collision globally (I-258). Only emit models genuinely absent from stock.
    stock_mdl = {int(r["id"]) for r in
                 ctx.stock_dbc_query("SELECT id FROM creaturemodeldata")}
    skipped_stock = 0
    for mid, mpath in mds.items():
        if mid in stock_mdl:
            skipped_stock += 1
            continue
        vals = [mid, 0, mpath, 1, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 2.5, 0,
                -1, -1, -1, 1, 1, 2, 1.0, 1.0, 0, 0, 0]
        ctx.col.put("creaturemodeldata", mid, dict(zip(MD_COLS, vals)),
                    tier="base", owner="fallback_models")

    # ---- creaturedisplayinfo (point at retroported models) ----
    # Texture variations + scale/alpha come from the Whitemane source row: not every
    # retroported model embeds its textures — GOBLINSHREDDER_LOW (shark 31781, I-246)
    # uses monster-skin slots 11/12/13, which resolve texture_variation_1-3 at runtime
    # and render UNTEXTURED when the variations are blank. Sound/extended-info stay 0
    # (Cata ids; ported separately where needed).
    import struct as _struct
    wm_di = {}
    recs, gsr = ctx.read_wdbc(ctx.whitemane_dbc("CreatureDisplayInfo.dbc"))
    for r in recs:
        if r[0] in dis:
            wm_di[r[0]] = ((_struct.unpack("<f", _struct.pack("<I", r[4]))[0] or 1.0),
                           r[5] & 0xFF, gsr(r[6]), gsr(r[7]), gsr(r[8]))
    for d0, mid in dis.items():
        scale, alpha, tv1, tv2, tv3 = wm_di.get(d0, (1.0, 255, "", "", ""))
        vals = [d0, mid, 0, 0, scale, alpha, tv1, tv2, tv3, "", 0, 0, 0, 0, 0, 0]
        ctx.col.put("creaturedisplayinfo", d0, dict(zip(DI_COLS, vals)),
                    tier="base", owner="fallback_models")

    # ---- creature_model_info (owned) + repoint (overlay on creatures base) ----
    for d in set(minfo):
        ctx.col.put("creature_model_info", d, {
            "DisplayID": d, "BoundingRadius": 0.5, "CombatReach": 1.5,
            "Gender": 2, "DisplayID_Other_Gender": 0, "VerifiedBuild": 0,
        }, tier="base", owner="fallback_models")
    for e, d0 in set(repoint2):
        ctx.col.put("creature_template_model", e,
                    {"CreatureDisplayID": d0}, tier="overlay")

    return "models=%d (stock-skipped=%d) displays=%d repoint=%d" % (
        len(mds) - skipped_stock, skipped_stock, len(dis), len(set(repoint2)))
