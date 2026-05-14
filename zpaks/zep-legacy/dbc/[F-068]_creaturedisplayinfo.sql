-- [F-068] zep-legacy: creaturedisplayinfo
-- Giant Murloc mount display info
--
-- creaturedisplayinfo: 1 insert

DELETE FROM `creaturedisplayinfo` WHERE `id` = 39097;
INSERT INTO `creaturedisplayinfo` (
    `id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`,
    `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`,
    `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`,
    `creature_geoset_data`, `obj_effect_package_id`
) VALUES (
    39097, 7216, 0, 0, 1.0,
    255, '', '', '',
    '', 0, 0, 0, 0, 0, 0
);
