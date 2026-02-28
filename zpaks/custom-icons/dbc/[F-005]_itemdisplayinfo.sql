-- [F-005] Riding Crop tier icons
-- Maps each riding crop tier to a unique color variant of inv_misc_crop_02

-- Tier 1: Apprentice Riding Crop (item 100010) - Green
DELETE FROM `itemdisplayinfo` WHERE `id` = 200010;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (200010, '', '', '', '', 'inv_misc_crop_02_DOMINANT_GREEN', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Tier 2: Journeyman Riding Crop (item 100011) - Yellow
DELETE FROM `itemdisplayinfo` WHERE `id` = 200011;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (200011, '', '', '', '', 'inv_misc_crop_02_DOMINANT_YELLOW', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Tier 3: Expert Riding Crop (item 100012) - Azure
DELETE FROM `itemdisplayinfo` WHERE `id` = 200012;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (200012, '', '', '', '', 'inv_misc_crop_02_DOMINANT_AZURE', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Tier 4: Artisan Riding Crop (item 100013) - Violet
DELETE FROM `itemdisplayinfo` WHERE `id` = 200013;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (200013, '', '', '', '', 'inv_misc_crop_02_DOMINANT_VIOLET', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Tier 5: Master Riding Crop (item 100014) - Red
DELETE FROM `itemdisplayinfo` WHERE `id` = 200014;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (200014, '', '', '', '', 'inv_misc_crop_02_DOMINANT_RED', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);
