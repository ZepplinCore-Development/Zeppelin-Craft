"""gen domain: faceless (F-011 Faceless of the Deep retroport wiring).

Ports the DBC/SQL-wiring half of Scripts/Goblin Zone Port/faceless_retroport.py.

Faceless of the Deep (38448) was the last ghoul-fallback creature; its model 3327
(CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2) is retroported Cata v272 ->
WotLK v264 and shipped (asset side effect, outside the CLI). It is a monster model
(texture_variation 'FacelessoneAquatic1Green', no bake). This emitter reproduces
only the fixed wiring rows, fed into the collector: creaturemodeldata +
creaturedisplayinfo + creature_model_info (owned), and the creature_template_model
repoint off the ghoul fallback as an overlay on the creatures-domain base row.

Every value is a constant in the source script, so this output is fully static.
Zone-independent; emitted once, on the Lost Isles pass. Overlay wave so the
creatures base rows exist when the repoint lands.
"""
NAME = "faceless"
TABLES = ["creaturemodeldata", "creaturedisplayinfo", "creature_model_info",
          "creature_template_model"]
TIER = "overlay"

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


def emit(ctx):
    if ctx.sfx == "_K":
        return "skipped (zone-independent; emitted on Lost Isles pass)"

    # ---- DBC: model + display (owned rows) ----
    md = [MODELID, 0, MODEL_PATH, 1, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 2.5, 0,
          -1, -1, -1, 1, 1, 2, 1.0, 1.0, 0, 0, 0]
    ctx.col.put("creaturemodeldata", MODELID, dict(zip(MD_COLS, md)),
                tier="base", owner="faceless")
    di = [DISPLAY, MODELID, 0, 0, 1.0, 255, TEXVAR, "", "", "", 0, 0, 0, 0, 0, 0]
    ctx.col.put("creaturedisplayinfo", DISPLAY, dict(zip(DI_COLS, di)),
                tier="base", owner="faceless")

    # ---- server: model_info (owned) + repoint off ghoul fallback 646 (overlay) ----
    ctx.col.put("creature_model_info", DISPLAY, {
        "DisplayID": DISPLAY, "BoundingRadius": 1.0, "CombatReach": 3.0,
        "Gender": 2, "DisplayID_Other_Gender": 0, "VerifiedBuild": 0,
    }, tier="base", owner="faceless")
    ctx.col.put("creature_template_model", CREATURE,
                {"CreatureDisplayID": DISPLAY}, tier="overlay")

    return "display=%d model=%d repoint=%d" % (DISPLAY, MODELID, CREATURE)
