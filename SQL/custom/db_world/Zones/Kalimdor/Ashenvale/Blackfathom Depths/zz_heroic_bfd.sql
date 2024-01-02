-- Heroic Skittering Crustacean
DELETE FROM `creature_template` WHERE entry = 9100500;
INSERT INTO `creature_template` VALUES (9100500, '0', '0', '0', '0', '0', '981', '0', '0', '0', 'Heroic Skittering Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4821', '0', '0', '5842', '0', '0', '0', '', '1', '1.0', '3.46', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100500 WHERE (`entry` = 4821);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4821) AND (`map` = 48);
-- Heroic Murkshallow Snapclaw
DELETE FROM `creature_template` WHERE entry = 9100501;
INSERT INTO `creature_template` VALUES (9100501, '0', '0', '0', '0', '0', '2835', '0', '0', '0', 'Heroic Murkshallow Snapclaw', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4815', '4815', '0', '0', '0', '0', '0', '', '1', '1.0', '3.08', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100501 WHERE (`entry` = 4815);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4815) AND (`map` = 48);
-- Heroic Blindlight Murloc
DELETE FROM `creature_template` WHERE entry = 9100502;
INSERT INTO `creature_template` VALUES (9100502, '0', '0', '0', '0', '0', '4920', '0', '0', '0', 'Heroic Blindlight Murloc', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4818', '4818', '0', '0', '0', '0', '0', '', '1', '1.0', '3.3', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100502 WHERE (`entry` = 4818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4818) AND (`map` = 48);
-- Heroic Blackfathom Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100503;
INSERT INTO `creature_template` VALUES (9100503, '0', '0', '0', '0', '0', '4762', '0', '0', '0', 'Heroic Blackfathom Myrmidon', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4807', '4807', '0', '0', '0', '0', '0', '', '1', '1.0', '3.13', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100503 WHERE (`entry` = 4807);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4807) AND (`map` = 48);
-- Heroic Twilight Loreseeker
DELETE FROM `creature_template` WHERE entry = 9100504;
INSERT INTO `creature_template` VALUES (9100504, '0', '0', '0', '0', '0', '2894', '2895', '2896', '2897', 'Heroic Twilight Loreseeker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '1613', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4812', '4812', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100504 WHERE (`entry` = 4812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4812) AND (`map` = 48);
-- Heroic Twilight Acolyte
DELETE FROM `creature_template` WHERE entry = 9100505;
INSERT INTO `creature_template` VALUES (9100505, '0', '0', '0', '0', '0', '2882', '2883', '2884', '2885', 'Heroic Twilight Acolyte', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '1604', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4809', '4809', '0', '0', '0', '0', '0', '', '1', '1.0', '3.2', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100505 WHERE (`entry` = 4809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4809) AND (`map` = 48);
-- Heroic Snapping Crustacean
DELETE FROM `creature_template` WHERE entry = 9100506;
INSERT INTO `creature_template` VALUES (9100506, '0', '0', '0', '0', '0', '1001', '0', '0', '0', 'Heroic Snapping Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4822', '0', '0', '5843', '0', '0', '0', '', '1', '1.0', '2.99', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100506 WHERE (`entry` = 4822);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4822) AND (`map` = 48);
-- Heroic Fallenroot Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9100507;
INSERT INTO `creature_template` VALUES (9100507, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Heroic Fallenroot Shadowstalker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4798', '4798', '0', '0', '0', '0', '0', '', '1', '1.0', '3.12', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100507 WHERE (`entry` = 4798);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4798) AND (`map` = 48);
-- Heroic Fallenroot Hellcaller
DELETE FROM `creature_template` WHERE entry = 9100508;
INSERT INTO `creature_template` VALUES (9100508, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Heroic Fallenroot Hellcaller', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4799', '4799', '0', '0', '0', '0', '0', '', '1', '1.0', '3.17', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100508 WHERE (`entry` = 4799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4799) AND (`map` = 48);
-- Heroic Deep Pool Threshfin
DELETE FROM `creature_template` WHERE entry = 9100509;
INSERT INTO `creature_template` VALUES (9100509, '0', '0', '0', '0', '0', '2836', '0', '0', '0', 'Heroic Deep Pool Threshfin', '', NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4827', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '2.91', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100509 WHERE (`entry` = 4827);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4827) AND (`map` = 48);
-- Heroic Akumai Servant
DELETE FROM `creature_template` WHERE entry = 9100510;
INSERT INTO `creature_template` VALUES (9100510, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Heroic Akumai Servant', '', NULL, '0', '60', '60', '0', '128', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '1.94', '2000', '1576', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '4978', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.87', '2.0', '0.9', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100510 WHERE (`entry` = 4978);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4978) AND (`map` = 48);
-- Heroic Akumai Snapjaw
DELETE FROM `creature_template` WHERE entry = 9100511;
INSERT INTO `creature_template` VALUES (9100511, '0', '0', '0', '0', '0', '5026', '0', '0', '0', 'Heroic Akumai Snapjaw', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4825', '0', '100012', '5930', '0', '0', '0', '', '1', '1.0', '2.94', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100511 WHERE (`entry` = 4825);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4825) AND (`map` = 48);
-- Heroic Barbed Crustacean
DELETE FROM `creature_template` WHERE entry = 9100512;
INSERT INTO `creature_template` VALUES (9100512, '0', '0', '0', '0', '0', '9565', '0', '0', '0', 'Heroic Barbed Crustacean', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.99', '2000', '1604', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4823', '0', '0', '5844', '0', '0', '0', '', '1', '1.0', '3.18', '1.0', '1.35', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100512 WHERE (`entry` = 4823);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4823) AND (`map` = 48);
-- Heroic Blindlight Muckdweller
DELETE FROM `creature_template` WHERE entry = 9100513;
INSERT INTO `creature_template` VALUES (9100513, '0', '0', '0', '0', '0', '11293', '0', '0', '0', 'Heroic Blindlight Muckdweller', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4819', '4819', '0', '0', '0', '0', '0', '', '1', '1.0', '3.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100513 WHERE (`entry` = 4819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4819) AND (`map` = 48);
-- Heroic Blindlight Oracle
DELETE FROM `creature_template` WHERE entry = 9100514;
INSERT INTO `creature_template` VALUES (9100514, '0', '0', '0', '0', '0', '3617', '0', '0', '0', 'Heroic Blindlight Oracle', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4820', '4820', '0', '0', '0', '0', '0', '', '1', '1.0', '3.41', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100514 WHERE (`entry` = 4820);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4820) AND (`map` = 48);
-- Heroic Twilight Aquamancer
DELETE FROM `creature_template` WHERE entry = 9100515;
INSERT INTO `creature_template` VALUES (9100515, '0', '0', '0', '0', '0', '2886', '2887', '2888', '2889', 'Heroic Twilight Aquamancer', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4811', '4811', '0', '0', '0', '0', '0', '', '1', '1.0', '2.94', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100515 WHERE (`entry` = 4811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4811) AND (`map` = 48);
-- Heroic Twilight Elementalist
DELETE FROM `creature_template` WHERE entry = 9100516;
INSERT INTO `creature_template` VALUES (9100516, '0', '0', '0', '0', '0', '2890', '2891', '2892', '2893', 'Heroic Twilight Elementalist', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '1567', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4814', '4814', '0', '0', '0', '0', '0', '', '1', '1.0', '3.44', '1.5', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100516 WHERE (`entry` = 4814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4814) AND (`map` = 48);
-- Heroic Twilight Reaver
DELETE FROM `creature_template` WHERE entry = 9100517;
INSERT INTO `creature_template` VALUES (9100517, '0', '0', '0', '0', '0', '2898', '2899', '2900', '2901', 'Heroic Twilight Reaver', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '1567', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4810', '4810', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100517 WHERE (`entry` = 4810);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4810) AND (`map` = 48);
-- Heroic Twilight Shadowmage
DELETE FROM `creature_template` WHERE entry = 9100518;
INSERT INTO `creature_template` VALUES (9100518, '0', '0', '0', '0', '0', '2876', '2877', '0', '0', 'Heroic Twilight Shadowmage', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '1567', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4813', '4813', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100518 WHERE (`entry` = 4813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4813) AND (`map` = 48);
-- Heroic Akumai Fisher
DELETE FROM `creature_template` WHERE entry = 9100519;
INSERT INTO `creature_template` VALUES (9100519, '0', '0', '0', '0', '0', '1244', '0', '0', '0', 'Heroic Akumai Fisher', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4824', '0', '100007', '5929', '0', '0', '0', '', '1', '1.0', '3.08', '1.0', '1.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100519 WHERE (`entry` = 4824);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4824) AND (`map` = 48);
-- Heroic Blackfathom Sea Witch
DELETE FROM `creature_template` WHERE entry = 9100520;
INSERT INTO `creature_template` VALUES (9100520, '0', '0', '0', '0', '0', '4982', '0', '0', '0', 'Heroic Blackfathom Sea Witch', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4805', '4805', '0', '0', '0', '0', '0', '', '1', '1.0', '3.08', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100520 WHERE (`entry` = 4805);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4805) AND (`map` = 48);
-- Heroic Akumai
DELETE FROM `creature_template` WHERE entry = 9100521;
INSERT INTO `creature_template` VALUES (9100521, '0', '0', '0', '0', '0', '2837', '0', '0', '0', 'Heroic Akumai', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '1558', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100400', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '6.48', '1.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100521 WHERE (`entry` = 4829);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4829) AND (`map` = 48);
-- Heroic Baron Aquanis
DELETE FROM `creature_template` WHERE entry = 9100522;
INSERT INTO `creature_template` VALUES (9100522, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Heroic Baron Aquanis', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '4.93', '2000', '1558', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.31', '1.0', '0.9', '2.0', '0', '0', '1', '8405008', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100522 WHERE (`entry` = 12876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12876) AND (`map` = 48);
-- Heroic Gelihast
DELETE FROM `creature_template` WHERE entry = 9100523;
INSERT INTO `creature_template` VALUES (9100523, '0', '0', '0', '0', '0', '1773', '0', '0', '0', 'Heroic Gelihast', '', NULL, '0', '63', '63', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6243', '0', '0', '0', '0', '0', '', '1', '1.0', '5.99', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100523 WHERE (`entry` = 6243);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6243) AND (`map` = 48);
-- Heroic Lorgus Jett
DELETE FROM `creature_template` WHERE entry = 9100524;
INSERT INTO `creature_template` VALUES (9100524, '0', '0', '0', '0', '0', '12822', '0', '0', '0', 'Heroic Lorgus Jett', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '12902', '0', '0', '0', '0', '0', '', '1', '1.0', '6.14', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100524 WHERE (`entry` = 12902);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12902) AND (`map` = 48);
-- Heroic Old Serrakis
DELETE FROM `creature_template` WHERE entry = 9100525;
INSERT INTO `creature_template` VALUES (9100525, '0', '0', '0', '0', '0', '1816', '0', '0', '0', 'Heroic Old Serrakis', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '1567', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '4830', '0', '0', '0', '0', '', '1', '1.0', '6.48', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100525 WHERE (`entry` = 4830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4830) AND (`map` = 48);
-- Heroic Twilight Lord Kelris
DELETE FROM `creature_template` WHERE entry = 9100526;
INSERT INTO `creature_template` VALUES (9100526, '0', '0', '0', '0', '0', '4939', '0', '0', '0', 'Heroic Twilight Lord Kelris', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4832', '0', '0', '0', '0', '0', '', '1', '1.0', '6.05', '2.5', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100526 WHERE (`entry` = 4832);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4832) AND (`map` = 48);
-- Heroic Ghamoo-ra
DELETE FROM `creature_template` WHERE entry = 9100527;
INSERT INTO `creature_template` VALUES (9100527, '0', '0', '0', '0', '0', '5027', '0', '0', '0', 'Heroic Ghamoo-ra', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '9100400', '0', '100007', '5932', '0', '0', '0', '', '1', '1.0', '5.83', '1.0', '932.45', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100527 WHERE (`entry` = 4887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4887) AND (`map` = 48);
-- Heroic Lady Sarevess
DELETE FROM `creature_template` WHERE entry = 9100528;
INSERT INTO `creature_template` VALUES (9100528, '0', '0', '0', '0', '0', '4979', '0', '0', '0', 'Heroic Lady Sarevess', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4831', '0', '0', '0', '0', '0', '', '1', '1.0', '6.14', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100528 WHERE (`entry` = 4831);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4831) AND (`map` = 48);
-- Heroic Aqua Guardian
DELETE FROM `creature_template` WHERE entry = 9100529;
INSERT INTO `creature_template` VALUES (9100529, '0', '0', '0', '0', '0', '525', '0', '0', '0', 'Heroic Aqua Guardian', '', NULL, '0', '60', '60', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.0', '2000', '1936', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.2', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100529 WHERE (`entry` = 6047);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6047) AND (`map` = 48);
-- Heroic Argent Guard Thaelrid
DELETE FROM `creature_template` WHERE entry = 9100530;
INSERT INTO `creature_template` VALUES (9100530, '0', '0', '0', '0', '0', '4946', '0', '0', '0', 'Heroic Argent Guard Thaelrid', 'The Argent Dawn', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4787', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100530 WHERE (`entry` = 4787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4787) AND (`map` = 48);
-- Heroic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100531;
INSERT INTO `creature_template` VALUES (9100531, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Heroic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.9', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100531 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996) AND (`map` = 48);
-- Heroic Murkshallow Softshell
DELETE FROM `creature_template` WHERE entry = 9100532;
INSERT INTO `creature_template` VALUES (9100532, '0', '0', '0', '0', '0', '1819', '0', '0', '0', 'Heroic Murkshallow Softshell', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '1936', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4977', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.8', '1.0', '1.4', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100532 WHERE (`entry` = 4977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4977) AND (`map` = 48);
-- Heroic Morridune
DELETE FROM `creature_template` WHERE entry = 9100533;
INSERT INTO `creature_template` VALUES (9100533, '0', '0', '0', '0', '0', '5465', '0', '0', '0', 'Heroic Morridune', NULL, NULL, '321', '60', '60', '0', '80', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.07', '2000', '1914', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.08', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100533 WHERE (`entry` = 6729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6729) AND (`map` = 48);
-- Mythic Skittering Crustacean
DELETE FROM `creature_template` WHERE entry = 9100534;
INSERT INTO `creature_template` VALUES (9100534, '0', '0', '0', '0', '0', '981', '0', '0', '0', 'Mythic Skittering Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4821', '0', '0', '5842', '0', '0', '0', '', '1', '1.0', '3.87', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100534 WHERE (`entry` = 4821);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4821) AND (`map` = 48);
-- Mythic Murkshallow Snapclaw
DELETE FROM `creature_template` WHERE entry = 9100535;
INSERT INTO `creature_template` VALUES (9100535, '0', '0', '0', '0', '0', '2835', '0', '0', '0', 'Mythic Murkshallow Snapclaw', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4815', '4815', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100535 WHERE (`entry` = 4815);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4815) AND (`map` = 48);
-- Mythic Blindlight Murloc
DELETE FROM `creature_template` WHERE entry = 9100536;
INSERT INTO `creature_template` VALUES (9100536, '0', '0', '0', '0', '0', '4920', '0', '0', '0', 'Mythic Blindlight Murloc', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4818', '4818', '0', '0', '0', '0', '0', '', '1', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100536 WHERE (`entry` = 4818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4818) AND (`map` = 48);
-- Mythic Blackfathom Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100537;
INSERT INTO `creature_template` VALUES (9100537, '0', '0', '0', '0', '0', '4762', '0', '0', '0', 'Mythic Blackfathom Myrmidon', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4807', '4807', '0', '0', '0', '0', '0', '', '1', '1.0', '4.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100537 WHERE (`entry` = 4807);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4807) AND (`map` = 48);
-- Mythic Twilight Loreseeker
DELETE FROM `creature_template` WHERE entry = 9100538;
INSERT INTO `creature_template` VALUES (9100538, '0', '0', '0', '0', '0', '2894', '2895', '2896', '2897', 'Mythic Twilight Loreseeker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '1613', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4812', '4812', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100538 WHERE (`entry` = 4812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4812) AND (`map` = 48);
-- Mythic Twilight Acolyte
DELETE FROM `creature_template` WHERE entry = 9100539;
INSERT INTO `creature_template` VALUES (9100539, '0', '0', '0', '0', '0', '2882', '2883', '2884', '2885', 'Mythic Twilight Acolyte', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '1604', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4809', '4809', '0', '0', '0', '0', '0', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100539 WHERE (`entry` = 4809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4809) AND (`map` = 48);
-- Mythic Snapping Crustacean
DELETE FROM `creature_template` WHERE entry = 9100540;
INSERT INTO `creature_template` VALUES (9100540, '0', '0', '0', '0', '0', '1001', '0', '0', '0', 'Mythic Snapping Crustacean', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4822', '0', '0', '5843', '0', '0', '0', '', '1', '1.0', '4.09', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100540 WHERE (`entry` = 4822);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4822) AND (`map` = 48);
-- Mythic Fallenroot Shadowstalker
DELETE FROM `creature_template` WHERE entry = 9100541;
INSERT INTO `creature_template` VALUES (9100541, '0', '0', '0', '0', '0', '2014', '0', '0', '0', 'Mythic Fallenroot Shadowstalker', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4798', '4798', '0', '0', '0', '0', '0', '', '1', '1.0', '4.26', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100541 WHERE (`entry` = 4798);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4798) AND (`map` = 48);
-- Mythic Fallenroot Hellcaller
DELETE FROM `creature_template` WHERE entry = 9100542;
INSERT INTO `creature_template` VALUES (9100542, '0', '0', '0', '0', '0', '2021', '0', '0', '0', 'Mythic Fallenroot Hellcaller', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4799', '4799', '0', '0', '0', '0', '0', '', '1', '1.0', '4.09', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100542 WHERE (`entry` = 4799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4799) AND (`map` = 48);
-- Mythic Deep Pool Threshfin
DELETE FROM `creature_template` WHERE entry = 9100543;
INSERT INTO `creature_template` VALUES (9100543, '0', '0', '0', '0', '0', '2836', '0', '0', '0', 'Mythic Deep Pool Threshfin', '', NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '4827', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '4.09', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100543 WHERE (`entry` = 4827);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4827) AND (`map` = 48);
-- Mythic Akumai Servant
DELETE FROM `creature_template` WHERE entry = 9100544;
INSERT INTO `creature_template` VALUES (9100544, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Mythic Akumai Servant', '', NULL, '0', '60', '60', '0', '128', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '2.94', '2000', '1576', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '4978', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.9', '2.0', '0.9', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100544 WHERE (`entry` = 4978);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4978) AND (`map` = 48);
-- Mythic Akumai Snapjaw
DELETE FROM `creature_template` WHERE entry = 9100545;
INSERT INTO `creature_template` VALUES (9100545, '0', '0', '0', '0', '0', '5026', '0', '0', '0', 'Mythic Akumai Snapjaw', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '1595', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4825', '0', '100012', '5930', '0', '0', '0', '', '1', '1.0', '3.98', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100545 WHERE (`entry` = 4825);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4825) AND (`map` = 48);
-- Mythic Barbed Crustacean
DELETE FROM `creature_template` WHERE entry = 9100546;
INSERT INTO `creature_template` VALUES (9100546, '0', '0', '0', '0', '0', '9565', '0', '0', '0', 'Mythic Barbed Crustacean', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.0', '2000', '1604', '1.0', '1.0', '1', '64', '2048', '0', '8', '0', '0', '0', '0', '1', '1', '4823', '0', '0', '5844', '0', '0', '0', '', '1', '1.0', '4.11', '1.0', '1.35', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100546 WHERE (`entry` = 4823);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4823) AND (`map` = 48);
-- Mythic Blindlight Muckdweller
DELETE FROM `creature_template` WHERE entry = 9100547;
INSERT INTO `creature_template` VALUES (9100547, '0', '0', '0', '0', '0', '11293', '0', '0', '0', 'Mythic Blindlight Muckdweller', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4819', '4819', '0', '0', '0', '0', '0', '', '1', '1.0', '4.03', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100547 WHERE (`entry` = 4819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4819) AND (`map` = 48);
-- Mythic Blindlight Oracle
DELETE FROM `creature_template` WHERE entry = 9100548;
INSERT INTO `creature_template` VALUES (9100548, '0', '0', '0', '0', '0', '3617', '0', '0', '0', 'Mythic Blindlight Oracle', '', NULL, '0', '60', '60', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4820', '4820', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100548 WHERE (`entry` = 4820);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4820) AND (`map` = 48);
-- Mythic Twilight Aquamancer
DELETE FROM `creature_template` WHERE entry = 9100549;
INSERT INTO `creature_template` VALUES (9100549, '0', '0', '0', '0', '0', '2886', '2887', '2888', '2889', 'Mythic Twilight Aquamancer', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4811', '4811', '0', '0', '0', '0', '0', '', '1', '1.0', '4.2', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100549 WHERE (`entry` = 4811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4811) AND (`map` = 48);
-- Mythic Twilight Elementalist
DELETE FROM `creature_template` WHERE entry = 9100550;
INSERT INTO `creature_template` VALUES (9100550, '0', '0', '0', '0', '0', '2890', '2891', '2892', '2893', 'Mythic Twilight Elementalist', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '1567', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4814', '4814', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '1.5', '1.0', '1.0', '0', '0', '1', '646016863', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100550 WHERE (`entry` = 4814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4814) AND (`map` = 48);
-- Mythic Twilight Reaver
DELETE FROM `creature_template` WHERE entry = 9100551;
INSERT INTO `creature_template` VALUES (9100551, '0', '0', '0', '0', '0', '2898', '2899', '2900', '2901', 'Mythic Twilight Reaver', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '1567', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4810', '4810', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100551 WHERE (`entry` = 4810);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4810) AND (`map` = 48);
-- Mythic Twilight Shadowmage
DELETE FROM `creature_template` WHERE entry = 9100552;
INSERT INTO `creature_template` VALUES (9100552, '0', '0', '0', '0', '0', '2876', '2877', '0', '0', 'Mythic Twilight Shadowmage', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '1567', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4813', '4813', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100552 WHERE (`entry` = 4813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4813) AND (`map` = 48);
-- Mythic Akumai Fisher
DELETE FROM `creature_template` WHERE entry = 9100553;
INSERT INTO `creature_template` VALUES (9100553, '0', '0', '0', '0', '0', '1244', '0', '0', '0', 'Mythic Akumai Fisher', '', NULL, '0', '60', '60', '0', '350', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '4824', '0', '100007', '5929', '0', '0', '0', '', '1', '1.0', '4.26', '1.0', '1.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100553 WHERE (`entry` = 4824);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4824) AND (`map` = 48);
-- Mythic Blackfathom Sea Witch
DELETE FROM `creature_template` WHERE entry = 9100554;
INSERT INTO `creature_template` VALUES (9100554, '0', '0', '0', '0', '0', '4982', '0', '0', '0', 'Mythic Blackfathom Sea Witch', '', NULL, '0', '60', '60', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4805', '4805', '0', '0', '0', '0', '0', '', '1', '1.0', '3.94', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100554 WHERE (`entry` = 4805);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4805) AND (`map` = 48);
-- Mythic Akumai
DELETE FROM `creature_template` WHERE entry = 9100555;
INSERT INTO `creature_template` VALUES (9100555, '0', '0', '0', '0', '0', '2837', '0', '0', '0', 'Mythic Akumai', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '1558', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100500', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '7.82', '1.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100555 WHERE (`entry` = 4829);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4829) AND (`map` = 48);
-- Mythic Baron Aquanis
DELETE FROM `creature_template` WHERE entry = 9100556;
INSERT INTO `creature_template` VALUES (9100556, '0', '0', '0', '0', '0', '110', '0', '0', '0', 'Mythic Baron Aquanis', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '4', '6.94', '2000', '1558', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.15', '1.0', '0.9', '2.0', '0', '0', '1', '8405008', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100556 WHERE (`entry` = 12876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12876) AND (`map` = 48);
-- Mythic Gelihast
DELETE FROM `creature_template` WHERE entry = 9100557;
INSERT INTO `creature_template` VALUES (9100557, '0', '0', '0', '0', '0', '1773', '0', '0', '0', 'Mythic Gelihast', '', NULL, '0', '63', '63', '0', '18', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6243', '0', '0', '0', '0', '0', '', '1', '1.0', '7.86', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100557 WHERE (`entry` = 6243);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6243) AND (`map` = 48);
-- Mythic Lorgus Jett
DELETE FROM `creature_template` WHERE entry = 9100558;
INSERT INTO `creature_template` VALUES (9100558, '0', '0', '0', '0', '0', '12822', '0', '0', '0', 'Mythic Lorgus Jett', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '12902', '0', '0', '0', '0', '0', '', '1', '1.0', '7.82', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100558 WHERE (`entry` = 12902);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12902) AND (`map` = 48);
-- Mythic Old Serrakis
DELETE FROM `creature_template` WHERE entry = 9100559;
INSERT INTO `creature_template` VALUES (9100559, '0', '0', '0', '0', '0', '1816', '0', '0', '0', 'Mythic Old Serrakis', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '1567', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '4830', '0', '0', '0', '0', '', '1', '1.0', '8.44', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100559 WHERE (`entry` = 4830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4830) AND (`map` = 48);
-- Mythic Twilight Lord Kelris
DELETE FROM `creature_template` WHERE entry = 9100560;
INSERT INTO `creature_template` VALUES (9100560, '0', '0', '0', '0', '0', '4939', '0', '0', '0', 'Mythic Twilight Lord Kelris', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '1567', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4832', '0', '0', '0', '0', '0', '', '1', '1.0', '7.84', '2.5', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100560 WHERE (`entry` = 4832);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4832) AND (`map` = 48);
-- Mythic Ghamoo-ra
DELETE FROM `creature_template` WHERE entry = 9100561;
INSERT INTO `creature_template` VALUES (9100561, '0', '0', '0', '0', '0', '5027', '0', '0', '0', 'Mythic Ghamoo-ra', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '21', '0', '0', '0', '0', '1', '1', '9100500', '0', '100007', '5932', '0', '0', '0', '', '1', '1.0', '8.3', '1.0', '932.45', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100561 WHERE (`entry` = 4887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4887) AND (`map` = 48);
-- Mythic Lady Sarevess
DELETE FROM `creature_template` WHERE entry = 9100562;
INSERT INTO `creature_template` VALUES (9100562, '0', '0', '0', '0', '0', '4979', '0', '0', '0', 'Mythic Lady Sarevess', '', NULL, '0', '63', '63', '0', '128', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4831', '0', '0', '0', '0', '0', '', '1', '1.0', '7.98', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100562 WHERE (`entry` = 4831);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4831) AND (`map` = 48);
-- Mythic Aqua Guardian
DELETE FROM `creature_template` WHERE entry = 9100563;
INSERT INTO `creature_template` VALUES (9100563, '0', '0', '0', '0', '0', '525', '0', '0', '0', 'Mythic Aqua Guardian', '', NULL, '0', '60', '60', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.93', '2000', '1936', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.25', '1.0', '1.0', '1.0', '0', '0', '1', '16384', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100563 WHERE (`entry` = 6047);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6047) AND (`map` = 48);
-- Mythic Argent Guard Thaelrid
DELETE FROM `creature_template` WHERE entry = 9100564;
INSERT INTO `creature_template` VALUES (9100564, '0', '0', '0', '0', '0', '4946', '0', '0', '0', 'Mythic Argent Guard Thaelrid', 'The Argent Dawn', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.1', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4787', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100564 WHERE (`entry` = 4787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4787) AND (`map` = 48);
-- Mythic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100565;
INSERT INTO `creature_template` VALUES (9100565, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Mythic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.83', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100565 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996) AND (`map` = 48);
-- Mythic Murkshallow Softshell
DELETE FROM `creature_template` WHERE entry = 9100566;
INSERT INTO `creature_template` VALUES (9100566, '0', '0', '0', '0', '0', '1819', '0', '0', '0', 'Mythic Murkshallow Softshell', '', NULL, '0', '60', '60', '0', '129', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.91', '2000', '1936', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4977', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.48', '1.0', '1.4', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100566 WHERE (`entry` = 4977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4977) AND (`map` = 48);
-- Mythic Morridune
DELETE FROM `creature_template` WHERE entry = 9100567;
INSERT INTO `creature_template` VALUES (9100567, '0', '0', '0', '0', '0', '5465', '0', '0', '0', 'Mythic Morridune', NULL, NULL, '321', '60', '60', '0', '80', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '2000', '1914', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.43', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100567 WHERE (`entry` = 6729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6729) AND (`map` = 48);