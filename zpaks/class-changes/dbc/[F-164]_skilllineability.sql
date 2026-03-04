-- [F-164] Earthwarden skilllineability
-- Maps talent-granted active spells to the Earthwarden skillline (9001)
-- so they appear in the Earthwarden tab of the spellbook.
-- Also maps Shield Mastery and Earthen Reprisal to Earthwarden.

-- Base Earthwarden talent abilities (acquire_method=0 so talent reset removes them)
DELETE FROM `skilllineability` WHERE `id` IN (200065, 200066, 200067, 200068, 200069);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200065, 9001, 900116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200066, 9001, 900119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200067, 9001, 900121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200068, 9001, 900123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200069, 9001, 900124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Shield Mastery (900133-900137) on Earthwarden skill line for Shaman class
DELETE FROM `skilllineability` WHERE `id` IN (200070, 200071, 200072, 200073, 200074);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200070, 9001, 900133, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200071, 9001, 900134, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200072, 9001, 900135, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200073, 9001, 900136, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200074, 9001, 900137, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Ancestral Shout on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200075;
INSERT INTO `skilllineability` (
    `id`, `skill_line`, `spell_id`,
    `required_races`, `required_classes`,
    `excluded_races`, `excluded_classes`,
    `min_skill_value`, `spell_parent_id`, `acquire_method`,
    `skill_grey_level`, `skill_yellow_level`,
    `character_points_1`, `character_points_2`
) VALUES
(200075, 9001, 900153, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Earthen Reprisal on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200045;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200045, 9001, 900114, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);
