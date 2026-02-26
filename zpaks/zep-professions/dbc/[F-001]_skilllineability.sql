-- F-001: Custom Profession Tools - SkillLineAbility entries

-- Smithing Hammer crafting recipes linked to Blacksmithing (skill_line 164)
DELETE FROM `skilllineability` WHERE `id` = 99994;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99994, 164, 91121, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99993;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99993, 164, 91123, 0, 0, 0, 0, 150, 0, 0, 175, 160, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99990;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99990, 164, 91125, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99989;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99989, 164, 91127, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99988;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99988, 164, 91129, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 99987;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (99987, 164, 91131, 0, 0, 0, 0, 450, 0, 0, 475, 460, 0, 0);

-- Tinkering Tools crafting recipes linked to Engineering (skill_line 202)
-- acquire_method = 0 (learned from trainer)
DELETE FROM `skilllineability` WHERE `id` = 200025;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200025, 202, 91218, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200026;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200026, 202, 91219, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200027;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200027, 202, 91220, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0);
DELETE FROM `skilllineability` WHERE `id` = 200028;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200028, 202, 91221, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);

-- BS Rivet recipes linked to Blacksmithing (skill_line 164), acquire_method = 0 (trainer)
DELETE FROM `skilllineability` WHERE `id` IN (200046, 200047, 200048, 200049);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200046, 164, 91252, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0),
(200047, 164, 91253, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0),
(200048, 164, 91254, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0),
(200049, 164, 91255, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);

-- JC Fastener recipes linked to Jewelcrafting (skill_line 755), acquire_method = 0 (trainer)
DELETE FROM `skilllineability` WHERE `id` IN (200050, 200051, 200052, 200053);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200050, 755, 91256, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0),
(200051, 755, 91257, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0),
(200052, 755, 91258, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0),
(200053, 755, 91259, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);

-- Eng Screwdriver recipes linked to Engineering (skill_line 202), acquire_method = 0 (trainer)
DELETE FROM `skilllineability` WHERE `id` IN (200054, 200055, 200056);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200054, 202, 91260, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0),
(200055, 202, 91261, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0),
(200056, 202, 91262, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);

-- Eng Drill recipes linked to Engineering (skill_line 202), acquire_method = 0 (trainer)
DELETE FROM `skilllineability` WHERE `id` IN (200057, 200058, 200059, 200060);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200057, 202, 91263, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0),
(200058, 202, 91264, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0),
(200059, 202, 91265, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0),
(200060, 202, 91266, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);

-- JC Kit Assembly recipes linked to Jewelcrafting (skill_line 755), acquire_method = 0 (trainer)
DELETE FROM `skilllineability` WHERE `id` IN (200061, 200062, 200063, 200064);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200061, 755, 91267, 0, 0, 0, 0, 75, 0, 0, 100, 85, 0, 0),
(200062, 755, 91268, 0, 0, 0, 0, 225, 0, 0, 250, 235, 0, 0),
(200063, 755, 91269, 0, 0, 0, 0, 300, 0, 0, 325, 310, 0, 0),
(200064, 755, 91270, 0, 0, 0, 0, 375, 0, 0, 400, 385, 0, 0);
