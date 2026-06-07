-- I-193: WoD fungal giant retroport as a new model entry.
-- Ships in this zpak under Creature\DraenorFungalGiant\ (M2 + skins + anims).
-- The M2's four hardcoded support textures (ArmorReflect4, ToonSmoke16,
-- FungalGiantGreenSpore, SmokeWispy_roundSponge) resolve to the same folder
-- and are shipped here too (hd-everything PATCH-H also carries copies).
--
-- Bounding / collision / sound_data inherited from 2402 (classic FungalGiant)
-- so combat reach and footstep audio stay consistent with the creatures
-- currently using the classic model.

DELETE FROM creaturemodeldata WHERE id = 900004;
INSERT INTO creaturemodeldata SET
    id = 900004,
    flags = 0,
    model_path = 'Creature\\DraenorFungalGiant\\FungalGiant.mdx',
    size_class = 3,
    model_scale = 1.0,
    blood_id = 2,
    footprint_texture_id = 1,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 2258,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 0.0,
    geo_box_min_x = -1.39423,
    geo_box_min_y = -2.614861,
    geo_box_min_z = -0.005557,
    geo_box_max_x = 2.02268,
    geo_box_max_y = 2.671407,
    geo_box_max_z = 5.988422,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
