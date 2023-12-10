-- Heroic Scarlet Trainee
DELETE FROM `creature_template` WHERE entry = 9100800;
INSERT INTO `creature_template` VALUES (9100800, '0', '0', '0', '0', '0', '2467', '2478', '0', '0', 'Heroic Scarlet Trainee', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '0.857143', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.95', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '6575', '6575', '0', '0', '0', '4', '30', '', '1', '1.0', '0.15', '1.0', '1.0', '0.25', '0', '100', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100800 WHERE (`entry` = 6575);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6575);
-- Heroic Scarlet Torturer
DELETE FROM `creature_template` WHERE entry = 9100801;
INSERT INTO `creature_template` VALUES (9100801, '0', '0', '0', '0', '0', '2607', '2608', '0', '0', 'Heroic Scarlet Torturer', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4306', '4306', '0', '0', '0', '81', '542', '', '1', '1.0', '3.0', '2.0', '0.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100801 WHERE (`entry` = 4306);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4306);
-- Heroic Scarlet Scryer
DELETE FROM `creature_template` WHERE entry = 9100802;
INSERT INTO `creature_template` VALUES (9100802, '0', '0', '0', '0', '0', '2518', '2519', '0', '0', 'Heroic Scarlet Scryer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4293', '4293', '0', '0', '0', '70', '504', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100802 WHERE (`entry` = 4293);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4293);
-- Heroic Unfettered Spirit
DELETE FROM `creature_template` WHERE entry = 9100803;
INSERT INTO `creature_template` VALUES (9100803, '0', '0', '0', '0', '0', '5430', '0', '0', '0', 'Heroic Unfettered Spirit', '', NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '4308', '0', '0', '0', '0', '29', '196', '', '1', '1.0', '1.0', '1.0', '1.45', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100803 WHERE (`entry` = 4308);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4308);
-- Heroic Anguished Dead
DELETE FROM `creature_template` WHERE entry = 9100804;
INSERT INTO `creature_template` VALUES (9100804, '0', '0', '0', '0', '0', '10255', '10256', '1196', '4631', 'Heroic Anguished Dead', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '4.15', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '6426', '6426', '0', '0', '0', '90', '541', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100804 WHERE (`entry` = 6426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6426);
-- Heroic Haunting Phantasm
DELETE FROM `creature_template` WHERE entry = 9100805;
INSERT INTO `creature_template` VALUES (9100805, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Heroic Haunting Phantasm', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.15', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '6427', '0', '0', '0', '0', '95', '591', '', '1', '1.0', '3.0', '2.0', '1.9', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100805 WHERE (`entry` = 6427);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6427);
-- Heroic Illusionary Phantasm
DELETE FROM `creature_template` WHERE entry = 9100806;
INSERT INTO `creature_template` VALUES (9100806, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Illusionary Phantasm', '', NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.15', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '50', '248', '', '1', '1.0', '3.0', '2.0', '1.9', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100806 WHERE (`entry` = 6493);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6493);
-- Heroic Scarlet Tracking Hound
DELETE FROM `creature_template` WHERE entry = 9100807;
INSERT INTO `creature_template` VALUES (9100807, '0', '0', '0', '0', '0', '2709', '0', '0', '0', 'Heroic Scarlet Tracking Hound', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.275', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '4304', '0', '100011', '8287', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100807 WHERE (`entry` = 4304);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4304);
-- Heroic Scarlet Gallant
DELETE FROM `creature_template` WHERE entry = 9100808;
INSERT INTO `creature_template` VALUES (9100808, '0', '0', '0', '0', '0', '2463', '2474', '0', '0', 'Heroic Scarlet Gallant', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4287', '4287', '0', '0', '0', '104', '676', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100808 WHERE (`entry` = 4287);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4287);
-- Heroic Scarlet Adept
DELETE FROM `creature_template` WHERE entry = 9100809;
INSERT INTO `creature_template` VALUES (9100809, '0', '0', '0', '0', '0', '5726', '5725', '0', '0', 'Heroic Scarlet Adept', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4296', '4296', '0', '0', '0', '139', '668', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100809 WHERE (`entry` = 4296);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4296);
-- Heroic Scarlet Abbot
DELETE FROM `creature_template` WHERE entry = 9100810;
INSERT INTO `creature_template` VALUES (9100810, '0', '0', '0', '0', '0', '2492', '0', '0', '0', 'Heroic Scarlet Abbot', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4303', '4303', '0', '0', '0', '225', '984', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100810 WHERE (`entry` = 4303);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4303);
-- Heroic Scarlet Champion
DELETE FROM `creature_template` WHERE entry = 9100811;
INSERT INTO `creature_template` VALUES (9100811, '0', '0', '0', '0', '0', '2460', '2461', '0', '0', 'Heroic Scarlet Champion', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4302', '4302', '0', '0', '0', '209', '1008', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100811 WHERE (`entry` = 4302);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4302);
-- Heroic Scarlet Centurion
DELETE FROM `creature_template` WHERE entry = 9100812;
INSERT INTO `creature_template` VALUES (9100812, '0', '0', '0', '0', '0', '2499', '2500', '0', '0', 'Heroic Scarlet Centurion', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4301', '4301', '0', '0', '0', '151', '899', '', '1', '1.0', '3.0', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100812 WHERE (`entry` = 4301);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4301);
-- Heroic Scarlet Wizard
DELETE FROM `creature_template` WHERE entry = 9100813;
INSERT INTO `creature_template` VALUES (9100813, '0', '0', '0', '0', '0', '2525', '2526', '0', '0', 'Heroic Scarlet Wizard', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.8', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4300', '4300', '0', '0', '0', '137', '923', '', '1', '1.0', '3.5', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100813 WHERE (`entry` = 4300);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4300);
-- Heroic Scarlet Defender
DELETE FROM `creature_template` WHERE entry = 9100814;
INSERT INTO `creature_template` VALUES (9100814, '0', '0', '0', '0', '0', '2462', '2473', '0', '0', 'Heroic Scarlet Defender', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4298', '4298', '0', '0', '0', '206', '864', '', '1', '1.0', '3.0', '2.0', 
'1.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100814 WHERE (`entry` = 4298);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4298);
-- Heroic Scarlet Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100815;
INSERT INTO `creature_template` VALUES (9100815, '0', '0', '0', '0', '0', '2514', '2515', '0', '0', 'Heroic Scarlet Myrmidon', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '1700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4295', '4295', '0', '0', '0', '142', '882', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100815 WHERE (`entry` = 4295);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4295);
-- Heroic Scarlet Sorcerer
DELETE FROM `creature_template` WHERE entry = 9100816;
INSERT INTO `creature_template` VALUES (9100816, '0', '0', '0', '0', '0', '2524', '0', '0', '0', 'Heroic Scarlet Sorcerer', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4294', '4294', '0', '0', '0', '150', '905', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100816 WHERE (`entry` = 4294);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4294);
-- Heroic Scarlet Evoker
DELETE FROM `creature_template` WHERE entry = 9100817;
INSERT INTO `creature_template` VALUES (9100817, '0', '0', '0', '0', '0', '2509', '2510', '0', '0', 'Heroic Scarlet Evoker', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.0', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4289', '4289', '0', '0', '0', '181', '786', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100817 WHERE (`entry` = 4289);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4289);
-- Heroic Scarlet Guardsman
DELETE FROM `creature_template` WHERE entry = 9100818;
INSERT INTO `creature_template` VALUES (9100818, '0', '0', '0', '0', '0', '2511', '0', '0', '0', 'Heroic Scarlet Guardsman', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.75', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4290', '4290', '0', '0', '0', '143', '826', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100818 WHERE (`entry` = 4290);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4290);
-- Heroic Scarlet Protector
DELETE FROM `creature_template` WHERE entry = 9100819;
INSERT INTO `creature_template` VALUES (9100819, '0', '0', '0', '0', '0', '2476', '2465', '0', '0', 'Heroic Scarlet Protector', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4292', '4292', '0', '0', '0', '133', '815', '', '1', '1.0', '3.0', '2.0', 
'1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100819 WHERE (`entry` = 4292);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4292);
-- Heroic Scarlet Conjuror
DELETE FROM `creature_template` WHERE entry = 9100820;
INSERT INTO `creature_template` VALUES (9100820, '0', '0', '0', '0', '0', '2503', '2504', '0', '0', 'Heroic Scarlet Conjuror', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.0', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4297', '4297', '0', '0', '0', '184', '488', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100820 WHERE (`entry` = 4297);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4297);
-- Heroic Scarlet Monk
DELETE FROM `creature_template` WHERE entry = 9100821;
INSERT INTO `creature_template` VALUES (9100821, '0', '0', '0', '0', '0', '2603', '2604', '0', '0', 'Heroic Scarlet Monk', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.16', '1800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4540', '4540', '0', '0', '0', '125', '791', '', '1', '1.0', '3.0', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100821 WHERE (`entry` = 4540);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4540);
-- Heroic Scarlet Soldier
DELETE FROM `creature_template` WHERE entry = 9100822;
INSERT INTO `creature_template` VALUES (9100822, '0', '0', '0', '0', '0', '2522', '2523', '0', '0', 'Heroic Scarlet Soldier', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4286', '4286', '0', '0', '0', '223', '787', '', '1', '1.0', '3.0', '2.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100822 WHERE (`entry` = 4286);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4286);
-- Heroic Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9100823;
INSERT INTO `creature_template` VALUES (9100823, '0', '0', '0', '0', '0', '1405', '0', '0', '0', 'Heroic Fire Elemental', '', NULL, '0', '60', '60', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '2', '0.75', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.35', '1.0', '0', '0', '1', '646016863', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100823 WHERE (`entry` = 575);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 575);
-- Heroic Scarlet Chaplain
DELETE FROM `creature_template` WHERE entry = 9100824;
INSERT INTO `creature_template` VALUES (9100824, '0', '0', '0', '0', '0', '2501', '2502', '0', '0', 'Heroic Scarlet Chaplain', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4299', '4299', '0', '0', '0', '117', '674', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100824 WHERE (`entry` = 4299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4299);
-- Heroic Scarlet Beastmaster
DELETE FROM `creature_template` WHERE entry = 9100825;
INSERT INTO `creature_template` VALUES (9100825, '0', '0', '0', '0', '0', '2497', '2498', '0', '0', 'Heroic Scarlet Beastmaster', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4288', '4288', '0', '0', '0', '216', '604', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100825 WHERE (`entry` = 4288);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4288);
-- Heroic Scarlet Diviner
DELETE FROM `creature_template` WHERE entry = 9100826;
INSERT INTO `creature_template` VALUES (9100826, '0', '0', '0', '0', '0', '2507', '2508', '0', '0', 'Heroic Scarlet Diviner', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4291', '4291', '0', '0', '0', '106', '689', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100826 WHERE (`entry` = 4291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4291);
-- Heroic Interrogator Vishas
DELETE FROM `creature_template` WHERE entry = 9100827;
INSERT INTO `creature_template` VALUES (9100827, '0', '0', '0', '0', '0', '2044', '0', '0', '0', 'Heroic Interrogator Vishas', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3983', '0', '0', '0', '281', '588', '', '1', '1.0', '6.1', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100827 WHERE (`entry` = 3983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3983);
-- Heroic Azshir the Sleepless
DELETE FROM `creature_template` WHERE entry = 9100828;
INSERT INTO `creature_template` VALUES (9100828, '0', '0', '0', '0', '0', '5534', '0', '0', '0', 'Heroic Azshir the Sleepless', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '6490', '0', '0', '0', '63', '624', '', '1', '1.0', '6.39', '2.0', '2.4', '1.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100828 WHERE (`entry` = 6490);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6490);
-- Heroic Fallen Champion
DELETE FROM `creature_template` WHERE entry = 9100829;
INSERT INTO `creature_template` VALUES (9100829, '0', '0', '0', '0', '0', '5230', '0', '0', '0', 'Heroic Fallen Champion', '', NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '298', '453', '', '1', '1.0', '6.27', '2.0', '1.95', '1.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100829 WHERE (`entry` = 6488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6488);
-- Heroic Ironspine
DELETE FROM `creature_template` WHERE entry = 9100830;
INSERT INTO `creature_template` VALUES (9100830, '0', '0', '0', '0', '0', '5231', '0', '0', '0', 'Heroic Ironspine', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.08', '2000', '1485', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '182', '394', '', '1', '1.0', '6.23', '2.0', '1.95', '1.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100830 WHERE (`entry` = 6489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6489);
-- Heroic High Inquisitor Whitemane
DELETE FROM `creature_template` WHERE entry = 9100831;
INSERT INTO `creature_template` VALUES (9100831, '0', '0', '0', '0', '0', '2043', '0', '0', '0', 'Heroic High Inquisitor Whitemane', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3977', '0', '0', '0', '298', '773', '', '1', '1.0', '5.89', 
'5.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100831 WHERE (`entry` = 3977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3977);
-- Heroic Scarlet Commander Mograine
DELETE FROM `creature_template` WHERE entry = 9100832;
INSERT INTO `creature_template` VALUES (9100832, '0', '0', '0', '0', '0', '2042', '0', '0', '0', 'Heroic Scarlet Commander Mograine', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '2200', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3976', '0', '0', '0', '285', '422', '', '1', '1.0', '5.94', '2.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100832 WHERE (`entry` = 3976);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3976);
-- Heroic Herod
DELETE FROM `creature_template` WHERE entry = 9100833;
INSERT INTO `creature_template` VALUES (9100833, '0', '0', '0', '0', '0', '2041', '0', '0', '0', 'Heroic Herod', 'The Scarlet Champion', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '5.0', '2500', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3975', '0', '0', '0', '336', '756', '', '1', '1.0', '6.05', '1.0', '0.8', '2.0', '0', '144', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100833 WHERE (`entry` = 3975);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3975);
-- Heroic High Inquisitor Fairbanks
DELETE FROM `creature_template` WHERE entry = 9100834;
INSERT INTO `creature_template` VALUES (9100834, '0', '0', '0', '0', '0', '2605', '0', '0', '0', 'Heroic High Inquisitor Fairbanks', '', NULL, '7283', '63', '63', '0', '67', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '4542', '0', '0', '0', '172', '497', '', '1', '1.0', '5.92', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100834 WHERE (`entry` = 4542);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4542);
-- Heroic Arcanist Doan
DELETE FROM `creature_template` WHERE entry = 9100835;
INSERT INTO `creature_template` VALUES (9100835, '0', '0', '0', '0', '0', '5266', '0', '0', '0', 'Heroic Arcanist Doan', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '6487', '0', '0', '0', '230', '770', '', '1', '1.0', '5.85', '3.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100835 WHERE (`entry` = 6487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6487);
-- Heroic Bloodmage Thalnos
DELETE FROM `creature_template` WHERE entry = 9100836;
INSERT INTO `creature_template` VALUES (9100836, '0', '0', '0', '0', '0', '11396', '0', '0', '0', 'Heroic Bloodmage Thalnos', '', NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '4543', '0', '0', '0', '121', '720', '', '1', '1.0', '6.43', '2.5', '0.95', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100836 WHERE (`entry` = 4543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4543);
-- Heroic Houndmaster Loksey
DELETE FROM `creature_template` WHERE entry = 9100837;
INSERT INTO `creature_template` VALUES (9100837, '0', '0', '0', '0', '0', '2040', '0', '0', '0', 'Heroic Houndmaster Loksey', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '3974', '0', '0', '0', '232', '729', '', '1', '1.0', '6.48', '1.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100837 WHERE (`entry` = 3974);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3974);
-- Mythic Scarlet Trainee
DELETE FROM `creature_template` WHERE entry = 9100838;
INSERT INTO `creature_template` VALUES (9100838, '0', '0', '0', '0', '0', '2467', '2478', '0', '0', 'Mythic Scarlet Trainee', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '0.857143', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '6575', '6575', '0', '0', '0', '4', '30', '', '1', '1.0', '3.97', '1.0', '1.0', '0.25', '0', '100', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100838 WHERE (`entry` = 6575);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6575);
-- Mythic Scarlet Torturer
DELETE FROM `creature_template` WHERE entry = 9100839;
INSERT INTO `creature_template` VALUES (9100839, '0', '0', '0', '0', '0', '2607', '2608', '0', '0', 'Mythic Scarlet Torturer', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4306', '4306', '0', '0', '0', '81', '542', '', '1', '1.0', '4.31', '2.0', 
'0.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100839 WHERE (`entry` = 4306);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4306);
-- Mythic Scarlet Scryer
DELETE FROM `creature_template` WHERE entry = 9100840;
INSERT INTO `creature_template` VALUES (9100840, '0', '0', '0', '0', '0', '2518', '2519', '0', '0', 'Mythic Scarlet Scryer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4293', '4293', '0', '0', '0', '70', '504', '', '1', '1.0', '4.32', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100840 WHERE (`entry` = 4293);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4293);
-- Mythic Unfettered Spirit
DELETE FROM `creature_template` WHERE entry = 9100841;
INSERT INTO `creature_template` VALUES (9100841, '0', '0', '0', '0', '0', '5430', '0', '0', '0', 'Mythic Unfettered Spirit', '', NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '4308', '0', '0', '0', '0', '29', '196', '', '1', '1.0', '4.34', '1.0', '1.45', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100841 WHERE (`entry` = 4308);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4308);
-- Mythic Anguished Dead
DELETE FROM `creature_template` WHERE entry = 9100842;
INSERT INTO `creature_template` VALUES (9100842, '0', '0', '0', '0', '0', '10255', '10256', '1196', '4631', 'Mythic Anguished Dead', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '6426', '6426', '0', '0', '0', '90', '541', '', '1', '1.0', '3.91', '2.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100842 WHERE (`entry` = 6426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6426);
-- Mythic Haunting Phantasm
DELETE FROM `creature_template` WHERE entry = 9100843;
INSERT INTO `creature_template` VALUES (9100843, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Mythic Haunting Phantasm', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '6427', '0', '0', '0', '0', '95', '591', '', '1', '1.0', '4.37', '2.0', '1.9', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100843 WHERE (`entry` = 6427);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6427);
-- Mythic Illusionary Phantasm
DELETE FROM `creature_template` WHERE entry = 9100844;
INSERT INTO `creature_template` VALUES (9100844, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Illusionary Phantasm', '', NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '50', '248', '', '1', '1.0', '4.03', '2.0', '1.9', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100844 WHERE (`entry` = 6493);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6493);
-- Mythic Scarlet Tracking Hound
DELETE FROM `creature_template` WHERE entry = 9100845;
INSERT INTO `creature_template` VALUES (9100845, '0', '0', '0', '0', '0', '2709', '0', '0', '0', 'Mythic Scarlet Tracking Hound', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '4304', '0', '100011', '8287', '0', '0', '0', '', '1', '1.0', '3.81', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100845 WHERE (`entry` = 4304);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4304);
-- Mythic Scarlet Gallant
DELETE FROM `creature_template` WHERE entry = 9100846;
INSERT INTO `creature_template` VALUES (9100846, '0', '0', '0', '0', '0', '2463', '2474', '0', '0', 'Mythic Scarlet Gallant', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4287', '4287', '0', '0', '0', '104', '676', '', '1', '1.0', '4.04', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100846 WHERE (`entry` = 4287);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4287);
-- Mythic Scarlet Adept
DELETE FROM `creature_template` WHERE entry = 9100847;
INSERT INTO `creature_template` VALUES (9100847, '0', '0', '0', '0', '0', '5726', '5725', '0', '0', 'Mythic Scarlet Adept', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4296', '4296', '0', '0', '0', '139', '668', '', '1', '1.0', '3.98', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100847 WHERE (`entry` = 4296);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4296);
-- Mythic Scarlet Abbot
DELETE FROM `creature_template` WHERE entry = 9100848;
INSERT INTO `creature_template` VALUES (9100848, '0', '0', '0', '0', '0', '2492', '0', '0', '0', 'Mythic Scarlet Abbot', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4303', '4303', '0', '0', '0', '225', '984', '', '1', '1.0', '3.95', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100848 WHERE (`entry` = 4303);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4303);
-- Mythic Scarlet Champion
DELETE FROM `creature_template` WHERE entry = 9100849;
INSERT INTO `creature_template` VALUES (9100849, '0', '0', '0', '0', '0', '2460', '2461', '0', '0', 'Mythic Scarlet Champion', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4302', '4302', '0', '0', '0', '209', '1008', '', '1', '1.0', '4.13', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100849 WHERE (`entry` = 4302);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4302);
-- Mythic Scarlet Centurion
DELETE FROM `creature_template` WHERE entry = 9100850;
INSERT INTO `creature_template` VALUES (9100850, '0', '0', '0', '0', '0', '2499', '2500', '0', '0', 'Mythic Scarlet Centurion', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4301', '4301', '0', '0', '0', '151', '899', '', '1', '1.0', '4.32', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100850 WHERE (`entry` = 4301);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4301);
-- Mythic Scarlet Wizard
DELETE FROM `creature_template` WHERE entry = 9100851;
INSERT INTO `creature_template` VALUES (9100851, '0', '0', '0', '0', '0', '2525', '2526', '0', '0', 'Mythic Scarlet Wizard', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4300', '4300', '0', '0', '0', '137', '923', '', '1', '1.0', '4.32', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100851 WHERE (`entry` = 4300);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4300);
-- Mythic Scarlet Defender
DELETE FROM `creature_template` WHERE entry = 9100852;
INSERT INTO `creature_template` VALUES (9100852, '0', '0', '0', '0', '0', '2462', '2473', '0', '0', 'Mythic Scarlet Defender', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4298', '4298', '0', '0', '0', '206', '864', '', '1', '1.0', '3.91', '2.0', '1.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100852 WHERE (`entry` = 4298);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4298);
-- Mythic Scarlet Myrmidon
DELETE FROM `creature_template` WHERE entry = 9100853;
INSERT INTO `creature_template` VALUES (9100853, '0', '0', '0', '0', '0', '2514', '2515', '0', '0', 'Mythic Scarlet Myrmidon', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '1700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4295', '4295', '0', '0', '0', '142', '882', '', '1', '1.0', '3.8', '2.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100853 WHERE (`entry` = 4295);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4295);
-- Mythic Scarlet Sorcerer
DELETE FROM `creature_template` WHERE entry = 9100854;
INSERT INTO `creature_template` VALUES (9100854, '0', '0', '0', '0', '0', '2524', '0', '0', '0', 'Mythic Scarlet Sorcerer', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4294', '4294', '0', '0', '0', '150', '905', '', '1', '1.0', '4.15', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100854 WHERE (`entry` = 4294);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4294);
-- Mythic Scarlet Evoker
DELETE FROM `creature_template` WHERE entry = 9100855;
INSERT INTO `creature_template` VALUES (9100855, '0', '0', '0', '0', '0', '2509', '2510', '0', '0', 'Mythic Scarlet Evoker', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4289', '4289', '0', '0', '0', '181', '786', '', '1', '1.0', '4.09', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100855 WHERE (`entry` = 4289);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4289);
-- Mythic Scarlet Guardsman
DELETE FROM `creature_template` WHERE entry = 9100856;
INSERT INTO `creature_template` VALUES (9100856, '0', '0', '0', '0', '0', '2511', '0', '0', '0', 'Mythic Scarlet Guardsman', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4290', '4290', '0', '0', '0', '143', '826', '', '1', '1.0', '4.07', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100856 WHERE (`entry` = 4290);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4290);
-- Mythic Scarlet Protector
DELETE FROM `creature_template` WHERE entry = 9100857;
INSERT INTO `creature_template` VALUES (9100857, '0', '0', '0', '0', '0', '2476', '2465', '0', '0', 'Mythic Scarlet Protector', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4292', '4292', '0', '0', '0', '133', '815', '', '1', '1.0', '3.95', '2.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100857 WHERE (`entry` = 4292);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4292);
-- Mythic Scarlet Conjuror
DELETE FROM `creature_template` WHERE entry = 9100858;
INSERT INTO `creature_template` VALUES (9100858, '0', '0', '0', '0', '0', '2503', '2504', '0', '0', 'Mythic Scarlet Conjuror', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4297', '4297', '0', '0', '0', '184', '488', '', '1', '1.0', '3.91', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100858 WHERE (`entry` = 4297);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4297);
-- Mythic Scarlet Monk
DELETE FROM `creature_template` WHERE entry = 9100859;
INSERT INTO `creature_template` VALUES (9100859, '0', '0', '0', '0', '0', '2603', '2604', '0', '0', 'Mythic Scarlet Monk', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '1800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4540', '4540', '0', '0', '0', '125', '791', '', '1', '1.0', '4.16', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100859 WHERE (`entry` = 4540);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4540);
-- Mythic Scarlet Soldier
DELETE FROM `creature_template` WHERE entry = 9100860;
INSERT INTO `creature_template` VALUES (9100860, '0', '0', '0', '0', '0', '2522', '2523', '0', '0', 'Mythic Scarlet Soldier', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4286', '4286', '0', '0', '0', '223', '787', '', '1', '1.0', '4.04', '2.0', 
'1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100860 WHERE (`entry` = 4286);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4286);
-- Mythic Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9100861;
INSERT INTO `creature_template` VALUES (9100861, '0', '0', '0', '0', '0', '1405', '0', '0', '0', 'Mythic Fire Elemental', '', NULL, '0', '60', '60', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '2', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.85', '1.0', '1.35', '1.0', '0', '0', '1', '646016863', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100861 WHERE (`entry` = 575);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 575);
-- Mythic Scarlet Chaplain
DELETE FROM `creature_template` WHERE entry = 9100862;
INSERT INTO `creature_template` VALUES (9100862, '0', '0', '0', '0', '0', '2501', '2502', '0', '0', 'Mythic Scarlet Chaplain', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4299', '4299', '0', '0', '0', '117', '674', '', '1', '1.0', '3.84', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100862 WHERE (`entry` = 4299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4299);
-- Mythic Scarlet Beastmaster
DELETE FROM `creature_template` WHERE entry = 9100863;
INSERT INTO `creature_template` VALUES (9100863, '0', '0', '0', '0', '0', '2497', '2498', '0', '0', 'Mythic Scarlet Beastmaster', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4288', '4288', '0', '0', '0', '216', '604', '', '1', '1.0', '4.35', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100863 WHERE (`entry` = 4288);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4288);
-- Mythic Scarlet Diviner
DELETE FROM `creature_template` WHERE entry = 9100864;
INSERT INTO `creature_template` VALUES (9100864, '0', '0', '0', '0', '0', '2507', '2508', '0', '0', 'Mythic Scarlet Diviner', '', NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4291', '4291', '0', '0', '0', '106', '689', '', '1', '1.0', '4.5', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100864 WHERE (`entry` = 4291);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4291);
-- Mythic Interrogator Vishas
DELETE FROM `creature_template` WHERE entry = 9100865;
INSERT INTO `creature_template` VALUES (9100865, '0', '0', '0', '0', '0', '2044', '0', '0', '0', 'Mythic Interrogator Vishas', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '3983', '0', '0', '0', '281', '588', '', '1', '1.0', '8.07', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100865 WHERE (`entry` = 3983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3983);
-- Mythic Azshir the Sleepless
DELETE FROM `creature_template` WHERE entry = 9100866;
INSERT INTO `creature_template` VALUES (9100866, '0', '0', '0', '0', '0', '5534', '0', '0', '0', 'Mythic Azshir the Sleepless', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '6490', '0', '0', '0', '63', '624', '', '1', '1.0', '8.47', '2.0', '2.4', '1.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100866 WHERE (`entry` = 6490);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6490);
-- Mythic Fallen Champion
DELETE FROM `creature_template` WHERE entry = 9100867;
INSERT INTO `creature_template` VALUES (9100867, '0', '0', '0', '0', '0', '5230', '0', '0', '0', 'Mythic Fallen Champion', '', NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '298', '453', '', '1', '1.0', '7.85', '2.0', '1.95', '1.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100867 WHERE (`entry` = 6488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6488);
-- Mythic Ironspine
DELETE FROM `creature_template` WHERE entry = 9100868;
INSERT INTO `creature_template` VALUES (9100868, '0', '0', '0', '0', '0', '5231', '0', '0', '0', 'Mythic Ironspine', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.0', '2000', '1485', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '182', '394', '', '1', '1.0', '7.86', '2.0', '1.95', '1.0', '0', '0', '1', '608925267', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100868 WHERE (`entry` = 6489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6489);
-- Mythic High Inquisitor Whitemane
DELETE FROM `creature_template` WHERE entry = 9100869;
INSERT INTO `creature_template` VALUES (9100869, '0', '0', '0', '0', '0', '2043', '0', '0', '0', 'Mythic High Inquisitor Whitemane', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '3977', '0', '0', '0', '298', '773', '', '1', '1.0', '8.28', 
'5.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100869 WHERE (`entry` = 3977);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3977);
-- Mythic Scarlet Commander Mograine
DELETE FROM `creature_template` WHERE entry = 9100870;
INSERT INTO `creature_template` VALUES (9100870, '0', '0', '0', '0', '0', '2042', '0', '0', '0', 'Mythic Scarlet Commander Mograine', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2200', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '3976', '0', '0', '0', '285', '422', '', '1', '1.0', '7.82', '2.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100870 WHERE (`entry` = 3976);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3976);
-- Mythic Herod
DELETE FROM `creature_template` WHERE entry = 9100871;
INSERT INTO `creature_template` VALUES (9100871, '0', '0', '0', '0', '0', '2041', '0', '0', '0', 'Mythic Herod', 'The Scarlet Champion', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.06', '2500', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '3975', '0', '0', '0', '336', '756', '', '1', '1.0', '7.87', '1.0', '0.8', '2.0', '0', '144', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100871 WHERE (`entry` = 3975);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3975);
-- Mythic High Inquisitor Fairbanks
DELETE FROM `creature_template` WHERE entry = 9100872;
INSERT INTO `creature_template` VALUES (9100872, '0', '0', '0', '0', '0', '2605', '0', '0', '0', 'Mythic High Inquisitor Fairbanks', '', NULL, '7283', '63', '63', '0', '67', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '4542', '0', '0', '0', '172', '497', '', '1', '1.0', '8.3', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100872 WHERE (`entry` = 4542);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4542);
-- Mythic Arcanist Doan
DELETE FROM `creature_template` WHERE entry = 9100873;
INSERT INTO `creature_template` VALUES (9100873, '0', '0', '0', '0', '0', '5266', '0', '0', '0', 'Mythic Arcanist Doan', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '6487', '0', '0', '0', '230', '770', '', '1', '1.0', '8.0', '3.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100873 WHERE (`entry` = 6487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6487);
-- Mythic Bloodmage Thalnos
DELETE FROM `creature_template` WHERE entry = 9100874;
INSERT INTO `creature_template` VALUES (9100874, '0', '0', '0', '0', '0', '11396', '0', '0', '0', 'Mythic Bloodmage Thalnos', '', NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '4543', '0', '0', '0', '121', '720', '', '1', '1.0', '8.16', '2.5', 
'0.95', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100874 WHERE (`entry` = 4543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4543);
-- Mythic Houndmaster Loksey
DELETE FROM `creature_template` WHERE entry = 9100875;
INSERT INTO `creature_template` VALUES (9100875, '0', '0', '0', '0', '0', '2040', '0', '0', '0', 'Mythic Houndmaster Loksey', '', NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '3974', '0', '0', '0', '232', '729', '', '1', '1.0', '7.9', '1.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100875 WHERE (`entry` = 3974);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 3974);