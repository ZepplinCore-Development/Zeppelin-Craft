-- Heroic Arugal's Voidwalker
DELETE FROM `creature_template` WHERE entry = 9100300;
INSERT INTO `creature_template` VALUES (9100300, '0', '0', '0', '0', '0', '1131', '0', '0', '0', 'Heroic Arugal\'s Voidwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4627', '0', '0', '0', '0', '9', '45', '', '1', '1.0', '1.0', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100300 WHERE (`entry` = 4627);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4627);
-- Heroic Bleak Worg
DELETE FROM `creature_template` WHERE entry = 9100301;
INSERT INTO `creature_template` VALUES (9100301, '0', '0', '0', '0', '0', '801', '0', '0', '0', 'Heroic Bleak Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3861', '0', '100006', '13050', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100301 WHERE (`entry` = 3861);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3861);
-- Heroic Blood Seeker
DELETE FROM `creature_template` WHERE entry = 9100302;
INSERT INTO `creature_template` VALUES (9100302, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Heroic Blood Seeker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3868', '0', '100007', '12814', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100302 WHERE (`entry` = 3868);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3868);
-- Heroic Deathstalker Adamant
DELETE FROM `creature_template` WHERE entry = 9100303;
INSERT INTO `creature_template` VALUES (9100303, '0', '0', '0', '0', '0', '2006', '0', '0', '0', 'Heroic Deathstalker Adamant', '', NULL, '21214', '60', '60', '0', '68', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '37440', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3849', '0', '0', '0', '0', '87', '154', '', '0', '1.0', '3.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100303 WHERE (`entry` = 3849);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3849);
-- Heroic Deathstalker Vincent
DELETE FROM `creature_template` WHERE entry = 9100304;
INSERT INTO `creature_template` VALUES (9100304, '0', '0', '0', '0', '0', '2689', '0', '0', '0', 'Heroic Deathstalker Vincent', '', NULL, '0', '60', '60', '0', '714', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '37376', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.02', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100304 WHERE (`entry` = 4444);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4444);
-- Heroic Fel Steed
DELETE FROM `creature_template` WHERE entry = 9100305;
INSERT INTO `creature_template` VALUES (9100305, '0', '0', '0', '0', '0', '1951', '0', '0', '0', 'Heroic Fel Steed', '', NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.4', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3864', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100305 WHERE (`entry` = 3864);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3864);
-- Heroic Haunted Servitor
DELETE FROM `creature_template` WHERE entry = 9100306;
INSERT INTO `creature_template` VALUES (9100306, '0', '0', '0', '0', '0', '3229', '3230', '0', '0', 'Heroic Haunted Servitor', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3875', '0', '0', '0', '0', '33', '215', '', '1', '1.0', '3.0', '1.0', '0.9', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100306 WHERE (`entry` = 3875);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3875);
-- Heroic Haunting Spirit
DELETE FROM `creature_template` WHERE entry = 9100307;
INSERT INTO `creature_template` VALUES (9100307, '0', '0', '0', '0', '0', '985', '0', '0', '0', 'Heroic Haunting Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.25', '2000', '1980', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.02', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100307 WHERE (`entry` = 4958);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4958);
-- Heroic Lupine Delusion
DELETE FROM `creature_template` WHERE entry = 9100308;
INSERT INTO `creature_template` VALUES (9100308, '0', '0', '0', '0', '0', '3123', '0', '0', '0', 'Heroic Lupine Delusion', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.8', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '22', '110', '', '0', '1.0', '1.0', '1.0', '0.85', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100308 WHERE (`entry` = 5097);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5097);
-- Heroic Lupine Horror
DELETE FROM `creature_template` WHERE entry = 9100309;
INSERT INTO `creature_template` VALUES (9100309, '0', '0', '0', '0', '0', '2446', '0', '0', '0', 'Heroic Lupine Horror', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3863', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100309 WHERE (`entry` = 3863);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3863);
-- Heroic Shadow Charger
DELETE FROM `creature_template` WHERE entry = 9100310;
INSERT INTO `creature_template` VALUES (9100310, '0', '0', '0', '0', '0', '1952', '0', '0', '0', 'Heroic Shadow Charger', NULL, NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3865', '0', '100006', '0', '0', '15', '75', '', '1', '1.0', '3.0', '1.0', '1.55', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100310 WHERE (`entry` = 3865);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3865);
-- Heroic Shadowfang Darksoul
DELETE FROM `creature_template` WHERE entry = 9100311;
INSERT INTO `creature_template` VALUES (9100311, '0', '0', '0', '0', '0', '657', '0', '0', '0', 'Heroic Shadowfang Darksoul', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3855', '0', '100006', '0', '0', '40', '209', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100311 WHERE (`entry` = 3855);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3855);
-- Heroic Shadowfang Glutton
DELETE FROM `creature_template` WHERE entry = 9100312;
INSERT INTO `creature_template` VALUES (9100312, '0', '0', '0', '0', '0', '202', '0', '0', '0', 'Heroic Shadowfang Glutton', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3857', '0', '100007', '0', '0', '41', '202', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100312 WHERE (`entry` = 3857);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3857);
-- Heroic Shadowfang Moonwalker
DELETE FROM `creature_template` WHERE entry = 9100313;
INSERT INTO `creature_template` VALUES (9100313, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Heroic Shadowfang Moonwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3853', '0', '100006', '0', '0', '32', '192', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100313 WHERE (`entry` = 3853);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3853);
-- Heroic Shadowfang Ragetooth
DELETE FROM `creature_template` WHERE entry = 9100314;
INSERT INTO `creature_template` VALUES (9100314, '0', '0', '0', '0', '0', '736', '0', '0', '0', 'Heroic Shadowfang Ragetooth', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3859', '0', '100007', '0', '0', '74', '303', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100314 WHERE (`entry` = 3859);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3859);
-- Heroic Shadowfang Whitescalp
DELETE FROM `creature_template` WHERE entry = 9100315;
INSERT INTO `creature_template` VALUES (9100315, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Heroic Shadowfang Whitescalp', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3851', '0', '100006', '0', '0', '30', '178', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100315 WHERE (`entry` = 3851);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3851);
-- Heroic Shadowfang Wolfguard
DELETE FROM `creature_template` WHERE entry = 9100316;
INSERT INTO `creature_template` VALUES (9100316, '0', '0', '0', '0', '0', '203', '0', '0', '0', 'Heroic Shadowfang Wolfguard', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3854', '0', '100006', '0', '0', '16', '164', '', '0', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100316 WHERE (`entry` = 3854);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3854);
-- Heroic Slavering Worg
DELETE FROM `creature_template` WHERE entry = 9100317;
INSERT INTO `creature_template` VALUES (9100317, '0', '0', '0', '0', '0', '11421', '0', '0', '0', 'Heroic Slavering Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3862', '0', '100006', '13032', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100317 WHERE (`entry` = 3862);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3862);
-- Heroic Son of Arugal
DELETE FROM `creature_template` WHERE entry = 9100318;
INSERT INTO `creature_template` VALUES (9100318, '0', '0', '0', '0', '0', '1098', '0', '0', '0', 'Heroic Son of Arugal', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '2529', '0', '100005', '0', '0', '63', '328', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100318 WHERE (`entry` = 2529);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 2529);
-- Heroic Sorcerer Ashcrombe
DELETE FROM `creature_template` WHERE entry = 9100319;
INSERT INTO `creature_template` VALUES (9100319, '0', '0', '0', '0', '0', '2005', '0', '0', '0', 'Heroic Sorcerer Ashcrombe', '', NULL, '21213', '60', '60', '0', '12', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3850', '3850', '0', '0', '0', '59', '108', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100319 WHERE (`entry` = 3850);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3850);
-- Heroic Tormented Officer
DELETE FROM `creature_template` WHERE entry = 9100320;
INSERT INTO `creature_template` VALUES (9100320, '0', '0', '0', '0', '0', '3225', '0', '0', '0', 'Heroic Tormented Officer', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3873', '3873', '0', '0', '0', '48', '290', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100320 WHERE (`entry` = 3873);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3873);
-- Heroic Vile Bat
DELETE FROM `creature_template` WHERE entry = 9100321;
INSERT INTO `creature_template` VALUES (9100321, '0', '0', '0', '0', '0', '8808', '0', '0', '0', 'Heroic Vile Bat', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3866', '0', '100007', '12826', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.9', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100321 WHERE (`entry` = 3866);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3866);
-- Heroic Wailing Guardsman
DELETE FROM `creature_template` WHERE entry = 9100322;
INSERT INTO `creature_template` VALUES (9100322, '0', '0', '0', '0', '0', '3226', '0', '0', '0', 'Heroic Wailing Guardsman', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.15', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3877', '0', '0', '0', '0', '68', '259', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100322 WHERE (`entry` = 3877);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3877);
-- Heroic Wolfguard Worg
DELETE FROM `creature_template` WHERE entry = 9100323;
INSERT INTO `creature_template` VALUES (9100323, '0', '0', '0', '0', '0', '246', '0', '0', '0', 'Heroic Wolfguard Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.7', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '0', '5058', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '1.02', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100323 WHERE (`entry` = 5058);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 5058);
-- Heroic Rethilgore
DELETE FROM `creature_template` WHERE entry = 9100324;
INSERT INTO `creature_template` VALUES (9100324, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Heroic Rethilgore', 'The Cell Keeper', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100006', '0', '0', '51', '206', '', '0', '1.0', '6.06', 
'1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100324 WHERE (`entry` = 3914);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3914);
-- Heroic Razorclaw the Butcher
DELETE FROM `creature_template` WHERE entry = 9100325;
INSERT INTO `creature_template` VALUES (9100325, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Heroic Razorclaw the Butcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100007', '0', '0', '120', '233', '', '1', '1.0', '6.07', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100325 WHERE (`entry` = 3886);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3886);
-- Heroic Baron Silverlaine
DELETE FROM `creature_template` WHERE entry = 9100326;
INSERT INTO `creature_template` VALUES (9100326, '0', '0', '0', '0', '0', '3222', '0', '0', '0', 'Heroic Baron Silverlaine', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '94', '279', '', '1', '1.0', '6.03', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100326 WHERE (`entry` = 3887);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3887);
-- Heroic Commander Springvale
DELETE FROM `creature_template` WHERE entry = 9100327;
INSERT INTO `creature_template` VALUES (9100327, '0', '0', '0', '0', '0', '3223', '0', '0', '0', 'Heroic Commander Springvale', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '115', '271', '', '1', '1.0', '5.81', '2.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100327 WHERE (`entry` = 4278);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4278);
-- Heroic Odo the Blindwatcher
DELETE FROM `creature_template` WHERE entry = 9100328;
INSERT INTO `creature_template` VALUES (9100328, '0', '0', '0', '0', '0', '522', '0', '0', '0', 'Heroic Odo the Blindwatcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100007', '0', '0', '65', '316', '', '1', '1.0', '6.0', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100328 WHERE (`entry` = 4279);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4279);
-- Heroic Deathsworn Captain
DELETE FROM `creature_template` WHERE entry = 9100329;
INSERT INTO `creature_template` VALUES (9100329, '0', '0', '0', '0', '0', '3224', '0', '0', '0', 'Heroic Deathsworn Captain', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.93', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '29', '145', '', '1', '1.0', '6.3', '1.0', '0.85', '2.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100329 WHERE (`entry` = 3872);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3872);
-- Heroic Fenrus the Devourer
DELETE FROM `creature_template` WHERE entry = 9100330;
INSERT INTO `creature_template` VALUES (9100330, '0', '0', '0', '0', '0', '2352', '0', '0', '0', 'Heroic Fenrus the Devourer', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '5.95', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100330 WHERE (`entry` = 4274);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4274);
-- Heroic Wolf Master Nandos
DELETE FROM `creature_template` WHERE entry = 9100331;
INSERT INTO `creature_template` VALUES (9100331, '0', '0', '0', '0', '0', '11179', '0', '0', '0', 'Heroic Wolf Master Nandos', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100012', '0', '0', '114', '338', '', '1', '1.0', '6.3', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100331 WHERE (`entry` = 3927);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 3927);
-- Heroic Archmage Arugal
DELETE FROM `creature_template` WHERE entry = 9100332;
INSERT INTO `creature_template` VALUES (9100332, '0', '0', '0', '0', '0', '2353', '0', '0', '0', 'Heroic Archmage Arugal', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4275', '0', '0', '0', '118', '425', '', '1', '1.0', '5.98', '4.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100332 WHERE (`entry` = 4275);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4275);