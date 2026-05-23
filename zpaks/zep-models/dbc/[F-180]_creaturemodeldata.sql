-- F-180: Phase out CarrionBird Outland model (id 2286) with ThunderIsleYoungBird.
-- Adds the youngbird model as a new creaturemodeldata entry; the existing 13
-- DisplayInfo rows that referenced 2286 are repointed to 900002 in
-- [F-180]_creaturedisplayinfo.sql.
--
-- Bounding / collision / sound_data inherited from 2286 (CarrionBirdOutland)
-- so combat reach, footstep, and missile collision stay consistent. Adjust
-- model_scale or per-display creature_model_scale if youngbird proportions
-- read wrong in-game.

DELETE FROM creaturemodeldata WHERE id = 900002;
INSERT INTO creaturemodeldata SET
    id = 900002,
    flags = 1,
    model_path = 'Creature\\ThunderIsleYoungBird\\ThunderIsleYoungBird.mdx',
    size_class = 1,
    model_scale = 0.7,
    blood_id = 1,
    footprint_texture_id = 4294967295,
    footprint_texture_length = 0.0,
    footprint_texture_width = 0.0,
    footprint_particle_scale = 0.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 2173,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 0.0,
    geo_box_min_x = -2.1699,
    geo_box_min_y = -2.0756,
    geo_box_min_z = 0.5372,
    geo_box_max_x = 1.6541,
    geo_box_max_y = 2.2497,
    geo_box_max_z = 6.2289,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
