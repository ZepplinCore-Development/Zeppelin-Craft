-- [F-164R] Rocksteady Family - skilllineability (split from F-164).
-- The Earthwarden skillLINE (9001) definition itself stays in F-164. These rows
-- attach the Rocksteady-family SPELLS to that line (spellbook visibility) and the
-- Inscription line (773) for the glyph recipes. acquire_method 0 so a talent reset
-- removes the talent-gated ones.

-- Stoneskin (900164) merged into Rockwall (900223); its old SLA 200079 stays removed.
DELETE FROM `skilllineability` WHERE `id` = 200079;

-- Rockwall (900223) active on the Earthwarden line (9001) so it shows in the spellbook tab.
DELETE FROM `skilllineability` WHERE `id` = 200096;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200096, 9001, 900223, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Rocksurge (900263) - baseline trainer-learned Rocksteady spender on the Earthwarden line.
DELETE FROM `skilllineability` WHERE `id` = 200099;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200099, 9001, 900263, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Rocksteady-family glyph recipes on the Inscription line (773). Any scribe
-- (required_classes 0), trainer-learned (acquire_method 0). Gated to each ability's
-- ACTUAL acquisition level and the recipe ink's make-skill (Midnight ~80, Lion's ~115).
DELETE FROM `skilllineability` WHERE `id` IN (200110, 200111, 200115);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200110, 773, 900290, 0, 0, 0, 0,  80, 0, 0, 120,  80, 0, 0),  -- Rockslam (~L19, Midnight)
(200111, 773, 900291, 0, 0, 0, 0, 115, 0, 0, 155, 115, 0, 0),  -- Rocksurge (L24, Lion's)
(200115, 773, 900295, 0, 0, 0, 0, 115, 0, 0, 155, 115, 0, 0);  -- Rockwall (L29, Lion's)
