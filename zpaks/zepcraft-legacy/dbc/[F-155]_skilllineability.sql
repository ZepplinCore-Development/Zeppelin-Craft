-- [F-155] Paladin Class Tuning: skilllineability
-- Chastise ability added to Paladin (Protection) skill line (split from [BASE,F-044]_skilllineability.sql)

DELETE FROM `skilllineability` WHERE `id` = 31578;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (31578, 184, 91002, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0);
