-- [F-068] zepcraft-legacy: creaturemodeldata
-- Giant Murloc mount model data
--
-- creaturemodeldata: 1 insert

DELETE FROM `creaturemodeldata` WHERE `id` = 7216;
INSERT INTO `creaturemodeldata` (
    `id`, `flags`, `model_path`, `size_class`, `model_scale`, `blood_id`,
    `footprint_texture_id`, `footprint_texture_length`, `footprint_texture_width`,
    `footprint_particle_scale`, `foley_material_id`, `footstep_shake_size`,
    `death_thud_shake_size`, `sound_data`, `collision_width`, `collision_height`,
    `mount_height`, `geo_box_min_x`, `geo_box_min_y`, `geo_box_min_z`,
    `geo_box_max_x`, `geo_box_max_y`, `geo_box_max_z`, `world_effect_scale`,
    `attached_effect_scale`, `missile_collision_radius`, `missile_collision_push`,
    `missile_collision_raise`
) VALUES (
    7216, 0, 'Creature\\MurlocMount\\murlocmount.mdx', 1, 1.0, 1,
    5, 24.0, 18.0, 1.0, 0, 0, 0, 0,
    0.6112, 2.0310,
    2.5206,
    -4.3277, -1.1146, -0.0638,
    2.1348, 2.0982, 3.3728,
    1.0, 1.0, 0.0, 0.0, 0.0
);
