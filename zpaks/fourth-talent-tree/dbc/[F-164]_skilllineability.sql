-- [F-164] Earthwarden skilllineability
-- Maps talent-granted active spells to the Earthwarden skillline (9001)
-- so they appear in the Earthwarden tab of the spellbook.

DELETE FROM `skilllineability` WHERE `id` IN (200065, 200066, 200067, 200068, 200069, 200070, 200071, 200072, 200075);

INSERT INTO `skilllineability` (
    `id`, `skill_line`, `spell_id`,
    `required_races`, `required_classes`,
    `excluded_races`, `excluded_classes`,
    `min_skill_value`, `spell_parent_id`, `acquire_method`,
    `skill_grey_level`, `skill_yellow_level`,
    `character_points_1`, `character_points_2`
) VALUES
(200065, 9001, 900116, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200066, 9001, 900119, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200067, 9001, 900121, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200068, 9001, 900123, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200069, 9001, 900124, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200070, 9001, 900147, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200071, 9001, 900148, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200072, 9001, 900149, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(200075, 9001, 900153, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);
