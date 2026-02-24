-- [F-015] Warding Scroll ItemDisplayInfo entries
-- These 6 entries map display IDs to custom scroll icons for resistance scrolls.
-- Recipe icons (AO_Scroll_01..05) are in the custom-icons zpak [F-142].

-- Nature Resistance scrolls (items 57440-57447)
DELETE FROM `itemdisplayinfo` WHERE `id` = 138251;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (138251, '', '', '', '', 'AO_LegendaryTrinketScroll2', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Shadow Resistance scrolls (items 57432-57439)
DELETE FROM `itemdisplayinfo` WHERE `id` = 139967;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (139967, '', '', '', '', 'AO_RareTrinketScroll2', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Holy Resistance scrolls (items 57448-57455)
DELETE FROM `itemdisplayinfo` WHERE `id` = 140076;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (140076, '', '', '', '', 'AO_RelicTrinketScroll2', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Arcane Resistance scrolls (items 57424-57431)
DELETE FROM `itemdisplayinfo` WHERE `id` = 141292;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (141292, '', '', '', '', 'AO_UncommonTrinketScroll2', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Frost Resistance scrolls (items 57416-57423)
DELETE FROM `itemdisplayinfo` WHERE `id` = 154864;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (154864, '', '', '', '', 'AO_RareTrinketScroll2_DOMINANT_MINT', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- Fire Resistance scrolls (items 57408-57415)
DELETE FROM `itemdisplayinfo` WHERE `id` = 154865;
INSERT INTO `itemdisplayinfo` (`id`, `left_model`, `right_model`, `left_model_texture`, `right_model_texture`, `icon_1`, `icon_2`, `geoset_group_1`, `geoset_group_2`, `geoset_group_3`, `flags`, `spell_visual_id`, `group_sound_index`, `helmet_geoset_male`, `helmet_geoset_female`, `upper_arm_texture`, `lower_arm_texture`, `hands_texture`, `upper_torso_texture`, `lower_torso_texture`, `upper_leg_texture`, `lower_leg_texture`, `foot_texture`, `item_visual`, `particle_colour_id`) VALUES (154865, '', '', '', '', 'AO_RareTrinketScroll2_DOMINANT_RED', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 0, 0);
