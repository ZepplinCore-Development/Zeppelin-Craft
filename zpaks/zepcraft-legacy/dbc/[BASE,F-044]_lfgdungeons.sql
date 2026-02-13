-- [BASE,F-044] zepcraft-legacy: lfgdungeons
-- Imported by zep dbc import-module (F-060 heroic/mythic entries extracted to [F-060]_lfgdungeons.sql)

-- lfgdungeons: 5 deletes, 5 inserts, 54 updates

-- Remove stock random dungeon queue entries
DELETE FROM `lfgdungeons` WHERE `id` = 258;
DELETE FROM `lfgdungeons` WHERE `id` = 259;
DELETE FROM `lfgdungeons` WHERE `id` = 260;
DELETE FROM `lfgdungeons` WHERE `id` = 261;
DELETE FROM `lfgdungeons` WHERE `id` = 262;

-- Replacement random dungeon queues (non-heroic/mythic)
DELETE FROM `lfgdungeons` WHERE `id` = 400;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (400, 'Random Azeroth Dungeon', 16712190, 15, 63, 60, 15, 63, 0, 0, 3, 6, -1, '', 0, 0, 1, '', 16712188);
DELETE FROM `lfgdungeons` WHERE `id` = 402;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (402, 'Random Outland Dungeon', 16712190, 61, 70, 65, 61, 70, 0, 0, 3, 6, -1, '', 1, 0, 2, '', 16712188);
DELETE FROM `lfgdungeons` WHERE `id` = 403;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (403, 'Random Outland Heroic', 16712190, 70, 73, 70, 70, 73, 0, 1, 3, 6, -1, '', 1, 0, 3, '', 16712188);
DELETE FROM `lfgdungeons` WHERE `id` = 404;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (404, 'Random Northrend Dungeon', 16712190, 71, 80, 80, 69, 80, 0, 0, 3, 6, -1, '', 2, 0, 4, '', 16712188);
DELETE FROM `lfgdungeons` WHERE `id` = 405;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (405, 'Random Northrend Heroic', 16712190, 80, 83, 80, 80, 83, 0, 1, 3, 6, -1, '', 2, 0, 5, '', 16712188);

-- Naxxramas 40-man
DELETE FROM `lfgdungeons` WHERE `id` = 451;
INSERT INTO `lfgdungeons` (`id`, `name_enus`, `name_flags`, `min_level`, `max_level`, `target_level`, `target_level_min`, `target_level_max`, `map_id`, `difficulty`, `flags`, `type_id`, `faction`, `texture`, `expansion`, `order_id`, `group_id`, `tooltip_enus`, `tooltip_flags`) VALUES (451, 'Naxxramas', 16712190, 60, 60, 60, 60, 60, 533, 2, 0, 2, -1, 'NAXXRAMAS', 0, 0, 6, '', 16712188);

-- Stock entry level band adjustments
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60 WHERE `id` = 2;
UPDATE `lfgdungeons` SET `min_level` = 42, `max_level` = 52, `target_level` = 45, `target_level_min` = 43, `target_level_max` = 50 WHERE `id` = 22;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 32;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 34;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 36;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 38;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 40;
UPDATE `lfgdungeons` SET `min_level` = 60, `max_level` = 60, `target_level_max` = 60 WHERE `id` = 42;
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60, `flags` = 3, `type_id` = 1, `group_id` = 1 WHERE `id` = 44;
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60 WHERE `id` = 48;
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60 WHERE `id` = 50;
UPDATE `lfgdungeons` SET `min_level` = 61 WHERE `id` = 136;
UPDATE `lfgdungeons` SET `min_level` = 61 WHERE `id` = 137;
UPDATE `lfgdungeons` SET `min_level` = 61 WHERE `id` = 140;
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60 WHERE `id` = 160;
UPDATE `lfgdungeons` SET `max_level` = 60, `target_level_max` = 60 WHERE `id` = 161;

-- TBC/WotLK heroic name additions
UPDATE `lfgdungeons` SET `name_enus` = 'Auchenai Crypts (Heroic)' WHERE `id` = 178;
UPDATE `lfgdungeons` SET `name_enus` = 'Mana-Tombs (Heroic)' WHERE `id` = 179;
UPDATE `lfgdungeons` SET `name_enus` = 'Sethekk Halls (Heroic)' WHERE `id` = 180;
UPDATE `lfgdungeons` SET `name_enus` = 'Shadow Labyrinth (Heroic)' WHERE `id` = 181;
UPDATE `lfgdungeons` SET `name_enus` = 'The Black Morass (Heroic)' WHERE `id` = 182;
UPDATE `lfgdungeons` SET `name_enus` = 'Slave Pens (Heroic)' WHERE `id` = 184;
UPDATE `lfgdungeons` SET `name_enus` = 'The Steamvault (Heroic)' WHERE `id` = 185;
UPDATE `lfgdungeons` SET `name_enus` = 'Underbog (Heroic)' WHERE `id` = 186;
UPDATE `lfgdungeons` SET `name_enus` = 'Blood Furnace (Heroic)' WHERE `id` = 187;
UPDATE `lfgdungeons` SET `name_enus` = 'Hellfire Ramparts (Heroic)' WHERE `id` = 188;
UPDATE `lfgdungeons` SET `name_enus` = 'Shattered Halls (Heroic)' WHERE `id` = 189;
UPDATE `lfgdungeons` SET `name_enus` = 'The Arcatraz (Heroic)' WHERE `id` = 190;
UPDATE `lfgdungeons` SET `name_enus` = 'The Botanica (Heroic)' WHERE `id` = 191;
UPDATE `lfgdungeons` SET `name_enus` = 'The Mechanar (Heroic)' WHERE `id` = 192;
UPDATE `lfgdungeons` SET `name_enus` = 'Magisters'' Terrace (Heroic)' WHERE `id` = 201;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 202;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 204;
UPDATE `lfgdungeons` SET `name_enus` = 'Utgarde Pinnacle (Heroic)' WHERE `id` = 205;
UPDATE `lfgdungeons` SET `name_enus` = 'The Oculus (Heroic)' WHERE `id` = 211;
UPDATE `lfgdungeons` SET `name_enus` = 'Halls of Lightning (Heroic)' WHERE `id` = 212;
UPDATE `lfgdungeons` SET `name_enus` = 'Halls of Stone (Heroic)' WHERE `id` = 213;
UPDATE `lfgdungeons` SET `name_enus` = 'Drak''Tharon Keep (Heroic)' WHERE `id` = 215;
UPDATE `lfgdungeons` SET `name_enus` = 'Gundrak (Heroic)' WHERE `id` = 217;
UPDATE `lfgdungeons` SET `name_enus` = 'Ahn''kahet: The Old Kingdom (Heroic)' WHERE `id` = 219;
UPDATE `lfgdungeons` SET `name_enus` = 'Violet Hold (Heroic)' WHERE `id` = 221;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 225;
UPDATE `lfgdungeons` SET `name_enus` = 'The Nexus (Heroic)' WHERE `id` = 226;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 228;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 229;
UPDATE `lfgdungeons` SET `min_level` = 71 WHERE `id` = 230;
UPDATE `lfgdungeons` SET `name_enus` = 'Azjol-Nerub (Heroic)' WHERE `id` = 241;
UPDATE `lfgdungeons` SET `name_enus` = 'Utgarde Keep (Heroic)' WHERE `id` = 242;
UPDATE `lfgdungeons` SET `name_enus` = 'The Forge of Souls (Heroic)' WHERE `id` = 252;
UPDATE `lfgdungeons` SET `name_enus` = 'Pit of Saron (Heroic)' WHERE `id` = 254;
UPDATE `lfgdungeons` SET `name_enus` = 'Halls of Reflection (Heroic)' WHERE `id` = 256;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 274;
UPDATE `lfgdungeons` SET `max_level` = 60 WHERE `id` = 276;
UPDATE `lfgdungeons` SET `name_enus` = 'Icecrown Citadel (Heroic)' WHERE `id` = 280;
