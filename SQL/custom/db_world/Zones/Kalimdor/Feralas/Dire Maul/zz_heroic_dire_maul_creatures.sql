-- Heroic Doomguard
DELETE FROM `creature_template` WHERE entry = 9102400;
INSERT INTO `creature_template` VALUES (9102400, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Heroic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '3.14', '0.77', '1.35', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102400 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859) AND (`map` = 429);
-- Heroic Xorothian Dreadsteed
DELETE FROM `creature_template` WHERE entry = 9102401;
INSERT INTO `creature_template` VALUES (9102401, '0', '0', '0', '0', '0', '14552', '0', '0', '0', 'Heroic Xorothian Dreadsteed', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.28968', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14502', '0', '14502', '0', '0', '0', '0', '', '1', '1.0', '3.12', '1.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102401 WHERE (`entry` = 14502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14502) AND (`map` = 429);
-- Heroic Gordok Reaver
DELETE FROM `creature_template` WHERE entry = 9102402;
INSERT INTO `creature_template` VALUES (9102402, '0', '0', '0', '0', '0', '10709', '0', '0', '0', 'Heroic Gordok Reaver', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11450', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '3.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102402 WHERE (`entry` = 11450);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11450) AND (`map` = 429);
-- Heroic Ferra
DELETE FROM `creature_template` WHERE entry = 9102403;
INSERT INTO `creature_template` VALUES (9102403, '0', '0', '0', '0', '0', '1083', '0', '0', '0', 'Heroic Ferra', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.6', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '14308', '0', '14308', '0', '0', '0', '0', '', '0', '1.0', '3.16', '1.0', '1.1', '1.0', '0', '51', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102403 WHERE (`entry` = 14308);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14308) AND (`map` = 429);
-- Heroic Dread Guard
DELETE FROM `creature_template` WHERE entry = 9102404;
INSERT INTO `creature_template` VALUES (9102404, '0', '0', '0', '0', '0', '14152', '0', '0', '0', 'Heroic Dread Guard', NULL, NULL, '0', '60', '60', '0', '90', '0', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.02', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102404 WHERE (`entry` = 14483);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14483) AND (`map` = 429);
-- Heroic Empyrean
DELETE FROM `creature_template` WHERE entry = 9102405;
INSERT INTO `creature_template` VALUES (9102405, '0', '0', '0', '0', '0', '12589', '0', '0', '0', 'Heroic Empyrean', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.01', '15.0', '1.1', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102405 WHERE (`entry` = 16098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16098) AND (`map` = 429);
-- Heroic Gordok Spirit
DELETE FROM `creature_template` WHERE entry = 9102406;
INSERT INTO `creature_template` VALUES (9102406, '0', '0', '0', '0', '0', '13093', '13130', '0', '13132', 'Heroic Gordok Spirit', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '1', '131076', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.31', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '1074003970', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102406 WHERE (`entry` = 11446);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11446) AND (`map` = 429);
-- Heroic Lorekeeper Javon
DELETE FROM `creature_template` WHERE entry = 9102407;
INSERT INTO `creature_template` VALUES (9102407, '0', '0', '0', '0', '0', '14422', '0', '0', '0', 'Heroic Lorekeeper Javon', 'House of Shen''dralar', NULL, '5755', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102407 WHERE (`entry` = 14381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14381) AND (`map` = 429);
-- Heroic Lorekeeper Lydros
DELETE FROM `creature_template` WHERE entry = 9102408;
INSERT INTO `creature_template` VALUES (9102408, '0', '0', '0', '0', '0', '14407', '0', '0', '0', 'Heroic Lorekeeper Lydros', 'House of Shen''dralar', NULL, '5747', 
'60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102408 WHERE (`entry` = 14368);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14368) AND (`map` = 429);
-- Heroic Lorekeeper Mykos
DELETE FROM `creature_template` WHERE entry = 9102409;
INSERT INTO `creature_template` VALUES (9102409, '0', '0', '0', '0', '0', '14421', '0', '0', '0', 'Heroic Lorekeeper Mykos', 'House of Shen''dralar', NULL, '5756', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.36', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102409 WHERE (`entry` = 14382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14382) AND (`map` = 429);
-- Heroic Mizzle the Crafty
DELETE FROM `creature_template` WHERE entry = 9102410;
INSERT INTO `creature_template` VALUES (9102410, '0', '0', '0', '0', '0', '14406', '0', '0', '0', 'Heroic Mizzle the Crafty', NULL, NULL, '5708', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102410 WHERE (`entry` = 14353);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14353) AND (`map` = 429);
-- Heroic Netherwalker
DELETE FROM `creature_template` WHERE entry = 9102411;
INSERT INTO `creature_template` VALUES (9102411, '0', '0', '0', '0', '0', '14428', '0', '0', '0', 'Heroic Netherwalker', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '2.02', '1183', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.84', '2.0', '1.1', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102411 WHERE (`entry` = 14389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14389) AND (`map` = 429);
-- Heroic Revanchion
DELETE FROM `creature_template` WHERE entry = 9102412;
INSERT INTO `creature_template` VALUES (9102412, '0', '0', '0', '0', '0', '14695', '0', '0', '0', 'Heroic Revanchion', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14690', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.36', '2.0', '1.35', '1.0', '0', '0', '1', '46156048', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102412 WHERE (`entry` = 14690);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14690) AND (`map` = 429);
-- Heroic Shendralar Ancient
DELETE FROM `creature_template` WHERE entry = 9102413;
INSERT INTO `creature_template` VALUES (9102413, '0', '0', '0', '0', '0', '14393', '0', '0', '0', 'Heroic Shendralar Ancient', 'House of Shen''dralar', NULL, '5729', '60', '60', '0', '1354', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.04', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102413 WHERE (`entry` = 14358);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14358) AND (`map` = 429);
-- Heroic Arcane Aberration
DELETE FROM `creature_template` WHERE entry = 9102414;
INSERT INTO `creature_template` VALUES (9102414, '0', '0', '0', '0', '0', '14253', '0', '0', '0', 'Heroic Arcane Aberration', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '2.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11480', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.02', '4.0', '1.1', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102414 WHERE (`entry` = 11480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11480) AND (`map` = 429);
-- Heroic Arcane Torrent
DELETE FROM `creature_template` WHERE entry = 9102415;
INSERT INTO `creature_template` VALUES (9102415, '0', '0', '0', '0', '0', '10315', '0', '0', '0', 'Heroic Arcane Torrent', NULL, NULL, '0', '60', '60', '0', '834', '0', '3.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '2.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '14399', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.06', '4.0', '1.05', '1.0', '0', '129', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102415 WHERE (`entry` = 14399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14399) AND (`map` = 429);
-- Heroic Gordok Captain
DELETE FROM `creature_template` WHERE entry = 9102416;
INSERT INTO `creature_template` VALUES (9102416, '0', '0', '0', '0', '0', '11564', '0', '0', '0', 'Heroic Gordok Captain', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11445', 
'11441', '0', '0', '0', '0', '0', '', '1', '1.0', '2.93', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102416 WHERE (`entry` = 11445);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11445) AND (`map` = 429);
-- Heroic Gordok Warlock
DELETE FROM `creature_template` WHERE entry = 9102417;
INSERT INTO `creature_template` VALUES (9102417, '0', '0', '0', '0', '0', '14423', '0', '0', '0', 'Heroic Gordok Warlock', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11448', 
'11441', '0', '0', '0', '0', '0', '', '1', '1.0', '3.16', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102417 WHERE (`entry` = 11448);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11448) AND (`map` = 429);
-- Heroic Residual Monstrosity
DELETE FROM `creature_template` WHERE entry = 9102418;
INSERT INTO `creature_template` VALUES (9102418, '0', '0', '0', '0', '0', '14254', '0', '0', '0', 'Heroic Residual Monstrosity', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '1.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11484', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.84', '4.0', '0.95', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102418 WHERE (`entry` = 11484);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11484) AND (`map` = 429);
-- Heroic Shendralar Zealot
DELETE FROM `creature_template` WHERE entry = 9102419;
INSERT INTO `creature_template` VALUES (9102419, '0', '0', '0', '0', '0', '14408', '14410', '14409', '14411', 'Heroic Shendralar Zealot', 'House of Shen''dralar', NULL, '5737', '60', '60', '0', '1355', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', 
'0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102419 WHERE (`entry` = 14369);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14369) AND (`map` = 429);
-- Heroic Eldreth Darter
DELETE FROM `creature_template` WHERE entry = 9102420;
INSERT INTO `creature_template` VALUES (9102420, '0', '0', '0', '0', '0', '8471', '0', '0', '0', 'Heroic Eldreth Darter', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '14398', '0', '14398', '0', '0', '0', '0', '', '1', '1.0', '3.42', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102420 WHERE (`entry` = 14398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14398) AND (`map` = 429);
-- Heroic Eldreth Phantasm
DELETE FROM `creature_template` WHERE entry = 9102421;
INSERT INTO `creature_template` VALUES (9102421, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Heroic Eldreth Phantasm', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11475', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.32', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102421 WHERE (`entry` = 11475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11475) AND (`map` = 429);
-- Heroic Eldreth Seether
DELETE FROM `creature_template` WHERE entry = 9102422;
INSERT INTO `creature_template` VALUES (9102422, '0', '0', '0', '0', '0', '11213', '11214', '11215', '11216', 'Heroic Eldreth Seether', NULL, NULL, '0', '60', '60', 
'0', '16', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '1600', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11469', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102422 WHERE (`entry` = 11469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11469) AND (`map` = 429);
-- Heroic Eldreth Sorcerer
DELETE FROM `creature_template` WHERE entry = 9102423;
INSERT INTO `creature_template` VALUES (9102423, '0', '0', '0', '0', '0', '11205', '11206', '11211', '11212', 'Heroic Eldreth Sorcerer', NULL, NULL, '0', '60', '60', '0', '16', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', 
'0', '11470', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.09', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102423 WHERE (`entry` = 11470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11470) AND (`map` = 429);
-- Heroic Eldreth Spectre
DELETE FROM `creature_template` WHERE entry = 9102424;
INSERT INTO `creature_template` VALUES (9102424, '0', '0', '0', '0', '0', '14366', '0', '0', '0', 'Heroic Eldreth Spectre', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11473', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.46', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102424 WHERE (`entry` = 11473);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11473) AND (`map` = 429);
-- Heroic Gordok Bushwacker
DELETE FROM `creature_template` WHERE entry = 9102425;
INSERT INTO `creature_template` VALUES (9102425, '0', '0', '0', '0', '0', '10709', '0', '0', '0', 'Heroic Gordok Bushwacker', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '1175', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '14351', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.45', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102425 WHERE (`entry` = 14351);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14351) AND (`map` = 429);
-- Heroic Rotting Highborne
DELETE FROM `creature_template` WHERE entry = 9102426;
INSERT INTO `creature_template` VALUES (9102426, '0', '0', '0', '0', '0', '14391', '0', '0', '0', 'Heroic Rotting Highborne', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11477', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.15', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102426 WHERE (`entry` = 11477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11477) AND (`map` = 429);
-- Heroic Ironbark Protector
DELETE FROM `creature_template` WHERE entry = 9102427;
INSERT INTO `creature_template` VALUES (9102427, '0', '0', '0', '0', '0', '13489', '0', '0', '0', 'Heroic Ironbark Protector', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11459', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.47', '1.5', '2.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102427 WHERE (`entry` = 11459);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11459) AND (`map` = 429);
-- Heroic Mana Remnant
DELETE FROM `creature_template` WHERE entry = 9102428;
INSERT INTO `creature_template` VALUES (9102428, '0', '0', '0', '0', '0', '14272', '0', '0', '0', 'Heroic Mana Remnant', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '1.97', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11483', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.16', '4.0', '1.0', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102428 WHERE (`entry` = 11483);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11483) AND (`map` = 429);
-- Heroic Petrified Guardian
DELETE FROM `creature_template` WHERE entry = 9102429;
INSERT INTO `creature_template` VALUES (9102429, '0', '0', '0', '0', '0', '5848', '0', '0', '0', 'Heroic Petrified Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '14303', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102429 WHERE (`entry` = 14303);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14303) AND (`map` = 429);
-- Heroic Petrified Treant
DELETE FROM `creature_template` WHERE entry = 9102430;
INSERT INTO `creature_template` VALUES (9102430, '0', '0', '0', '0', '0', '2078', '0', '0', '0', 'Heroic Petrified Treant', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11458', '0', '100045', '0', '0', '0', '0', '', '0', '1.0', '3.42', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102430 WHERE (`entry` = 11458);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11458) AND (`map` = 429);
-- Heroic Gordok Mastiff
DELETE FROM `creature_template` WHERE entry = 9102431;
INSERT INTO `creature_template` VALUES (9102431, '0', '0', '0', '0', '0', '12966', '0', '0', '0', 'Heroic Gordok Mastiff', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.08', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '13036', '0', '13036', '12913', '0', '0', '0', '', '0', '1.0', '3.18', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102431 WHERE (`entry` = 13036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13036) AND (`map` = 429);
-- Heroic Lorekeeper Kildrath
DELETE FROM `creature_template` WHERE entry = 9102432;
INSERT INTO `creature_template` VALUES (9102432, '0', '0', '0', '0', '0', '14420', '0', '0', '0', 'Heroic Lorekeeper Kildrath', 'House of Shen''dralar', NULL, '5748', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', 
'0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.45', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102432 WHERE (`entry` = 14383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14383) AND (`map` = 429);
-- Heroic Old Ironbark
DELETE FROM `creature_template` WHERE entry = 9102433;
INSERT INTO `creature_template` VALUES (9102433, '0', '0', '0', '0', '0', '13170', '0', '0', '0', 'Heroic Old Ironbark', NULL, NULL, '5601', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.1', '1.0', '1.2', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102433 WHERE (`entry` = 11491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11491) AND (`map` = 429);
-- Heroic Death Lash
DELETE FROM `creature_template` WHERE entry = 9102434;
INSERT INTO `creature_template` VALUES (9102434, '0', '0', '0', '0', '0', '13172', '0', '0', '0', 'Heroic Death Lash', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13285', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.43', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102434 WHERE (`entry` = 13285);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13285) AND (`map` = 429);
-- Heroic Eldreth Apparition
DELETE FROM `creature_template` WHERE entry = 9102435;
INSERT INTO `creature_template` VALUES (9102435, '0', '0', '0', '0', '0', '14365', '0', '0', '0', 'Heroic Eldreth Apparition', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11471', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.49', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102435 WHERE (`entry` = 11471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11471) AND (`map` = 429);
-- Heroic Eldreth Spirit
DELETE FROM `creature_template` WHERE entry = 9102436;
INSERT INTO `creature_template` VALUES (9102436, '0', '0', '0', '0', '0', '10751', '0', '0', '0', 'Heroic Eldreth Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11472', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.11', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102436 WHERE (`entry` = 11472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11472) AND (`map` = 429);
-- Heroic Gordok Brute
DELETE FROM `creature_template` WHERE entry = 9102437;
INSERT INTO `creature_template` VALUES (9102437, '0', '0', '0', '0', '0', '12473', '0', '0', '0', 'Heroic Gordok Brute', NULL, NULL, '5746', '60', '60', '0', '45', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11441', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '3.45', '2.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102437 WHERE (`entry` = 11441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11441) AND (`map` = 429);
-- Heroic Gordok Mage-Lord
DELETE FROM `creature_template` WHERE entry = 9102438;
INSERT INTO `creature_template` VALUES (9102438, '0', '0', '0', '0', '0', '11537', '0', '0', '0', 'Heroic Gordok Mage-Lord', NULL, NULL, '5746', '60', '60', '0', '45', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11444', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '2.9', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102438 WHERE (`entry` = 11444);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11444) AND (`map` = 429);
-- Heroic Warpwood Guardian
DELETE FROM `creature_template` WHERE entry = 9102439;
INSERT INTO `creature_template` VALUES (9102439, '0', '0', '0', '0', '0', '13173', '0', '0', '0', 'Heroic Warpwood Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11461', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.33', '1.5', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102439 WHERE (`entry` = 11461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11461) AND (`map` = 429);
-- Heroic Warpwood Stomper
DELETE FROM `creature_template` WHERE entry = 9102440;
INSERT INTO `creature_template` VALUES (9102440, '0', '0', '0', '0', '0', '6350', '0', '0', '0', 'Heroic Warpwood Stomper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11465', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.45', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102440 WHERE (`entry` = 11465);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11465) AND (`map` = 429);
-- Heroic Shendralar Spirit
DELETE FROM `creature_template` WHERE entry = 9102441;
INSERT INTO `creature_template` VALUES (9102441, '0', '0', '0', '0', '0', '14397', '14393', '14398', '14400', 'Heroic Shendralar Spirit', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '1354', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '1200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.88', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102441 WHERE (`entry` = 14364);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14364) AND (`map` = 429);
-- Heroic Wildspawn Hellcaller
DELETE FROM `creature_template` WHERE entry = 9102442;
INSERT INTO `creature_template` VALUES (9102442, '0', '0', '0', '0', '0', '11340', '0', '0', '0', 'Heroic Wildspawn Hellcaller', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11457', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.43', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102442 WHERE (`entry` = 11457);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11457) AND (`map` = 429);
-- Heroic Wildspawn Rogue
DELETE FROM `creature_template` WHERE entry = 9102443;
INSERT INTO `creature_template` VALUES (9102443, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Heroic Wildspawn Rogue', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11452', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.05', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102443 WHERE (`entry` = 11452);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11452) AND (`map` = 429);
-- Heroic Wildspawn Trickster
DELETE FROM `creature_template` WHERE entry = 9102444;
INSERT INTO `creature_template` VALUES (9102444, '0', '0', '0', '0', '0', '2020', '0', '0', '0', 'Heroic Wildspawn Trickster', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11453', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.83', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102444 WHERE (`entry` = 11453);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11453) AND (`map` = 429);
-- Heroic Fel Lash
DELETE FROM `creature_template` WHERE entry = 9102445;
INSERT INTO `creature_template` VALUES (9102445, '0', '0', '0', '0', '0', '13110', '0', '0', '0', 'Heroic Fel Lash', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13197', '0', 
'100045', '0', '0', '0', '0', '', '1', '1.0', '3.2', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102445 WHERE (`entry` = 13197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13197) AND (`map` = 429);
-- Heroic Warpwood Crusher
DELETE FROM `creature_template` WHERE entry = 9102446;
INSERT INTO `creature_template` VALUES (9102446, '0', '0', '0', '0', '0', '12929', '0', '0', '0', 'Heroic Warpwood Crusher', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13021', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '2.83', '1.5', '1.0', '1.0', '0', '0', '1', '608910931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102446 WHERE (`entry` = 13021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13021) AND (`map` = 429);
-- Heroic Wildspawn Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9102447;
INSERT INTO `creature_template` VALUES (9102447, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Heroic Wildspawn Shadowstalker', NULL, NULL, '0', '60', '60', '0', 
'90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11456', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.41', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102447 WHERE (`entry` = 11456);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11456) AND (`map` = 429);
-- Heroic Alzzins Minion
DELETE FROM `creature_template` WHERE entry = 9102448;
INSERT INTO `creature_template` VALUES (9102448, '0', '0', '0', '0', '0', '911', '0', '0', '0', 'Heroic Alzzins Minion', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.99', '800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.99', '1.0', '1.0', '0.5', '0', '188', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102448 WHERE (`entry` = 11460);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11460) AND (`map` = 429);
-- Heroic Wildspawn Imp
DELETE FROM `creature_template` WHERE entry = 9102449;
INSERT INTO `creature_template` VALUES (9102449, '0', '0', '0', '0', '0', '911', '0', '0', '0', 'Heroic Wildspawn Imp', NULL, NULL, '0', '60', '60', '0', '16', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '13276', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.01', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102449 WHERE (`entry` = 13276);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13276) AND (`map` = 429);
-- Heroic Warpwood Tangler
DELETE FROM `creature_template` WHERE entry = 9102450;
INSERT INTO `creature_template` VALUES (9102450, '0', '0', '0', '0', '0', '9592', '0', '0', '0', 'Heroic Warpwood Tangler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11464', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '3.47', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102450 WHERE (`entry` = 11464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11464) AND (`map` = 429);
-- Heroic Wildspawn Betrayer
DELETE FROM `creature_template` WHERE entry = 9102451;
INSERT INTO `creature_template` VALUES (9102451, '0', '0', '0', '0', '0', '10032', '0', '0', '0', 'Heroic Wildspawn Betrayer', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11454', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.34', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102451 WHERE (`entry` = 11454);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11454) AND (`map` = 429);
-- Heroic Wildspawn Felsworn
DELETE FROM `creature_template` WHERE entry = 9102452;
INSERT INTO `creature_template` VALUES (9102452, '0', '0', '0', '0', '0', '7649', '0', '0', '0', 'Heroic Wildspawn Felsworn', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11455', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102452 WHERE (`entry` = 11455);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11455) AND (`map` = 429);
-- Heroic Wildspawn Satyr
DELETE FROM `creature_template` WHERE entry = 9102453;
INSERT INTO `creature_template` VALUES (9102453, '0', '0', '0', '0', '0', '11345', '0', '0', '0', 'Heroic Wildspawn Satyr', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11451', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.5', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102453 WHERE (`entry` = 11451);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11451) AND (`map` = 429);
-- Heroic Highborne Summoner
DELETE FROM `creature_template` WHERE entry = 9102454;
INSERT INTO `creature_template` VALUES (9102454, '0', '0', '0', '0', '0', '11207', '11208', '11209', '11210', 'Heroic Highborne Summoner', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '3.0', '1.0', '0.5', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102454 WHERE (`entry` = 11466);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11466) AND (`map` = 429);
-- Heroic Phase Lasher
DELETE FROM `creature_template` WHERE entry = 9102455;
INSERT INTO `creature_template` VALUES (9102455, '0', '0', '0', '0', '0', '13109', '0', '0', '0', 'Heroic Phase Lasher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13196', 
'0', '100044', '0', '0', '0', '0', '', '1', '1.0', '2.92', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102455 WHERE (`entry` = 13196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13196) AND (`map` = 429);
-- Heroic Warpwood Treant
DELETE FROM `creature_template` WHERE entry = 9102456;
INSERT INTO `creature_template` VALUES (9102456, '0', '0', '0', '0', '0', '10621', '0', '0', '0', 'Heroic Warpwood Treant', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11462', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '3.06', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102456 WHERE (`entry` = 11462);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11462) AND (`map` = 429);
-- Heroic Whip Lasher
DELETE FROM `creature_template` WHERE entry = 9102457;
INSERT INTO `creature_template` VALUES (9102457, '0', '0', '0', '0', '0', '12962', '12963', '0', '0', 'Heroic Whip Lasher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13022', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '3.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102457 WHERE (`entry` = 13022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13022) AND (`map` = 429);
-- Heroic Shendralar Provisioner
DELETE FROM `creature_template` WHERE entry = 9102458;
INSERT INTO `creature_template` VALUES (9102458, '0', '0', '0', '0', '0', '14412', '0', '0', '0', 'Heroic Shendralar Provisioner', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '1355', '4226', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102458 WHERE (`entry` = 14371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14371) AND (`map` = 429);
-- Heroic Isalien
DELETE FROM `creature_template` WHERE entry = 9102459;
INSERT INTO `creature_template` VALUES (9102459, '0', '0', '0', '0', '0', '16000', '0', '0', '0', 'Heroic Isalien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '1150', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '6.28', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102459 WHERE (`entry` = 16097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16097) AND (`map` = 429);
-- Heroic Lord Helnurath
DELETE FROM `creature_template` WHERE entry = 9102460;
INSERT INTO `creature_template` VALUES (9102460, '0', '0', '0', '0', '0', '14556', '0', '0', '0', 'Heroic Lord Helnurath', NULL, NULL, '0', '63', '63', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2400', '1246', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102460 WHERE (`entry` = 14506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14506) AND (`map` = 429);
-- Heroic King Gordok
DELETE FROM `creature_template` WHERE entry = 9102461;
INSERT INTO `creature_template` VALUES (9102461, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Heroic King Gordok', NULL, NULL, '0', '63', '63', '0', '45', '0', 
'1.0', '1.71429', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.94', '1.0', '1.0', '2.0', '0', '164', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102461 WHERE (`entry` = 11501);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11501) AND (`map` = 429);
-- Heroic Captain Kromcrush
DELETE FROM `creature_template` WHERE entry = 9102462;
INSERT INTO `creature_template` VALUES (9102462, '0', '0', '0', '0', '0', '11564', '0', '0', '0', 'Heroic Captain Kromcrush', NULL, NULL, '5739', '63', '63', '0', '1374', '3', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.86', '1.0', '1.0', '2.0', '0', '127', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102462 WHERE (`entry` = 14325);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14325) AND (`map` = 429);
-- Heroic Immolthar
DELETE FROM `creature_template` WHERE entry = 9102463;
INSERT INTO `creature_template` VALUES (9102463, '0', '0', '0', '0', '0', '14173', '0', '0', '0', 'Heroic Immolthar', NULL, NULL, '0', '63', '63', '0', '754', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '11496', '0', '0', '0', '0', '', '1', '1.0', '6.41', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102463 WHERE (`entry` = 11496);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11496) AND (`map` = 429);
-- Heroic Prince Tortheldrin
DELETE FROM `creature_template` WHERE entry = 9102464;
INSERT INTO `creature_template` VALUES (9102464, '0', '0', '0', '0', '0', '11256', '0', '0', '0', 'Heroic Prince Tortheldrin', 'Ruler of the Shen''dralar', NULL, '5736', '63', '63', '0', '1355', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.33', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '2', '', '12340');     
UPDATE `creature_template` SET `difficulty_entry_1` = 9102464 WHERE (`entry` = 11486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11486) AND (`map` = 429);
-- Heroic ChoRush the Observer
DELETE FROM `creature_template` WHERE entry = 9102465;
INSERT INTO `creature_template` VALUES (9102465, '0', '0', '0', '0', '0', '11537', '0', '0', '0', 'Heroic ChoRush the Observer', NULL, NULL, '5742', '63', '63', '0', '45', '1', '2.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.33', '4.0', '1.1', '2.0', '0', '151', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102465 WHERE (`entry` = 14324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14324) AND (`map` = 429);
-- Heroic Illyanna Ravenoak
DELETE FROM `creature_template` WHERE entry = 9102466;
INSERT INTO `creature_template` VALUES (9102466, '0', '0', '0', '0', '0', '11270', '0', '0', '0', 'Heroic Illyanna Ravenoak', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.4', '3.0', '1.1', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102466 WHERE (`entry` = 11488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11488) AND (`map` = 429);
-- Heroic Magister Kalendris
DELETE FROM `creature_template` WHERE entry = 9102467;
INSERT INTO `creature_template` VALUES (9102467, '0', '0', '0', '0', '0', '14384', '0', '0', '0', 'Heroic Magister Kalendris', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.22', '4.0', '1.0', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102467 WHERE (`entry` = 11487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11487) AND (`map` = 429);
-- Heroic Tendris Warpwood
DELETE FROM `creature_template` WHERE entry = 9102468;
INSERT INTO `creature_template` VALUES (9102468, '0', '0', '0', '0', '0', '14383', '0', '0', '0', 'Heroic Tendris Warpwood', NULL, NULL, '0', '63', '63', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '9100400', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '5.87', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102468 WHERE (`entry` = 11489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11489) AND (`map` = 429);
-- Heroic Tsuzee
DELETE FROM `creature_template` WHERE entry = 9102469;
INSERT INTO `creature_template` VALUES (9102469, '0', '0', '0', '0', '0', '11250', '0', '0', '0', 'Heroic Tsuzee', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '1600', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.15', '1.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102469 WHERE (`entry` = 11467);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11467) AND (`map` = 429);
-- Heroic Guard Fengus
DELETE FROM `creature_template` WHERE entry = 9102470;
INSERT INTO `creature_template` VALUES (9102470, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Heroic Guard Fengus', NULL, NULL, '5734', '63', '63', '0', '45', '1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.9', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102470 WHERE (`entry` = 14321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14321) AND (`map` = 429);
-- Heroic Guard Moldar
DELETE FROM `creature_template` WHERE entry = 9102471;
INSERT INTO `creature_template` VALUES (9102471, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Heroic Guard Moldar', NULL, NULL, '5735', '63', '63', '0', '45', '1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.24', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102471 WHERE (`entry` = 14326);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14326) AND (`map` = 429);
-- Heroic Guard Slipkik
DELETE FROM `creature_template` WHERE entry = 9102472;
INSERT INTO `creature_template` VALUES (9102472, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Heroic Guard Slipkik', NULL, NULL, '5733', '63', '63', '0', '45', 
'1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.18', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102472 WHERE (`entry` = 14323);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14323) AND (`map` = 429);
-- Heroic Stomper Kreeg
DELETE FROM `creature_template` WHERE entry = 9102473;
INSERT INTO `creature_template` VALUES (9102473, '0', '0', '0', '0', '0', '11545', '0', '0', '0', 'Heroic Stomper Kreeg', 'The Drunk', NULL, '5721', '63', '63', '0', '45', '131', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.23', '2.0', '1.0', '2.0', '0', '53', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102473 WHERE (`entry` = 14322);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14322) AND (`map` = 429);
-- Heroic Alzzin the Wildshaper
DELETE FROM `creature_template` WHERE entry = 9102474;
INSERT INTO `creature_template` VALUES (9102474, '0', '0', '0', '0', '0', '14416', '0', '0', '0', 'Heroic Alzzin the Wildshaper', NULL, NULL, '0', '63', '63', '0', '90', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.94', '5.0', '1.0', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102474 WHERE (`entry` = 11492);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11492) AND (`map` = 429);
-- Heroic Hydrospawn
DELETE FROM `creature_template` WHERE entry = 9102475;
INSERT INTO `creature_template` VALUES (9102475, '0', '0', '0', '0', '0', '5489', '0', '0', '0', 'Heroic Hydrospawn', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '4', '4.97', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.29', '3.0', '1.0', '2.0', '0', '0', '1', '613122011', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102475 WHERE (`entry` = 13280);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13280) AND (`map` = 429);
-- Heroic Lethtendris
DELETE FROM `creature_template` WHERE entry = 9102476;
INSERT INTO `creature_template` VALUES (9102476, '0', '0', '0', '0', '0', '14378', '0', '0', '0', 'Heroic Lethtendris', NULL, NULL, '0', '63', '63', '0', '16', '0', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.09', '4.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102476 WHERE (`entry` = 14327);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14327) AND (`map` = 429);
-- Heroic Pusillin
DELETE FROM `creature_template` WHERE entry = 9102477;
INSERT INTO `creature_template` VALUES (9102477, '0', '0', '0', '0', '0', '7552', '0', '0', '0', 'Heroic Pusillin', NULL, NULL, '5710', '63', '63', '0', '35', '1', '1.0', '2.57143', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.08', '6.0', '1.0', '1.0', '0', '210', '1', '613105627', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102477 WHERE (`entry` = 14354);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14354) AND (`map` = 429);
-- Heroic Zevrim Thornhoof
DELETE FROM `creature_template` WHERE entry = 9102478;
INSERT INTO `creature_template` VALUES (9102478, '0', '0', '0', '0', '0', '11335', '0', '0', '0', 'Heroic Zevrim Thornhoof', NULL, NULL, '0', '63', '63', '0', '90', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.29', '1.0', '1.0', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102478 WHERE (`entry` = 11490);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11490) AND (`map` = 429);
-- Heroic Pimgib
DELETE FROM `creature_template` WHERE entry = 9102479;
INSERT INTO `creature_template` VALUES (9102479, '0', '0', '0', '0', '0', '14380', '0', '0', '0', 'Heroic Pimgib', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '3.0', '1.0', '1.0', '0', '0', '1', '75700827', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102479 WHERE (`entry` = 14349);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14349) AND (`map` = 429);
-- Heroic Jeevee
DELETE FROM `creature_template` WHERE entry = 9102480;
INSERT INTO `creature_template` VALUES (9102480, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Heroic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.19', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102480 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500) AND (`map` = 429);
-- Heroic Eye of Immolthar
DELETE FROM `creature_template` WHERE entry = 9102481;
INSERT INTO `creature_template` VALUES (9102481, '0', '0', '0', '0', '0', '14430', '0', '0', '0', 'Heroic Eye of Immolthar', NULL, NULL, '0', '60', '60', '0', '754', '0', '1.0', '2.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.97', '10000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.36', '1.0', '1.0', '0.5', '0', '207', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102481 WHERE (`entry` = 14396);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14396) AND (`map` = 429);
-- Heroic Ancient Equine Spirit
DELETE FROM `creature_template` WHERE entry = 9102482;
INSERT INTO `creature_template` VALUES (9102482, '0', '0', '0', '0', '0', '14585', '0', '0', '0', 'Heroic Ancient Equine Spirit', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '0', '1.0', '2.3', '1.0', '1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102482 WHERE (`entry` = 14566);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14566) AND (`map` = 429);
-- Heroic Cadaverous Worm
DELETE FROM `creature_template` WHERE entry = 9102483;
INSERT INTO `creature_template` VALUES (9102483, '0', '0', '0', '0', '0', '10996', '0', '0', '0', 'Heroic Cadaverous Worm', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '1000', '1540', '1.0', '1.0', '1', '0', '2048', '0', '42', '0', '0', '0', '0', '10', '65537', '14370', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.44', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102483 WHERE (`entry` = 14370);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14370) AND (`map` = 429);
-- Heroic Dreadsteed Spirit
DELETE FROM `creature_template` WHERE entry = 9102484;
INSERT INTO `creature_template` VALUES (9102484, '0', '0', '0', '0', '0', '14553', '0', '0', '0', 'Heroic Dreadsteed Spirit', NULL, NULL, '0', '60', '60', '0', '7', 
'2', '1.0', '1.28968', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.09', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102484 WHERE (`entry` = 14504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14504) AND (`map` = 429);
-- Heroic Falrin Treeshaper
DELETE FROM `creature_template` WHERE entry = 9102485;
INSERT INTO `creature_template` VALUES (9102485, '0', '0', '0', '0', '0', '15996', '0', '0', '0', 'Heroic Falrin Treeshaper', 'House of Shen''dralar', NULL, '7084', 
'60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.9', '1.0', '0.9', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102485 WHERE (`entry` = 16032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16032) AND (`map` = 429);
-- Heroic Massive Geyser
DELETE FROM `creature_template` WHERE entry = 9102486;
INSERT INTO `creature_template` VALUES (9102486, '0', '0', '0', '0', '0', '13069', '0', '0', '0', 'Heroic Massive Geyser', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '1024', '0', 
'0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.01', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102486 WHERE (`entry` = 14122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14122) AND (`map` = 429);
-- Heroic Spectral Stalker
DELETE FROM `creature_template` WHERE entry = 9102487;
INSERT INTO `creature_template` VALUES (9102487, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Heroic Spectral Stalker', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '1200', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.05', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102487 WHERE (`entry` = 16093);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16093) AND (`map` = 429);
-- Heroic Wandering Eye of Kilrogg
DELETE FROM `creature_template` WHERE entry = 9102488;
INSERT INTO `creature_template` VALUES (9102488, '0', '0', '0', '0', '0', '14430', '0', '0', '0', 'Heroic Wandering Eye of Kilrogg', NULL, NULL, '0', '60', '60', '0', '45', '0', '4.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.07', '2000', '2000', '1.0', '1.0', '1', '131072', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.1', '1.0', '0.95', '0.25', '0', '156', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102488 WHERE (`entry` = 14386);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14386) AND (`map` = 429);
-- Heroic Arcane Feedback
DELETE FROM `creature_template` WHERE entry = 9102489;
INSERT INTO `creature_template` VALUES (9102489, '0', '0', '0', '0', '0', '5490', '0', '0', '0', 'Heroic Arcane Feedback', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '6', '1.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '14400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.19', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102489 WHERE (`entry` = 14400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14400) AND (`map` = 429);
-- Heroic Doomguard Minion
DELETE FROM `creature_template` WHERE entry = 9102490;
INSERT INTO `creature_template` VALUES (9102490, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Heroic Doomguard Minion', NULL, NULL, '0', '60', '60', '0', '954', 
'0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.92', '2000', '1562', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14385', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.13', '0.77', '1.35', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102490 WHERE (`entry` = 14385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14385) AND (`map` = 429);
-- Heroic Mana Burst
DELETE FROM `creature_template` WHERE entry = 9102491;
INSERT INTO `creature_template` VALUES (9102491, '0', '0', '0', '0', '0', '14273', '0', '0', '0', 'Heroic Mana Burst', NULL, NULL, '0', '60', '60', '0', '834', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '6', '1.05', '2000', '1562', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.19', '2.0', '1.1', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102491 WHERE (`entry` = 14397);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14397) AND (`map` = 429);
-- Heroic Xorothian Imp
DELETE FROM `creature_template` WHERE entry = 9102492;
INSERT INTO `creature_template` VALUES (9102492, '0', '0', '0', '0', '0', '14380', '0', '0', '0', 'Heroic Xorothian Imp', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.97', '1200', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '2.27', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102492 WHERE (`entry` = 14482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14482) AND (`map` = 429);
-- Heroic Carrion Swarmer
DELETE FROM `creature_template` WHERE entry = 9102493;
INSERT INTO `creature_template` VALUES (9102493, '0', '0', '0', '0', '0', '13096', '13111', '13097', '0', 'Heroic Carrion Swarmer', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', 
'13160', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '2.43', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102493 WHERE (`entry` = 13160);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13160) AND (`map` = 429);
-- Heroic Skeletal Highborne
DELETE FROM `creature_template` WHERE entry = 9102494;
INSERT INTO `creature_template` VALUES (9102494, '0', '0', '0', '0', '0', '11078', '0', '0', '0', 'Heroic Skeletal Highborne', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11476', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.39', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102494 WHERE (`entry` = 11476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11476) AND (`map` = 429);
-- Heroic Hydroling
DELETE FROM `creature_template` WHERE entry = 9102495;
INSERT INTO `creature_template` VALUES (9102495, '0', '0', '0', '0', '0', '5561', '0', '0', '0', 'Heroic Hydroling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.55556', '1.85714', '1.0', '1.0', '18.0', '1.0', '0', '4', '0.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.2', '1.0', '1.0', '0.5', '0', '176', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102495 WHERE (`entry` = 14350);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14350) AND (`map` = 429);
-- Heroic Knot Thimblejack
DELETE FROM `creature_template` WHERE entry = 9102496;
INSERT INTO `creature_template` VALUES (9102496, '0', '0', '0', '0', '0', '14381', '0', '0', '0', 'Heroic Knot Thimblejack', NULL, NULL, '5667', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.24', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102496 WHERE (`entry` = 14338);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14338) AND (`map` = 429);
-- Mythic Doomguard
DELETE FROM `creature_template` WHERE entry = 9102497;
INSERT INTO `creature_template` VALUES (9102497, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Mythic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '4.11', '0.77', '1.35', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102497 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859) AND (`map` = 429);
-- Mythic Xorothian Dreadsteed
DELETE FROM `creature_template` WHERE entry = 9102498;
INSERT INTO `creature_template` VALUES (9102498, '0', '0', '0', '0', '0', '14552', '0', '0', '0', 'Mythic Xorothian Dreadsteed', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.28968', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14502', '0', '14502', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102498 WHERE (`entry` = 14502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14502) AND (`map` = 429);
-- Mythic Gordok Reaver
DELETE FROM `creature_template` WHERE entry = 9102499;
INSERT INTO `creature_template` VALUES (9102499, '0', '0', '0', '0', '0', '10709', '0', '0', '0', 'Mythic Gordok Reaver', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11450', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102499 WHERE (`entry` = 11450);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11450) AND (`map` = 429);
-- Mythic Ferra
DELETE FROM `creature_template` WHERE entry = 9102500;
INSERT INTO `creature_template` VALUES (9102500, '0', '0', '0', '0', '0', '1083', '0', '0', '0', 'Mythic Ferra', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.6', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '14308', '0', '14308', '0', '0', '0', '0', '', '0', '1.0', '4.18', '1.0', '1.1', '1.0', '0', '51', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102500 WHERE (`entry` = 14308);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14308) AND (`map` = 429);
-- Mythic Dread Guard
DELETE FROM `creature_template` WHERE entry = 9102501;
INSERT INTO `creature_template` VALUES (9102501, '0', '0', '0', '0', '0', '14152', '0', '0', '0', 'Mythic Dread Guard', NULL, NULL, '0', '60', '60', '0', '90', '0', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102501 WHERE (`entry` = 14483);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14483) AND (`map` = 429);
-- Mythic Empyrean
DELETE FROM `creature_template` WHERE entry = 9102502;
INSERT INTO `creature_template` VALUES (9102502, '0', '0', '0', '0', '0', '12589', '0', '0', '0', 'Mythic Empyrean', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', 
'0', '0', '0', '0', '', '0', '1.0', '3.99', '15.0', '1.1', '1.0', '0', '0', '1', '512', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102502 WHERE (`entry` = 16098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16098) AND (`map` = 429);
-- Mythic Gordok Spirit
DELETE FROM `creature_template` WHERE entry = 9102503;
INSERT INTO `creature_template` VALUES (9102503, '0', '0', '0', '0', '0', '13093', '13130', '0', '13132', 'Mythic Gordok Spirit', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '131076', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.98', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '1074003970', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102503 WHERE (`entry` = 11446);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11446) AND (`map` = 429);
-- Mythic Lorekeeper Javon
DELETE FROM `creature_template` WHERE entry = 9102504;
INSERT INTO `creature_template` VALUES (9102504, '0', '0', '0', '0', '0', '14422', '0', '0', '0', 'Mythic Lorekeeper Javon', 'House of Shen''dralar', NULL, '5755', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.98', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102504 WHERE (`entry` = 14381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14381) AND (`map` = 429);
-- Mythic Lorekeeper Lydros
DELETE FROM `creature_template` WHERE entry = 9102505;
INSERT INTO `creature_template` VALUES (9102505, '0', '0', '0', '0', '0', '14407', '0', '0', '0', 'Mythic Lorekeeper Lydros', 'House of Shen''dralar', NULL, '5747', 
'60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102505 WHERE (`entry` = 14368);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14368) AND (`map` = 429);
-- Mythic Lorekeeper Mykos
DELETE FROM `creature_template` WHERE entry = 9102506;
INSERT INTO `creature_template` VALUES (9102506, '0', '0', '0', '0', '0', '14421', '0', '0', '0', 'Mythic Lorekeeper Mykos', 'House of Shen''dralar', NULL, '5756', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102506 WHERE (`entry` = 14382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14382) AND (`map` = 429);
-- Mythic Mizzle the Crafty
DELETE FROM `creature_template` WHERE entry = 9102507;
INSERT INTO `creature_template` VALUES (9102507, '0', '0', '0', '0', '0', '14406', '0', '0', '0', 'Mythic Mizzle the Crafty', NULL, NULL, '5708', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102507 WHERE (`entry` = 14353);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14353) AND (`map` = 429);
-- Mythic Netherwalker
DELETE FROM `creature_template` WHERE entry = 9102508;
INSERT INTO `creature_template` VALUES (9102508, '0', '0', '0', '0', '0', '14428', '0', '0', '0', 'Mythic Netherwalker', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '3.04', '1183', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.35', '2.0', '1.1', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102508 WHERE (`entry` = 14389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14389) AND (`map` = 429);
-- Mythic Revanchion
DELETE FROM `creature_template` WHERE entry = 9102509;
INSERT INTO `creature_template` VALUES (9102509, '0', '0', '0', '0', '0', '14695', '0', '0', '0', 'Mythic Revanchion', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14690', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.44', '2.0', '1.35', '1.0', '0', '0', '1', '46156048', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102509 WHERE (`entry` = 14690);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14690) AND (`map` = 429);
-- Mythic Shendralar Ancient
DELETE FROM `creature_template` WHERE entry = 9102510;
INSERT INTO `creature_template` VALUES (9102510, '0', '0', '0', '0', '0', '14393', '0', '0', '0', 'Mythic Shendralar Ancient', 'House of Shen''dralar', NULL, '5729', '60', '60', '0', '1354', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.89', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102510 WHERE (`entry` = 14358);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14358) AND (`map` = 429);
-- Mythic Arcane Aberration
DELETE FROM `creature_template` WHERE entry = 9102511;
INSERT INTO `creature_template` VALUES (9102511, '0', '0', '0', '0', '0', '14253', '0', '0', '0', 'Mythic Arcane Aberration', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '3.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11480', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.01', '4.0', '1.1', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102511 WHERE (`entry` = 11480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11480) AND (`map` = 429);
-- Mythic Arcane Torrent
DELETE FROM `creature_template` WHERE entry = 9102512;
INSERT INTO `creature_template` VALUES (9102512, '0', '0', '0', '0', '0', '10315', '0', '0', '0', 'Mythic Arcane Torrent', NULL, NULL, '0', '60', '60', '0', '834', '0', '3.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '3.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '14399', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '4.0', '1.05', '1.0', '0', '129', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102512 WHERE (`entry` = 14399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14399) AND (`map` = 429);
-- Mythic Gordok Captain
DELETE FROM `creature_template` WHERE entry = 9102513;
INSERT INTO `creature_template` VALUES (9102513, '0', '0', '0', '0', '0', '11564', '0', '0', '0', 'Mythic Gordok Captain', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11445', 
'11441', '0', '0', '0', '0', '0', '', '1', '1.0', '4.2', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102513 WHERE (`entry` = 11445);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11445) AND (`map` = 429);
-- Mythic Gordok Warlock
DELETE FROM `creature_template` WHERE entry = 9102514;
INSERT INTO `creature_template` VALUES (9102514, '0', '0', '0', '0', '0', '14423', '0', '0', '0', 'Mythic Gordok Warlock', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11448', 
'11441', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102514 WHERE (`entry` = 11448);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11448) AND (`map` = 429);
-- Mythic Residual Monstrosity
DELETE FROM `creature_template` WHERE entry = 9102515;
INSERT INTO `creature_template` VALUES (9102515, '0', '0', '0', '0', '0', '14254', '0', '0', '0', 'Mythic Residual Monstrosity', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '2.96', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11484', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '4.0', '0.95', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102515 WHERE (`entry` = 11484);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11484) AND (`map` = 429);
-- Mythic Shendralar Zealot
DELETE FROM `creature_template` WHERE entry = 9102516;
INSERT INTO `creature_template` VALUES (9102516, '0', '0', '0', '0', '0', '14408', '14410', '14409', '14411', 'Mythic Shendralar Zealot', 'House of Shen''dralar', NULL, '5737', '60', '60', '0', '1355', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102516 WHERE (`entry` = 14369);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14369) AND (`map` = 429);
-- Mythic Eldreth Darter
DELETE FROM `creature_template` WHERE entry = 9102517;
INSERT INTO `creature_template` VALUES (9102517, '0', '0', '0', '0', '0', '8471', '0', '0', '0', 'Mythic Eldreth Darter', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '14398', '0', '14398', '0', '0', '0', '0', '', '1', '1.0', '3.88', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102517 WHERE (`entry` = 14398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14398) AND (`map` = 429);
-- Mythic Eldreth Phantasm
DELETE FROM `creature_template` WHERE entry = 9102518;
INSERT INTO `creature_template` VALUES (9102518, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Mythic Eldreth Phantasm', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11475', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.09', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102518 WHERE (`entry` = 11475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11475) AND (`map` = 429);
-- Mythic Eldreth Seether
DELETE FROM `creature_template` WHERE entry = 9102519;
INSERT INTO `creature_template` VALUES (9102519, '0', '0', '0', '0', '0', '11213', '11214', '11215', '11216', 'Mythic Eldreth Seether', NULL, NULL, '0', '60', '60', 
'0', '16', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '1600', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11469', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102519 WHERE (`entry` = 11469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11469) AND (`map` = 429);
-- Mythic Eldreth Sorcerer
DELETE FROM `creature_template` WHERE entry = 9102520;
INSERT INTO `creature_template` VALUES (9102520, '0', '0', '0', '0', '0', '11205', '11206', '11211', '11212', 'Mythic Eldreth Sorcerer', NULL, NULL, '0', '60', '60', '0', '16', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', 
'0', '11470', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.89', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102520 WHERE (`entry` = 11470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11470) AND (`map` = 429);
-- Mythic Eldreth Spectre
DELETE FROM `creature_template` WHERE entry = 9102521;
INSERT INTO `creature_template` VALUES (9102521, '0', '0', '0', '0', '0', '14366', '0', '0', '0', 'Mythic Eldreth Spectre', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11473', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.38', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102521 WHERE (`entry` = 11473);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11473) AND (`map` = 429);
-- Mythic Gordok Bushwacker
DELETE FROM `creature_template` WHERE entry = 9102522;
INSERT INTO `creature_template` VALUES (9102522, '0', '0', '0', '0', '0', '10709', '0', '0', '0', 'Mythic Gordok Bushwacker', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '1175', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '14351', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.87', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102522 WHERE (`entry` = 14351);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14351) AND (`map` = 429);
-- Mythic Rotting Highborne
DELETE FROM `creature_template` WHERE entry = 9102523;
INSERT INTO `creature_template` VALUES (9102523, '0', '0', '0', '0', '0', '14391', '0', '0', '0', 'Mythic Rotting Highborne', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11477', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102523 WHERE (`entry` = 11477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11477) AND (`map` = 429);
-- Mythic Ironbark Protector
DELETE FROM `creature_template` WHERE entry = 9102524;
INSERT INTO `creature_template` VALUES (9102524, '0', '0', '0', '0', '0', '13489', '0', '0', '0', 'Mythic Ironbark Protector', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11459', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.96', '1.5', '2.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102524 WHERE (`entry` = 11459);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11459) AND (`map` = 429);
-- Mythic Mana Remnant
DELETE FROM `creature_template` WHERE entry = 9102525;
INSERT INTO `creature_template` VALUES (9102525, '0', '0', '0', '0', '0', '14272', '0', '0', '0', 'Mythic Mana Remnant', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '6', '3.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '11483', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '4.0', '1.0', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102525 WHERE (`entry` = 11483);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11483) AND (`map` = 429);
-- Mythic Petrified Guardian
DELETE FROM `creature_template` WHERE entry = 9102526;
INSERT INTO `creature_template` VALUES (9102526, '0', '0', '0', '0', '0', '5848', '0', '0', '0', 'Mythic Petrified Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '14303', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '4.26', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102526 WHERE (`entry` = 14303);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14303) AND (`map` = 429);
-- Mythic Petrified Treant
DELETE FROM `creature_template` WHERE entry = 9102527;
INSERT INTO `creature_template` VALUES (9102527, '0', '0', '0', '0', '0', '2078', '0', '0', '0', 'Mythic Petrified Treant', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11458', '0', '100045', '0', '0', '0', '0', '', '0', '1.0', '3.89', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102527 WHERE (`entry` = 11458);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11458) AND (`map` = 429);
-- Mythic Gordok Mastiff
DELETE FROM `creature_template` WHERE entry = 9102528;
INSERT INTO `creature_template` VALUES (9102528, '0', '0', '0', '0', '0', '12966', '0', '0', '0', 'Mythic Gordok Mastiff', NULL, NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '13036', '0', '13036', '12913', '0', '0', '0', '', '0', '1.0', '4.28', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102528 WHERE (`entry` = 13036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13036) AND (`map` = 429);
-- Mythic Lorekeeper Kildrath
DELETE FROM `creature_template` WHERE entry = 9102529;
INSERT INTO `creature_template` VALUES (9102529, '0', '0', '0', '0', '0', '14420', '0', '0', '0', 'Mythic Lorekeeper Kildrath', 'House of Shen''dralar', NULL, '5748', '60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', 
'0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.2', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102529 WHERE (`entry` = 14383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14383) AND (`map` = 429);
-- Mythic Old Ironbark
DELETE FROM `creature_template` WHERE entry = 9102530;
INSERT INTO `creature_template` VALUES (9102530, '0', '0', '0', '0', '0', '13170', '0', '0', '0', 'Mythic Old Ironbark', NULL, NULL, '5601', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.08', '1.0', '1.2', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102530 WHERE (`entry` = 11491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11491) AND (`map` = 429);
-- Mythic Death Lash
DELETE FROM `creature_template` WHERE entry = 9102531;
INSERT INTO `creature_template` VALUES (9102531, '0', '0', '0', '0', '0', '13172', '0', '0', '0', 'Mythic Death Lash', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13285', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '3.91', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102531 WHERE (`entry` = 13285);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13285) AND (`map` = 429);
-- Mythic Eldreth Apparition
DELETE FROM `creature_template` WHERE entry = 9102532;
INSERT INTO `creature_template` VALUES (9102532, '0', '0', '0', '0', '0', '14365', '0', '0', '0', 'Mythic Eldreth Apparition', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11471', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.07', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102532 WHERE (`entry` = 11471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11471) AND (`map` = 429);
-- Mythic Eldreth Spirit
DELETE FROM `creature_template` WHERE entry = 9102533;
INSERT INTO `creature_template` VALUES (9102533, '0', '0', '0', '0', '0', '10751', '0', '0', '0', 'Mythic Eldreth Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11472', 
'0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.42', '3.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102533 WHERE (`entry` = 11472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11472) AND (`map` = 429);
-- Mythic Gordok Brute
DELETE FROM `creature_template` WHERE entry = 9102534;
INSERT INTO `creature_template` VALUES (9102534, '0', '0', '0', '0', '0', '12473', '0', '0', '0', 'Mythic Gordok Brute', NULL, NULL, '5746', '60', '60', '0', '45', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11441', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '2.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102534 WHERE (`entry` = 11441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11441) AND (`map` = 429);
-- Mythic Gordok Mage-Lord
DELETE FROM `creature_template` WHERE entry = 9102535;
INSERT INTO `creature_template` VALUES (9102535, '0', '0', '0', '0', '0', '11537', '0', '0', '0', 'Mythic Gordok Mage-Lord', NULL, NULL, '5746', '60', '60', '0', '45', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11444', '11441', '0', '0', '0', '0', '0', '', '1', '1.0', '4.42', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102535 WHERE (`entry` = 11444);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11444) AND (`map` = 429);
-- Mythic Warpwood Guardian
DELETE FROM `creature_template` WHERE entry = 9102536;
INSERT INTO `creature_template` VALUES (9102536, '0', '0', '0', '0', '0', '13173', '0', '0', '0', 'Mythic Warpwood Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11461', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '4.36', '1.5', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102536 WHERE (`entry` = 11461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11461) AND (`map` = 429);
-- Mythic Warpwood Stomper
DELETE FROM `creature_template` WHERE entry = 9102537;
INSERT INTO `creature_template` VALUES (9102537, '0', '0', '0', '0', '0', '6350', '0', '0', '0', 'Mythic Warpwood Stomper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11465', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '4.46', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102537 WHERE (`entry` = 11465);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11465) AND (`map` = 429);
-- Mythic Shendralar Spirit
DELETE FROM `creature_template` WHERE entry = 9102538;
INSERT INTO `creature_template` VALUES (9102538, '0', '0', '0', '0', '0', '14397', '14393', '14398', '14400', 'Mythic Shendralar Spirit', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '1354', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '1200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.34', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102538 WHERE (`entry` = 14364);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14364) AND (`map` = 429);
-- Mythic Wildspawn Hellcaller
DELETE FROM `creature_template` WHERE entry = 9102539;
INSERT INTO `creature_template` VALUES (9102539, '0', '0', '0', '0', '0', '11340', '0', '0', '0', 'Mythic Wildspawn Hellcaller', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11457', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.22', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102539 WHERE (`entry` = 11457);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11457) AND (`map` = 429);
-- Mythic Wildspawn Rogue
DELETE FROM `creature_template` WHERE entry = 9102540;
INSERT INTO `creature_template` VALUES (9102540, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Mythic Wildspawn Rogue', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11452', 
'0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.44', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102540 WHERE (`entry` = 11452);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11452) AND (`map` = 429);
-- Mythic Wildspawn Trickster
DELETE FROM `creature_template` WHERE entry = 9102541;
INSERT INTO `creature_template` VALUES (9102541, '0', '0', '0', '0', '0', '2020', '0', '0', '0', 'Mythic Wildspawn Trickster', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11453', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.88', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102541 WHERE (`entry` = 11453);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11453) AND (`map` = 429);
-- Mythic Fel Lash
DELETE FROM `creature_template` WHERE entry = 9102542;
INSERT INTO `creature_template` VALUES (9102542, '0', '0', '0', '0', '0', '13110', '0', '0', '0', 'Mythic Fel Lash', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13197', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '4.34', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102542 WHERE (`entry` = 13197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13197) AND (`map` = 429);
-- Mythic Warpwood Crusher
DELETE FROM `creature_template` WHERE entry = 9102543;
INSERT INTO `creature_template` VALUES (9102543, '0', '0', '0', '0', '0', '12929', '0', '0', '0', 'Mythic Warpwood Crusher', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13021', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '4.48', '1.5', '1.0', '1.0', '0', '0', '1', '608910931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102543 WHERE (`entry` = 13021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13021) AND (`map` = 429);
-- Mythic Wildspawn Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9102544;
INSERT INTO `creature_template` VALUES (9102544, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Mythic Wildspawn Shadowstalker', NULL, NULL, '0', '60', '60', '0', 
'90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11456', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102544 WHERE (`entry` = 11456);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11456) AND (`map` = 429);
-- Mythic Alzzins Minion
DELETE FROM `creature_template` WHERE entry = 9102545;
INSERT INTO `creature_template` VALUES (9102545, '0', '0', '0', '0', '0', '911', '0', '0', '0', 'Mythic Alzzins Minion', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.41', '1.0', '1.0', '0.5', '0', '188', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102545 WHERE (`entry` = 11460);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11460) AND (`map` = 429);
-- Mythic Wildspawn Imp
DELETE FROM `creature_template` WHERE entry = 9102546;
INSERT INTO `creature_template` VALUES (9102546, '0', '0', '0', '0', '0', '911', '0', '0', '0', 'Mythic Wildspawn Imp', NULL, NULL, '0', '60', '60', '0', '16', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '13276', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.8', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102546 WHERE (`entry` = 13276);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13276) AND (`map` = 429);
-- Mythic Warpwood Tangler
DELETE FROM `creature_template` WHERE entry = 9102547;
INSERT INTO `creature_template` VALUES (9102547, '0', '0', '0', '0', '0', '9592', '0', '0', '0', 'Mythic Warpwood Tangler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11464', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '3.97', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102547 WHERE (`entry` = 11464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11464) AND (`map` = 429);
-- Mythic Wildspawn Betrayer
DELETE FROM `creature_template` WHERE entry = 9102548;
INSERT INTO `creature_template` VALUES (9102548, '0', '0', '0', '0', '0', '10032', '0', '0', '0', 'Mythic Wildspawn Betrayer', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11454', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102548 WHERE (`entry` = 11454);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11454) AND (`map` = 429);
-- Mythic Wildspawn Felsworn
DELETE FROM `creature_template` WHERE entry = 9102549;
INSERT INTO `creature_template` VALUES (9102549, '0', '0', '0', '0', '0', '7649', '0', '0', '0', 'Mythic Wildspawn Felsworn', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11455', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102549 WHERE (`entry` = 11455);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11455) AND (`map` = 429);
-- Mythic Wildspawn Satyr
DELETE FROM `creature_template` WHERE entry = 9102550;
INSERT INTO `creature_template` VALUES (9102550, '0', '0', '0', '0', '0', '11345', '0', '0', '0', 'Mythic Wildspawn Satyr', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '11451', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.08', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102550 WHERE (`entry` = 11451);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11451) AND (`map` = 429);
-- Mythic Highborne Summoner
DELETE FROM `creature_template` WHERE entry = 9102551;
INSERT INTO `creature_template` VALUES (9102551, '0', '0', '0', '0', '0', '11207', '11208', '11209', '11210', 'Mythic Highborne Summoner', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.47', '3.0', '1.0', '0.5', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102551 WHERE (`entry` = 11466);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11466) AND (`map` = 429);
-- Mythic Phase Lasher
DELETE FROM `creature_template` WHERE entry = 9102552;
INSERT INTO `creature_template` VALUES (9102552, '0', '0', '0', '0', '0', '13109', '0', '0', '0', 'Mythic Phase Lasher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13196', 
'0', '100044', '0', '0', '0', '0', '', '1', '1.0', '4.23', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102552 WHERE (`entry` = 13196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13196) AND (`map` = 429);
-- Mythic Warpwood Treant
DELETE FROM `creature_template` WHERE entry = 9102553;
INSERT INTO `creature_template` VALUES (9102553, '0', '0', '0', '0', '0', '10621', '0', '0', '0', 'Mythic Warpwood Treant', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '11462', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.5', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102553 WHERE (`entry` = 11462);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11462) AND (`map` = 429);
-- Mythic Whip Lasher
DELETE FROM `creature_template` WHERE entry = 9102554;
INSERT INTO `creature_template` VALUES (9102554, '0', '0', '0', '0', '0', '12962', '12963', '0', '0', 'Mythic Whip Lasher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '13022', '0', '100044', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102554 WHERE (`entry` = 13022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13022) AND (`map` = 429);
-- Mythic Shendralar Provisioner
DELETE FROM `creature_template` WHERE entry = 9102555;
INSERT INTO `creature_template` VALUES (9102555, '0', '0', '0', '0', '0', '14412', '0', '0', '0', 'Mythic Shendralar Provisioner', 'House of Shen''dralar', NULL, '0', '60', '60', '0', '1355', '4226', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102555 WHERE (`entry` = 14371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14371) AND (`map` = 429);
-- Mythic Isalien
DELETE FROM `creature_template` WHERE entry = 9102556;
INSERT INTO `creature_template` VALUES (9102556, '0', '0', '0', '0', '0', '16000', '0', '0', '0', 'Mythic Isalien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '1150', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102556 WHERE (`entry` = 16097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16097) AND (`map` = 429);
-- Mythic Lord Helnurath
DELETE FROM `creature_template` WHERE entry = 9102557;
INSERT INTO `creature_template` VALUES (9102557, '0', '0', '0', '0', '0', '14556', '0', '0', '0', 'Mythic Lord Helnurath', NULL, NULL, '0', '63', '63', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2400', '1246', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.87', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102557 WHERE (`entry` = 14506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14506) AND (`map` = 429);
-- Mythic King Gordok
DELETE FROM `creature_template` WHERE entry = 9102558;
INSERT INTO `creature_template` VALUES (9102558, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Mythic King Gordok', NULL, NULL, '0', '63', '63', '0', '45', '0', 
'1.0', '1.71429', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.93', '1.0', '1.0', '2.0', '0', '164', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102558 WHERE (`entry` = 11501);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11501) AND (`map` = 429);
-- Mythic Captain Kromcrush
DELETE FROM `creature_template` WHERE entry = 9102559;
INSERT INTO `creature_template` VALUES (9102559, '0', '0', '0', '0', '0', '11564', '0', '0', '0', 'Mythic Captain Kromcrush', NULL, NULL, '5739', '63', '63', '0', '1374', '3', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.37', '1.0', '1.0', '2.0', '0', '127', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102559 WHERE (`entry` = 14325);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14325) AND (`map` = 429);
-- Mythic Immolthar
DELETE FROM `creature_template` WHERE entry = 9102560;
INSERT INTO `creature_template` VALUES (9102560, '0', '0', '0', '0', '0', '14173', '0', '0', '0', 'Mythic Immolthar', NULL, NULL, '0', '63', '63', '0', '754', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '11496', '0', '0', '0', '0', '', '1', '1.0', '8.41', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102560 WHERE (`entry` = 11496);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11496) AND (`map` = 429);
-- Mythic Prince Tortheldrin
DELETE FROM `creature_template` WHERE entry = 9102561;
INSERT INTO `creature_template` VALUES (9102561, '0', '0', '0', '0', '0', '11256', '0', '0', '0', 'Mythic Prince Tortheldrin', 'Ruler of the Shen''dralar', NULL, '5736', '63', '63', '0', '1355', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.9', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '2', '', '12340');      
UPDATE `creature_template` SET `difficulty_entry_2` = 9102561 WHERE (`entry` = 11486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11486) AND (`map` = 429);
-- Mythic ChoRush the Observer
DELETE FROM `creature_template` WHERE entry = 9102562;
INSERT INTO `creature_template` VALUES (9102562, '0', '0', '0', '0', '0', '11537', '0', '0', '0', 'Mythic ChoRush the Observer', NULL, NULL, '5742', '63', '63', '0', '45', '1', '2.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', 
'9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.0', '4.0', '1.1', '2.0', '0', '151', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102562 WHERE (`entry` = 14324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14324) AND (`map` = 429);
-- Mythic Illyanna Ravenoak
DELETE FROM `creature_template` WHERE entry = 9102563;
INSERT INTO `creature_template` VALUES (9102563, '0', '0', '0', '0', '0', '11270', '0', '0', '0', 'Mythic Illyanna Ravenoak', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.1', '3.0', '1.1', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102563 WHERE (`entry` = 11488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11488) AND (`map` = 429);
-- Mythic Magister Kalendris
DELETE FROM `creature_template` WHERE entry = 9102564;
INSERT INTO `creature_template` VALUES (9102564, '0', '0', '0', '0', '0', '14384', '0', '0', '0', 'Mythic Magister Kalendris', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.86', '4.0', '1.0', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102564 WHERE (`entry` = 11487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11487) AND (`map` = 429);
-- Mythic Tendris Warpwood
DELETE FROM `creature_template` WHERE entry = 9102565;
INSERT INTO `creature_template` VALUES (9102565, '0', '0', '0', '0', '0', '14383', '0', '0', '0', 'Mythic Tendris Warpwood', NULL, NULL, '0', '63', '63', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '256', '9100500', '0', '100045', '0', '0', '0', '0', '', '1', '1.0', '8.48', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102565 WHERE (`entry` = 11489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11489) AND (`map` = 429);
-- Mythic Tsuzee
DELETE FROM `creature_template` WHERE entry = 9102566;
INSERT INTO `creature_template` VALUES (9102566, '0', '0', '0', '0', '0', '11250', '0', '0', '0', 'Mythic Tsuzee', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '1600', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.27', '1.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102566 WHERE (`entry` = 11467);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11467) AND (`map` = 429);
-- Mythic Guard Fengus
DELETE FROM `creature_template` WHERE entry = 9102567;
INSERT INTO `creature_template` VALUES (9102567, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Mythic Guard Fengus', NULL, NULL, '5734', '63', '63', '0', '45', '1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.38', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102567 WHERE (`entry` = 14321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14321) AND (`map` = 429);
-- Mythic Guard Moldar
DELETE FROM `creature_template` WHERE entry = 9102568;
INSERT INTO `creature_template` VALUES (9102568, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Mythic Guard Moldar', NULL, NULL, '5735', '63', '63', '0', '45', '1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.97', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102568 WHERE (`entry` = 14326);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14326) AND (`map` = 429);
-- Mythic Guard Slipkik
DELETE FROM `creature_template` WHERE entry = 9102569;
INSERT INTO `creature_template` VALUES (9102569, '0', '0', '0', '0', '0', '11561', '0', '0', '0', 'Mythic Guard Slipkik', NULL, NULL, '5733', '63', '63', '0', '45', 
'1', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '7.89', '1.0', '1.0', '2.0', '0', '53', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102569 WHERE (`entry` = 14323);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14323) AND (`map` = 429);
-- Mythic Stomper Kreeg
DELETE FROM `creature_template` WHERE entry = 9102570;
INSERT INTO `creature_template` VALUES (9102570, '0', '0', '0', '0', '0', '11545', '0', '0', '0', 'Mythic Stomper Kreeg', 'The Drunk', NULL, '5721', '63', '63', '0', '45', '131', '2.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.92', '2.0', '1.0', '2.0', '0', '53', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102570 WHERE (`entry` = 14322);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14322) AND (`map` = 429);
-- Mythic Alzzin the Wildshaper
DELETE FROM `creature_template` WHERE entry = 9102571;
INSERT INTO `creature_template` VALUES (9102571, '0', '0', '0', '0', '0', '14416', '0', '0', '0', 'Mythic Alzzin the Wildshaper', NULL, NULL, '0', '63', '63', '0', '90', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.95', '5.0', '1.0', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102571 WHERE (`entry` = 11492);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11492) AND (`map` = 429);
-- Mythic Hydrospawn
DELETE FROM `creature_template` WHERE entry = 9102572;
INSERT INTO `creature_template` VALUES (9102572, '0', '0', '0', '0', '0', '5489', '0', '0', '0', 'Mythic Hydrospawn', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '4', '7.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.16', '3.0', '1.0', '2.0', '0', '0', '1', '613122011', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102572 WHERE (`entry` = 13280);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13280) AND (`map` = 429);
-- Mythic Lethtendris
DELETE FROM `creature_template` WHERE entry = 9102573;
INSERT INTO `creature_template` VALUES (9102573, '0', '0', '0', '0', '0', '14378', '0', '0', '0', 'Mythic Lethtendris', NULL, NULL, '0', '63', '63', '0', '16', '0', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.87', '4.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102573 WHERE (`entry` = 14327);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14327) AND (`map` = 429);
-- Mythic Pusillin
DELETE FROM `creature_template` WHERE entry = 9102574;
INSERT INTO `creature_template` VALUES (9102574, '0', '0', '0', '0', '0', '7552', '0', '0', '0', 'Mythic Pusillin', NULL, NULL, '5710', '63', '63', '0', '35', '1', '1.0', '2.57143', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.27', '6.0', '1.0', '1.0', '0', '210', '1', '613105627', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102574 WHERE (`entry` = 14354);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14354) AND (`map` = 429);
-- Mythic Zevrim Thornhoof
DELETE FROM `creature_template` WHERE entry = 9102575;
INSERT INTO `creature_template` VALUES (9102575, '0', '0', '0', '0', '0', '11335', '0', '0', '0', 'Mythic Zevrim Thornhoof', NULL, NULL, '0', '63', '63', '0', '90', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.04', '1.0', '1.0', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102575 WHERE (`entry` = 11490);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11490) AND (`map` = 429);
-- Mythic Pimgib
DELETE FROM `creature_template` WHERE entry = 9102576;
INSERT INTO `creature_template` VALUES (9102576, '0', '0', '0', '0', '0', '14380', '0', '0', '0', 'Mythic Pimgib', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.48', '3.0', '1.0', '1.0', '0', '0', '1', '75700827', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102576 WHERE (`entry` = 14349);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14349) AND (`map` = 429);
-- Mythic Jeevee
DELETE FROM `creature_template` WHERE entry = 9102577;
INSERT INTO `creature_template` VALUES (9102577, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Mythic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.41', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102577 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500) AND (`map` = 429);
-- Mythic Eye of Immolthar
DELETE FROM `creature_template` WHERE entry = 9102578;
INSERT INTO `creature_template` VALUES (9102578, '0', '0', '0', '0', '0', '14430', '0', '0', '0', 'Mythic Eye of Immolthar', NULL, NULL, '0', '60', '60', '0', '754', '0', '1.0', '2.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '10000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', 
'0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.07', '1.0', '1.0', '0.5', '0', '207', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102578 WHERE (`entry` = 14396);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14396) AND (`map` = 429);
-- Mythic Ancient Equine Spirit
DELETE FROM `creature_template` WHERE entry = 9102579;
INSERT INTO `creature_template` VALUES (9102579, '0', '0', '0', '0', '0', '14585', '0', '0', '0', 'Mythic Ancient Equine Spirit', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '0', '1.0', '2.9', '1.0', '1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102579 WHERE (`entry` = 14566);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14566) AND (`map` = 429);
-- Mythic Cadaverous Worm
DELETE FROM `creature_template` WHERE entry = 9102580;
INSERT INTO `creature_template` VALUES (9102580, '0', '0', '0', '0', '0', '10996', '0', '0', '0', 'Mythic Cadaverous Worm', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '1000', '1540', '1.0', '1.0', '1', '0', '2048', '0', '42', '0', '0', '0', '0', '10', '65537', '14370', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.84', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102580 WHERE (`entry` = 14370);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14370) AND (`map` = 429);
-- Mythic Dreadsteed Spirit
DELETE FROM `creature_template` WHERE entry = 9102581;
INSERT INTO `creature_template` VALUES (9102581, '0', '0', '0', '0', '0', '14553', '0', '0', '0', 'Mythic Dreadsteed Spirit', NULL, NULL, '0', '60', '60', '0', '7', 
'2', '1.0', '1.28968', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.07', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.09', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102581 WHERE (`entry` = 14504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14504) AND (`map` = 429);
-- Mythic Falrin Treeshaper
DELETE FROM `creature_template` WHERE entry = 9102582;
INSERT INTO `creature_template` VALUES (9102582, '0', '0', '0', '0', '0', '15996', '0', '0', '0', 'Mythic Falrin Treeshaper', 'House of Shen''dralar', NULL, '7084', 
'60', '60', '0', '1355', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.34', '1.0', '0.9', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102582 WHERE (`entry` = 16032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16032) AND (`map` = 429);
-- Mythic Massive Geyser
DELETE FROM `creature_template` WHERE entry = 9102583;
INSERT INTO `creature_template` VALUES (9102583, '0', '0', '0', '0', '0', '13069', '0', '0', '0', 'Mythic Massive Geyser', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '1024', '0', 
'0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.37', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102583 WHERE (`entry` = 14122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14122) AND (`map` = 429);
-- Mythic Spectral Stalker
DELETE FROM `creature_template` WHERE entry = 9102584;
INSERT INTO `creature_template` VALUES (9102584, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Mythic Spectral Stalker', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '1200', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', 
'0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.9', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102584 WHERE (`entry` = 16093);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16093) AND (`map` = 429);
-- Mythic Wandering Eye of Kilrogg
DELETE FROM `creature_template` WHERE entry = 9102585;
INSERT INTO `creature_template` VALUES (9102585, '0', '0', '0', '0', '0', '14430', '0', '0', '0', 'Mythic Wandering Eye of Kilrogg', NULL, NULL, '0', '60', '60', '0', '45', '0', '4.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '131072', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.34', '1.0', '0.95', '0.25', '0', '156', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102585 WHERE (`entry` = 14386);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14386) AND (`map` = 429);
-- Mythic Arcane Feedback
DELETE FROM `creature_template` WHERE entry = 9102586;
INSERT INTO `creature_template` VALUES (9102586, '0', '0', '0', '0', '0', '5490', '0', '0', '0', 'Mythic Arcane Feedback', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '6', '2.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '14400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.1', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102586 WHERE (`entry` = 14400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14400) AND (`map` = 429);
-- Mythic Doomguard Minion
DELETE FROM `creature_template` WHERE entry = 9102587;
INSERT INTO `creature_template` VALUES (9102587, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Mythic Doomguard Minion', NULL, NULL, '0', '60', '60', '0', '954', 
'0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.04', '2000', '1562', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14385', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.11', '0.77', '1.35', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102587 WHERE (`entry` = 14385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14385) AND (`map` = 429);
-- Mythic Mana Burst
DELETE FROM `creature_template` WHERE entry = 9102588;
INSERT INTO `creature_template` VALUES (9102588, '0', '0', '0', '0', '0', '14273', '0', '0', '0', 'Mythic Mana Burst', NULL, NULL, '0', '60', '60', '0', '834', '0', 
'1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '6', '1.93', '2000', '1562', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.03', '2.0', '1.1', '1.0', '0', '0', '1', '16384', '64', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102588 WHERE (`entry` = 14397);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14397) AND (`map` = 429);
-- Mythic Xorothian Imp
DELETE FROM `creature_template` WHERE entry = 9102589;
INSERT INTO `creature_template` VALUES (9102589, '0', '0', '0', '0', '0', '14380', '0', '0', '0', 'Mythic Xorothian Imp', NULL, NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '1200', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '3.2', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102589 WHERE (`entry` = 14482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14482) AND (`map` = 429);
-- Mythic Carrion Swarmer
DELETE FROM `creature_template` WHERE entry = 9102590;
INSERT INTO `creature_template` VALUES (9102590, '0', '0', '0', '0', '0', '13096', '13111', '13097', '0', 'Mythic Carrion Swarmer', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.04', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', 
'13160', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '2.99', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102590 WHERE (`entry` = 13160);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 13160) AND (`map` = 429);
-- Mythic Skeletal Highborne
DELETE FROM `creature_template` WHERE entry = 9102591;
INSERT INTO `creature_template` VALUES (9102591, '0', '0', '0', '0', '0', '11078', '0', '0', '0', 'Mythic Skeletal Highborne', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11476', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.85', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102591 WHERE (`entry` = 11476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11476) AND (`map` = 429);
-- Mythic Hydroling
DELETE FROM `creature_template` WHERE entry = 9102592;
INSERT INTO `creature_template` VALUES (9102592, '0', '0', '0', '0', '0', '5561', '0', '0', '0', 'Mythic Hydroling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.55556', '1.85714', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.45', '1.0', '1.0', '0.5', '0', '176', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102592 WHERE (`entry` = 14350);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14350) AND (`map` = 429);
-- Mythic Knot Thimblejack
DELETE FROM `creature_template` WHERE entry = 9102593;
INSERT INTO `creature_template` VALUES (9102593, '0', '0', '0', '0', '0', '14381', '0', '0', '0', 'Mythic Knot Thimblejack', NULL, NULL, '5667', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.86', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102593 WHERE (`entry` = 14338);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14338) AND (`map` = 429);