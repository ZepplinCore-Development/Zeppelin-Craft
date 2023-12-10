-- Heroic Argent Guard Thaelrid
DELETE FROM `creature_template` WHERE entry = 9100500;
INSERT INTO `creature_template` VALUES (9100500, '0', '0', '0', '0', '0', '4946', '0', '0', '0', 'Heroic Argent Guard Thaelrid', 'The Argent Dawn', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4787', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100500 WHERE (`entry` = 4787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4787);
-- Heroic Aqua Guardian
DELETE FROM `creature_template` WHERE entry = 9100501;
INSERT INTO `creature_template` VALUES (9100501, '0', '0', '0', '0', '0', '525', '0', '0', '0', 'Heroic Aqua Guardian', '', NULL, '0', '60', '60', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.05', '2000', '1936', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '9', '45', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100501 WHERE (`entry` = 6047);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6047);
-- Heroic Skittering Crustacean
DELETE FROM `creature_template` WHERE entry = 9100502;
INSERT INTO `creature_template` VALUES (9100502, '0', '0', '0', '0', '0', '981', '0', '0', '0', 'Heroic Skittering Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.85', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4821', '0', '0', '5842', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100502 WHERE (`entry` = 4821);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4821);
-- Heroic Murkshallow Snapclaw
DELETE FROM `creature_template` WHERE entry = 9100503;
INSERT INTO `creature_template` VALUES (9100503, '0', '0', '0', '0', '0', '2835', '0', '0', '0', 'Heroic Murkshallow Snapclaw', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4815', '4815', '0', '0', '0', '72', '262', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100503 WHERE (`entry` = 4815);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4815);
-- Heroic Blindlight Murloc
DELETE FROM `creature_template` WHERE entry = 9100504;
INSERT INTO `creature_template` VALUES (9100504, '0', '0', '0', '0', '0', '4920', '0', '0', '0', 'Heroic Blindlight Murloc', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4818', '4818', '0', '0', '0', '54', '262', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100504 WHERE (`entry` = 4818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4818);
-- Heroic Blackfathom Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100505;
INSERT INTO `creature_template` VALUES (9100505, '0', '0', '0', '0', '0', '4762', '0', '0', '0', 'Heroic Blackfathom Myrmidon', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4807', '4807', '0', '0', '0', '72', '259', '', '1', '1.0', '4.5', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100505 WHERE (`entry` = 4807);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4807);
-- Heroic Twilight Loreseeker
DELETE FROM `creature_template` WHERE entry = 9100506;
INSERT INTO `creature_template` VALUES (9100506, '0', '0', '0', '0', '0', '2894', '2895', '2896', '2897', 'Heroic Twilight Loreseeker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '1613', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4812', '4812', '0', '0', '0', '114', '298', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100506 WHERE (`entry` = 4812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4812);
-- Heroic Twilight Acolyte
DELETE FROM `creature_template` WHERE entry = 9100507;
INSERT INTO `creature_template` VALUES (9100507, '0', '0', '0', '0', '0', '2882', '2883', '2884', '2885', 'Heroic Twilight Acolyte', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.2', '2000', '1604', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4809', '4809', '0', '0', '0', '119', '306', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100507 WHERE (`entry` = 4809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4809);
-- Heroic Snapping Crustacean
DELETE FROM `creature_template` WHERE entry = 9100508;
INSERT INTO `creature_template` VALUES (9100508, '0', '0', '0', '0', '0', '1001', '0', '0', '0', 'Heroic Snapping Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4822', '0', '0', '5843', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100508 WHERE (`entry` = 4822);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4822);
-- Heroic Fallenroot Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9100509;
INSERT INTO `creature_template` VALUES (9100509, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Heroic Fallenroot Shadowstalker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.5', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4798', '4798', '0', '0', '0', '48', '271', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100509 WHERE (`entry` = 4798);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4798);
-- Heroic Fallenroot Hellcaller
DELETE FROM `creature_template` WHERE entry = 9100510;
INSERT INTO `creature_template` VALUES (9100510, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Heroic Fallenroot Hellcaller', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4799', '4799', '0', '0', '0', '65', '225', '', '1', '1.0', '3.0', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100510 WHERE (`entry` = 4799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4799);
-- Heroic Deep Pool Threshfin
DELETE FROM `creature_template` WHERE entry = 9100511;
INSERT INTO `creature_template` VALUES (9100511, '0', '0', '0', '0', '0', '2836', '0', '0', '0', 'Heroic Deep Pool Threshfin', '', NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4827', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100511 WHERE (`entry` = 4827);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4827);
-- Heroic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100512;
INSERT INTO `creature_template` VALUES (9100512, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Heroic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '57', '79', '', '1', '1.0', '0.8', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100512 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996);
-- Heroic Morridune
DELETE FROM `creature_template` WHERE entry = 9100513;
INSERT INTO `creature_template` VALUES (9100513, '0', '0', '0', '0', '0', '5465', '0', '0', '0', 'Heroic Morridune', NULL, NULL, '321', '60', '60', '0', '80', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '2000', '1914', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '11', '53', '', '1', '1.0', '1.05', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100513 WHERE (`entry` = 6729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6729);
-- Heroic Akumai Servant
DELETE FROM `creature_template` WHERE entry = 9100514;
INSERT INTO `creature_template` VALUES (9100514, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Heroic Akumai Servant', '', NULL, '0', '60', '60', '0', '128', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '2.25', '2000', '1576', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '4978', '0', '0', '0', '0', '47', '237', '', '1', '1.0', '3.0', '2.0', '0.9', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100514 WHERE (`entry` = 4978);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4978);
-- Heroic Akumai Snapjaw
DELETE FROM `creature_template` WHERE entry = 9100515;
INSERT INTO `creature_template` VALUES (9100515, '0', '0', '0', '0', '0', '5026', '0', '0', '0', 'Heroic Akumai Snapjaw', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4825', '0', '100012', '5930', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100515 WHERE (`entry` = 4825);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4825);
-- Heroic Barbed Crustacean
DELETE FROM `creature_template` WHERE entry = 9100516;
INSERT INTO `creature_template` VALUES (9100516, '0', '0', '0', '0', '0', '9565', '0', '0', '0', 'Heroic Barbed Crustacean', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.85', '2000', '1604', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4823', '0', '0', '5844', '0', '0', '0', '', '1', '1.0', '2.3', '1.0', '1.35', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100516 WHERE (`entry` = 4823);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4823);
-- Heroic Blindlight Muckdweller
DELETE FROM `creature_template` WHERE entry = 9100517;
INSERT INTO `creature_template` VALUES (9100517, '0', '0', '0', '0', '0', '11293', '0', '0', '0', 'Heroic Blindlight Muckdweller', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4819', '4819', '0', '0', '0', '68', '184', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100517 WHERE (`entry` = 4819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4819);
-- Heroic Blindlight Oracle
DELETE FROM `creature_template` WHERE entry = 9100518;
INSERT INTO `creature_template` VALUES (9100518, '0', '0', '0', '0', '0', '3617', '0', '0', '0', 'Heroic Blindlight Oracle', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4820', '4820', '0', '0', '0', '76', '290', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100518 WHERE (`entry` = 4820);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4820);
-- Heroic Twilight Aquamancer
DELETE FROM `creature_template` WHERE entry = 9100519;
INSERT INTO `creature_template` VALUES (9100519, '0', '0', '0', '0', '0', '2886', '2887', '2888', '2889', 'Heroic Twilight Aquamancer', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4811', '4811', '0', '0', '0', '120', '311', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100519 WHERE (`entry` = 4811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4811);
-- Heroic Twilight Elementalist
DELETE FROM `creature_template` WHERE entry = 9100520;
INSERT INTO `creature_template` VALUES (9100520, '0', '0', '0', '0', '0', '2890', '2891', '2892', '2893', 'Heroic Twilight Elementalist', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '1567', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4814', '4814', '0', '0', '0', '130', '270', '', '1', '1.0', '3.0', '1.5', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100520 WHERE (`entry` = 4814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4814);
-- Heroic Twilight Reaver
DELETE FROM `creature_template` WHERE entry = 9100521;
INSERT INTO `creature_template` VALUES (9100521, '0', '0', '0', '0', '0', '2898', '2899', '2900', '2901', 'Heroic Twilight Reaver', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '1567', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4810', '4810', '0', '0', '0', '137', '184', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100521 WHERE (`entry` = 4810);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4810);
-- Heroic Twilight Shadowmage
DELETE FROM `creature_template` WHERE entry = 9100522;
INSERT INTO `creature_template` VALUES (9100522, '0', '0', '0', '0', '0', '2876', '2877', '0', '0', 'Heroic Twilight Shadowmage', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '1567', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4813', '4813', '0', '0', '0', '103', '385', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100522 WHERE (`entry` = 4813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4813);
-- Heroic Murkshallow Softshell
DELETE FROM `creature_template` WHERE entry = 9100523;
INSERT INTO `creature_template` VALUES (9100523, '0', '0', '0', '0', '0', '1819', '0', '0', '0', 'Heroic Murkshallow Softshell', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '2000', '1936', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4977', '0', '0', '0', '0', '9', '47', '', '0', '1.0', '0.3', '1.0', '1.4', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100523 WHERE (`entry` = 4977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4977);
-- Heroic Akumai Fisher
DELETE FROM `creature_template` WHERE entry = 9100524;
INSERT INTO `creature_template` VALUES (9100524, '0', '0', '0', '0', '0', '1244', '0', '0', '0', 'Heroic Akumai Fisher', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4824', '0', '100007', '5929', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100524 WHERE (`entry` = 4824);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4824);
-- Heroic Blackfathom Sea Witch
DELETE FROM `creature_template` WHERE entry = 9100525;
INSERT INTO `creature_template` VALUES (9100525, '0', '0', '0', '0', '0', '4982', '0', '0', '0', 'Heroic Blackfathom Sea Witch', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4805', '4805', '0', '0', '0', '53', '285', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100525 WHERE (`entry` = 4805);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4805);
-- Heroic Akumai
DELETE FROM `creature_template` WHERE entry = 9100526;
INSERT INTO `creature_template` VALUES (9100526, '0', '0', '0', '0', '0', '2837', '0', '0', '0', 'Heroic Akumai', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2000', '1558', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100400', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '6.43', '1.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100526 WHERE (`entry` = 4829);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4829);
-- Heroic Baron Aquanis
DELETE FROM `creature_template` WHERE entry = 9100527;
INSERT INTO `creature_template` VALUES (9100527, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Heroic Baron Aquanis', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '4.94', '2000', '1558', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100400', '0', '0', '0', '0', '32', '160', '', '1', '1.0', '6.19', '1.0', '0.9', '2.0', '0', '0', '1', '8405008', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100527 WHERE (`entry` = 12876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12876);
-- Heroic Gelihast
DELETE FROM `creature_template` WHERE entry = 9100528;
INSERT INTO `creature_template` VALUES (9100528, '0', '0', '0', '0', '0', '1773', '0', '0', '0', 'Heroic Gelihast', '', NULL, '0', '63', '63', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6243', '0', '0', '0', '231', '308', '', '1', '1.0', '5.86', '1.0', '1.0', 
'2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100528 WHERE (`entry` = 6243);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6243);
-- Heroic Lorgus Jett
DELETE FROM `creature_template` WHERE entry = 9100529;
INSERT INTO `creature_template` VALUES (9100529, '0', '0', '0', '0', '0', '12822', '0', '0', '0', 'Heroic Lorgus Jett', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '12902', '0', '0', '0', '122', '164', '', '1', '1.0', '6.06', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100529 WHERE (`entry` = 12902);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12902);
-- Heroic Old Serrakis
DELETE FROM `creature_template` WHERE entry = 9100530;
INSERT INTO `creature_template` VALUES (9100530, '0', '0', '0', '0', '0', '1816', '0', '0', '0', 'Heroic Old Serrakis', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '1567', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '4830', '0', '0', '0', '0', '', '1', '1.0', '6.46', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100530 WHERE (`entry` = 4830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4830);
-- Heroic Twilight Lord Kelris
DELETE FROM `creature_template` WHERE entry = 9100531;
INSERT INTO `creature_template` VALUES (9100531, '0', '0', '0', '0', '0', '4939', '0', '0', '0', 'Heroic Twilight Lord Kelris', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4832', '0', '0', '0', '281', '372', '', '1', '1.0', '6.17', '2.5', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100531 WHERE (`entry` = 4832);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4832);
-- Heroic Ghamoo-ra
DELETE FROM `creature_template` WHERE entry = 9100532;
INSERT INTO `creature_template` VALUES (9100532, '0', '0', '0', '0', '0', '5027', '0', '0', '0', 'Heroic Ghamoo-ra', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '4.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '9100400', '0', '100007', '5932', '0', '0', '0', '', '1', '1.0', '5.88', '1.0', '932.45', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100532 WHERE (`entry` = 4887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4887);
-- Heroic Lady Sarevess
DELETE FROM `creature_template` WHERE entry = 9100533;
INSERT INTO `creature_template` VALUES (9100533, '0', '0', '0', '0', '0', '4979', '0', '0', '0', 'Heroic Lady Sarevess', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4831', '0', '0', '0', '143', '328', '', '1', '1.0', '6.04', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100533 WHERE (`entry` = 4831);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4831);
-- Mythic Argent Guard Thaelrid
DELETE FROM `creature_template` WHERE entry = 9100534;
INSERT INTO `creature_template` VALUES (9100534, '0', '0', '0', '0', '0', '4946', '0', '0', '0', 'Mythic Argent Guard Thaelrid', 'The Argent Dawn', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4787', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100534 WHERE (`entry` = 4787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4787);
-- Mythic Aqua Guardian
DELETE FROM `creature_template` WHERE entry = 9100535;
INSERT INTO `creature_template` VALUES (9100535, '0', '0', '0', '0', '0', '525', '0', '0', '0', 'Mythic Aqua Guardian', '', NULL, '0', '60', '60', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.98', '2000', '1936', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '9', '45', '', '1', '1.0', '4.05', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100535 WHERE (`entry` = 6047);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6047);
-- Mythic Skittering Crustacean
DELETE FROM `creature_template` WHERE entry = 9100536;
INSERT INTO `creature_template` VALUES (9100536, '0', '0', '0', '0', '0', '981', '0', '0', '0', 'Mythic Skittering Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4821', '0', '0', '5842', '0', '0', '0', '', '1', '1.0', '3.89', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100536 WHERE (`entry` = 4821);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4821);
-- Mythic Murkshallow Snapclaw
DELETE FROM `creature_template` WHERE entry = 9100537;
INSERT INTO `creature_template` VALUES (9100537, '0', '0', '0', '0', '0', '2835', '0', '0', '0', 'Mythic Murkshallow Snapclaw', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4815', '4815', '0', '0', '0', '72', '262', '', '1', '1.0', '4.08', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100537 WHERE (`entry` = 4815);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4815);
-- Mythic Blindlight Murloc
DELETE FROM `creature_template` WHERE entry = 9100538;
INSERT INTO `creature_template` VALUES (9100538, '0', '0', '0', '0', '0', '4920', '0', '0', '0', 'Mythic Blindlight Murloc', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4818', '4818', '0', '0', '0', '54', '262', '', '1', '1.0', '3.91', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100538 WHERE (`entry` = 4818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4818);
-- Mythic Blackfathom Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100539;
INSERT INTO `creature_template` VALUES (9100539, '0', '0', '0', '0', '0', '4762', '0', '0', '0', 'Mythic Blackfathom Myrmidon', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4807', '4807', '0', '0', '0', '72', '259', '', '1', '1.0', '4.05', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100539 WHERE (`entry` = 4807);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4807);
-- Mythic Twilight Loreseeker
DELETE FROM `creature_template` WHERE entry = 9100540;
INSERT INTO `creature_template` VALUES (9100540, '0', '0', '0', '0', '0', '2894', '2895', '2896', '2897', 'Mythic Twilight Loreseeker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1613', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4812', '4812', '0', '0', '0', '114', '298', '', '1', '1.0', '4.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100540 WHERE (`entry` = 4812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4812);
-- Mythic Twilight Acolyte
DELETE FROM `creature_template` WHERE entry = 9100541;
INSERT INTO `creature_template` VALUES (9100541, '0', '0', '0', '0', '0', '2882', '2883', '2884', '2885', 'Mythic Twilight Acolyte', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1604', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4809', '4809', '0', '0', '0', '119', '306', '', '1', '1.0', '4.48', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100541 WHERE (`entry` = 4809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4809);
-- Mythic Snapping Crustacean
DELETE FROM `creature_template` WHERE entry = 9100542;
INSERT INTO `creature_template` VALUES (9100542, '0', '0', '0', '0', '0', '1001', '0', '0', '0', 'Mythic Snapping Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4822', '0', '0', '5843', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100542 WHERE (`entry` = 4822);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4822);
-- Mythic Fallenroot Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9100543;
INSERT INTO `creature_template` VALUES (9100543, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Mythic Fallenroot Shadowstalker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4798', '4798', '0', '0', '0', '48', '271', '', '1', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100543 WHERE (`entry` = 4798);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4798);
-- Mythic Fallenroot Hellcaller
DELETE FROM `creature_template` WHERE entry = 9100544;
INSERT INTO `creature_template` VALUES (9100544, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Mythic Fallenroot Hellcaller', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4799', '4799', '0', '0', '0', '65', '225', '', '1', '1.0', '3.95', '1.5', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100544 WHERE (`entry` = 4799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4799);
-- Mythic Deep Pool Threshfin
DELETE FROM `creature_template` WHERE entry = 9100545;
INSERT INTO `creature_template` VALUES (9100545, '0', '0', '0', '0', '0', '2836', '0', '0', '0', 'Mythic Deep Pool Threshfin', '', NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4827', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100545 WHERE (`entry` = 4827);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4827);
-- Mythic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100546;
INSERT INTO `creature_template` VALUES (9100546, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Mythic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '57', '79', '', '1', '1.0', '4.07', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100546 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996);
-- Mythic Morridune
DELETE FROM `creature_template` WHERE entry = 9100547;
INSERT INTO `creature_template` VALUES (9100547, '0', '0', '0', '0', '0', '5465', '0', '0', '0', 'Mythic Morridune', NULL, NULL, '321', '60', '60', '0', '80', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '1914', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '11', '53', '', '1', '1.0', '4.43', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100547 WHERE (`entry` = 6729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6729);
-- Mythic Akumai Servant
DELETE FROM `creature_template` WHERE entry = 9100548;
INSERT INTO `creature_template` VALUES (9100548, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Mythic Akumai Servant', '', NULL, '0', '60', '60', '0', '128', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '3.09', '2000', '1576', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '4978', '0', '0', '0', '0', '47', '237', '', '1', '1.0', '4.44', '2.0', '0.9', 
'1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100548 WHERE (`entry` = 4978);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4978);
-- Mythic Akumai Snapjaw
DELETE FROM `creature_template` WHERE entry = 9100549;
INSERT INTO `creature_template` VALUES (9100549, '0', '0', '0', '0', '0', '5026', '0', '0', '0', 'Mythic Akumai Snapjaw', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4825', '0', '100012', '5930', '0', '0', '0', '', '1', '1.0', '3.89', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100549 WHERE (`entry` = 4825);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4825);
-- Mythic Barbed Crustacean
DELETE FROM `creature_template` WHERE entry = 9100550;
INSERT INTO `creature_template` VALUES (9100550, '0', '0', '0', '0', '0', '9565', '0', '0', '0', 'Mythic Barbed Crustacean', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.05', '2000', '1604', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4823', '0', '0', '5844', '0', '0', '0', '', '1', '1.0', '4.2', '1.0', '1.35', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100550 WHERE (`entry` = 4823);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4823);
-- Mythic Blindlight Muckdweller
DELETE FROM `creature_template` WHERE entry = 9100551;
INSERT INTO `creature_template` VALUES (9100551, '0', '0', '0', '0', '0', '11293', '0', '0', '0', 'Mythic Blindlight Muckdweller', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4819', '4819', '0', '0', '0', '68', '184', '', '1', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100551 WHERE (`entry` = 4819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4819);
-- Mythic Blindlight Oracle
DELETE FROM `creature_template` WHERE entry = 9100552;
INSERT INTO `creature_template` VALUES (9100552, '0', '0', '0', '0', '0', '3617', '0', '0', '0', 'Mythic Blindlight Oracle', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4820', '4820', '0', '0', '0', '76', '290', '', '1', '1.0', '4.23', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100552 WHERE (`entry` = 4820);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4820);
-- Mythic Twilight Aquamancer
DELETE FROM `creature_template` WHERE entry = 9100553;
INSERT INTO `creature_template` VALUES (9100553, '0', '0', '0', '0', '0', '2886', '2887', '2888', '2889', 'Mythic Twilight Aquamancer', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4811', '4811', '0', '0', '0', '120', '311', '', '1', '1.0', '4.24', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100553 WHERE (`entry` = 4811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4811);
-- Mythic Twilight Elementalist
DELETE FROM `creature_template` WHERE entry = 9100554;
INSERT INTO `creature_template` VALUES (9100554, '0', '0', '0', '0', '0', '2890', '2891', '2892', '2893', 'Mythic Twilight Elementalist', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '1567', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4814', '4814', '0', '0', '0', '130', '270', '', '1', '1.0', '4.11', '1.5', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100554 WHERE (`entry` = 4814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4814);
-- Mythic Twilight Reaver
DELETE FROM `creature_template` WHERE entry = 9100555;
INSERT INTO `creature_template` VALUES (9100555, '0', '0', '0', '0', '0', '2898', '2899', '2900', '2901', 'Mythic Twilight Reaver', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '1567', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4810', '4810', '0', '0', '0', '137', '184', '', '1', '1.0', '4.25', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100555 WHERE (`entry` = 4810);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4810);
-- Mythic Twilight Shadowmage
DELETE FROM `creature_template` WHERE entry = 9100556;
INSERT INTO `creature_template` VALUES (9100556, '0', '0', '0', '0', '0', '2876', '2877', '0', '0', 'Mythic Twilight Shadowmage', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '1567', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4813', '4813', '0', '0', '0', '103', '385', '', '1', '1.0', '4.03', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100556 WHERE (`entry` = 4813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4813);
-- Mythic Murkshallow Softshell
DELETE FROM `creature_template` WHERE entry = 9100557;
INSERT INTO `creature_template` VALUES (9100557, '0', '0', '0', '0', '0', '1819', '0', '0', '0', 'Mythic Murkshallow Softshell', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.03', '2000', '1936', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4977', '0', '0', '0', '0', '9', '47', '', '0', '1.0', '4.46', '1.0', '1.4', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100557 WHERE (`entry` = 4977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4977);
-- Mythic Akumai Fisher
DELETE FROM `creature_template` WHERE entry = 9100558;
INSERT INTO `creature_template` VALUES (9100558, '0', '0', '0', '0', '0', '1244', '0', '0', '0', 'Mythic Akumai Fisher', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4824', '0', '100007', '5929', '0', '0', '0', '', '1', '1.0', '4.45', '1.0', '1.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100558 WHERE (`entry` = 4824);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4824);
-- Mythic Blackfathom Sea Witch
DELETE FROM `creature_template` WHERE entry = 9100559;
INSERT INTO `creature_template` VALUES (9100559, '0', '0', '0', '0', '0', '4982', '0', '0', '0', 'Mythic Blackfathom Sea Witch', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4805', '4805', '0', '0', '0', '53', '285', '', '1', '1.0', '4.26', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100559 WHERE (`entry` = 4805);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4805);
-- Mythic Akumai
DELETE FROM `creature_template` WHERE entry = 9100560;
INSERT INTO `creature_template` VALUES (9100560, '0', '0', '0', '0', '0', '2837', '0', '0', '0', 'Mythic Akumai', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '1558', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100500', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '8.21', '1.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100560 WHERE (`entry` = 4829);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4829);
-- Mythic Baron Aquanis
DELETE FROM `creature_template` WHERE entry = 9100561;
INSERT INTO `creature_template` VALUES (9100561, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Mythic Baron Aquanis', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '7.01', '2000', '1558', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100500', '0', '0', '0', '0', '32', '160', '', '1', '1.0', '8.29', '1.0', '0.9', '2.0', '0', '0', '1', '8405008', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100561 WHERE (`entry` = 12876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12876);
-- Mythic Gelihast
DELETE FROM `creature_template` WHERE entry = 9100562;
INSERT INTO `creature_template` VALUES (9100562, '0', '0', '0', '0', '0', '1773', '0', '0', '0', 'Mythic Gelihast', '', NULL, '0', '63', '63', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6243', '0', '0', '0', '231', '308', '', '1', '1.0', '8.06', '1.0', '1.0', 
'2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100562 WHERE (`entry` = 6243);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6243);
-- Mythic Lorgus Jett
DELETE FROM `creature_template` WHERE entry = 9100563;
INSERT INTO `creature_template` VALUES (9100563, '0', '0', '0', '0', '0', '12822', '0', '0', '0', 'Mythic Lorgus Jett', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '12902', '0', '0', '0', '122', '164', '', '1', '1.0', '7.91', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100563 WHERE (`entry` = 12902);
-- Mythic Old Serrakis
DELETE FROM `creature_template` WHERE entry = 9100564;
INSERT INTO `creature_template` VALUES (9100564, '0', '0', '0', '0', '0', '1816', '0', '0', '0', 'Mythic Old Serrakis', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '1567', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '4830', '0', '0', '0', '0', '', '1', '1.0', '7.97', '1.0', '0.95', 
'2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100564 WHERE (`entry` = 4830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4830);
-- Mythic Twilight Lord Kelris
DELETE FROM `creature_template` WHERE entry = 9100565;
INSERT INTO `creature_template` VALUES (9100565, '0', '0', '0', '0', '0', '4939', '0', '0', '0', 'Mythic Twilight Lord Kelris', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4832', '0', '0', '0', '281', '372', '', '1', '1.0', '8.12', '2.5', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100565 WHERE (`entry` = 4832);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4832);
-- Mythic Ghamoo-ra
DELETE FROM `creature_template` WHERE entry = 9100566;
INSERT INTO `creature_template` VALUES (9100566, '0', '0', '0', '0', '0', '5027', '0', '0', '0', 'Mythic Ghamoo-ra', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '9100500', '0', '100007', '5932', '0', '0', '0', '', '1', '1.0', '7.94', '1.0', '932.45', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100566 WHERE (`entry` = 4887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4887);
-- Mythic Lady Sarevess
DELETE FROM `creature_template` WHERE entry = 9100567;
INSERT INTO `creature_template` VALUES (9100567, '0', '0', '0', '0', '0', '4979', '0', '0', '0', 'Mythic Lady Sarevess', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4831', '0', '0', '0', '143', '328', '', '1', '1.0', '8.39', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100567 WHERE (`entry` = 4831);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4831);
