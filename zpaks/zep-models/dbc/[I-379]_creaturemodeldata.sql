-- I-379: Warlock mounts -> spaceslam's NightmareNew retroports (hoof + face fire).
-- Source: github.com/valsan-azerty-boi/WotLK3.3.5_New_HD_Patch_2025 (main,
-- Creature/NightmareNew/, ft/2.0.6). Assets shipped in this zpak's source-assets.
--
-- patch-hd-everything (Maribeth) points the mounts at Nightmare2\nightmare /
-- gorgon101 (models 6023/6024), whose retroport dropped the fire emitters.
-- Spaceslam repoints stock models 215/1951 instead; we use our own model ids so
-- only the two warlock mount displays change, not every Nightmare NPC.
-- Collision / bounds / sound copied from 6023/6024, identical to spaceslam's rows.
--
-- TEMPORARY: remove once F-216 (model source blending) picks a source per model.

DELETE FROM creaturemodeldata WHERE id IN (900006, 900007);

INSERT INTO creaturemodeldata SET
    id = 900006,
    flags = 0,
    model_path = 'Creature\\NightmareNew\\NightmareNew.mdx',
    size_class = 1,
    model_scale = 1.0,
    blood_id = 3,
    footprint_texture_id = 6,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 10,
    sound_data = 65,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 1.865717,
    geo_box_min_x = -1.63553,
    geo_box_min_y = -0.450452,
    geo_box_min_z = -0.034621,
    geo_box_max_x = 1.939372,
    geo_box_max_y = 0.401508,
    geo_box_max_z = 2.640727,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;

INSERT INTO creaturemodeldata SET
    id = 900007,
    flags = 0,
    model_path = 'Creature\\NightmareNew\\Gorgon101New.mdx',
    size_class = 1,
    model_scale = 1.0,
    blood_id = 3,
    footprint_texture_id = 3,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 1868,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 1.865717,
    geo_box_min_x = -1.434944,
    geo_box_min_y = -0.885324,
    geo_box_min_z = -0.013426,
    geo_box_max_x = 1.979149,
    geo_box_max_y = 0.902423,
    geo_box_max_z = 2.905035,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
