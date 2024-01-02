-- Heroic Bleak Worg
DELETE FROM `creature_template` WHERE entry = 9100300;
INSERT INTO `creature_template` VALUES (9100300, '0', '0', '0', '0', '0', '801', '0', '0', '0', 'Heroic Bleak Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3861', '0', '100006', '13050', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100300 WHERE (`entry` = 3861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3861) AND (`map` = 33);
-- Heroic Blood Seeker
DELETE FROM `creature_template` WHERE entry = 9100301;
INSERT INTO `creature_template` VALUES (9100301, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Heroic Blood Seeker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3868', '0', '100007', '12814', '0', '0', '0', '', '1', '1.0', '3.36', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100301 WHERE (`entry` = 3868);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3868) AND (`map` = 33);
-- Heroic Deathstalker Adamant
DELETE FROM `creature_template` WHERE entry = 9100302;
INSERT INTO `creature_template` VALUES (9100302, '0', '0', '0', '0', '0', '2006', '0', '0', '0', 'Heroic Deathstalker Adamant', '', NULL, '21214', '60', '60', '0', '68', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '37440', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3849', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100302 WHERE (`entry` = 3849);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3849) AND (`map` = 33);
-- Heroic Fel Steed
DELETE FROM `creature_template` WHERE entry = 9100303;
INSERT INTO `creature_template` VALUES (9100303, '0', '0', '0', '0', '0', '1951', '0', '0', '0', 'Heroic Fel Steed', '', NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3864', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.29', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100303 WHERE (`entry` = 3864);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3864) AND (`map` = 33);
-- Heroic Haunted Servitor
DELETE FROM `creature_template` WHERE entry = 9100304;
INSERT INTO `creature_template` VALUES (9100304, '0', '0', '0', '0', '0', '3229', '3230', '0', '0', 'Heroic Haunted Servitor', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3875', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.85', '1.0', '0.9', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100304 WHERE (`entry` = 3875);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3875) AND (`map` = 33);
-- Heroic Lupine Horror
DELETE FROM `creature_template` WHERE entry = 9100305;
INSERT INTO `creature_template` VALUES (9100305, '0', '0', '0', '0', '0', '2446', '0', '0', '0', 'Heroic Lupine Horror', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3863', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.95', '1.0', '0.85', '1.0', 
'0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100305 WHERE (`entry` = 3863);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3863) AND (`map` = 33);
-- Heroic Shadow Charger
DELETE FROM `creature_template` WHERE entry = 9100306;
INSERT INTO `creature_template` VALUES (9100306, '0', '0', '0', '0', '0', '1952', '0', '0', '0', 'Heroic Shadow Charger', NULL, NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3865', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.04', '1.0', '1.55', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100306 WHERE (`entry` = 3865);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3865) AND (`map` = 33);
-- Heroic Shadowfang Darksoul
DELETE FROM `creature_template` WHERE entry = 9100307;
INSERT INTO `creature_template` VALUES (9100307, '0', '0', '0', '0', '0', '657', '0', '0', '0', 'Heroic Shadowfang Darksoul', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3855', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '2.88', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100307 WHERE (`entry` = 3855);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3855) AND (`map` = 33);
-- Heroic Shadowfang Glutton
DELETE FROM `creature_template` WHERE entry = 9100308;
INSERT INTO `creature_template` VALUES (9100308, '0', '0', '0', '0', '0', '202', '0', '0', '0', 'Heroic Shadowfang Glutton', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3857', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '3.15', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100308 WHERE (`entry` = 3857);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3857) AND (`map` = 33);
-- Heroic Shadowfang Moonwalker
DELETE FROM `creature_template` WHERE entry = 9100309;
INSERT INTO `creature_template` VALUES (9100309, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Heroic Shadowfang Moonwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3853', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.27', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100309 WHERE (`entry` = 3853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3853) AND (`map` = 33);
-- Heroic Shadowfang Ragetooth
DELETE FROM `creature_template` WHERE entry = 9100310;
INSERT INTO `creature_template` VALUES (9100310, '0', '0', '0', '0', '0', '736', '0', '0', '0', 'Heroic Shadowfang Ragetooth', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3859', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '3.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100310 WHERE (`entry` = 3859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3859) AND (`map` = 33);
-- Heroic Shadowfang Whitescalp
DELETE FROM `creature_template` WHERE entry = 9100311;
INSERT INTO `creature_template` VALUES (9100311, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Heroic Shadowfang Whitescalp', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3851', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.38', '2.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100311 WHERE (`entry` = 3851);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3851) AND (`map` = 33);
-- Heroic Shadowfang Wolfguard
DELETE FROM `creature_template` WHERE entry = 9100312;
INSERT INTO `creature_template` VALUES (9100312, '0', '0', '0', '0', '0', '203', '0', '0', '0', 'Heroic Shadowfang Wolfguard', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3854', '0', '100006', '0', '0', '0', '0', '', '0', '1.0', '3.24', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100312 WHERE (`entry` = 3854);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3854) AND (`map` = 33);
-- Heroic Slavering Worg
DELETE FROM `creature_template` WHERE entry = 9100313;
INSERT INTO `creature_template` VALUES (9100313, '0', '0', '0', '0', '0', '11421', '0', '0', '0', 'Heroic Slavering Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3862', '0', '100006', '13032', '0', '0', '0', '', '1', '1.0', '3.04', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100313 WHERE (`entry` = 3862);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3862) AND (`map` = 33);
-- Heroic Son of Arugal
DELETE FROM `creature_template` WHERE entry = 9100314;
INSERT INTO `creature_template` VALUES (9100314, '0', '0', '0', '0', '0', '1098', '0', '0', '0', 'Heroic Son of Arugal', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '2529', '0', '100005', '0', '0', '0', '0', '', '1', '1.0', '2.82', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100314 WHERE (`entry` = 2529);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2529) AND (`map` = 33);
-- Heroic Sorcerer Ashcrombe
DELETE FROM `creature_template` WHERE entry = 9100315;
INSERT INTO `creature_template` VALUES (9100315, '0', '0', '0', '0', '0', '2005', '0', '0', '0', 'Heroic Sorcerer Ashcrombe', '', NULL, '21213', '60', '60', '0', '12', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3850', '3850', '0', '0', '0', '0', '0', '', '1', '1.0', '2.9', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100315 WHERE (`entry` = 3850);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3850) AND (`map` = 33);
-- Heroic Tormented Officer
DELETE FROM `creature_template` WHERE entry = 9100316;
INSERT INTO `creature_template` VALUES (9100316, '0', '0', '0', '0', '0', '3225', '0', '0', '0', 'Heroic Tormented Officer', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3873', '3873', '0', '0', '0', '0', '0', '', '1', '1.0', '3.01', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100316 WHERE (`entry` = 3873);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3873) AND (`map` = 33);
-- Heroic Vile Bat
DELETE FROM `creature_template` WHERE entry = 9100317;
INSERT INTO `creature_template` VALUES (9100317, '0', '0', '0', '0', '0', '8808', '0', '0', '0', 'Heroic Vile Bat', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3866', '0', '100007', '12826', '0', '0', '0', '', '1', '1.0', '3.13', '1.0', '0.9', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100317 WHERE (`entry` = 3866);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3866) AND (`map` = 33);
-- Heroic Wailing Guardsman
DELETE FROM `creature_template` WHERE entry = 9100318;
INSERT INTO `creature_template` VALUES (9100318, '0', '0', '0', '0', '0', '3226', '0', '0', '0', 'Heroic Wailing Guardsman', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3877', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100318 WHERE (`entry` = 3877);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3877) AND (`map` = 33);
-- Heroic Rethilgore
DELETE FROM `creature_template` WHERE entry = 9100319;
INSERT INTO `creature_template` VALUES (9100319, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Heroic Rethilgore', 'The Cell Keeper', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100006', '0', '0', '0', '0', '', '0', '1.0', '6.22', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100319 WHERE (`entry` = 3914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3914) AND (`map` = 33);
-- Heroic Razorclaw the Butcher
DELETE FROM `creature_template` WHERE entry = 9100320;
INSERT INTO `creature_template` VALUES (9100320, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Heroic Razorclaw the Butcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '5.91', '1.0', 
'1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100320 WHERE (`entry` = 3886);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3886) AND (`map` = 33);
-- Heroic Baron Silverlaine
DELETE FROM `creature_template` WHERE entry = 9100321;
INSERT INTO `creature_template` VALUES (9100321, '0', '0', '0', '0', '0', '3222', '0', '0', '0', 'Heroic Baron Silverlaine', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.39', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100321 WHERE (`entry` = 3887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3887) AND (`map` = 33);
-- Heroic Commander Springvale
DELETE FROM `creature_template` WHERE entry = 9100322;
INSERT INTO `creature_template` VALUES (9100322, '0', '0', '0', '0', '0', '3223', '0', '0', '0', 'Heroic Commander Springvale', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.21', '2.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100322 WHERE (`entry` = 4278);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4278) AND (`map` = 33);
-- Heroic Odo the Blindwatcher
DELETE FROM `creature_template` WHERE entry = 9100323;
INSERT INTO `creature_template` VALUES (9100323, '0', '0', '0', '0', '0', '522', '0', '0', '0', 'Heroic Odo the Blindwatcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '6.49', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100323 WHERE (`entry` = 4279);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4279) AND (`map` = 33);
-- Heroic Deathsworn Captain
DELETE FROM `creature_template` WHERE entry = 9100324;
INSERT INTO `creature_template` VALUES (9100324, '0', '0', '0', '0', '0', '3224', '0', '0', '0', 'Heroic Deathsworn Captain', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.9', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.5', '1.0', '0.85', 
'2.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100324 WHERE (`entry` = 3872);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3872) AND (`map` = 33);
-- Heroic Fenrus the Devourer
DELETE FROM `creature_template` WHERE entry = 9100325;
INSERT INTO `creature_template` VALUES (9100325, '0', '0', '0', '0', '0', '2352', '0', '0', '0', 'Heroic Fenrus the Devourer', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '6.28', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100325 WHERE (`entry` = 4274);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4274) AND (`map` = 33);
-- Heroic Wolf Master Nandos
DELETE FROM `creature_template` WHERE entry = 9100326;
INSERT INTO `creature_template` VALUES (9100326, '0', '0', '0', '0', '0', '11179', '0', '0', '0', 'Heroic Wolf Master Nandos', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '6.09', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100326 WHERE (`entry` = 3927);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3927) AND (`map` = 33);
-- Heroic Archmage Arugal
DELETE FROM `creature_template` WHERE entry = 9100327;
INSERT INTO `creature_template` VALUES (9100327, '0', '0', '0', '0', '0', '2353', '0', '0', '0', 'Heroic Archmage Arugal', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4275', '0', '0', '0', '0', '0', '', '1', '1.0', '6.38', '4.0', '0.85', 
'2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100327 WHERE (`entry` = 4275);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4275) AND (`map` = 33);
-- Heroic Arugals Voidwalker
DELETE FROM `creature_template` WHERE entry = 9100328;
INSERT INTO `creature_template` VALUES (9100328, '0', '0', '0', '0', '0', '1131', '0', '0', '0', 'Heroic Arugals Voidwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '0.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4627', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.23', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100328 WHERE (`entry` = 4627);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4627) AND (`map` = 33);
-- Heroic Deathstalker Vincent
DELETE FROM `creature_template` WHERE entry = 9100329;
INSERT INTO `creature_template` VALUES (9100329, '0', '0', '0', '0', '0', '2689', '0', '0', '0', 'Heroic Deathstalker Vincent', '', NULL, '0', '60', '60', '0', '714', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '37376', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.2', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100329 WHERE (`entry` = 4444);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4444) AND (`map` = 33);
-- Heroic Haunting Spirit
DELETE FROM `creature_template` WHERE entry = 9100330;
INSERT INTO `creature_template` VALUES (9100330, '0', '0', '0', '0', '0', '985', '0', '0', '0', 'Heroic Haunting Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.9', '2000', '1980', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.49', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100330 WHERE (`entry` = 4958);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4958) AND (`map` = 33);
-- Heroic Lupine Delusion
DELETE FROM `creature_template` WHERE entry = 9100331;
INSERT INTO `creature_template` VALUES (9100331, '0', '0', '0', '0', '0', '3123', '0', '0', '0', 'Heroic Lupine Delusion', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.85', '1.0', '0.85', '1.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100331 WHERE (`entry` = 5097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5097) AND (`map` = 33);
-- Heroic Wolfguard Worg
DELETE FROM `creature_template` WHERE entry = 9100332;
INSERT INTO `creature_template` VALUES (9100332, '0', '0', '0', '0', '0', '246', '0', '0', '0', 'Heroic Wolfguard Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.08', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '0', '5058', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '2.09', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100332 WHERE (`entry` = 5058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5058) AND (`map` = 33);
-- Mythic Bleak Worg
DELETE FROM `creature_template` WHERE entry = 9100333;
INSERT INTO `creature_template` VALUES (9100333, '0', '0', '0', '0', '0', '801', '0', '0', '0', 'Mythic Bleak Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3861', '0', '100006', '13050', '0', '0', '0', '', '1', '1.0', '4.22', '1.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100333 WHERE (`entry` = 3861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3861) AND (`map` = 33);
-- Mythic Blood Seeker
DELETE FROM `creature_template` WHERE entry = 9100334;
INSERT INTO `creature_template` VALUES (9100334, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Mythic Blood Seeker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3868', '0', '100007', '12814', '0', '0', '0', '', '1', '1.0', '3.85', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100334 WHERE (`entry` = 3868);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3868) AND (`map` = 33);
-- Mythic Deathstalker Adamant
DELETE FROM `creature_template` WHERE entry = 9100335;
INSERT INTO `creature_template` VALUES (9100335, '0', '0', '0', '0', '0', '2006', '0', '0', '0', 'Mythic Deathstalker Adamant', '', NULL, '21214', '60', '60', '0', '68', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '37440', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3849', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.14', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100335 WHERE (`entry` = 3849);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3849) AND (`map` = 33);
-- Mythic Fel Steed
DELETE FROM `creature_template` WHERE entry = 9100336;
INSERT INTO `creature_template` VALUES (9100336, '0', '0', '0', '0', '0', '1951', '0', '0', '0', 'Mythic Fel Steed', '', NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3864', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '4.36', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100336 WHERE (`entry` = 3864);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3864) AND (`map` = 33);
-- Mythic Haunted Servitor
DELETE FROM `creature_template` WHERE entry = 9100337;
INSERT INTO `creature_template` VALUES (9100337, '0', '0', '0', '0', '0', '3229', '3230', '0', '0', 'Mythic Haunted Servitor', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3875', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '1.0', '0.9', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100337 WHERE (`entry` = 3875);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3875) AND (`map` = 33);
-- Mythic Lupine Horror
DELETE FROM `creature_template` WHERE entry = 9100338;
INSERT INTO `creature_template` VALUES (9100338, '0', '0', '0', '0', '0', '2446', '0', '0', '0', 'Mythic Lupine Horror', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3863', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.33', '1.0', '0.85', '1.0', 
'0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100338 WHERE (`entry` = 3863);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3863) AND (`map` = 33);
-- Mythic Shadow Charger
DELETE FROM `creature_template` WHERE entry = 9100339;
INSERT INTO `creature_template` VALUES (9100339, '0', '0', '0', '0', '0', '1952', '0', '0', '0', 'Mythic Shadow Charger', NULL, NULL, '0', '60', '60', '0', '15', '0', '1.0', '1.28571', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '3865', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '4.3', '1.0', '1.55', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100339 WHERE (`entry` = 3865);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3865) AND (`map` = 33);
-- Mythic Shadowfang Darksoul
DELETE FROM `creature_template` WHERE entry = 9100340;
INSERT INTO `creature_template` VALUES (9100340, '0', '0', '0', '0', '0', '657', '0', '0', '0', 'Mythic Shadowfang Darksoul', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3855', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '4.37', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100340 WHERE (`entry` = 3855);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3855) AND (`map` = 33);
-- Mythic Shadowfang Glutton
DELETE FROM `creature_template` WHERE entry = 9100341;
INSERT INTO `creature_template` VALUES (9100341, '0', '0', '0', '0', '0', '202', '0', '0', '0', 'Mythic Shadowfang Glutton', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3857', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '4.1', '2.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100341 WHERE (`entry` = 3857);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3857) AND (`map` = 33);
-- Mythic Shadowfang Moonwalker
DELETE FROM `creature_template` WHERE entry = 9100342;
INSERT INTO `creature_template` VALUES (9100342, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Mythic Shadowfang Moonwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3853', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '4.06', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100342 WHERE (`entry` = 3853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3853) AND (`map` = 33);
-- Mythic Shadowfang Ragetooth
DELETE FROM `creature_template` WHERE entry = 9100343;
INSERT INTO `creature_template` VALUES (9100343, '0', '0', '0', '0', '0', '736', '0', '0', '0', 'Mythic Shadowfang Ragetooth', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3859', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100343 WHERE (`entry` = 3859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3859) AND (`map` = 33);
-- Mythic Shadowfang Whitescalp
DELETE FROM `creature_template` WHERE entry = 9100344;
INSERT INTO `creature_template` VALUES (9100344, '0', '0', '0', '0', '0', '729', '0', '0', '0', 'Mythic Shadowfang Whitescalp', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3851', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '4.34', '2.0', '1.0', '1.0', '0', '0', '1', '0', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100344 WHERE (`entry` = 3851);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3851) AND (`map` = 33);
-- Mythic Shadowfang Wolfguard
DELETE FROM `creature_template` WHERE entry = 9100345;
INSERT INTO `creature_template` VALUES (9100345, '0', '0', '0', '0', '0', '203', '0', '0', '0', 'Mythic Shadowfang Wolfguard', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3854', '0', '100006', '0', '0', '0', '0', '', '0', '1.0', '4.18', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100345 WHERE (`entry` = 3854);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3854) AND (`map` = 33);
-- Mythic Slavering Worg
DELETE FROM `creature_template` WHERE entry = 9100346;
INSERT INTO `creature_template` VALUES (9100346, '0', '0', '0', '0', '0', '11421', '0', '0', '0', 'Mythic Slavering Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '3862', '0', '100006', '13032', '0', '0', '0', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100346 WHERE (`entry` = 3862);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3862) AND (`map` = 33);
-- Mythic Son of Arugal
DELETE FROM `creature_template` WHERE entry = 9100347;
INSERT INTO `creature_template` VALUES (9100347, '0', '0', '0', '0', '0', '1098', '0', '0', '0', 'Mythic Son of Arugal', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '2529', '0', '100005', '0', '0', '0', '0', '', '1', '1.0', '4.07', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100347 WHERE (`entry` = 2529);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2529) AND (`map` = 33);
-- Mythic Sorcerer Ashcrombe
DELETE FROM `creature_template` WHERE entry = 9100348;
INSERT INTO `creature_template` VALUES (9100348, '0', '0', '0', '0', '0', '2005', '0', '0', '0', 'Mythic Sorcerer Ashcrombe', '', NULL, '21213', '60', '60', '0', '12', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3850', '3850', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100348 WHERE (`entry` = 3850);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3850) AND (`map` = 33);
-- Mythic Tormented Officer
DELETE FROM `creature_template` WHERE entry = 9100349;
INSERT INTO `creature_template` VALUES (9100349, '0', '0', '0', '0', '0', '3225', '0', '0', '0', 'Mythic Tormented Officer', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3873', '3873', '0', '0', '0', '0', '0', '', '1', '1.0', '4.07', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100349 WHERE (`entry` = 3873);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3873) AND (`map` = 33);
-- Mythic Vile Bat
DELETE FROM `creature_template` WHERE entry = 9100350;
INSERT INTO `creature_template` VALUES (9100350, '0', '0', '0', '0', '0', '8808', '0', '0', '0', 'Mythic Vile Bat', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '3866', '0', '100007', '12826', '0', '0', '0', '', '1', '1.0', '3.88', '1.0', '0.9', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100350 WHERE (`entry` = 3866);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3866) AND (`map` = 33);
-- Mythic Wailing Guardsman
DELETE FROM `creature_template` WHERE entry = 9100351;
INSERT INTO `creature_template` VALUES (9100351, '0', '0', '0', '0', '0', '3226', '0', '0', '0', 'Mythic Wailing Guardsman', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '3877', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100351 WHERE (`entry` = 3877);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3877) AND (`map` = 33);
-- Mythic Rethilgore
DELETE FROM `creature_template` WHERE entry = 9100352;
INSERT INTO `creature_template` VALUES (9100352, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Mythic Rethilgore', 'The Cell Keeper', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '100006', '0', '0', '0', '0', '', '0', '1.0', '8.19', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100352 WHERE (`entry` = 3914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3914) AND (`map` = 33);
-- Mythic Razorclaw the Butcher
DELETE FROM `creature_template` WHERE entry = 9100353;
INSERT INTO `creature_template` VALUES (9100353, '0', '0', '0', '0', '0', '524', '0', '0', '0', 'Mythic Razorclaw the Butcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '8.47', '1.0', 
'1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100353 WHERE (`entry` = 3886);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3886) AND (`map` = 33);
-- Mythic Baron Silverlaine
DELETE FROM `creature_template` WHERE entry = 9100354;
INSERT INTO `creature_template` VALUES (9100354, '0', '0', '0', '0', '0', '3222', '0', '0', '0', 'Mythic Baron Silverlaine', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.43', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100354 WHERE (`entry` = 3887);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3887) AND (`map` = 33);
-- Mythic Commander Springvale
DELETE FROM `creature_template` WHERE entry = 9100355;
INSERT INTO `creature_template` VALUES (9100355, '0', '0', '0', '0', '0', '3223', '0', '0', '0', 'Mythic Commander Springvale', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '2.0', '0.9', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100355 WHERE (`entry` = 4278);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4278) AND (`map` = 33);
-- Mythic Odo the Blindwatcher
DELETE FROM `creature_template` WHERE entry = 9100356;
INSERT INTO `creature_template` VALUES (9100356, '0', '0', '0', '0', '0', '522', '0', '0', '0', 'Mythic Odo the Blindwatcher', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '100007', '0', '0', '0', '0', '', '1', '1.0', '8.41', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100356 WHERE (`entry` = 4279);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4279) AND (`map` = 33);
-- Mythic Deathsworn Captain
DELETE FROM `creature_template` WHERE entry = 9100357;
INSERT INTO `creature_template` VALUES (9100357, '0', '0', '0', '0', '0', '3224', '0', '0', '0', 'Mythic Deathsworn Captain', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.03', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.0', '1.0', '0.85', '2.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100357 WHERE (`entry` = 3872);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3872) AND (`map` = 33);
-- Mythic Fenrus the Devourer
DELETE FROM `creature_template` WHERE entry = 9100358;
INSERT INTO `creature_template` VALUES (9100358, '0', '0', '0', '0', '0', '2352', '0', '0', '0', 'Mythic Fenrus the Devourer', '', NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '7.85', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100358 WHERE (`entry` = 4274);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4274) AND (`map` = 33);
-- Mythic Wolf Master Nandos
DELETE FROM `creature_template` WHERE entry = 9100359;
INSERT INTO `creature_template` VALUES (9100359, '0', '0', '0', '0', '0', '11179', '0', '0', '0', 'Mythic Wolf Master Nandos', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '100012', '0', '0', '0', '0', '', '1', '1.0', '8.49', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100359 WHERE (`entry` = 3927);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3927) AND (`map` = 33);
-- Mythic Archmage Arugal
DELETE FROM `creature_template` WHERE entry = 9100360;
INSERT INTO `creature_template` VALUES (9100360, '0', '0', '0', '0', '0', '2353', '0', '0', '0', 'Mythic Archmage Arugal', '', NULL, '0', '63', '63', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4275', '0', '0', '0', '0', '0', '', '1', '1.0', '8.03', '4.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100360 WHERE (`entry` = 4275);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4275) AND (`map` = 33);
-- Mythic Arugals Voidwalker
DELETE FROM `creature_template` WHERE entry = 9100361;
INSERT INTO `creature_template` VALUES (9100361, '0', '0', '0', '0', '0', '1131', '0', '0', '0', 'Mythic Arugals Voidwalker', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '4627', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.95', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100361 WHERE (`entry` = 4627);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4627) AND (`map` = 33);
-- Mythic Deathstalker Vincent
DELETE FROM `creature_template` WHERE entry = 9100362;
INSERT INTO `creature_template` VALUES (9100362, '0', '0', '0', '0', '0', '2689', '0', '0', '0', 'Mythic Deathstalker Vincent', '', NULL, '0', '60', '60', '0', '714', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '37376', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.49', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100362 WHERE (`entry` = 4444);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4444) AND (`map` = 33);
-- Mythic Haunting Spirit
DELETE FROM `creature_template` WHERE entry = 9100363;
INSERT INTO `creature_template` VALUES (9100363, '0', '0', '0', '0', '0', '985', '0', '0', '0', 'Mythic Haunting Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.99', '2000', '1980', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.04', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100363 WHERE (`entry` = 4958);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4958) AND (`map` = 33);
-- Mythic Lupine Delusion
DELETE FROM `creature_template` WHERE entry = 9100364;
INSERT INTO `creature_template` VALUES (9100364, '0', '0', '0', '0', '0', '3123', '0', '0', '0', 'Mythic Lupine Delusion', NULL, NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.96', '1.0', '0.85', '1.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100364 WHERE (`entry` = 5097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5097) AND (`map` = 33);
-- Mythic Wolfguard Worg
DELETE FROM `creature_template` WHERE entry = 9100365;
INSERT INTO `creature_template` VALUES (9100365, '0', '0', '0', '0', '0', '246', '0', '0', '0', 'Mythic Wolfguard Worg', '', NULL, '0', '60', '60', '0', '24', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.07', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '0', '5058', '0', '100006', '0', '0', '0', '0', '', '1', '1.0', '3.46', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100365 WHERE (`entry` = 5058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 5058) AND (`map` = 33);