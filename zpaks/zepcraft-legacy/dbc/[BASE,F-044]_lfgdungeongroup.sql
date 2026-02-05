-- [BASE,F-044] zepcraft-legacy: lfgdungeongroup
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_lfgdungeongroup.sql with overrides

-- lfgdungeongroup: 2 inserts, 9 updates, 0 deletes
DELETE FROM `lfgdungeongroup` WHERE `id` = 12;
INSERT INTO `lfgdungeongroup` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `order`, `parent`, `type`) VALUES (12, 'Azeroth Heroic', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 6, 0, 5);
DELETE FROM `lfgdungeongroup` WHERE `id` = 13;
INSERT INTO `lfgdungeongroup` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `order`, `parent`, `type`) VALUES (13, 'Azeroth Mythic', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 7, 0, 5);
UPDATE `lfgdungeongroup` SET `name_1` = 'Azeroth Dungeon' WHERE `id` = 1;
UPDATE `lfgdungeongroup` SET `name_1` = 'Outland Dungeon' WHERE `id` = 2;
UPDATE `lfgdungeongroup` SET `name_1` = 'Outland Heroic' WHERE `id` = 3;
UPDATE `lfgdungeongroup` SET `name_1` = 'Northrend Dungeon' WHERE `id` = 4;
UPDATE `lfgdungeongroup` SET `name_1` = 'Northrend Heroic' WHERE `id` = 5;
UPDATE `lfgdungeongroup` SET `name_1` = 'Azeroth Raid' WHERE `id` = 6;
UPDATE `lfgdungeongroup` SET `name_1` = 'Outland Raid' WHERE `id` = 7;
UPDATE `lfgdungeongroup` SET `name_1` = 'Northrend Raid' WHERE `id` = 8;
UPDATE `lfgdungeongroup` SET `name_1` = 'Northrend Heroic Raid' WHERE `id` = 9;