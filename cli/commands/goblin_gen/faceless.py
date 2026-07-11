"""gen domain: faceless (F-011 Faceless of the Deep retroport wiring).

Ports the DBC/SQL-wiring half of Scripts/Goblin Zone Port/faceless_retroport.py.

Faceless of the Deep (38448) was the last ghoul-fallback creature; its model 3327
(CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2) is retroported Cata v272 ->
WotLK v264 and shipped (asset side effect, outside the CLI). It is a monster model
(texture_variation 'FacelessoneAquatic1Green', no bake). This emitter reproduces
only the fixed wiring rows:

    dbc/[AUTO,F-011]_faceless_retroport.sql   -- CreatureModelData + CreatureDisplayInfo
    sql/[AUTO,F-011]_faceless_repoint.sql     -- creature_model_info + repoint

Every value is a constant in the source script, so this output is fully static.
Zone-independent; emitted once, on the Lost Isles pass.
"""
NAME = "faceless"

TEXVAR = "FacelessoneAquatic1Green"
DISPLAY, MODELID, CREATURE = 31674, 3327, 38448
MODEL_PATH = "CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2"

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

    # ---- DBC: model + display ----
    b = ["-- F-011 Faceless of the Deep (38448) retroported model 3327 + display 31674\n\n"]
    md = [MODELID, 0, MODEL_PATH, 1, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 2.5, 0,
          -1, -1, -1, 1, 1, 2, 1.0, 1.0, 0, 0, 0]
    b.append("DELETE FROM creaturemodeldata WHERE id=%d;\n" % MODELID)
    b.append("INSERT INTO creaturemodeldata (%s) VALUES (%s);\n" % (
        ",".join(MD_COLS), ",".join(_esc(v) for v in md)))
    di = [DISPLAY, MODELID, 0, 0, 1.0, 255, TEXVAR, "", "", "", 0, 0, 0, 0, 0, 0]
    b.append("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % DISPLAY)
    b.append("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (
        ",".join(DI_COLS), ",".join(_esc(v) for v in di)))
    ctx.write("dbc/[AUTO,F-011]_faceless_retroport.sql", "".join(b))

    # ---- server SQL: model_info + repoint ----
    b = ["-- F-011 Faceless of the Deep model_info + repoint off ghoul fallback 646\n\n"]
    b.append("DELETE FROM creature_model_info WHERE DisplayID=%d;\n" % DISPLAY)
    b.append("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES (%d,1.0,3.0,2,0,0);\n\n" % DISPLAY)
    b.append("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (DISPLAY, CREATURE))
    ctx.write("sql/zz_[AUTO,F-011]_faceless_repoint.sql", "".join(b))

    return "display=%d model=%d repoint=%d" % (DISPLAY, MODELID, CREATURE)
