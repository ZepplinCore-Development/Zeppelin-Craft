-- Heroic Sandfury Executioner
DELETE FROM `creature_template` WHERE entry = 9101100;
INSERT INTO `creature_template` VALUES (9101100, '0', '0', '0', '0', '0', '6440', '0', '0', '0', 'Heroic Sandfury Executioner', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2600', '1384', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7274', '7274', '0', '0', '0', '0', '0', '', '1', '1.0', '3.5', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101100 WHERE (`entry` = 7274);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7274) AND (`map` = 209);
-- Heroic Murta Grimgut
DELETE FROM `creature_template` WHERE entry = 9101101;
INSERT INTO `creature_template` VALUES (9101101, '0', '0', '0', '0', '0', '6438', '0', '0', '0', 'Heroic Murta Grimgut', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '1384', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7608', '7608', '0', '0', '0', '0', '0', '', '1', '1.0', '3.12', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101101 WHERE (`entry` = 7608);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7608) AND (`map` = 209);
-- Heroic Oro Eyegouge
DELETE FROM `creature_template` WHERE entry = 9101102;
INSERT INTO `creature_template` VALUES (9101102, '0', '0', '0', '0', '0', '6432', '0', '0', '0', 'Heroic Oro Eyegouge', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '1384', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7606', '7606', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101102 WHERE (`entry` = 7606);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7606) AND (`map` = 209);
-- Heroic Raven
DELETE FROM `creature_template` WHERE entry = 9101103;
INSERT INTO `creature_template` VALUES (9101103, '0', '0', '0', '0', '0', '6435', '0', '0', '0', 'Heroic Raven', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '1600', '1384', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7605', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.38', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101103 WHERE (`entry` = 7605);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7605) AND (`map` = 209);
-- Heroic Sandfury Blood Drinker
DELETE FROM `creature_template` WHERE entry = 9101104;
INSERT INTO `creature_template` VALUES (9101104, '0', '0', '0', '0', '0', '6423', '6424', '0', '0', 'Heroic Sandfury Blood Drinker', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5649', '5649', '0', '0', '0', '0', '0', '', '1', '1.0', '3.04', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101104 WHERE (`entry` = 5649);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5649) AND (`map` = 209);
-- Heroic Sandfury Cretin
DELETE FROM `creature_template` WHERE entry = 9101105;
INSERT INTO `creature_template` VALUES (9101105, '0', '0', '0', '0', '0', '6682', '0', '0', '0', 'Heroic Sandfury Cretin', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.6', '0.714286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.05', '2000', '1384', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7789', '7789', '0', '0', '0', '0', '0', '', '1', '1.0', '3.42', '1.0', '1.3', '1.0', '0', '93', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101105 WHERE (`entry` = 7789);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7789) AND (`map` = 209);
-- Heroic Sandfury Guardian
DELETE FROM `creature_template` WHERE entry = 9101106;
INSERT INTO `creature_template` VALUES (9101106, '0', '0', '0', '0', '0', '4305', '0', '0', '0', 'Heroic Sandfury Guardian', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '1700', '2000', '1.0', '1.0', '1', '0', '2048', '0', '35', '0', '0', '0', '0', '1', '1', '7268', '0', '100014', '12940', '0', '0', '0', '', '1', '1.0', '2.83', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101106 WHERE (`entry` = 7268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7268) AND (`map` = 209);
-- Heroic Sandfury Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9101107;
INSERT INTO `creature_template` VALUES (9101107, '0', '0', '0', '0', '0', '6419', '6420', '0', '0', 'Heroic Sandfury Shadowcaster', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5648', '5648', '0', '0', '0', '0', '0', '', '1', '1.0', '3.09', '2.0', '1.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101107 WHERE (`entry` = 5648);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5648) AND (`map` = 209);
-- Heroic Sandfury Shadowhunter
DELETE FROM `creature_template` WHERE entry = 9101108;
INSERT INTO `creature_template` VALUES (9101108, '0', '0', '0', '0', '0', '6425', '6426', '0', '0', 'Heroic Sandfury Shadowhunter', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7246', '7246', '0', '0', '0', '0', '0', '', '1', '1.0', '3.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101108 WHERE (`entry` = 7246);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7246) AND (`map` = 209);
-- Heroic Sandfury Soul Eater
DELETE FROM `creature_template` WHERE entry = 9101109;
INSERT INTO `creature_template` VALUES (9101109, '0', '0', '0', '0', '0', '6427', '6428', '0', '0', 'Heroic Sandfury Soul Eater', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7247', '7247', '0', '0', '0', '0', '0', '', '1', '1.0', '2.91', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101109 WHERE (`entry` = 7247);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7247) AND (`map` = 209);
-- Heroic Sandfury Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101110;
INSERT INTO `creature_template` VALUES (9101110, '0', '0', '0', '0', '0', '6421', '6422', '0', '0', 'Heroic Sandfury Witch Doctor', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5650', '5650', '0', '0', '0', '0', '0', '', '1', '1.0', '2.86', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101110 WHERE (`entry` = 5650);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5650) AND (`map` = 209);
-- Heroic Sergeant Bly
DELETE FROM `creature_template` WHERE entry = 9101111;
INSERT INTO `creature_template` VALUES (9101111, '0', '0', '0', '0', '0', '6433', '0', '0', '0', 'Heroic Sergeant Bly', '', NULL, '941', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '1384', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '7604', '7604', '0', '0', '0', '0', '0', '', '1', '1.0', '3.31', '1.0', '1.0', '1.0', '0', '0', '0', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101111 WHERE (`entry` = 7604);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7604) AND (`map` = 209);
-- Heroic Servant of Antusul
DELETE FROM `creature_template` WHERE entry = 9101112;
INSERT INTO `creature_template` VALUES (9101112, '0', '0', '0', '0', '0', '601', '0', '0', '0', 'Heroic Servant of Antusul', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '1411', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.12', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101112 WHERE (`entry` = 8156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8156) AND (`map` = 209);
-- Heroic Sullithuz Abomination
DELETE FROM `creature_template` WHERE entry = 9101113;
INSERT INTO `creature_template` VALUES (9101113, '0', '0', '0', '0', '0', '7345', '0', '0', '0', 'Heroic Sullithuz Abomination', '', NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8120', '0', '8120', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101113 WHERE (`entry` = 8120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8120) AND (`map` = 209);
-- Heroic Sullithuz Hatchling
DELETE FROM `creature_template` WHERE entry = 9101114;
INSERT INTO `creature_template` VALUES (9101114, '0', '0', '0', '0', '0', '1073', '0', '0', '0', 'Heroic Sullithuz Hatchling', '', NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.81', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101114 WHERE (`entry` = 8130);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8130) AND (`map` = 209);
-- Heroic Sullithuz Sandcrawler
DELETE FROM `creature_template` WHERE entry = 9101115;
INSERT INTO `creature_template` VALUES (9101115, '0', '0', '0', '0', '0', '7345', '0', '0', '0', 'Heroic Sullithuz Sandcrawler', '', NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8095', '0', '8095', '0', '0', '0', '0', '', '1', '1.0', '2.97', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101115 WHERE (`entry` = 8095);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8095) AND (`map` = 209);
-- Heroic Weegli Blastfuse
DELETE FROM `creature_template` WHERE entry = 9101116;
INSERT INTO `creature_template` VALUES (9101116, '0', '0', '0', '0', '0', '7222', '0', '0', '0', 'Heroic Weegli Blastfuse', '', NULL, '940', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.95', '2000', '1448', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7607', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.89', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101116 WHERE (`entry` = 7607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7607) AND (`map` = 209);
-- Heroic ZulFarrak Zombie
DELETE FROM `creature_template` WHERE entry = 9101117;
INSERT INTO `creature_template` VALUES (9101117, '0', '0', '0', '0', '0', '6417', '6418', '0', '0', 'Heroic ZulFarrak Zombie', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7286', '7286', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101117 WHERE (`entry` = 7286);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7286) AND (`map` = 209);
-- Heroic Antusul
DELETE FROM `creature_template` WHERE entry = 9101118;
INSERT INTO `creature_template` VALUES (9101118, '0', '0', '0', '0', '0', '7353', '0', '0', '0', 'Heroic Antusul', 'Overseer of Sul', NULL, '0', '63', '63', '0', '107', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.18', '8.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101118 WHERE (`entry` = 8127);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8127) AND (`map` = 209);
-- Heroic Chief Ukorz Sandscalp
DELETE FROM `creature_template` WHERE entry = 9101119;
INSERT INTO `creature_template` VALUES (9101119, '0', '0', '0', '0', '0', '6439', '0', '0', '0', 'Heroic Chief Ukorz Sandscalp', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '7267', '0', '0', '0', '0', '0', '', '1', '1.0', '6.33', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101119 WHERE (`entry` = 7267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7267) AND (`map` = 209);
-- Heroic Gahzrilla
DELETE FROM `creature_template` WHERE entry = 9101120;
INSERT INTO `creature_template` VALUES (9101120, '0', '0', '0', '0', '0', '7271', '0', '0', '0', 'Heroic Gahzrilla', NULL, NULL, '0', '63', '63', '0', '107', '0', '1.6', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '1402', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100400', '0', '7273', '0', '0', '0', '0', '', '1', '1.0', '6.03', '2.0', '0.9', '2.0', '0', '150', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101120 WHERE (`entry` = 7273);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7273) AND (`map` = 209);
-- Heroic Hydromancer Velratha
DELETE FROM `creature_template` WHERE entry = 9101121;
INSERT INTO `creature_template` VALUES (9101121, '0', '0', '0', '0', '0', '6685', '0', '0', '0', 'Heroic Hydromancer Velratha', '', NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '1384', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '7795', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101121 WHERE (`entry` = 7795);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7795) AND (`map` = 209);
-- Heroic Nekrum Gutchewer
DELETE FROM `creature_template` WHERE entry = 9101122;
INSERT INTO `creature_template` VALUES (9101122, '0', '0', '0', '0', '0', '6690', '0', '0', '0', 'Heroic Nekrum Gutchewer', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '4.97', '2500', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '7796', '0', '0', '0', '0', '0', '', '1', '1.0', '6.3', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101122 WHERE (`entry` = 7796);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7796) AND (`map` = 209);
-- Heroic Ruuzlu
DELETE FROM `creature_template` WHERE entry = 9101123;
INSERT INTO `creature_template` VALUES (9101123, '0', '0', '0', '0', '0', '6687', '0', '0', '0', 'Heroic Ruuzlu', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2600', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '7797', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101123 WHERE (`entry` = 7797);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7797) AND (`map` = 209);
-- Heroic Shadowpriest Sezzziz
DELETE FROM `creature_template` WHERE entry = 9101124;
INSERT INTO `creature_template` VALUES (9101124, '0', '0', '0', '0', '0', '6441', '0', '0', '0', 'Heroic Shadowpriest Sezzziz', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '1393', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '7275', '0', '0', '0', '0', '0', '', '1', '1.0', '6.45', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101124 WHERE (`entry` = 7275);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7275) AND (`map` = 209);
-- Heroic Theka the Martyr
DELETE FROM `creature_template` WHERE entry = 9101125;
INSERT INTO `creature_template` VALUES (9101125, '0', '0', '0', '0', '0', '6696', '0', '0', '0', 'Heroic Theka the Martyr', '', NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2500', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '7272', '0', '0', '0', '0', '0', '', '1', '1.0', '6.17', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101125 WHERE (`entry` = 7272);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7272) AND (`map` = 209);
-- Heroic Witch Doctor Zumrah
DELETE FROM `creature_template` WHERE entry = 9101126;
INSERT INTO `creature_template` VALUES (9101126, '0', '0', '0', '0', '0', '6434', '0', '0', '0', 'Heroic Witch Doctor Zumrah', '', NULL, '0', '63', '63', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '7271', '0', '0', '0', '0', '0', '', '1', '1.0', '6.49', '4.0', 
'1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101126 WHERE (`entry` = 7271);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7271) AND (`map` = 209);
-- Heroic Sandarr Dunereaver
DELETE FROM `creature_template` WHERE entry = 9101127;
INSERT INTO `creature_template` VALUES (9101127, '0', '0', '0', '0', '0', '9291', '0', '0', '0', 'Heroic Sandarr Dunereaver', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10080', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.85', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101127 WHERE (`entry` = 10080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10080) AND (`map` = 209);
-- Heroic Dustwraith
DELETE FROM `creature_template` WHERE entry = 9101128;
INSERT INTO `creature_template` VALUES (9101128, '0', '0', '0', '0', '0', '9292', '0', '0', '0', 'Heroic Dustwraith', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10081', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.98', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101128 WHERE (`entry` = 10081);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10081) AND (`map` = 209);
-- Heroic Zerillis
DELETE FROM `creature_template` WHERE entry = 9101129;
INSERT INTO `creature_template` VALUES (9101129, '0', '0', '0', '0', '0', '9293', '0', '0', '0', 'Heroic Zerillis', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '2', '0', '4.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10082', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.8', '2.0', '1.0', '1.0', '0', 
'0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101129 WHERE (`entry` = 10082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10082) AND (`map` = 209);
-- Heroic Elder Wildmane
DELETE FROM `creature_template` WHERE entry = 9101130;
INSERT INTO `creature_template` VALUES (9101130, '0', '0', '0', '0', '0', '15645', '0', '0', '0', 'Heroic Elder Wildmane', NULL, NULL, '21070', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.9', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.96', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101130 WHERE (`entry` = 15578);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15578) AND (`map` = 209);
-- Heroic Goblin Land Mine
DELETE FROM `creature_template` WHERE entry = 9101131;
INSERT INTO `creature_template` VALUES (9101131, '0', '0', '0', '0', '0', '6271', '0', '0', '0', 'Heroic Goblin Land Mine', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.02', '2000', '2000', '1.0', '1.0', '1', '131076', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.3', '1.0', '1.0', '1.0', 
'0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101131 WHERE (`entry` = 7527);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7527) AND (`map` = 209);
-- Heroic Greater Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101132;
INSERT INTO `creature_template` VALUES (9101132, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Heroic Greater Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.01', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8179', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101132 WHERE (`entry` = 8179);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8179) AND (`map` = 209);
-- Heroic Sandfury Acolyte
DELETE FROM `creature_template` WHERE entry = 9101133;
INSERT INTO `creature_template` VALUES (9101133, '0', '0', '0', '0', '0', '6411', '6412', '0', '0', 'Heroic Sandfury Acolyte', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.99', '2000', '1727', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8876', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.24', '1.0', '0.95', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101133 WHERE (`entry` = 8876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8876) AND (`map` = 209);
-- Heroic Sandfury Drudge
DELETE FROM `creature_template` WHERE entry = 9101134;
INSERT INTO `creature_template` VALUES (9101134, '0', '0', '0', '0', '0', '6680', '6681', '0', '0', 'Heroic Sandfury Drudge', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7788', '7788', '0', '0', '0', '0', '0', '', '1', '1.0', '2.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101134 WHERE (`entry` = 7788);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7788) AND (`map` = 209);
-- Heroic Sandfury Slave
DELETE FROM `creature_template` WHERE entry = 9101135;
INSERT INTO `creature_template` VALUES (9101135, '0', '0', '0', '0', '0', '6678', '6679', '0', '0', 'Heroic Sandfury Slave', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '1738', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7787', '7787', '0', '0', '0', '0', '0', '', '1', '1.0', '2.37', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101135 WHERE (`entry` = 7787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7787) AND (`map` = 209);
-- Heroic Sandfury Zealot
DELETE FROM `creature_template` WHERE entry = 9101136;
INSERT INTO `creature_template` VALUES (9101136, '0', '0', '0', '0', '0', '6423', '6424', '0', '0', 'Heroic Sandfury Zealot', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.96', '2400', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8877', '8877', '0', '0', '0', '0', '0', '', '1', '1.0', '2.49', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101136 WHERE (`entry` = 8877);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8877) AND (`map` = 209);
-- Heroic Scarab
DELETE FROM `creature_template` WHERE entry = 9101137;
INSERT INTO `creature_template` VALUES (9101137, '0', '0', '0', '0', '0', '7470', '0', '0', '0', 'Heroic Scarab', '', NULL, '0', '60', '60', '0', '15', '0', '0.8', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '7269', '0', '100004', '0', '0', '0', '0', '', '1', '1.0', '2.41', '1.0', '1.0', '1.0', '0', '114', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101137 WHERE (`entry` = 7269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7269) AND (`map` = 209);
-- Heroic Skeleton of Zumrah
DELETE FROM `creature_template` WHERE entry = 9101138;
INSERT INTO `creature_template` VALUES (9101138, '0', '0', '0', '0', '0', '200', '0', '0', '0', 'Heroic Skeleton of Zumrah', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.01', '2000', '1826', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.17', '1.0', '1.45', 
'1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101138 WHERE (`entry` = 7786);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7786) AND (`map` = 209);
-- Heroic Sullithuz Broodling
DELETE FROM `creature_template` WHERE entry = 9101139;
INSERT INTO `creature_template` VALUES (9101139, '0', '0', '0', '0', '0', '1075', '0', '0', '0', 'Heroic Sullithuz Broodling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '0.94', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8138', '0', '8138', '0', '0', '0', '0', '', '1', '1.0', '1.91', '1.0', 
'2.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101139 WHERE (`entry` = 8138);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8138) AND (`map` = 209);
-- Heroic Ward of Zumrah
DELETE FROM `creature_template` WHERE entry = 9101140;
INSERT INTO `creature_template` VALUES (9101140, '0', '0', '0', '0', '0', '2418', '0', '0', '0', 'Heroic Ward of Zumrah', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '2000', '1705', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101140 WHERE (`entry` = 7785);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7785) AND (`map` = 209);
-- Heroic ZulFarrak Dead Hero
DELETE FROM `creature_template` WHERE entry = 9101141;
INSERT INTO `creature_template` VALUES (9101141, '0', '0', '0', '0', '0', '6436', '6437', '0', '0', 'Heroic ZulFarrak Dead Hero', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.07', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7276', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.06', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101141 WHERE (`entry` = 7276);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7276) AND (`map` = 209);
-- Mythic Sandfury Executioner
DELETE FROM `creature_template` WHERE entry = 9101142;
INSERT INTO `creature_template` VALUES (9101142, '0', '0', '0', '0', '0', '6440', '0', '0', '0', 'Mythic Sandfury Executioner', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2600', '1384', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7274', '7274', '0', '0', '0', '0', '0', '', '1', '1.0', '4.43', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101142 WHERE (`entry` = 7274);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7274) AND (`map` = 209);
-- Mythic Murta Grimgut
DELETE FROM `creature_template` WHERE entry = 9101143;
INSERT INTO `creature_template` VALUES (9101143, '0', '0', '0', '0', '0', '6438', '0', '0', '0', 'Mythic Murta Grimgut', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '1384', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7608', '7608', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101143 WHERE (`entry` = 7608);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7608) AND (`map` = 209);
-- Mythic Oro Eyegouge
DELETE FROM `creature_template` WHERE entry = 9101144;
INSERT INTO `creature_template` VALUES (9101144, '0', '0', '0', '0', '0', '6432', '0', '0', '0', 'Mythic Oro Eyegouge', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '1384', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7606', '7606', '0', '0', '0', '0', '0', '', '1', '1.0', '4.35', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101144 WHERE (`entry` = 7606);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7606) AND (`map` = 209);
-- Mythic Raven
DELETE FROM `creature_template` WHERE entry = 9101145;
INSERT INTO `creature_template` VALUES (9101145, '0', '0', '0', '0', '0', '6435', '0', '0', '0', 'Mythic Raven', '', NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '1600', '1384', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7605', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.22', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101145 WHERE (`entry` = 7605);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7605) AND (`map` = 209);
-- Mythic Sandfury Blood Drinker
DELETE FROM `creature_template` WHERE entry = 9101146;
INSERT INTO `creature_template` VALUES (9101146, '0', '0', '0', '0', '0', '6423', '6424', '0', '0', 'Mythic Sandfury Blood Drinker', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5649', '5649', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101146 WHERE (`entry` = 5649);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5649) AND (`map` = 209);
-- Mythic Sandfury Cretin
DELETE FROM `creature_template` WHERE entry = 9101147;
INSERT INTO `creature_template` VALUES (9101147, '0', '0', '0', '0', '0', '6682', '0', '0', '0', 'Mythic Sandfury Cretin', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.6', '0.714286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.96', '2000', '1384', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7789', '7789', '0', '0', '0', '0', '0', '', '1', '1.0', '4.16', '1.0', '1.3', '1.0', '0', '93', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101147 WHERE (`entry` = 7789);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7789) AND (`map` = 209);
-- Mythic Sandfury Guardian
DELETE FROM `creature_template` WHERE entry = 9101148;
INSERT INTO `creature_template` VALUES (9101148, '0', '0', '0', '0', '0', '4305', '0', '0', '0', 'Mythic Sandfury Guardian', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '1700', '2000', '1.0', '1.0', '1', '0', '2048', '0', '35', '0', '0', '0', '0', '1', '1', '7268', '0', '100014', '12940', '0', '0', '0', '', '1', '1.0', '3.86', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101148 WHERE (`entry` = 7268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7268) AND (`map` = 209);
-- Mythic Sandfury Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9101149;
INSERT INTO `creature_template` VALUES (9101149, '0', '0', '0', '0', '0', '6419', '6420', '0', '0', 'Mythic Sandfury Shadowcaster', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5648', '5648', '0', '0', '0', '0', '0', '', '1', '1.0', '4.36', '2.0', '1.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101149 WHERE (`entry` = 5648);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5648) AND (`map` = 209);
-- Mythic Sandfury Shadowhunter
DELETE FROM `creature_template` WHERE entry = 9101150;
INSERT INTO `creature_template` VALUES (9101150, '0', '0', '0', '0', '0', '6425', '6426', '0', '0', 'Mythic Sandfury Shadowhunter', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7246', '7246', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101150 WHERE (`entry` = 7246);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7246) AND (`map` = 209);
-- Mythic Sandfury Soul Eater
DELETE FROM `creature_template` WHERE entry = 9101151;
INSERT INTO `creature_template` VALUES (9101151, '0', '0', '0', '0', '0', '6427', '6428', '0', '0', 'Mythic Sandfury Soul Eater', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7247', '7247', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101151 WHERE (`entry` = 7247);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7247) AND (`map` = 209);
-- Mythic Sandfury Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101152;
INSERT INTO `creature_template` VALUES (9101152, '0', '0', '0', '0', '0', '6421', '6422', '0', '0', 'Mythic Sandfury Witch Doctor', '', NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '5650', '5650', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101152 WHERE (`entry` = 5650);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5650) AND (`map` = 209);
-- Mythic Sergeant Bly
DELETE FROM `creature_template` WHERE entry = 9101153;
INSERT INTO `creature_template` VALUES (9101153, '0', '0', '0', '0', '0', '6433', '0', '0', '0', 'Mythic Sergeant Bly', '', NULL, '941', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '1384', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '7604', '7604', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '1.0', '1.0', '1.0', '0', '0', '0', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101153 WHERE (`entry` = 7604);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7604) AND (`map` = 209);
-- Mythic Servant of Antusul
DELETE FROM `creature_template` WHERE entry = 9101154;
INSERT INTO `creature_template` VALUES (9101154, '0', '0', '0', '0', '0', '601', '0', '0', '0', 'Mythic Servant of Antusul', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '1411', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.01', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101154 WHERE (`entry` = 8156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8156) AND (`map` = 209);
-- Mythic Sullithuz Abomination
DELETE FROM `creature_template` WHERE entry = 9101155;
INSERT INTO `creature_template` VALUES (9101155, '0', '0', '0', '0', '0', '7345', '0', '0', '0', 'Mythic Sullithuz Abomination', '', NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8120', '0', '8120', '0', '0', '0', '0', '', '1', '1.0', '4.5', '1.0', 
'1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101155 WHERE (`entry` = 8120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8120) AND (`map` = 209);
-- Mythic Sullithuz Hatchling
DELETE FROM `creature_template` WHERE entry = 9101156;
INSERT INTO `creature_template` VALUES (9101156, '0', '0', '0', '0', '0', '1073', '0', '0', '0', 'Mythic Sullithuz Hatchling', '', NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.33', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101156 WHERE (`entry` = 8130);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8130) AND (`map` = 209);
-- Mythic Sullithuz Sandcrawler
DELETE FROM `creature_template` WHERE entry = 9101157;
INSERT INTO `creature_template` VALUES (9101157, '0', '0', '0', '0', '0', '7345', '0', '0', '0', 'Mythic Sullithuz Sandcrawler', '', NULL, '0', '60', '60', '0', '37', '0', '1.11111', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8095', '0', '8095', '0', '0', '0', '0', '', '1', '1.0', '4.15', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101157 WHERE (`entry` = 8095);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8095) AND (`map` = 209);
-- Mythic Weegli Blastfuse
DELETE FROM `creature_template` WHERE entry = 9101158;
INSERT INTO `creature_template` VALUES (9101158, '0', '0', '0', '0', '0', '7222', '0', '0', '0', 'Mythic Weegli Blastfuse', '', NULL, '940', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.94', '2000', '1448', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7607', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.91', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101158 WHERE (`entry` = 7607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7607) AND (`map` = 209);
-- Mythic ZulFarrak Zombie
DELETE FROM `creature_template` WHERE entry = 9101159;
INSERT INTO `creature_template` VALUES (9101159, '0', '0', '0', '0', '0', '6417', '6418', '0', '0', 'Mythic ZulFarrak Zombie', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7286', '7286', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101159 WHERE (`entry` = 7286);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7286) AND (`map` = 209);
-- Mythic Antusul
DELETE FROM `creature_template` WHERE entry = 9101160;
INSERT INTO `creature_template` VALUES (9101160, '0', '0', '0', '0', '0', '7353', '0', '0', '0', 'Mythic Antusul', 'Overseer of Sul', NULL, '0', '63', '63', '0', '107', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.92', '8.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101160 WHERE (`entry` = 8127);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8127) AND (`map` = 209);
-- Mythic Chief Ukorz Sandscalp
DELETE FROM `creature_template` WHERE entry = 9101161;
INSERT INTO `creature_template` VALUES (9101161, '0', '0', '0', '0', '0', '6439', '0', '0', '0', 'Mythic Chief Ukorz Sandscalp', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '7267', '0', '0', '0', '0', '0', '', '1', '1.0', '8.21', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101161 WHERE (`entry` = 7267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7267) AND (`map` = 209);
-- Mythic Gahzrilla
DELETE FROM `creature_template` WHERE entry = 9101162;
INSERT INTO `creature_template` VALUES (9101162, '0', '0', '0', '0', '0', '7271', '0', '0', '0', 'Mythic Gahzrilla', NULL, NULL, '0', '63', '63', '0', '107', '0', '1.6', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '1402', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '9100500', '0', '7273', '0', '0', '0', '0', '', '1', '1.0', '8.15', '2.0', '0.9', '2.0', '0', '150', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101162 WHERE (`entry` = 7273);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7273) AND (`map` = 209);
-- Mythic Hydromancer Velratha
DELETE FROM `creature_template` WHERE entry = 9101163;
INSERT INTO `creature_template` VALUES (9101163, '0', '0', '0', '0', '0', '6685', '0', '0', '0', 'Mythic Hydromancer Velratha', '', NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '1384', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '7795', '0', '0', '0', '0', '0', '', '1', '1.0', '7.86', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101163 WHERE (`entry` = 7795);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7795) AND (`map` = 209);
-- Mythic Nekrum Gutchewer
DELETE FROM `creature_template` WHERE entry = 9101164;
INSERT INTO `creature_template` VALUES (9101164, '0', '0', '0', '0', '0', '6690', '0', '0', '0', 'Mythic Nekrum Gutchewer', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '7.08', '2500', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '7796', '0', '0', '0', '0', '0', '', '1', '1.0', '7.83', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101164 WHERE (`entry` = 7796);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7796) AND (`map` = 209);
-- Mythic Ruuzlu
DELETE FROM `creature_template` WHERE entry = 9101165;
INSERT INTO `creature_template` VALUES (9101165, '0', '0', '0', '0', '0', '6687', '0', '0', '0', 'Mythic Ruuzlu', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2600', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '7797', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101165 WHERE (`entry` = 7797);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7797) AND (`map` = 209);
-- Mythic Shadowpriest Sezzziz
DELETE FROM `creature_template` WHERE entry = 9101166;
INSERT INTO `creature_template` VALUES (9101166, '0', '0', '0', '0', '0', '6441', '0', '0', '0', 'Mythic Shadowpriest Sezzziz', NULL, NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '1393', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '7275', '0', '0', '0', '0', '0', '', '1', '1.0', '7.97', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101166 WHERE (`entry` = 7275);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7275) AND (`map` = 209);
-- Mythic Theka the Martyr
DELETE FROM `creature_template` WHERE entry = 9101167;
INSERT INTO `creature_template` VALUES (9101167, '0', '0', '0', '0', '0', '6696', '0', '0', '0', 'Mythic Theka the Martyr', '', NULL, '0', '63', '63', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2500', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '7272', '0', '0', '0', '0', '0', '', '1', '1.0', '8.15', '2.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101167 WHERE (`entry` = 7272);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7272) AND (`map` = 209);
-- Mythic Witch Doctor Zumrah
DELETE FROM `creature_template` WHERE entry = 9101168;
INSERT INTO `creature_template` VALUES (9101168, '0', '0', '0', '0', '0', '6434', '0', '0', '0', 'Mythic Witch Doctor Zumrah', '', NULL, '0', '63', '63', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '7271', '0', '0', '0', '0', '0', '', '1', '1.0', '8.02', '4.0', '1.0', '2.0', '0', '0', '1', '646659935', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101168 WHERE (`entry` = 7271);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7271) AND (`map` = 209);
-- Mythic Sandarr Dunereaver
DELETE FROM `creature_template` WHERE entry = 9101169;
INSERT INTO `creature_template` VALUES (9101169, '0', '0', '0', '0', '0', '9291', '0', '0', '0', 'Mythic Sandarr Dunereaver', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10080', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '7.33', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101169 WHERE (`entry` = 10080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10080) AND (`map` = 209);
-- Mythic Dustwraith
DELETE FROM `creature_template` WHERE entry = 9101170;
INSERT INTO `creature_template` VALUES (9101170, '0', '0', '0', '0', '0', '9292', '0', '0', '0', 'Mythic Dustwraith', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10081', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '7.12', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101170 WHERE (`entry` = 10081);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10081) AND (`map` = 209);
-- Mythic Zerillis
DELETE FROM `creature_template` WHERE entry = 9101171;
INSERT INTO `creature_template` VALUES (9101171, '0', '0', '0', '0', '0', '9293', '0', '0', '0', 'Mythic Zerillis', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '2', '0', '5.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10082', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.0', '2.0', '1.0', '1.0', '0', 
'0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101171 WHERE (`entry` = 10082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10082) AND (`map` = 209);
-- Mythic Elder Wildmane
DELETE FROM `creature_template` WHERE entry = 9101172;
INSERT INTO `creature_template` VALUES (9101172, '0', '0', '0', '0', '0', '15645', '0', '0', '0', 'Mythic Elder Wildmane', NULL, NULL, '21070', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.4', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101172 WHERE (`entry` = 15578);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15578) AND (`map` = 209);
-- Mythic Goblin Land Mine
DELETE FROM `creature_template` WHERE entry = 9101173;
INSERT INTO `creature_template` VALUES (9101173, '0', '0', '0', '0', '0', '6271', '0', '0', '0', 'Mythic Goblin Land Mine', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '131076', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.85', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101173 WHERE (`entry` = 7527);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7527) AND (`map` = 209);
-- Mythic Greater Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101174;
INSERT INTO `creature_template` VALUES (9101174, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Mythic Greater Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.04', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8179', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.33', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101174 WHERE (`entry` = 8179);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8179) AND (`map` = 209);
-- Mythic Sandfury Acolyte
DELETE FROM `creature_template` WHERE entry = 9101175;
INSERT INTO `creature_template` VALUES (9101175, '0', '0', '0', '0', '0', '6411', '6412', '0', '0', 'Mythic Sandfury Acolyte', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.9', '2000', '1727', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8876', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.34', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101175 WHERE (`entry` = 8876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8876) AND (`map` = 209);
-- Mythic Sandfury Drudge
DELETE FROM `creature_template` WHERE entry = 9101176;
INSERT INTO `creature_template` VALUES (9101176, '0', '0', '0', '0', '0', '6680', '6681', '0', '0', 'Mythic Sandfury Drudge', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.04', '2000', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7788', '7788', '0', '0', '0', '0', '0', '', '1', '1.0', '3.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101176 WHERE (`entry` = 7788);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7788) AND (`map` = 209);
-- Mythic Sandfury Slave
DELETE FROM `creature_template` WHERE entry = 9101177;
INSERT INTO `creature_template` VALUES (9101177, '0', '0', '0', '0', '0', '6678', '6679', '0', '0', 'Mythic Sandfury Slave', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.91', '2000', '1738', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7787', '7787', '0', '0', '0', '0', '0', '', '1', '1.0', '3.37', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101177 WHERE (`entry` = 7787);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7787) AND (`map` = 209);
-- Mythic Sandfury Zealot
DELETE FROM `creature_template` WHERE entry = 9101178;
INSERT INTO `creature_template` VALUES (9101178, '0', '0', '0', '0', '0', '6423', '6424', '0', '0', 'Mythic Sandfury Zealot', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.91', '2400', '1716', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8877', '8877', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101178 WHERE (`entry` = 8877);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8877) AND (`map` = 209);
-- Mythic Scarab
DELETE FROM `creature_template` WHERE entry = 9101179;
INSERT INTO `creature_template` VALUES (9101179, '0', '0', '0', '0', '0', '7470', '0', '0', '0', 'Mythic Scarab', '', NULL, '0', '60', '60', '0', '15', '0', '0.8', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '7269', '0', '100004', '0', '0', '0', '0', '', '1', '1.0', '3.36', '1.0', '1.0', '1.0', '0', '114', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101179 WHERE (`entry` = 7269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7269) AND (`map` = 209);
-- Mythic Skeleton of Zumrah
DELETE FROM `creature_template` WHERE entry = 9101180;
INSERT INTO `creature_template` VALUES (9101180, '0', '0', '0', '0', '0', '200', '0', '0', '0', 'Mythic Skeleton of Zumrah', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '2000', '1826', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.93', '1.0', '1.45', 
'1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101180 WHERE (`entry` = 7786);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7786) AND (`map` = 209);
-- Mythic Sullithuz Broodling
DELETE FROM `creature_template` WHERE entry = 9101181;
INSERT INTO `creature_template` VALUES (9101181, '0', '0', '0', '0', '0', '1075', '0', '0', '0', 'Mythic Sullithuz Broodling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.99', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '8138', '0', '8138', '0', '0', '0', '0', '', '1', '1.0', '2.84', '1.0', 
'2.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101181 WHERE (`entry` = 8138);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8138) AND (`map` = 209);
-- Mythic Ward of Zumrah
DELETE FROM `creature_template` WHERE entry = 9101182;
INSERT INTO `creature_template` VALUES (9101182, '0', '0', '0', '0', '0', '2418', '0', '0', '0', 'Mythic Ward of Zumrah', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.02', '2000', '1705', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.91', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101182 WHERE (`entry` = 7785);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7785) AND (`map` = 209);
-- Mythic ZulFarrak Dead Hero
DELETE FROM `creature_template` WHERE entry = 9101183;
INSERT INTO `creature_template` VALUES (9101183, '0', '0', '0', '0', '0', '6436', '6437', '0', '0', 'Mythic ZulFarrak Dead Hero', NULL, NULL, '0', '60', '60', '0', '37', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.99', '2000', '1384', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7276', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.24', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101183 WHERE (`entry` = 7276);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7276) AND (`map` = 209);