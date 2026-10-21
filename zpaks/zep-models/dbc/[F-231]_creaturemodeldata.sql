-- F-231: Gnomeregan Junker Slimes. Model 900240 = retail creature/junkerslime/junkerslime.m2
-- (fdid 2492626), converted for 3.3.5 by the F-216 retail converter and shipped in this zpak
-- (Creature/JunkerSlime/). Size class, geo box and collision are retail's own row (retail
-- CreatureModelData 11441); flags, blood, footprint and sound_data come from the stock slime
-- (model 81) so the slimes keep their slime sounds and leave no footprints.

DELETE FROM creaturemodeldata WHERE id = 900240;
INSERT INTO creaturemodeldata SET
    id = 900240,
    flags = 3,
    model_path = 'Creature\\JunkerSlime\\JunkerSlime.mdx',
    size_class = 3,
    model_scale = 1.0,
    blood_id = 2,
    footprint_texture_id = 4294967295,
    footprint_texture_length = 18.0,
    footprint_texture_width = 12.0,
    footprint_particle_scale = 1.0,
    foley_material_id = 0,
    footstep_shake_size = 0,
    death_thud_shake_size = 0,
    sound_data = 81,
    collision_width = 0.6111111,
    collision_height = 2.0312779,
    mount_height = 0.0,
    geo_box_min_x = -14.1200352,
    geo_box_min_y = -8.5661516,
    geo_box_min_z = -0.1955694,
    geo_box_max_x = 7.0426850,
    geo_box_max_y = 8.4626465,
    geo_box_max_z = 12.5384455,
    world_effect_scale = 1.0,
    attached_effect_scale = 1.0,
    missile_collision_radius = 0.0,
    missile_collision_push = 0.0,
    missile_collision_raise = 0.0;
