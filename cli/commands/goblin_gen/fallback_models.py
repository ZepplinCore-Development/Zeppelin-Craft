"""gen domain: fallback_models (F-011 retroported fallback creature models).

Ports the DBC/SQL-wiring half of Scripts/Goblin Zone Port/fallback_models.py.

The standalone script retroports 8 fallback creature M2s (Whitemane 4.3.4 v272 ->
WotLK v264 via MultiConverter) and ships them; the heavy asset conversion is a
side effect that stays out of the CLI. This emitter reproduces only the SQL/DBC
wiring for the converted models, driven by the `fb_plan` fixture's `needmodel`
list (the curated plan of which creature -> display -> model -> client path):

    dbc/[AUTO,F-011]_fallback_creaturemodeldata.sql   -- minimal 3.3.5a model rows
    dbc/[AUTO,F-011]_fallback_creaturedisplayinfo.sql  -- displays -> those models
    sql/[AUTO,F-011]_fallback_modelinfo.sql           -- creature_model_info + repoint

Zone-independent (the plan is global); emitted once, on the Lost Isles pass.

NOTE: the standalone script only wired models that actually converted to v264
(conv_ok). Every model in the committed fb_plan converted successfully, so this
emitter treats the whole needmodel list as converted. Conversion failures cannot
be detected here (no wine/MultiConverter); a failed retroport would need the plan
entry pruned from the fixture.
"""
NAME = "fallback_models"

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


def _esc(v):
    return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'" if isinstance(v, str) else str(v)


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

    # ---- creaturemodeldata ----
    b = ["-- F-011 fallback creature models (retroported, minimal 3.3.5a rows)\n\n"]
    for mid, mpath in sorted(mds.items()):
        vals = [mid, 0, mpath, 1, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 2.5, 0,
                -1, -1, -1, 1, 1, 2, 1.0, 1.0, 0, 0, 0]
        b.append("DELETE FROM creaturemodeldata WHERE id=%d;\n" % mid)
        b.append("INSERT INTO creaturemodeldata (%s) VALUES (%s);\n" % (
            ",".join(MD_COLS), ",".join(_esc(v) for v in vals)))
    ctx.write("dbc/[AUTO,F-011]_fallback_creaturemodeldata.sql", "".join(b))

    # ---- creaturedisplayinfo ----
    b = ["-- F-011 fallback creature displays (point at retroported models; embedded textures)\n\n"]
    for d0, mid in sorted(dis.items()):
        vals = [d0, mid, 0, 0, 1.0, 255, "", "", "", "", 0, 0, 0, 0, 0, 0]
        b.append("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % d0)
        b.append("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (
            ",".join(DI_COLS), ",".join(_esc(v) for v in vals)))
    ctx.write("dbc/[AUTO,F-011]_fallback_creaturedisplayinfo.sql", "".join(b))

    # ---- creature_model_info + repoint (server SQL) ----
    b = ["-- F-011 fallback creature_model_info + repoint\n\n"]
    if minfo:
        b.append("DELETE FROM creature_model_info WHERE DisplayID IN (%s);\n"
                 % ",".join(str(d) for d in sorted(set(minfo))))
        b.append("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES\n")
        b.append(",\n".join("  (%d,0.5,1.5,2,0,0)" % d for d in sorted(set(minfo))) + ";\n\n")
    for e, d0 in sorted(set(repoint2)):
        b.append("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (d0, e))
    ctx.write("sql/zz_[AUTO,F-011]_fallback_modelinfo.sql", "".join(b))

    return "models=%d displays=%d repoint=%d" % (len(mds), len(dis), len(set(repoint2)))
