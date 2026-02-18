-- F-001: Custom Profession Tools - SkillLineAbility entries

-- Smithing Hammer crafting recipes linked to Blacksmithing (skill_line 164)
DELETE FROM `skilllineability` WHERE `id` = 99994;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99994, 164, 91121, 0, 0, 0, 0, 1, 0, 0, 100, 90, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99993;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99993, 164, 91123, 0, 0, 0, 0, 1, 0, 0, 175, 165, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99990;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99990, 164, 91125, 0, 0, 0, 0, 1, 0, 0, 250, 240, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99989;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99989, 164, 91127, 0, 0, 0, 0, 1, 0, 0, 325, 315, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99988;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99988, 164, 91129, 0, 0, 0, 0, 1, 0, 0, 400, 390, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99987;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99987, 164, 91131, 0, 0, 0, 0, 1, 0, 0, 475, 465, 0, 0);

-- Tinkering Tools crafting recipes linked to Engineering (skill_line 202)
-- acquire_method = 1 (learned from trainer)
DELETE FROM `skilllineability` WHERE `id` = 200025;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200025, 202, 91218, 0, 0, 0, 0, 75, 0, 1, 150, 100, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200026;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200026, 202, 91219, 0, 0, 0, 0, 225, 0, 1, 300, 260, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200027;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200027, 202, 91220, 0, 0, 0, 0, 300, 0, 1, 375, 340, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200028;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200028, 202, 91221, 0, 0, 0, 0, 375, 0, 1, 450, 410, 0, 0);
