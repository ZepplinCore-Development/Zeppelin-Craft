-- Heroic Defias Blackguard
DELETE FROM `creature_template` WHERE entry = 9100200;
INSERT INTO `creature_template` VALUES (9100200, '0', '0', '0', '0', '0', '2314', '2315', '0', '0', 'Heroic Defias Blackguard', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '636', '636', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100200 WHERE (`entry` = 636);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 636);
-- Heroic Defias Squallshaper
DELETE FROM `creature_template` WHERE entry = 9100201;
INSERT INTO `creature_template` VALUES (9100201, '0', '0', '0', '0', '0', '2349', '2350', '0', '0', 'Heroic Defias Squallshaper', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1732', '1732', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100201 WHERE (`entry` = 1732);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1732);
-- Heroic Goblin Shipbuilder
DELETE FROM `creature_template` WHERE entry = 9100202;
INSERT INTO `creature_template` VALUES (9100202, '0', '0', '0', '0', '0', '7112', '0', '0', '0', 'Heroic Goblin Shipbuilder', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3947', '3947', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100202 WHERE (`entry` = 3947);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3947);
-- Heroic Defias Taskmaster
DELETE FROM `creature_template` WHERE entry = 9100203;
INSERT INTO `creature_template` VALUES (9100203, '0', '0', '0', '0', '0', '2440', '2443', '0', '0', 'Heroic Defias Taskmaster', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.85', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4417', '4417', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100203 WHERE (`entry` = 4417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4417);
-- Heroic Defias Wizard
DELETE FROM `creature_template` WHERE entry = 9100204;
INSERT INTO `creature_template` VALUES (9100204, '0', '0', '0', '0', '0', '2447', '2448', '0', '0', 'Heroic Defias Wizard', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4418', '4418', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100204 WHERE (`entry` = 4418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4418);
-- Heroic Goblin Craftsman
DELETE FROM `creature_template` WHERE entry = 9100205;
INSERT INTO `creature_template` VALUES (9100205, '0', '0', '0', '0', '0', '7110', '0', '0', '0', 'Heroic Goblin Craftsman', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1731', '1731', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100205 WHERE (`entry` = 1731);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1731);
-- Heroic Goblin Engineer
DELETE FROM `creature_template` WHERE entry = 9100206;
INSERT INTO `creature_template` VALUES (9100206, '0', '0', '0', '0', '0', '7109', '0', '0', '0', 'Heroic Goblin Engineer', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '622', '622', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100206 WHERE (`entry` = 622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 622);
-- Heroic Goblin Woodcarver
DELETE FROM `creature_template` WHERE entry = 9100207;
INSERT INTO `creature_template` VALUES (9100207, '0', '0', '0', '0', '0', '7111', '0', '0', '0', 'Heroic Goblin Woodcarver', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '641', '641', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100207 WHERE (`entry` = 641);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 641);
-- Heroic Defias Strip Miner
DELETE FROM `creature_template` WHERE entry = 9100208;
INSERT INTO `creature_template` VALUES (9100208, '0', '0', '0', '0', '0', '2438', '341', '0', '0', 'Heroic Defias Strip Miner', NULL, NULL, '0', '60', '60', '0', '17', '0', '0.666668', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4416', '4416', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100208 WHERE (`entry` = 4416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4416);
-- Heroic Remote-Controlled Golem
DELETE FROM `creature_template` WHERE entry = 9100209;
INSERT INTO `creature_template` VALUES (9100209, '0', '0', '0', '0', '0', '1159', '0', '0', '0', 'Heroic Remote-Controlled Golem', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.6', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100209 WHERE (`entry` = 2520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2520);
-- Heroic Defias Evoker
DELETE FROM `creature_template` WHERE entry = 9100210;
INSERT INTO `creature_template` VALUES (9100210, '0', '0', '0', '0', '0', '2318', '2319', '0', '0', 'Heroic Defias Evoker', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1729', '1729', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.55', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100210 WHERE (`entry` = 1729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1729);
-- Heroic Defias Overseer
DELETE FROM `creature_template` WHERE entry = 9100211;
INSERT INTO `creature_template` VALUES (9100211, '0', '0', '0', '0', '0', '2316', '2317', '0', '0', 'Heroic Defias Overseer', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.8', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '634', '634', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100211 WHERE (`entry` = 634);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 634);
-- Heroic Defias Miner
DELETE FROM `creature_template` WHERE entry = 9100212;
INSERT INTO `creature_template` VALUES (9100212, '0', '0', '0', '0', '0', '308', '2444', '0', '0', 'Heroic Defias Miner', NULL, NULL, '0', '60', '60', '0', '17', '0', '0.666668', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '598', '598', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100212 WHERE (`entry` = 598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 598);
-- Heroic Defias Watchman
DELETE FROM `creature_template` WHERE entry = 9100213;
INSERT INTO `creature_template` VALUES (9100213, '0', '0', '0', '0', '0', '184', '0', '0', '0', 'Heroic Defias Watchman', '', NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1725', '1725', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100213 WHERE (`entry` = 1725);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1725);
-- Heroic Defias Companion
DELETE FROM `creature_template` WHERE entry = 9100214;
INSERT INTO `creature_template` VALUES (9100214, '0', '0', '0', '0', '0', '5207', '0', '0', '0', 'Heroic Defias Companion', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '0.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100214 WHERE (`entry` = 3450);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3450);
-- Heroic Defias Pirate
DELETE FROM `creature_template` WHERE entry = 9100215;
INSERT INTO `creature_template` VALUES (9100215, '0', '0', '0', '0', '0', '2347', '2348', '0', '0', 'Heroic Defias Pirate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '657', '657', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100215 WHERE (`entry` = 657);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 657);
-- Heroic Miner Johnson
DELETE FROM `creature_template` WHERE entry = 9100216;
INSERT INTO `creature_template` VALUES (9100216, '0', '0', '0', '0', '0', '556', '0', '0', '0', 'Heroic Miner Johnson', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.04', '1500', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.27', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100216 WHERE (`entry` = 3586);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3586);
-- Heroic Edwin VanCleef
DELETE FROM `creature_template` WHERE entry = 9100217;
INSERT INTO `creature_template` VALUES (9100217, '0', '0', '0', '0', '0', '2029', '0', '0', '0', 'Heroic Edwin VanCleef', 'Defias Kingpin', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.03', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '639', '0', '0', '0', '0', '0', '', '0', '1.0', '6.29', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100217 WHERE (`entry` = 639);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 639);
-- Heroic Captain Greenskin
DELETE FROM `creature_template` WHERE entry = 9100218;
INSERT INTO `creature_template` VALUES (9100218, '0', '0', '0', '0', '0', '7113', '0', '0', '0', 'Heroic Captain Greenskin', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '647', '0', '0', '0', '0', '0', '', '1', '1.0', '6.42', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100218 WHERE (`entry` = 647);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 647);
-- Heroic Cookie
DELETE FROM `creature_template` WHERE entry = 9100219;
INSERT INTO `creature_template` VALUES (9100219, '0', '0', '0', '0', '0', '1305', '0', '0', '0', 'Heroic Cookie', 'The Ship''s Cook', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '645', '0', '0', '0', '0', '0', '', '1', '1.0', '6.44', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100219 WHERE (`entry` = 645);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 645);
-- Heroic Gilnid
DELETE FROM `creature_template` WHERE entry = 9100220;
INSERT INTO `creature_template` VALUES (9100220, '0', '0', '0', '0', '0', '7124', '0', '0', '0', 'Heroic Gilnid', 'The Smelter', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1763', '0', '0', '0', '0', '0', '', '1', '1.0', '6.48', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100220 WHERE (`entry` = 1763);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1763);
-- Heroic Mr. Smite
DELETE FROM `creature_template` WHERE entry = 9100221;
INSERT INTO `creature_template` VALUES (9100221, '0', '0', '0', '0', '0', '2026', '0', '0', '0', 'Heroic Mr. Smite', 'The Ship''s First Mate', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '646', '0', '0', '0', '0', '0', '', '1', '1.0', '6.04', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100221 WHERE (`entry` = 646);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 646);
-- Heroic Sneed
DELETE FROM `creature_template` WHERE entry = 9100222;
INSERT INTO `creature_template` VALUES (9100222, '0', '0', '0', '0', '0', '7125', '0', '0', '0', 'Heroic Sneed', 'Lumbermaster', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '643', '0', '0', '0', '0', '0', '', '1', '1.0', '5.9', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100222 WHERE (`entry` = 643);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 643);
-- Heroic Sneeds Shredder
DELETE FROM `creature_template` WHERE entry = 9100223;
INSERT INTO `creature_template` VALUES (9100223, '0', '0', '0', '0', '0', '1269', '0', '0', '0', 'Heroic Sneeds Shredder', 'Lumbermaster', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '9100400', '0', '100031', '0', '0', '0', '0', '', '1', '1.0', '6.37', '1.0', '1.0', '2.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100223 WHERE (`entry` = 642);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 642);
-- Heroic Rhahk Zor
DELETE FROM `creature_template` WHERE entry = 9100224;
INSERT INTO `creature_template` VALUES (9100224, '0', '0', '0', '0', '0', '14403', '0', '0', '0', 'Heroic Rhahk Zor', 'The Foreman', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '3500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '644', '0', '0', '0', '0', '0', '', '0', '1.0', '6.29', '1.0', '1.0', '2.0', '0', '0', '1', '617299807', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100224 WHERE (`entry` = 644);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 644);
-- Mythic Defias Blackguard
DELETE FROM `creature_template` WHERE entry = 9100225;
INSERT INTO `creature_template` VALUES (9100225, '0', '0', '0', '0', '0', '2314', '2315', '0', '0', 'Mythic Defias Blackguard', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '636', '636', '0', '0', '0', '0', '0', '', '1', '1.0', '4.09', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100225 WHERE (`entry` = 636);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 636);
-- Mythic Defias Squallshaper
DELETE FROM `creature_template` WHERE entry = 9100226;
INSERT INTO `creature_template` VALUES (9100226, '0', '0', '0', '0', '0', '2349', '2350', '0', '0', 'Mythic Defias Squallshaper', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1732', '1732', '0', '0', '0', '0', '0', '', '1', '1.0', '3.93', '2.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100226 WHERE (`entry` = 1732);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1732);
-- Mythic Goblin Shipbuilder
DELETE FROM `creature_template` WHERE entry = 9100227;
INSERT INTO `creature_template` VALUES (9100227, '0', '0', '0', '0', '0', '7112', '0', '0', '0', 'Mythic Goblin Shipbuilder', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '3947', '3947', '0', '0', '0', '0', '0', '', '1', '1.0', '4.27', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100227 WHERE (`entry` = 3947);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3947);
-- Mythic Defias Taskmaster
DELETE FROM `creature_template` WHERE entry = 9100228;
INSERT INTO `creature_template` VALUES (9100228, '0', '0', '0', '0', '0', '2440', '2443', '0', '0', 'Mythic Defias Taskmaster', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4417', '4417', '0', '0', '0', '0', '0', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100228 WHERE (`entry` = 4417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4417);
-- Mythic Defias Wizard
DELETE FROM `creature_template` WHERE entry = 9100229;
INSERT INTO `creature_template` VALUES (9100229, '0', '0', '0', '0', '0', '2447', '2448', '0', '0', 'Mythic Defias Wizard', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4418', '4418', '0', '0', '0', '0', '0', '', '1', '1.0', '4.21', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100229 WHERE (`entry` = 4418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4418);
-- Mythic Goblin Craftsman
DELETE FROM `creature_template` WHERE entry = 9100230;
INSERT INTO `creature_template` VALUES (9100230, '0', '0', '0', '0', '0', '7110', '0', '0', '0', 'Mythic Goblin Craftsman', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1731', '1731', '0', '0', '0', '0', '0', '', '1', '1.0', '4.47', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100230 WHERE (`entry` = 1731);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1731);
-- Mythic Goblin Engineer
DELETE FROM `creature_template` WHERE entry = 9100231;
INSERT INTO `creature_template` VALUES (9100231, '0', '0', '0', '0', '0', '7109', '0', '0', '0', 'Mythic Goblin Engineer', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '622', '622', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100231 WHERE (`entry` = 622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 622);
-- Mythic Goblin Woodcarver
DELETE FROM `creature_template` WHERE entry = 9100232;
INSERT INTO `creature_template` VALUES (9100232, '0', '0', '0', '0', '0', '7111', '0', '0', '0', 'Mythic Goblin Woodcarver', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '641', '641', '0', '0', '0', '0', '0', '', '1', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100232 WHERE (`entry` = 641);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 641);
-- Mythic Defias Strip Miner
DELETE FROM `creature_template` WHERE entry = 9100233;
INSERT INTO `creature_template` VALUES (9100233, '0', '0', '0', '0', '0', '2438', '341', '0', '0', 'Mythic Defias Strip Miner', NULL, NULL, '0', '60', '60', '0', '17', '0', '0.666668', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4416', '4416', '0', '0', '0', '0', '0', '', '1', '1.0', '4.03', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100233 WHERE (`entry` = 4416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4416);
-- Mythic Remote-Controlled Golem
DELETE FROM `creature_template` WHERE entry = 9100234;
INSERT INTO `creature_template` VALUES (9100234, '0', '0', '0', '0', '0', '1159', '0', '0', '0', 'Mythic Remote-Controlled Golem', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100234 WHERE (`entry` = 2520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2520);
-- Mythic Defias Evoker
DELETE FROM `creature_template` WHERE entry = 9100235;
INSERT INTO `creature_template` VALUES (9100235, '0', '0', '0', '0', '0', '2318', '2319', '0', '0', 'Mythic Defias Evoker', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1729', '1729', '0', '0', '0', '0', '0', '', '1', '1.0', '4.01', '2.0', '1.55', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100235 WHERE (`entry` = 1729);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1729);
-- Mythic Defias Overseer
DELETE FROM `creature_template` WHERE entry = 9100236;
INSERT INTO `creature_template` VALUES (9100236, '0', '0', '0', '0', '0', '2316', '2317', '0', '0', 'Mythic Defias Overseer', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '634', '634', '0', '0', '0', '0', '0', '', '1', '1.0', '3.89', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100236 WHERE (`entry` = 634);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 634);
-- Mythic Defias Miner
DELETE FROM `creature_template` WHERE entry = 9100237;
INSERT INTO `creature_template` VALUES (9100237, '0', '0', '0', '0', '0', '308', '2444', '0', '0', 'Mythic Defias Miner', NULL, NULL, '0', '60', '60', '0', '17', '0', '0.666668', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '598', '598', '0', '0', '0', '0', '0', '', '1', '1.0', '4.02', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100237 WHERE (`entry` = 598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 598);
-- Mythic Defias Watchman
DELETE FROM `creature_template` WHERE entry = 9100238;
INSERT INTO `creature_template` VALUES (9100238, '0', '0', '0', '0', '0', '184', '0', '0', '0', 'Mythic Defias Watchman', '', NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1725', '1725', '0', '0', '0', '0', '0', '', '1', '1.0', '4.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100238 WHERE (`entry` = 1725);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1725);
-- Mythic Defias Companion
DELETE FROM `creature_template` WHERE entry = 9100239;
INSERT INTO `creature_template` VALUES (9100239, '0', '0', '0', '0', '0', '5207', '0', '0', '0', 'Mythic Defias Companion', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.28', '1.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100239 WHERE (`entry` = 3450);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3450);
-- Mythic Defias Pirate
DELETE FROM `creature_template` WHERE entry = 9100240;
INSERT INTO `creature_template` VALUES (9100240, '0', '0', '0', '0', '0', '2347', '2348', '0', '0', 'Mythic Defias Pirate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '657', '657', '0', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100240 WHERE (`entry` = 657);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 657);
-- Mythic Miner Johnson
DELETE FROM `creature_template` WHERE entry = 9100241;
INSERT INTO `creature_template` VALUES (9100241, '0', '0', '0', '0', '0', '556', '0', '0', '0', 'Mythic Miner Johnson', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.04', '1500', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.1', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100241 WHERE (`entry` = 3586);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3586);
-- Mythic Edwin VanCleef
DELETE FROM `creature_template` WHERE entry = 9100242;
INSERT INTO `creature_template` VALUES (9100242, '0', '0', '0', '0', '0', '2029', '0', '0', '0', 'Mythic Edwin VanCleef', 'Defias Kingpin', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.08', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '639', '0', '0', '0', '0', '0', '', '0', '1.0', '8.37', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100242 WHERE (`entry` = 639);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 639);
-- Mythic Captain Greenskin
DELETE FROM `creature_template` WHERE entry = 9100243;
INSERT INTO `creature_template` VALUES (9100243, '0', '0', '0', '0', '0', '7113', '0', '0', '0', 'Mythic Captain Greenskin', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '647', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100243 WHERE (`entry` = 647);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 647);
-- Mythic Cookie
DELETE FROM `creature_template` WHERE entry = 9100244;
INSERT INTO `creature_template` VALUES (9100244, '0', '0', '0', '0', '0', '1305', '0', '0', '0', 'Mythic Cookie', 'The Ship''s Cook', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '645', '0', '0', '0', '0', '0', '', '1', '1.0', '8.07', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100244 WHERE (`entry` = 645);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 645);
-- Mythic Gilnid
DELETE FROM `creature_template` WHERE entry = 9100245;
INSERT INTO `creature_template` VALUES (9100245, '0', '0', '0', '0', '0', '7124', '0', '0', '0', 'Mythic Gilnid', 'The Smelter', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1763', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100245 WHERE (`entry` = 1763);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1763);
-- Mythic Mr. Smite
DELETE FROM `creature_template` WHERE entry = 9100246;
INSERT INTO `creature_template` VALUES (9100246, '0', '0', '0', '0', '0', '2026', '0', '0', '0', 'Mythic Mr. Smite', 'The Ship''s First Mate', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '646', '0', '0', '0', '0', '0', '', '1', '1.0', '8.04', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100246 WHERE (`entry` = 646);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 646);
-- Mythic Sneed
DELETE FROM `creature_template` WHERE entry = 9100247;
INSERT INTO `creature_template` VALUES (9100247, '0', '0', '0', '0', '0', '7125', '0', '0', '0', 'Mythic Sneed', 'Lumbermaster', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '643', '0', '0', '0', '0', '0', '', '1', '1.0', '7.93', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100247 WHERE (`entry` = 643);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 643);
-- Mythic Sneeds Shredder
DELETE FROM `creature_template` WHERE entry = 9100248;
INSERT INTO `creature_template` VALUES (9100248, '0', '0', '0', '0', '0', '1269', '0', '0', '0', 'Mythic Sneeds Shredder', 'Lumbermaster', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '9100500', '0', '100031', '0', '0', '0', '0', '', '1', '1.0', '8.04', '1.0', '1.0', '2.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100248 WHERE (`entry` = 642);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 642);
-- Mythic Rhahk Zor
DELETE FROM `creature_template` WHERE entry = 9100249;
INSERT INTO `creature_template` VALUES (9100249, '0', '0', '0', '0', '0', '14403', '0', '0', '0', 'Mythic Rhahk Zor', 'The Foreman', NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.1', '3500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '644', '0', '0', '0', '0', '0', '', '0', '1.0', '8.09', '1.0', '1.0', '2.0', '0', '0', '1', '617299807', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100249 WHERE (`entry` = 644);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 644);