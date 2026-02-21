-- [F-059] zepcraft-legacy: lfgdungeons
-- Split Sunken Temple into Upper (Shade of Eranikus) and Lower (Atal'alarion) wings

-- Update existing Sunken Temple normal entry to "Sunken Temple Upper"
DELETE FROM `lfgdungeons` WHERE `id` = 28;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (28, 'Sunken Temple Upper', 16712190, 50, 58, 53, 52, 55, 109, 0, 3, 1, -1, 'SUNKENTEMPLE', 0, 0, 1, '', 16712188);

-- New Sunken Temple Lower normal entry
DELETE FROM `lfgdungeons` WHERE `id` = 455;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (455, 'Sunken Temple Lower', 16712190, 45, 53, 48, 47, 50, 109, 0, 3, 1, -1, 'SUNKENTEMPLE', 0, 0, 1, '', 16712188);

-- Update existing Sunken Temple Heroic to "Sunken Temple Upper (Heroic)"
DELETE FROM `lfgdungeons` WHERE `id` = 307;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (307, 'Sunken Temple Upper (Heroic)', 16712190, 60, 63, 60, 60, 60, 109, 1, 3, 5, -1, 'SUNKENTEMPLE', 0, 0, 12, '', 16712188);

-- New Sunken Temple Lower Heroic entry
DELETE FROM `lfgdungeons` WHERE `id` = 456;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (456, 'Sunken Temple Lower (Heroic)', 16712190, 60, 63, 60, 60, 60, 109, 1, 3, 5, -1, 'SUNKENTEMPLE', 0, 0, 12, '', 16712188);

-- Update existing Sunken Temple Mythic to "Sunken Temple Upper (Mythic)"
DELETE FROM `lfgdungeons` WHERE `id` = 363;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (363, 'Sunken Temple Upper (Mythic)', 16712190, 60, 63, 60, 60, 60, 109, 2, 3, 5, -1, 'SUNKENTEMPLE', 0, 0, 13, '', 16712188);

-- New Sunken Temple Lower Mythic entry
DELETE FROM `lfgdungeons` WHERE `id` = 457;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (457, 'Sunken Temple Lower (Mythic)', 16712190, 60, 63, 60, 60, 60, 109, 2, 3, 5, -1, 'SUNKENTEMPLE', 0, 0, 13, '', 16712188);
