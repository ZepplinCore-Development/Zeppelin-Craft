-- [F-164] Shaman Tuning: skilllineability
-- Earthen Reprisal added to Earthwarden skill line for Shaman class

DELETE FROM `skilllineability` WHERE `id` = 200045;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200045, 9001, 900114, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Shield Mastery (900133-900137) added to Enhancement skill line for Shaman class
DELETE FROM `skilllineability` WHERE `id` IN (200070, 200071, 200072, 200073, 200074);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200070, 373, 900133, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200071, 373, 900134, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200072, 373, 900135, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200073, 373, 900136, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200074, 373, 900137, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Earthwarden talent abilities on skill line 9001 (acquire_method=0 so talent reset removes them)
DELETE FROM `skilllineability` WHERE `id` IN (200065, 200066, 200067, 200068, 200069);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200065, 9001, 900116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200066, 9001, 900119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200067, 9001, 900121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200068, 9001, 900123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200069, 9001, 900124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
