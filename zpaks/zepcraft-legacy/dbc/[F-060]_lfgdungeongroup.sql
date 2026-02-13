-- [F-060] zepcraft-legacy: lfgdungeongroup
-- Classic Heroic and Mythic dungeon LFG groups and category renames

-- lfgdungeongroup: 2 inserts, 9 updates
DELETE FROM `lfgdungeongroup` WHERE `id` = 12;
INSERT INTO `lfgdungeongroup` (`id`, `name_enus`, `name_flags`, `order`, `parent`, `type`) VALUES (12, 'Azeroth Heroic', 16712190, 6, 0, 5);
DELETE FROM `lfgdungeongroup` WHERE `id` = 13;
INSERT INTO `lfgdungeongroup` (`id`, `name_enus`, `name_flags`, `order`, `parent`, `type`) VALUES (13, 'Azeroth Mythic', 16712190, 7, 0, 5);
UPDATE `lfgdungeongroup` SET `name_enus` = 'Azeroth Dungeon' WHERE `id` = 1;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Outland Dungeon' WHERE `id` = 2;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Outland Heroic' WHERE `id` = 3;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Northrend Dungeon' WHERE `id` = 4;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Northrend Heroic' WHERE `id` = 5;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Azeroth Raid' WHERE `id` = 6;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Outland Raid' WHERE `id` = 7;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Northrend Raid' WHERE `id` = 8;
UPDATE `lfgdungeongroup` SET `name_enus` = 'Northrend Heroic Raid' WHERE `id` = 9;
