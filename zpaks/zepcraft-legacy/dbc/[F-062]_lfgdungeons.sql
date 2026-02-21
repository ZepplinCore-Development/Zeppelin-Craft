-- [F-062] zepcraft-legacy: lfgdungeons
-- Split Uldaman into East (Ironaya) and West (Archaedas) wings

-- Update existing Uldaman normal entry to "Uldaman East"
DELETE FROM `lfgdungeons` WHERE `id` = 22;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (22, 'Uldaman East', 16712190, 35, 43, 38, 37, 40, 70, 0, 3, 1, -1, 'ULDAMAN', 0, 0, 1, '', 16712188);

-- New Uldaman West normal entry
DELETE FROM `lfgdungeons` WHERE `id` = 452;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (452, 'Uldaman West', 16712190, 42, 50, 45, 44, 47, 70, 0, 3, 1, -1, 'ULDAMAN', 0, 0, 1, '', 16712188);

-- Update existing Uldaman Heroic to "Uldaman East (Heroic)"
DELETE FROM `lfgdungeons` WHERE `id` = 304;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (304, 'Uldaman East (Heroic)', 16712190, 60, 63, 60, 60, 60, 70, 1, 3, 5, -1, 'ULDAMAN', 0, 0, 12, '', 16712188);

-- New Uldaman West Heroic entry
DELETE FROM `lfgdungeons` WHERE `id` = 453;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (453, 'Uldaman West (Heroic)', 16712190, 60, 63, 60, 60, 60, 70, 1, 3, 5, -1, 'ULDAMAN', 0, 0, 12, '', 16712188);

-- Update existing Uldaman Mythic to "Uldaman East (Mythic)"
DELETE FROM `lfgdungeons` WHERE `id` = 360;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (360, 'Uldaman East (Mythic)', 16712190, 60, 63, 60, 60, 60, 70, 2, 3, 5, -1, 'ULDAMAN', 0, 0, 13, '', 16712188);

-- New Uldaman West Mythic entry
DELETE FROM `lfgdungeons` WHERE `id` = 454;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (454, 'Uldaman West (Mythic)', 16712190, 60, 63, 60, 60, 60, 70, 2, 3, 5, -1, 'ULDAMAN', 0, 0, 13, '', 16712188);
