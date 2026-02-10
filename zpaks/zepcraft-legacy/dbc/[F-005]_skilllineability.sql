-- F-005: Riding Overhaul - SkillLineAbility
-- Riding crop trainer entries on skill_line 773.
-- IDs 100010-100014: Crop passive buff spell training
-- IDs 100020-100024: Crop crafting spell training

-- Apprentice Riding Crop (passive)
DELETE FROM `skilllineability` WHERE `id` = 100010;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100010, 773, 103307, 0, 0, 0, 0, 1, 0, 0, 110, 95, 0, 0);

-- Journeyman Riding Crop (passive)
DELETE FROM `skilllineability` WHERE `id` = 100011;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100011, 773, 103308, 0, 0, 0, 0, 1, 0, 0, 115, 100, 0, 0);

-- Expert Riding Crop (passive)
DELETE FROM `skilllineability` WHERE `id` = 100012;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100012, 773, 103309, 0, 0, 0, 0, 1, 0, 0, 115, 100, 0, 0);

-- Artisan Riding Crop (passive)
DELETE FROM `skilllineability` WHERE `id` = 100013;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100013, 773, 103310, 0, 0, 0, 0, 1, 0, 0, 120, 105, 0, 0);

-- Master Riding Crop (passive)
DELETE FROM `skilllineability` WHERE `id` = 100014;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100014, 773, 103311, 0, 0, 0, 0, 1, 0, 0, 120, 105, 0, 0);

-- Apprentice Riding Crop (crafting)
DELETE FROM `skilllineability` WHERE `id` = 100020;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100020, 773, 103317, 0, 0, 0, 0, 1, 0, 0, 195, 180, 0, 0);

-- Journeyman Riding Crop (crafting)
DELETE FROM `skilllineability` WHERE `id` = 100021;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100021, 773, 103318, 0, 0, 0, 0, 1, 0, 0, 255, 240, 0, 0);

-- Expert Riding Crop (crafting)
DELETE FROM `skilllineability` WHERE `id` = 100022;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100022, 773, 103319, 0, 0, 0, 0, 1, 0, 0, 255, 240, 0, 0);

-- Artisan Riding Crop (crafting)
DELETE FROM `skilllineability` WHERE `id` = 100023;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100023, 773, 103320, 0, 0, 0, 0, 1, 0, 0, 260, 245, 0, 0);

-- Master Riding Crop (crafting)
DELETE FROM `skilllineability` WHERE `id` = 100024;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (100024, 773, 103321, 0, 0, 0, 0, 1, 0, 0, 260, 245, 0, 0);
