-- I-396: HD desert lasher orchid split by texture region (Creature\desertlasherorchid_modular, built by
-- model_transforms.json): stem/roots/vine arms = skin 1, petals/leaves = skin 2, beak/jaw/teeth = skin 3.
-- Values from stock Lasher model 951; geo box = the HD mesh's vertex extents.

DELETE FROM creaturemodeldata WHERE id = 900206;
INSERT INTO creaturemodeldata SET
    id = 900206,
    flags = 3,
    model_path = 'Creature\\desertlasherorchid_modular\\desertlasherorchid_modular.mdx',
    size_class = 1,
    model_scale = 1.0,
    blood_id = 2,
    footprint_texture_id = 1,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 848,
    collision_width = 0.6111,
    collision_height = 2.031,
    mount_height = 0.0,
    geo_box_min_x = -1.1685,
    geo_box_min_y = -2.2761,
    geo_box_min_z = -0.0281,
    geo_box_max_x = 2.2263,
    geo_box_max_y = 2.2761,
    geo_box_max_z = 3.7968,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
