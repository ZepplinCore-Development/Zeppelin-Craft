-- open-azeroth: areapoi
-- Imported by zep dbc import-module

-- areapoi: 1 inserts, 1 updates, 0 deletes
DELETE FROM `areapoi` WHERE `id` = 2762;
INSERT INTO `areapoi` (`id`, `importance`, `icon_1`, `icon_2`, `icon_3`, `icon_4`, `icon_5`, `icon_6`, `icon_7`, `icon_8`, `icon_9`, `faction_id`, `x`, `y`, `z`, `map_id`, `flags`, `area_id`, `name_enus`, `name_flags`, `description_enus`, `description_flags`, `world_state_id`, `world_map_link`) VALUES (2762, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, '-1703.7700195312500000', '1404.0570068359375000', '90.4829025268554700', 0, 541, 4755, 'Gilneas City', 16712190, '', 16712188, 0, 0);
UPDATE `areapoi` SET `x` = '5555.0000000000000000', `y` = '6460.0000000000000000', `map_id` = 1 WHERE `id` = 1785;