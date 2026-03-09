-- I-154: Backport Therazane model for Princess Theradras
-- Adds Therazane model (Cata+) as a new creaturemodeldata entry,
-- then points display ID 32913 to it (used by zepcraft-legacy for Theradras)

-- New creaturemodeldata entry for Therazane model
-- Based on Tharazun (id 1751) with updated model path
DELETE FROM creaturemodeldata WHERE id = 900001;
INSERT INTO creaturemodeldata SET
    id = 900001,
    flags = 0,
    model_path = 'Creature\\Therazane\\Therazane.mdx',
    size_class = 2,
    model_scale = 1.0,
    blood_id = 3,
    footprint_texture_id = 1,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 1628,
    collision_width = 0.6944,
    collision_height = 2.083,
    mount_height = 0.0,
    geo_box_min_x = -2.2248,
    geo_box_min_y = -2.0288,
    geo_box_min_z = -0.0038,
    geo_box_max_x = 1.1659,
    geo_box_max_y = 1.9961,
    geo_box_max_z = 4.359,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;

-- Point display ID 32913 (Theradras replacement) to the new Therazane model
UPDATE creaturedisplayinfo SET model_id = 900001 WHERE id = 32913;
