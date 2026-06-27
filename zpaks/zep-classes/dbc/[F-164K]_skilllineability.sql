-- [F-164K] Stoneskin - skilllineability (sub-feature of F-164 Earthwarden).
-- Attaches Stoneskin (900164) to the Earthwarden line (9001) so it shows in the
-- spellbook tab once the talent is learned. acquire_method 0 -> removed on talent
-- reset. Split out of [F-164R]_skilllineability.sql (id 200079 was the old Stoneskin
-- SLA, freed when Stoneskin merged into Rockwall, now revived for the standalone).
-- Talent-tree placement lives in the F-164 PARENT ([F-164]_talent.sql).
DELETE FROM `skilllineability` WHERE `id` = 200079;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200079, 9001, 900164, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);
