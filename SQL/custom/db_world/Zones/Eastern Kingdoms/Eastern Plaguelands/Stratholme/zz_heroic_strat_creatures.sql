-- Heroic Aelmar the Vanquisher
DELETE FROM `creature_template` WHERE entry = 9101700;
INSERT INTO `creature_template` VALUES (9101700, '0', '0', '0', '0', '0', '17317', '0', '0', '0', 'Heroic Aelmar the Vanquisher', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101700 WHERE (`entry` = 17913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17913);
-- Heroic Aurius
DELETE FROM `creature_template` WHERE entry = 9101701;
INSERT INTO `creature_template` VALUES (9101701, '0', '0', '0', '0', '0', '10217', '0', '0', '0', 'Heroic Aurius', NULL, NULL, '3043', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '1', '0', '4.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.5', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101701 WHERE (`entry` = 10917);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10917);
-- Heroic Bile Slime
DELETE FROM `creature_template` WHERE entry = 9101702;
INSERT INTO `creature_template` VALUES (9101702, '0', '0', '0', '0', '0', '10029', '0', '0', '0', 'Heroic Bile Slime', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.15', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '62', '308', '', '1', '1.0', '0.3', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101702 WHERE (`entry` = 10697);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10697);
-- Heroic Bile Spewer
DELETE FROM `creature_template` WHERE entry = 9101703;
INSERT INTO `creature_template` VALUES (9101703, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Heroic Bile Spewer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10416', '10416', '0', '0', '0', '503', '2070', '', '1', '1.0', '5.0', '2.0', '1.1', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101703 WHERE (`entry` = 10416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10416);
-- Heroic Black Guard Sentry
DELETE FROM `creature_template` WHERE entry = 9101704;
INSERT INTO `creature_template` VALUES (9101704, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Heroic Black Guard Sentry', NULL, NULL, '0', '60', '60', '0', '974', '0', '0.888888', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '5', '2.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10394', '0', '0', '0', '0', '152', '2416', '', '1', '1.0', '3.0', '2.0', '1.35', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101704 WHERE (`entry` = 10394);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10394);
-- Heroic Broken Cadaver
DELETE FROM `creature_template` WHERE entry = 9101705;
INSERT INTO `creature_template` VALUES (9101705, '0', '0', '0', '0', '0', '10970', '0', '0', '0', 'Heroic Broken Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.65', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '65', '326', '', '1', '1.0', '0.1', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101705 WHERE (`entry` = 10383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10383);
-- Heroic Cathela the Seeker
DELETE FROM `creature_template` WHERE entry = 9101706;
INSERT INTO `creature_template` VALUES (9101706, '0', '0', '0', '0', '0', '17315', '0', '0', '0', 'Heroic Cathela the Seeker', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101706 WHERE (`entry` = 17911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17911);
-- Heroic Crimson Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101707;
INSERT INTO `creature_template` VALUES (9101707, '0', '0', '0', '0', '0', '10529', '10531', '10530', '10532', 'Heroic Crimson Battle Mage', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.3', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10425', '10425', '0', '0', '0', '382', '2054', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101707 WHERE (`entry` = 10425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10425);
-- Heroic Crimson Conjuror
DELETE FROM `creature_template` WHERE entry = 9101708;
INSERT INTO `creature_template` VALUES (9101708, '0', '0', '0', '0', '0', '10488', '10489', '10490', '10491', 'Heroic Crimson Conjuror', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.8', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10419', '10419', '0', '0', '0', '362', '2525', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101708 WHERE (`entry` = 10419);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10419);
-- Heroic Crimson Defender
DELETE FROM `creature_template` WHERE entry = 9101709;
INSERT INTO `creature_template` VALUES (9101709, '0', '0', '0', '0', '0', '10500', '10502', '10501', '10503', 'Heroic Crimson Defender', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10421', '10421', '0', '0', '0', '402', '2844', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101709 WHERE (`entry` = 10421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10421);
-- Heroic Crimson Gallant
DELETE FROM `creature_template` WHERE entry = 9101710;
INSERT INTO `creature_template` VALUES (9101710, '0', '0', '0', '0', '0', '10512', '10513', '10514', '10515', 'Heroic Crimson Gallant', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10424', '10424', '0', '0', '0', '438', '2897', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101710 WHERE (`entry` = 10424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10424);
-- Heroic Crimson Guardsman
DELETE FROM `creature_template` WHERE entry = 9101711;
INSERT INTO `creature_template` VALUES (9101711, '0', '0', '0', '0', '0', '10492', '10494', '10493', '10495', 'Heroic Crimson Guardsman', NULL, NULL, '0', '60', '60', '0', '89', '0', '1.0', '1.14286', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10418', '10418', '0', '0', '0', '393', '2709', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101711 WHERE (`entry` = 10418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10418);
-- Heroic Crimson Initiate
DELETE FROM `creature_template` WHERE entry = 9101712;
INSERT INTO `creature_template` VALUES (9101712, '0', '0', '0', '0', '0', '10496', '10497', '10498', '10499', 'Heroic Crimson Initiate', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10420', '10420', '0', '0', '0', '460', '2637', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101712 WHERE (`entry` = 10420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10420);
-- Heroic Crimson Inquisitor
DELETE FROM `creature_template` WHERE entry = 9101713;
INSERT INTO `creature_template` VALUES (9101713, '0', '0', '0', '0', '0', '10516', '10517', '10518', '10519', 'Heroic Crimson Inquisitor', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10426', '10426', '0', '0', '0', '403', '2388', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101713 WHERE (`entry` = 10426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10426);
-- Heroic Crimson Monk
DELETE FROM `creature_template` WHERE entry = 9101714;
INSERT INTO `creature_template` VALUES (9101714, '0', '0', '0', '0', '0', '10463', '10464', '10533', '10534', 'Heroic Crimson Monk', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11043', '11043', '0', '0', '0', '486', '2365', '', '1', '1.0', '3.0', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101714 WHERE (`entry` = 11043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11043);
-- Heroic Crimson Priest
DELETE FROM `creature_template` WHERE entry = 9101715;
INSERT INTO `creature_template` VALUES (9101715, '0', '0', '0', '0', '0', '10508', '10510', '10509', '10511', 'Heroic Crimson Priest', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.75', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10423', '10423', '0', '0', '0', '368', '2296', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101715 WHERE (`entry` = 10423);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10423);
-- Heroic Crimson Rifleman
DELETE FROM `creature_template` WHERE entry = 9101716;
INSERT INTO `creature_template` VALUES (9101716, '0', '0', '0', '0', '0', '10820', '10822', '10821', '10823', 'Heroic Crimson Rifleman', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101716 WHERE (`entry` = 11054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11054);
-- Heroic Crimson Sorcerer
DELETE FROM `creature_template` WHERE entry = 9101717;
INSERT INTO `creature_template` VALUES (9101717, '0', '0', '0', '0', '0', '10504', '10505', '10506', '10507', 'Heroic Crimson Sorcerer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.75', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10422', '10422', '0', '0', '0', '368', '2364', '', '0', '1.0', '3.0', '2.0', '1.4', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101717 WHERE (`entry` = 10422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10422);
-- Heroic Crypt Beast
DELETE FROM `creature_template` WHERE entry = 9101718;
INSERT INTO `creature_template` VALUES (9101718, '0', '0', '0', '0', '0', '9758', '0', '0', '0', 'Heroic Crypt Beast', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10413', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101718 WHERE (`entry` = 10413);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10413);
-- Heroic Crypt Crawler
DELETE FROM `creature_template` WHERE entry = 9101719;
INSERT INTO `creature_template` VALUES (9101719, '0', '0', '0', '0', '0', '6841', '0', '0', '0', 'Heroic Crypt Crawler', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10412', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101719 WHERE (`entry` = 10412);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10412);
-- Heroic Elder Farwhisper
DELETE FROM `creature_template` WHERE entry = 9101720;
INSERT INTO `creature_template` VALUES (9101720, '0', '0', '0', '0', '0', '15610', '0', '0', '0', 'Heroic Elder Farwhisper', NULL, NULL, '21016', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.15', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.2', '1.0', '2.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101720 WHERE (`entry` = 15607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15607);
-- Heroic Eye of Naxxramas
DELETE FROM `creature_template` WHERE entry = 9101721;
INSERT INTO `creature_template` VALUES (9101721, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Heroic Eye of Naxxramas', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10411', '0', '0', '0', '0', '86', '808', '', '1', '1.0', '0.1', '1.0', '1.05', 
'0.25', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101721 WHERE (`entry` = 10411);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10411);
-- Heroic Felguard
DELETE FROM `creature_template` WHERE entry = 9101722;
INSERT INTO `creature_template` VALUES (9101722, '0', '0', '0', '0', '0', '14255', '0', '0', '0', 'Heroic Felguard', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '29', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.1', '0.77', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101722 WHERE (`entry` = 17252);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17252);
-- Heroic Felhunter
DELETE FROM `creature_template` WHERE entry = 9101723;
INSERT INTO `creature_template` VALUES (9101723, '0', '0', '0', '0', '0', '850', '0', '0', '0', 'Heroic Felhunter', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.15', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '15', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.95', '0.77', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101723 WHERE (`entry` = 417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 417);
-- Heroic Fleshflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9101724;
INSERT INTO `creature_template` VALUES (9101724, '0', '0', '0', '0', '0', '414', '0', '0', '0', 'Heroic Fleshflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10407', '0', '0', '0', '0', '493', '2930', '', '1', '1.0', '3.0', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101724 WHERE (`entry` = 10407);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10407);
-- Heroic Ghostly Citizen
DELETE FROM `creature_template` WHERE entry = 9101725;
INSERT INTO `creature_template` VALUES (9101725, '0', '0', '0', '0', '0', '10478', '10480', '10479', '10481', 'Heroic Ghostly Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10385', '0', '0', '0', '0', '339', '447', '', '1', '1.0', '2.0', 
'2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101725 WHERE (`entry` = 10385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10385);
-- Heroic Ghoul Ravener
DELETE FROM `creature_template` WHERE entry = 9101726;
INSERT INTO `creature_template` VALUES (9101726, '0', '0', '0', '0', '0', '10626', '0', '0', '0', 'Heroic Ghoul Ravener', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10406', '0', '0', '0', '0', '547', '2727', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101726 WHERE (`entry` = 10406);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10406);
-- Heroic Grand Crusader Dathrohan
DELETE FROM `creature_template` WHERE entry = 9101727;
INSERT INTO `creature_template` VALUES (9101727, '0', '0', '0', '0', '0', '10545', '0', '0', '0', 'Heroic Grand Crusader Dathrohan', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.7', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '10812', '0', '0', '0', '461', '2307', '', '0', '1.0', '10.0', '3.0', '1.25', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101727 WHERE (`entry` = 10812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10812);
-- Heroic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9101728;
INSERT INTO `creature_template` VALUES (9101728, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '1.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101728 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Heroic Gregor the Justiciar
DELETE FROM `creature_template` WHERE entry = 9101729;
INSERT INTO `creature_template` VALUES (9101729, '0', '0', '0', '0', '0', '17314', '0', '0', '0', 'Heroic Gregor the Justiciar', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.5', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101729 WHERE (`entry` = 17910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17910);
-- Heroic Imp
DELETE FROM `creature_template` WHERE entry = 9101730;
INSERT INTO `creature_template` VALUES (9101730, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Heroic Imp', '', '', '0', '60', '60', '0', '73', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.8', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '23', '0', '0', '0', '0', '3', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.36', '0.33', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101730 WHERE (`entry` = 416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 416);
-- Heroic Mangled Cadaver
DELETE FROM `creature_template` WHERE entry = 9101731;
INSERT INTO `creature_template` VALUES (9101731, '0', '0', '0', '0', '0', '10972', '5431', '4631', '0', 'Heroic Mangled Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10382', '10382', '0', '0', '0', '411', '2481', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101731 WHERE (`entry` = 10382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10382);
-- Heroic Mindless Skeleton
DELETE FROM `creature_template` WHERE entry = 9101732;
INSERT INTO `creature_template` VALUES (9101732, '0', '0', '0', '0', '0', '9784', '7550', '7555', '0', 'Heroic Mindless Skeleton', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.15', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.11', '1.0', '0.95', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101732 WHERE (`entry` = 11197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11197);
-- Heroic Mindless Undead
DELETE FROM `creature_template` WHERE entry = 9101733;
INSERT INTO `creature_template` VALUES (9101733, '0', '0', '0', '0', '0', '9784', '1200', '646', '0', 'Heroic Mindless Undead', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.4', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101733 WHERE (`entry` = 11030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11030);
-- Heroic Nemas the Arbiter
DELETE FROM `creature_template` WHERE entry = 9101734;
INSERT INTO `creature_template` VALUES (9101734, '0', '0', '0', '0', '0', '17316', '0', '0', '0', 'Heroic Nemas the Arbiter', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101734 WHERE (`entry` = 17912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17912);
-- Heroic Patchwork Horror
DELETE FROM `creature_template` WHERE entry = 9101735;
INSERT INTO `creature_template` VALUES (9101735, '0', '0', '0', '0', '0', '1693', '0', '0', '0', 'Heroic Patchwork Horror', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.4', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10414', '10414', '0', '0', '0', '816', '2663', '', '1', '1.0', '6.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101735 WHERE (`entry` = 10414);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10414);
-- Heroic Plague Ghoul
DELETE FROM `creature_template` WHERE entry = 9101736;
INSERT INTO `creature_template` VALUES (9101736, '0', '0', '0', '0', '0', '559', '0', '0', '0', 'Heroic Plague Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.5', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10405', '10405', '0', '0', '0', '420', '2677', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101736 WHERE (`entry` = 10405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10405);
-- Heroic Plagued Insect
DELETE FROM `creature_template` WHERE entry = 9101737;
INSERT INTO `creature_template` VALUES (9101737, '0', '0', '0', '0', '0', '7511', '2177', '9829', '0', 'Heroic Plagued Insect', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.3', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101737 WHERE (`entry` = 10461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10461);
-- Heroic Plagued Maggot
DELETE FROM `creature_template` WHERE entry = 9101738;
INSERT INTO `creature_template` VALUES (9101738, '0', '0', '0', '0', '0', '9903', '9904', '9905', '9906', 'Heroic Plagued Maggot', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '0.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101738 WHERE (`entry` = 10536);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10536);
-- Heroic Plagued Rat
DELETE FROM `creature_template` WHERE entry = 9101739;
INSERT INTO `creature_template` VALUES (9101739, '0', '0', '0', '0', '0', '1141', '1418', '2176', '0', 'Heroic Plagued Rat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.15', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.3', '1.0', '1.0', '0.5', 
'0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101739 WHERE (`entry` = 10441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10441);
-- Heroic Ravaged Cadaver
DELETE FROM `creature_template` WHERE entry = 9101740;
INSERT INTO `creature_template` VALUES (9101740, '0', '0', '0', '0', '0', '10974', '10255', '5432', '0', 'Heroic Ravaged Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10381', '0', '0', '0', '0', '423', '2614', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101740 WHERE (`entry` = 10381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10381);
-- Heroic Restless Soul
DELETE FROM `creature_template` WHERE entry = 9101741;
INSERT INTO `creature_template` VALUES (9101741, '0', '0', '0', '0', '0', '1825', '0', '0', '0', 'Heroic Restless Soul', NULL, NULL, '0', '60', '60', '0', '35', '0', '6.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '6.65', '2000', '2200', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '197', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101741 WHERE (`entry` = 11122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11122);
-- Heroic Rockwing Gargoyle
DELETE FROM `creature_template` WHERE entry = 9101742;
INSERT INTO `creature_template` VALUES (9101742, '0', '0', '0', '0', '0', '7533', '0', '0', '0', 'Heroic Rockwing Gargoyle', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10408', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.25', '1.0', '0', '144', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101742 WHERE (`entry` = 10408);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10408);
-- Heroic Rockwing Screecher
DELETE FROM `creature_template` WHERE entry = 9101743;
INSERT INTO `creature_template` VALUES (9101743, '0', '0', '0', '0', '0', '11071', '0', '0', '0', 'Heroic Rockwing Screecher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10409', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.25', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101743 WHERE (`entry` = 10409);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10409);
-- Heroic Shrieking Banshee
DELETE FROM `creature_template` WHERE entry = 9101744;
INSERT INTO `creature_template` VALUES (9101744, '0', '0', '0', '0', '0', '10728', '0', '0', '0', 'Heroic Shrieking Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10463', '0', '0', '0', '0', '464', '2746', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101744 WHERE (`entry` = 10463);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10463);
-- Heroic Skeletal Berserker
DELETE FROM `creature_template` WHERE entry = 9101745;
INSERT INTO `creature_template` VALUES (9101745, '0', '0', '0', '0', '0', '9784', '9787', '9786', '9788', 'Heroic Skeletal Berserker', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10391', '10391', '0', '0', '0', '136', '843', '', '1', '1.0', '1.0', 
'1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101745 WHERE (`entry` = 10391);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10391);
-- Heroic Skeletal Guardian
DELETE FROM `creature_template` WHERE entry = 9101746;
INSERT INTO `creature_template` VALUES (9101746, '0', '0', '0', '0', '0', '9789', '9785', '7555', '9790', 'Heroic Skeletal Guardian', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.75', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10390', '10390', '0', '0', '0', '122', '821', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101746 WHERE (`entry` = 10390);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10390);
-- Heroic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9101747;
INSERT INTO `creature_template` VALUES (9101747, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Heroic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.25', '1.0', '0.35', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101747 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477);
-- Heroic Spectral Citizen
DELETE FROM `creature_template` WHERE entry = 9101748;
INSERT INTO `creature_template` VALUES (9101748, '0', '0', '0', '0', '0', '10483', '10484', '10485', '10486', 'Heroic Spectral Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.55', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10384', '0', '0', '0', '0', '346', '522', '', '1', '1.0', '2.0', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101748 WHERE (`entry` = 10384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10384);
-- Heroic Spirit of Jarien
DELETE FROM `creature_template` WHERE entry = 9101749;
INSERT INTO `creature_template` VALUES (9101749, '0', '0', '0', '0', '0', '16019', '0', '0', '0', 'Heroic Spirit of Jarien', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.7', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.0', '15.0', '1.1', '1.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101749 WHERE (`entry` = 16103);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16103);
-- Heroic Spirit of Sothos
DELETE FROM `creature_template` WHERE entry = 9101750;
INSERT INTO `creature_template` VALUES (9101750, '0', '0', '0', '0', '0', '16004', '0', '0', '0', 'Heroic Spirit of Sothos', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.85', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.0', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101750 WHERE (`entry` = 16104);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16104);
-- Heroic Spiteful Phantom
DELETE FROM `creature_template` WHERE entry = 9101751;
INSERT INTO `creature_template` VALUES (9101751, '0', '0', '0', '0', '0', '10700', '0', '0', '0', 'Heroic Spiteful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.5', '2000', '1562', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.1', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101751 WHERE (`entry` = 10388);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10388);
-- Heroic Summoned Water Elemental
DELETE FROM `creature_template` WHERE entry = 9101752;
INSERT INTO `creature_template` VALUES (9101752, '0', '0', '0', '0', '0', '4606', '0', '0', '0', 'Heroic Summoned Water Elemental', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '0.9', '2000', '1606', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '55', '273', '', '0', '1.0', '0.5', '1.0', '0.85', '1.0', '0', '0', '1', '646016863', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101752 WHERE (`entry` = 10955);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10955);
-- Heroic Thuzadin Acolyte
DELETE FROM `creature_template` WHERE entry = 9101753;
INSERT INTO `creature_template` VALUES (9101753, '0', '0', '0', '0', '0', '10535', '10536', '10537', '10538', 'Heroic Thuzadin Acolyte', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.6', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10399', '10399', '0', '0', '0', '472', '3028', '', '1', '1.0', 
'1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101753 WHERE (`entry` = 10399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10399);
-- Heroic Thuzadin Necromancer
DELETE FROM `creature_template` WHERE entry = 9101754;
INSERT INTO `creature_template` VALUES (9101754, '0', '0', '0', '0', '0', '10539', '10541', '10540', '10542', 'Heroic Thuzadin Necromancer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.65', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10400', '10400', '0', '0', '0', '380', '2812', '', '1', '1.0', '3.0', '2.0', '2.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101754 WHERE (`entry` = 10400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10400);
-- Heroic Thuzadin Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9101755;
INSERT INTO `creature_template` VALUES (9101755, '0', '0', '0', '0', '0', '10631', '10633', '10632', '10634', 'Heroic Thuzadin Shadowcaster', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.75', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10398', '0', '0', '0', '0', '380', '2613', '', '1', '1.0', '3.0', '2.0', '2.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101755 WHERE (`entry` = 10398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10398);
-- Heroic Undead Postman
DELETE FROM `creature_template` WHERE entry = 9101756;
INSERT INTO `creature_template` VALUES (9101756, '0', '0', '0', '0', '0', '10668', '0', '0', '0', 'Heroic Undead Postman', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '1310', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11142', '0', '0', '0', '0', '1', '817', '', '1', '1.0', '2.5', '1.0', '0.8', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101756 WHERE (`entry` = 11142);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11142);
-- Heroic Undead Scarab
DELETE FROM `creature_template` WHERE entry = 9101757;
INSERT INTO `creature_template` VALUES (9101757, '0', '0', '0', '0', '0', '10031', '0', '0', '0', 'Heroic Undead Scarab', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '58', '288', '', '0', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101757 WHERE (`entry` = 10876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10876);
-- Heroic Vengeful Phantom
DELETE FROM `creature_template` WHERE entry = 9101758;
INSERT INTO `creature_template` VALUES (9101758, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Vengeful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10387', '0', '0', '0', '0', '56', '278', '', '1', '1.0', '0.3', '1.0', '0.85', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101758 WHERE (`entry` = 10387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10387);
-- Heroic Venom Belcher
DELETE FROM `creature_template` WHERE entry = 9101759;
INSERT INTO `creature_template` VALUES (9101759, '0', '0', '0', '0', '0', '12819', '0', '0', '0', 'Heroic Venom Belcher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10417', '10417', '0', '0', '0', '743', '2721', '', '1', '1.0', '5.0', '2.0', '1.15', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101759 WHERE (`entry` = 10417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10417);
-- Heroic Vicar Hieronymus
DELETE FROM `creature_template` WHERE entry = 9101760;
INSERT INTO `creature_template` VALUES (9101760, '0', '0', '0', '0', '0', '17318', '0', '0', '0', 'Heroic Vicar Hieronymus', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.0', '5.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101760 WHERE (`entry` = 17914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17914);
-- Heroic Wailing Banshee
DELETE FROM `creature_template` WHERE entry = 9101761;
INSERT INTO `creature_template` VALUES (9101761, '0', '0', '0', '0', '0', '8782', '0', '0', '0', 'Heroic Wailing Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10464', '0', '0', '0', '0', '478', '2869', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101761 WHERE (`entry` = 10464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10464);
-- Heroic Wrath Phantom
DELETE FROM `creature_template` WHERE entry = 9101762;
INSERT INTO `creature_template` VALUES (9101762, '0', '0', '0', '0', '0', '10701', '0', '0', '0', 'Heroic Wrath Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '5', '1.55', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.1', '1.0', '1.15', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101762 WHERE (`entry` = 10389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10389);
-- Heroic Ysida Harmon
DELETE FROM `creature_template` WHERE entry = 9101763;
INSERT INTO `creature_template` VALUES (9101763, '0', '0', '0', '0', '0', '15967', '0', '0', '0', 'Heroic Ysida Harmon', NULL, NULL, '7091', '60', '60', '0', '794', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.3', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.0', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101763 WHERE (`entry` = 16031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16031);
-- Heroic Archivist Galford
DELETE FROM `creature_template` WHERE entry = 9101764;
INSERT INTO `creature_template` VALUES (9101764, '0', '0', '0', '0', '0', '10544', '0', '0', '0', 'Heroic Archivist Galford', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10811', '0', '0', '0', '907', '2609', '', '1', '1.0', '6.22', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101764 WHERE (`entry` = 10811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10811);
-- Heroic Balnazzar
DELETE FROM `creature_template` WHERE entry = 9101765;
INSERT INTO `creature_template` VALUES (9101765, '0', '0', '0', '0', '0', '10691', '0', '0', '0', 'Heroic Balnazzar', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '1150', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '461', '3148', '', '1', '1.0', '6.48', '6.0', '1.4', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101765 WHERE (`entry` = 10813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10813);
-- Heroic Baroness Anastari
DELETE FROM `creature_template` WHERE entry = 9101766;
INSERT INTO `creature_template` VALUES (9101766, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Heroic Baroness Anastari', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '1670', '2185', '', '1', '1.0', '5.89', '4.0', '1.0', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101766 WHERE (`entry` = 10436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10436);
-- Heroic Black Guard Swordsmith
DELETE FROM `creature_template` WHERE entry = 9101767;
INSERT INTO `creature_template` VALUES (9101767, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Heroic Black Guard Swordsmith', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '1133', '1246', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '187', '935', '', '1', '1.0', '5.82', '2.0', '1.15', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101767 WHERE (`entry` = 11121);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11121);
-- Heroic Cannon Master Willey
DELETE FROM `creature_template` WHERE entry = 9101768;
INSERT INTO `creature_template` VALUES (9101768, '0', '0', '0', '0', '0', '10674', '0', '0', '0', 'Heroic Cannon Master Willey', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10997', '0', '0', '0', '1629', '2132', '', '1', '1.0', '6.0', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101768 WHERE (`entry` = 10997);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10997);
-- Heroic Crimson Hammersmith
DELETE FROM `creature_template` WHERE entry = 9101769;
INSERT INTO `creature_template` VALUES (9101769, '0', '0', '0', '0', '0', '10637', '10638', '10639', '10640', 'Heroic Crimson Hammersmith', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '168', '838', '', '1', '1.0', '6.43', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101769 WHERE (`entry` = 11120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11120);
-- Heroic Fras Siabi
DELETE FROM `creature_template` WHERE entry = 9101770;
INSERT INTO `creature_template` VALUES (9101770, '0', '0', '0', '0', '0', '10475', '0', '0', '0', 'Heroic Fras Siabi', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '1255', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '173', '1981', '', '1', '1.0', '5.96', '2.0', '1.15', 
'2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101770 WHERE (`entry` = 11058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11058);
-- Heroic Hearthsinger Forresten
DELETE FROM `creature_template` WHERE entry = 9101771;
INSERT INTO `creature_template` VALUES (9101771, '0', '0', '0', '0', '0', '10482', '0', '0', '0', 'Heroic Hearthsinger Forresten', NULL, NULL, '0', '63', '63', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '589', '2708', '', '1', '1.0', '6.14', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101771 WHERE (`entry` = 10558);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10558);
-- Heroic Jarien
DELETE FROM `creature_template` WHERE entry = 9101772;
INSERT INTO `creature_template` VALUES (9101772, '0', '0', '0', '0', '0', '16018', '0', '0', '0', 'Heroic Jarien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '871', '4568', '', '1', '1.0', '6.21', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101772 WHERE (`entry` = 16101);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16101);
-- Heroic Magistrate Barthilas
DELETE FROM `creature_template` WHERE entry = 9101773;
INSERT INTO `creature_template` VALUES (9101773, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Heroic Magistrate Barthilas', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10435', '0', '0', '0', '1286', '2654', '', '1', '1.0', '6.1', 
'2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101773 WHERE (`entry` = 10435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10435);
-- Heroic Maleki the Pallid
DELETE FROM `creature_template` WHERE entry = 9101774;
INSERT INTO `creature_template` VALUES (9101774, '0', '0', '0', '0', '0', '10546', '0', '0', '0', 'Heroic Maleki the Pallid', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10438', '0', '0', '0', '1036', '2697', '', '1', '1.0', '6.45', '1.5', '1.15', '2.0', '0', '0', '1', '617299931', '0', '67108864', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101774 WHERE (`entry` = 10438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10438);
-- Heroic Malor the Zealous
DELETE FROM `creature_template` WHERE entry = 9101775;
INSERT INTO `creature_template` VALUES (9101775, '0', '0', '0', '0', '0', '10458', '0', '0', '0', 'Heroic Malor the Zealous', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11032', '0', '0', '0', '822', '2726', '', '1', '1.0', '6.31', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101775 WHERE (`entry` = 11032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11032);
-- Heroic Nerubenkan
DELETE FROM `creature_template` WHERE entry = 9101776;
INSERT INTO `creature_template` VALUES (9101776, '0', '0', '0', '0', '0', '9793', '0', '0', '0', 'Heroic Nerubenkan', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.22', '2.0', '1.35', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101776 WHERE (`entry` = 10437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10437);
-- Heroic Postmaster Malown
DELETE FROM `creature_template` WHERE entry = 9101777;
INSERT INTO `creature_template` VALUES (9101777, '0', '0', '0', '0', '0', '10669', '0', '0', '0', 'Heroic Postmaster Malown', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2200', '1283', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '435', '2176', '', '0', '1.0', '6.16', '1.0', '1.35', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101777 WHERE (`entry` = 11143);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11143);
-- Heroic Ramstein the Gorger
DELETE FROM `creature_template` WHERE entry = 9101778;
INSERT INTO `creature_template` VALUES (9101778, '0', '0', '0', '0', '0', '12818', '0', '0', '0', 'Heroic Ramstein the Gorger', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '1', '1757', '', '1', '1.0', '5.95', '2.0', 
'1.05', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101778 WHERE (`entry` = 10439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10439);
-- Heroic Skul
DELETE FROM `creature_template` WHERE entry = 9101779;
INSERT INTO `creature_template` VALUES (9101779, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Heroic Skul', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.07', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '346', '2854', '', '1', '1.0', '6.28', '2.0', '2.1', '2.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101779 WHERE (`entry` = 10393);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10393);
-- Heroic Stonespine
DELETE FROM `creature_template` WHERE entry = 9101780;
INSERT INTO `creature_template` VALUES (9101780, '0', '0', '0', '0', '0', '7856', '0', '0', '0', 'Heroic Stonespine', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.0', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.42', '2.0', '2.15', '1.0', 
'0', '144', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101780 WHERE (`entry` = 10809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10809);
-- Heroic Sothos
DELETE FROM `creature_template` WHERE entry = 9101781;
INSERT INTO `creature_template` VALUES (9101781, '0', '0', '0', '0', '0', '16003', '0', '0', '0', 'Heroic Sothos', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '871', '4568', '', '1', '1.0', '6.21', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101781 WHERE (`entry` = 16102);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16102);
-- Heroic Stratholme Courier
DELETE FROM `creature_template` WHERE entry = 9101782;
INSERT INTO `creature_template` VALUES (9101782, '0', '0', '0', '0', '0', '10547', '0', '0', '0', 'Heroic Stratholme Courier', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '1301', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '604', '794', '', '1', '1.0', '6.23', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101782 WHERE (`entry` = 11082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11082);
-- Heroic The Unforgiven
DELETE FROM `creature_template` WHERE entry = 9101783;
INSERT INTO `creature_template` VALUES (9101783, '0', '0', '0', '0', '0', '10771', '0', '0', '0', 'Heroic The Unforgiven', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '534', '2669', '', '1', '1.0', '6.41', '2.0', 
'1.25', '2.0', '0', '0', '1', '646675226', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101783 WHERE (`entry` = 10516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10516);
-- Heroic Timmy the Cruel
DELETE FROM `creature_template` WHERE entry = 9101784;
INSERT INTO `creature_template` VALUES (9101784, '0', '0', '0', '0', '0', '571', '0', '0', '0', 'Heroic Timmy the Cruel', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.95', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10808', '0', '0', '0', '142', '2828', '', '1', '1.0', '6.42', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101784 WHERE (`entry` = 10808);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10808);
-- Heroic Atiesh
DELETE FROM `creature_template` WHERE entry = 9101785;
INSERT INTO `creature_template` VALUES (9101785, '0', '0', '0', '0', '0', '16164', '0', '0', '0', 'Heroic Atiesh', 'Hand of Sargeras', NULL, '0', '63', '63', '0', '954', '0', '1.0', '2.85714', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.94', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.37', '100.0', 
'1.35', '1.0', '0', '220', '1', '2113912827', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101785 WHERE (`entry` = 16387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16387);
-- Heroic Balzaphon
DELETE FROM `creature_template` WHERE entry = 9101786;
INSERT INTO `creature_template` VALUES (9101786, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Heroic Balzaphon', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '2275', '2984', '', '0', '1.0', '5.96', '6.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101786 WHERE (`entry` = 14684);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14684);
-- Heroic Baron Rivendare
DELETE FROM `creature_template` WHERE entry = 9101787;
INSERT INTO `creature_template` VALUES (9101787, '0', '0', '0', '0', '0', '10729', '0', '0', '0', 'Heroic Baron Rivendare', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'1.0', '1.0', '1', '0', '4.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '2057', '2692', '', '1', '1.0', '6.27', '5.0', '1.4', '2.0', '0', '0', '1', '1053507419', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101787 WHERE (`entry` = 10440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10440);
-- Mythic Aelmar the Vanquisher
DELETE FROM `creature_template` WHERE entry = 9101788;
INSERT INTO `creature_template` VALUES (9101788, '0', '0', '0', '0', '0', '17317', '0', '0', '0', 'Mythic Aelmar the Vanquisher', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', 
'4.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101788 WHERE (`entry` = 17913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17913);
-- Mythic Aurius
DELETE FROM `creature_template` WHERE entry = 9101789;
INSERT INTO `creature_template` VALUES (9101789, '0', '0', '0', '0', '0', '10217', '0', '0', '0', 'Mythic Aurius', NULL, NULL, '3043', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '1.5', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101789 WHERE (`entry` = 10917);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10917);
-- Mythic Bile Slime
DELETE FROM `creature_template` WHERE entry = 9101790;
INSERT INTO `creature_template` VALUES (9101790, '0', '0', '0', '0', '0', '10029', '0', '0', '0', 'Mythic Bile Slime', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '62', '308', '', '1', '1.0', '4.35', '1.0', '0.7', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101790 WHERE (`entry` = 10697);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10697);
-- Mythic Bile Spewer
DELETE FROM `creature_template` WHERE entry = 9101791;
INSERT INTO `creature_template` VALUES (9101791, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Mythic Bile Spewer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10416', '10416', '0', '0', '0', '503', '2070', '', '1', '1.0', '3.81', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101791 WHERE (`entry` = 10416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10416);
-- Mythic Black Guard Sentry
DELETE FROM `creature_template` WHERE entry = 9101792;
INSERT INTO `creature_template` VALUES (9101792, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Mythic Black Guard Sentry', NULL, NULL, '0', '60', '60', '0', '974', '0', '0.888888', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '5', '3.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10394', '0', '0', '0', '0', '152', '2416', '', '1', '1.0', '4.18', '2.0', '1.35', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101792 WHERE (`entry` = 10394);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10394);
-- Mythic Broken Cadaver
DELETE FROM `creature_template` WHERE entry = 9101793;
INSERT INTO `creature_template` VALUES (9101793, '0', '0', '0', '0', '0', '10970', '0', '0', '0', 'Mythic Broken Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '65', '326', '', '1', '1.0', '4.23', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101793 WHERE (`entry` = 10383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10383);
-- Mythic Cathela the Seeker
DELETE FROM `creature_template` WHERE entry = 9101794;
INSERT INTO `creature_template` VALUES (9101794, '0', '0', '0', '0', '0', '17315', '0', '0', '0', 'Mythic Cathela the Seeker', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.3', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101794 WHERE (`entry` = 17911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17911);
-- Mythic Crimson Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101795;
INSERT INTO `creature_template` VALUES (9101795, '0', '0', '0', '0', '0', '10529', '10531', '10530', '10532', 'Mythic Crimson Battle Mage', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10425', '10425', '0', '0', '0', '382', '2054', '', '1', '1.0', 
'4.4', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101795 WHERE (`entry` = 10425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10425);
-- Mythic Crimson Conjuror
DELETE FROM `creature_template` WHERE entry = 9101796;
INSERT INTO `creature_template` VALUES (9101796, '0', '0', '0', '0', '0', '10488', '10489', '10490', '10491', 'Mythic Crimson Conjuror', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10419', '10419', '0', '0', '0', '362', '2525', '', '1', '1.0', '4.01', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101796 WHERE (`entry` = 10419);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10419);
-- Mythic Crimson Defender
DELETE FROM `creature_template` WHERE entry = 9101797;
INSERT INTO `creature_template` VALUES (9101797, '0', '0', '0', '0', '0', '10500', '10502', '10501', '10503', 'Mythic Crimson Defender', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10421', '10421', '0', '0', '0', '402', '2844', '', '1', '1.0', '3.97', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101797 WHERE (`entry` = 10421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10421);
-- Mythic Crimson Gallant
DELETE FROM `creature_template` WHERE entry = 9101798;
INSERT INTO `creature_template` VALUES (9101798, '0', '0', '0', '0', '0', '10512', '10513', '10514', '10515', 'Mythic Crimson Gallant', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10424', '10424', '0', '0', '0', '438', '2897', '', '1', '1.0', '4.29', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101798 WHERE (`entry` = 10424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10424);
-- Mythic Crimson Guardsman
DELETE FROM `creature_template` WHERE entry = 9101799;
INSERT INTO `creature_template` VALUES (9101799, '0', '0', '0', '0', '0', '10492', '10494', '10493', '10495', 'Mythic Crimson Guardsman', NULL, NULL, '0', '60', '60', '0', '89', '0', '1.0', '1.14286', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10418', '10418', '0', '0', '0', '393', '2709', '', '1', '1.0', '4.33', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101799 WHERE (`entry` = 10418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10418);
-- Mythic Crimson Initiate
DELETE FROM `creature_template` WHERE entry = 9101800;
INSERT INTO `creature_template` VALUES (9101800, '0', '0', '0', '0', '0', '10496', '10497', '10498', '10499', 'Mythic Crimson Initiate', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10420', '10420', '0', '0', '0', '460', '2637', '', '1', '1.0', '4.02', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101800 WHERE (`entry` = 10420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10420);
-- Mythic Crimson Inquisitor
DELETE FROM `creature_template` WHERE entry = 9101801;
INSERT INTO `creature_template` VALUES (9101801, '0', '0', '0', '0', '0', '10516', '10517', '10518', '10519', 'Mythic Crimson Inquisitor', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10426', '10426', '0', '0', '0', '403', '2388', '', '1', '1.0', '4.16', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101801 WHERE (`entry` = 10426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10426);
-- Mythic Crimson Monk
DELETE FROM `creature_template` WHERE entry = 9101802;
INSERT INTO `creature_template` VALUES (9101802, '0', '0', '0', '0', '0', '10463', '10464', '10533', '10534', 'Mythic Crimson Monk', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11043', '11043', '0', '0', '0', '486', '2365', '', '1', '1.0', '4.34', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101802 WHERE (`entry` = 11043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11043);
-- Mythic Crimson Priest
DELETE FROM `creature_template` WHERE entry = 9101803;
INSERT INTO `creature_template` VALUES (9101803, '0', '0', '0', '0', '0', '10508', '10510', '10509', '10511', 'Mythic Crimson Priest', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10423', '10423', '0', '0', '0', '368', '2296', '', '1', '1.0', '3.96', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101803 WHERE (`entry` = 10423);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10423);
-- Mythic Crimson Rifleman
DELETE FROM `creature_template` WHERE entry = 9101804;
INSERT INTO `creature_template` VALUES (9101804, '0', '0', '0', '0', '0', '10820', '10822', '10821', '10823', 'Mythic Crimson Rifleman', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101804 WHERE (`entry` = 11054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11054);
-- Mythic Crimson Sorcerer
DELETE FROM `creature_template` WHERE entry = 9101805;
INSERT INTO `creature_template` VALUES (9101805, '0', '0', '0', '0', '0', '10504', '10505', '10506', '10507', 'Mythic Crimson Sorcerer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10422', '10422', '0', '0', '0', '368', '2364', '', '0', '1.0', '4.4', '2.0', '1.4', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101805 WHERE (`entry` = 10422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10422);
-- Mythic Crypt Beast
DELETE FROM `creature_template` WHERE entry = 9101806;
INSERT INTO `creature_template` VALUES (9101806, '0', '0', '0', '0', '0', '9758', '0', '0', '0', 'Mythic Crypt Beast', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10413', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.27', '2.0', '1.05', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101806 WHERE (`entry` = 10413);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10413);
-- Mythic Crypt Crawler
DELETE FROM `creature_template` WHERE entry = 9101807;
INSERT INTO `creature_template` VALUES (9101807, '0', '0', '0', '0', '0', '6841', '0', '0', '0', 'Mythic Crypt Crawler', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10412', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.92', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101807 WHERE (`entry` = 10412);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10412);
-- Mythic Elder Farwhisper
DELETE FROM `creature_template` WHERE entry = 9101808;
INSERT INTO `creature_template` VALUES (9101808, '0', '0', '0', '0', '0', '15610', '0', '0', '0', 'Mythic Elder Farwhisper', NULL, NULL, '21016', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.36', '1.0', '2.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101808 WHERE (`entry` = 15607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15607);
-- Mythic Eye of Naxxramas
DELETE FROM `creature_template` WHERE entry = 9101809;
INSERT INTO `creature_template` VALUES (9101809, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Mythic Eye of Naxxramas', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10411', '0', '0', '0', '0', '86', '808', '', '1', '1.0', '4.29', '1.0', '1.05', '0.25', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101809 WHERE (`entry` = 10411);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10411);
-- Mythic Felguard
DELETE FROM `creature_template` WHERE entry = 9101810;
INSERT INTO `creature_template` VALUES (9101810, '0', '0', '0', '0', '0', '14255', '0', '0', '0', 'Mythic Felguard', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '29', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '0.77', '1.0', '1.0', '0', 
'121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101810 WHERE (`entry` = 17252);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17252);
-- Mythic Felhunter
DELETE FROM `creature_template` WHERE entry = 9101811;
INSERT INTO `creature_template` VALUES (9101811, '0', '0', '0', '0', '0', '850', '0', '0', '0', 'Mythic Felhunter', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '15', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.82', '0.77', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101811 WHERE (`entry` = 417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 417);
-- Mythic Fleshflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9101812;
INSERT INTO `creature_template` VALUES (9101812, '0', '0', '0', '0', '0', '414', '0', '0', '0', 'Mythic Fleshflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10407', '0', '0', '0', '0', '493', '2930', '', '1', '1.0', '4.25', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101812 WHERE (`entry` = 10407);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10407);
-- Mythic Ghostly Citizen
DELETE FROM `creature_template` WHERE entry = 9101813;
INSERT INTO `creature_template` VALUES (9101813, '0', '0', '0', '0', '0', '10478', '10480', '10479', '10481', 'Mythic Ghostly Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10385', '0', '0', '0', '0', '339', '447', '', '1', '1.0', '3.89', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101813 WHERE (`entry` = 10385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10385);
-- Mythic Ghoul Ravener
DELETE FROM `creature_template` WHERE entry = 9101814;
INSERT INTO `creature_template` VALUES (9101814, '0', '0', '0', '0', '0', '10626', '0', '0', '0', 'Mythic Ghoul Ravener', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10406', '0', '0', '0', '0', '547', '2727', '', '1', '1.0', '3.98', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101814 WHERE (`entry` = 10406);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10406);
-- Mythic Grand Crusader Dathrohan
DELETE FROM `creature_template` WHERE entry = 9101815;
INSERT INTO `creature_template` VALUES (9101815, '0', '0', '0', '0', '0', '10545', '0', '0', '0', 'Mythic Grand Crusader Dathrohan', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '10812', '0', '0', '0', '461', '2307', '', '0', '1.0', '4.03', '3.0', '1.25', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101815 WHERE (`entry` = 10812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10812);
-- Mythic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9101816;
INSERT INTO `creature_template` VALUES (9101816, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '2.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.28', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101816 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Mythic Gregor the Justiciar
DELETE FROM `creature_template` WHERE entry = 9101817;
INSERT INTO `creature_template` VALUES (9101817, '0', '0', '0', '0', '0', '17314', '0', '0', '0', 'Mythic Gregor the Justiciar', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.86', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101817 WHERE (`entry` = 17910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17910);
-- Mythic Imp
DELETE FROM `creature_template` WHERE entry = 9101818;
INSERT INTO `creature_template` VALUES (9101818, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Mythic Imp', '', '', '0', '60', '60', '0', '73', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.91', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '23', '0', '0', '0', '0', '3', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.17', '0.33', '1.0', '1.0', '0', '121', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101818 WHERE (`entry` = 416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 416);
-- Mythic Mangled Cadaver
DELETE FROM `creature_template` WHERE entry = 9101819;
INSERT INTO `creature_template` VALUES (9101819, '0', '0', '0', '0', '0', '10972', '5431', '4631', '0', 'Mythic Mangled Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10382', '10382', '0', '0', '0', '411', '2481', '', '1', '1.0', '4.03', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101819 WHERE (`entry` = 10382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10382);
-- Mythic Mindless Skeleton
DELETE FROM `creature_template` WHERE entry = 9101820;
INSERT INTO `creature_template` VALUES (9101820, '0', '0', '0', '0', '0', '9784', '7550', '7555', '0', 'Mythic Mindless Skeleton', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '1.0', '0.95', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101820 WHERE (`entry` = 11197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11197);
-- Mythic Mindless Undead
DELETE FROM `creature_template` WHERE entry = 9101821;
INSERT INTO `creature_template` VALUES (9101821, '0', '0', '0', '0', '0', '9784', '1200', '646', '0', 'Mythic Mindless Undead', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.49', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101821 WHERE (`entry` = 11030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11030);
-- Mythic Nemas the Arbiter
DELETE FROM `creature_template` WHERE entry = 9101822;
INSERT INTO `creature_template` VALUES (9101822, '0', '0', '0', '0', '0', '17316', '0', '0', '0', 'Mythic Nemas the Arbiter', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.4', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101822 WHERE (`entry` = 17912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17912);
-- Mythic Patchwork Horror
DELETE FROM `creature_template` WHERE entry = 9101823;
INSERT INTO `creature_template` VALUES (9101823, '0', '0', '0', '0', '0', '1693', '0', '0', '0', 'Mythic Patchwork Horror', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.08', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10414', '10414', '0', '0', '0', '816', '2663', '', '1', '1.0', '4.46', '2.0', 
'1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101823 WHERE (`entry` = 10414);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10414);
-- Mythic Plague Ghoul
DELETE FROM `creature_template` WHERE entry = 9101824;
INSERT INTO `creature_template` VALUES (9101824, '0', '0', '0', '0', '0', '559', '0', '0', '0', 'Mythic Plague Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.98', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10405', '10405', '0', '0', '0', '420', '2677', '', '1', '1.0', '4.49', '2.0', 
'1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101824 WHERE (`entry` = 10405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10405);
-- Mythic Plagued Insect
DELETE FROM `creature_template` WHERE entry = 9101825;
INSERT INTO `creature_template` VALUES (9101825, '0', '0', '0', '0', '0', '7511', '2177', '9829', '0', 'Mythic Plagued Insect', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.32', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101825 WHERE (`entry` = 10461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10461);
-- Mythic Plagued Maggot
DELETE FROM `creature_template` WHERE entry = 9101826;
INSERT INTO `creature_template` VALUES (9101826, '0', '0', '0', '0', '0', '9903', '9904', '9905', '9906', 'Mythic Plagued Maggot', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.38', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101826 WHERE (`entry` = 10536);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10536);
-- Mythic Plagued Rat
DELETE FROM `creature_template` WHERE entry = 9101827;
INSERT INTO `creature_template` VALUES (9101827, '0', '0', '0', '0', '0', '1141', '1418', '2176', '0', 'Mythic Plagued Rat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.95', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101827 WHERE (`entry` = 10441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10441);
-- Mythic Ravaged Cadaver
DELETE FROM `creature_template` WHERE entry = 9101828;
INSERT INTO `creature_template` VALUES (9101828, '0', '0', '0', '0', '0', '10974', '10255', '5432', '0', 'Mythic Ravaged Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10381', '0', '0', '0', '0', '423', '2614', '', '1', '1.0', '4.3', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101828 WHERE (`entry` = 10381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10381);
-- Mythic Restless Soul
DELETE FROM `creature_template` WHERE entry = 9101829;
INSERT INTO `creature_template` VALUES (9101829, '0', '0', '0', '0', '0', '1825', '0', '0', '0', 'Mythic Restless Soul', NULL, NULL, '0', '60', '60', '0', '35', '0', '6.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2200', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '', '1', '1.0', '4.15', '1.0', '1.0', '1.0', '0', '197', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101829 WHERE (`entry` = 11122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11122);
-- Mythic Rockwing Gargoyle
DELETE FROM `creature_template` WHERE entry = 9101830;
INSERT INTO `creature_template` VALUES (9101830, '0', '0', '0', '0', '0', '7533', '0', '0', '0', 'Mythic Rockwing Gargoyle', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10408', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.04', '2.0', '1.25', 
'1.0', '0', '144', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101830 WHERE (`entry` = 10408);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10408);
-- Mythic Rockwing Screecher
DELETE FROM `creature_template` WHERE entry = 9101831;
INSERT INTO `creature_template` VALUES (9101831, '0', '0', '0', '0', '0', '11071', '0', '0', '0', 'Mythic Rockwing Screecher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10409', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '2.0', '1.25', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101831 WHERE (`entry` = 10409);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10409);
-- Mythic Shrieking Banshee
DELETE FROM `creature_template` WHERE entry = 9101832;
INSERT INTO `creature_template` VALUES (9101832, '0', '0', '0', '0', '0', '10728', '0', '0', '0', 'Mythic Shrieking Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10463', '0', '0', '0', '0', '464', '2746', '', '1', '1.0', '4.33', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101832 WHERE (`entry` = 10463);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10463);
-- Mythic Skeletal Berserker
DELETE FROM `creature_template` WHERE entry = 9101833;
INSERT INTO `creature_template` VALUES (9101833, '0', '0', '0', '0', '0', '9784', '9787', '9786', '9788', 'Mythic Skeletal Berserker', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10391', '10391', '0', '0', '0', '136', '843', '', '1', '1.0', '4.39', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101833 WHERE (`entry` = 10391);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10391);
-- Mythic Skeletal Guardian
DELETE FROM `creature_template` WHERE entry = 9101834;
INSERT INTO `creature_template` VALUES (9101834, '0', '0', '0', '0', '0', '9789', '9785', '7555', '9790', 'Mythic Skeletal Guardian', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10390', '10390', '0', '0', '0', '122', '821', '', '1', '1.0', '3.87', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101834 WHERE (`entry` = 10390);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10390);
-- Mythic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9101835;
INSERT INTO `creature_template` VALUES (9101835, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Mythic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '0.35', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101835 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477);
-- Mythic Spectral Citizen
DELETE FROM `creature_template` WHERE entry = 9101836;
INSERT INTO `creature_template` VALUES (9101836, '0', '0', '0', '0', '0', '10483', '10484', '10485', '10486', 'Mythic Spectral Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10384', '0', '0', '0', '0', '346', '522', '', '1', '1.0', '4.37', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101836 WHERE (`entry` = 10384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10384);
-- Mythic Spirit of Jarien
DELETE FROM `creature_template` WHERE entry = 9101837;
INSERT INTO `creature_template` VALUES (9101837, '0', '0', '0', '0', '0', '16019', '0', '0', '0', 'Mythic Spirit of Jarien', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.37', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101837 WHERE (`entry` = 16103);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16103);
-- Mythic Spirit of Sothos
DELETE FROM `creature_template` WHERE entry = 9101838;
INSERT INTO `creature_template` VALUES (9101838, '0', '0', '0', '0', '0', '16004', '0', '0', '0', 'Mythic Spirit of Sothos', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.04', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101838 WHERE (`entry` = 16104);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16104);
-- Mythic Spiteful Phantom
DELETE FROM `creature_template` WHERE entry = 9101839;
INSERT INTO `creature_template` VALUES (9101839, '0', '0', '0', '0', '0', '10700', '0', '0', '0', 'Mythic Spiteful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.97', '2000', '1562', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101839 WHERE (`entry` = 10388);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10388);
-- Mythic Summoned Water Elemental
DELETE FROM `creature_template` WHERE entry = 9101840;
INSERT INTO `creature_template` VALUES (9101840, '0', '0', '0', '0', '0', '4606', '0', '0', '0', 'Mythic Summoned Water Elemental', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.96', '2000', '1606', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '55', '273', '', '0', '1.0', '4.15', '1.0', '0.85', '1.0', '0', '0', '1', '646016863', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101840 WHERE (`entry` = 10955);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10955);
-- Mythic Thuzadin Acolyte
DELETE FROM `creature_template` WHERE entry = 9101841;
INSERT INTO `creature_template` VALUES (9101841, '0', '0', '0', '0', '0', '10535', '10536', '10537', '10538', 'Mythic Thuzadin Acolyte', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10399', '10399', '0', '0', '0', '472', '3028', '', '1', '1.0', '4.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101841 WHERE (`entry` = 10399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10399);
-- Mythic Thuzadin Necromancer
DELETE FROM `creature_template` WHERE entry = 9101842;
INSERT INTO `creature_template` VALUES (9101842, '0', '0', '0', '0', '0', '10539', '10541', '10540', '10542', 'Mythic Thuzadin Necromancer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10400', '10400', '0', '0', '0', '380', '2812', '', '1', '1.0', '3.81', '2.0', '2.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101842 WHERE (`entry` = 10400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10400);
-- Mythic Thuzadin Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9101843;
INSERT INTO `creature_template` VALUES (9101843, '0', '0', '0', '0', '0', '10631', '10633', '10632', '10634', 'Mythic Thuzadin Shadowcaster', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10398', '0', '0', '0', '0', '380', '2613', '', '1', '1.0', '3.99', '2.0', '2.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101843 WHERE (`entry` = 10398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10398);
-- Mythic Undead Postman
DELETE FROM `creature_template` WHERE entry = 9101844;
INSERT INTO `creature_template` VALUES (9101844, '0', '0', '0', '0', '0', '10668', '0', '0', '0', 'Mythic Undead Postman', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '1310', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11142', '0', '0', '0', '0', '1', '817', '', '1', '1.0', '4.4', '1.0', '0.8', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101844 WHERE (`entry` = 11142);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11142);
-- Mythic Undead Scarab
DELETE FROM `creature_template` WHERE entry = 9101845;
INSERT INTO `creature_template` VALUES (9101845, '0', '0', '0', '0', '0', '10031', '0', '0', '0', 'Mythic Undead Scarab', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '58', '288', '', '0', '1.0', '3.84', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101845 WHERE (`entry` = 10876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10876);
-- Mythic Vengeful Phantom
DELETE FROM `creature_template` WHERE entry = 9101846;
INSERT INTO `creature_template` VALUES (9101846, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Vengeful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10387', '0', '0', '0', '0', '56', '278', '', '1', '1.0', '4.45', '1.0', '0.85', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101846 WHERE (`entry` = 10387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10387);
-- Mythic Venom Belcher
DELETE FROM `creature_template` WHERE entry = 9101847;
INSERT INTO `creature_template` VALUES (9101847, '0', '0', '0', '0', '0', '12819', '0', '0', '0', 'Mythic Venom Belcher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10417', '10417', '0', '0', '0', '743', '2721', '', '1', '1.0', '4.04', '2.0', '1.15', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101847 WHERE (`entry` = 10417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10417);
-- Mythic Vicar Hieronymus
DELETE FROM `creature_template` WHERE entry = 9101848;
INSERT INTO `creature_template` VALUES (9101848, '0', '0', '0', '0', '0', '17318', '0', '0', '0', 'Mythic Vicar Hieronymus', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.16', '5.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101848 WHERE (`entry` = 17914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17914);
-- Mythic Wailing Banshee
DELETE FROM `creature_template` WHERE entry = 9101849;
INSERT INTO `creature_template` VALUES (9101849, '0', '0', '0', '0', '0', '8782', '0', '0', '0', 'Mythic Wailing Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10464', '0', '0', '0', '0', '478', '2869', '', '1', '1.0', '3.96', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101849 WHERE (`entry` = 10464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10464);
-- Mythic Wrath Phantom
DELETE FROM `creature_template` WHERE entry = 9101850;
INSERT INTO `creature_template` VALUES (9101850, '0', '0', '0', '0', '0', '10701', '0', '0', '0', 'Mythic Wrath Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '5', '3.04', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '1.0', '1.15', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101850 WHERE (`entry` = 10389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10389);
-- Mythic Ysida Harmon
DELETE FROM `creature_template` WHERE entry = 9101851;
INSERT INTO `creature_template` VALUES (9101851, '0', '0', '0', '0', '0', '15967', '0', '0', '0', 'Mythic Ysida Harmon', NULL, NULL, '7091', '60', '60', '0', '794', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.37', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101851 WHERE (`entry` = 16031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16031);
-- Mythic Archivist Galford
DELETE FROM `creature_template` WHERE entry = 9101852;
INSERT INTO `creature_template` VALUES (9101852, '0', '0', '0', '0', '0', '10544', '0', '0', '0', 'Mythic Archivist Galford', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10811', '0', '0', '0', '907', '2609', '', '1', '1.0', '8.08', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101852 WHERE (`entry` = 10811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10811);
-- Mythic Balnazzar
DELETE FROM `creature_template` WHERE entry = 9101853;
INSERT INTO `creature_template` VALUES (9101853, '0', '0', '0', '0', '0', '10691', '0', '0', '0', 'Mythic Balnazzar', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '1150', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '461', '3148', '', '1', '1.0', '8.23', '6.0', '1.4', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101853 WHERE (`entry` = 10813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10813);
-- Mythic Baroness Anastari
DELETE FROM `creature_template` WHERE entry = 9101854;
INSERT INTO `creature_template` VALUES (9101854, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Mythic Baroness Anastari', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '1670', '2185', '', '1', '1.0', '8.34', '4.0', '1.0', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101854 WHERE (`entry` = 10436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10436);
-- Mythic Black Guard Swordsmith
DELETE FROM `creature_template` WHERE entry = 9101855;
INSERT INTO `creature_template` VALUES (9101855, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Mythic Black Guard Swordsmith', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.1', '1133', '1246', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '187', '935', '', '1', '1.0', '8.27', '2.0', 
'1.15', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101855 WHERE (`entry` = 11121);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11121);
-- Mythic Cannon Master Willey
DELETE FROM `creature_template` WHERE entry = 9101856;
INSERT INTO `creature_template` VALUES (9101856, '0', '0', '0', '0', '0', '10674', '0', '0', '0', 'Mythic Cannon Master Willey', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10997', '0', '0', '0', '1629', '2132', '', '1', '1.0', '8.1', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101856 WHERE (`entry` = 10997);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10997);
-- Mythic Crimson Hammersmith
DELETE FROM `creature_template` WHERE entry = 9101857;
INSERT INTO `creature_template` VALUES (9101857, '0', '0', '0', '0', '0', '10637', '10638', '10639', '10640', 'Mythic Crimson Hammersmith', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '168', '838', '', '1', '1.0', '7.94', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101857 WHERE (`entry` = 11120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11120);
-- Mythic Fras Siabi
DELETE FROM `creature_template` WHERE entry = 9101858;
INSERT INTO `creature_template` VALUES (9101858, '0', '0', '0', '0', '0', '10475', '0', '0', '0', 'Mythic Fras Siabi', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '1255', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '173', '1981', '', '1', '1.0', '8.23', '2.0', '1.15', 
'2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101858 WHERE (`entry` = 11058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11058);
-- Mythic Hearthsinger Forresten
DELETE FROM `creature_template` WHERE entry = 9101859;
INSERT INTO `creature_template` VALUES (9101859, '0', '0', '0', '0', '0', '10482', '0', '0', '0', 'Mythic Hearthsinger Forresten', NULL, NULL, '0', '63', '63', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '589', '2708', '', '1', '1.0', '8.35', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101859 WHERE (`entry` = 10558);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10558);
-- Mythic Jarien
DELETE FROM `creature_template` WHERE entry = 9101860;
INSERT INTO `creature_template` VALUES (9101860, '0', '0', '0', '0', '0', '16018', '0', '0', '0', 'Mythic Jarien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '871', '4568', '', '1', '1.0', '8.08', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101860 WHERE (`entry` = 16101);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16101);
-- Mythic Magistrate Barthilas
DELETE FROM `creature_template` WHERE entry = 9101861;
INSERT INTO `creature_template` VALUES (9101861, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Mythic Magistrate Barthilas', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10435', '0', '0', '0', '1286', '2654', '', '1', '1.0', '8.04', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101861 WHERE (`entry` = 10435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10435);
-- Mythic Maleki the Pallid
DELETE FROM `creature_template` WHERE entry = 9101862;
INSERT INTO `creature_template` VALUES (9101862, '0', '0', '0', '0', '0', '10546', '0', '0', '0', 'Mythic Maleki the Pallid', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10438', '0', '0', '0', '1036', '2697', '', '1', '1.0', '8.37', '1.5', '1.15', '2.0', '0', '0', '1', '617299931', '0', '67108864', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101862 WHERE (`entry` = 10438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10438);
-- Mythic Malor the Zealous
DELETE FROM `creature_template` WHERE entry = 9101863;
INSERT INTO `creature_template` VALUES (9101863, '0', '0', '0', '0', '0', '10458', '0', '0', '0', 'Mythic Malor the Zealous', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11032', '0', '0', '0', '822', '2726', '', '1', '1.0', '8.42', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101863 WHERE (`entry` = 11032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11032);
-- Mythic Nerubenkan
DELETE FROM `creature_template` WHERE entry = 9101864;
INSERT INTO `creature_template` VALUES (9101864, '0', '0', '0', '0', '0', '9793', '0', '0', '0', 'Mythic Nerubenkan', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.96', '2.0', '1.35', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101864 WHERE (`entry` = 10437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10437);
-- Mythic Postmaster Malown
DELETE FROM `creature_template` WHERE entry = 9101865;
INSERT INTO `creature_template` VALUES (9101865, '0', '0', '0', '0', '0', '10669', '0', '0', '0', 'Mythic Postmaster Malown', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2200', '1283', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '435', '2176', '', '0', '1.0', '7.94', '1.0', '1.35', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101865 WHERE (`entry` = 11143);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11143);
-- Mythic Ramstein the Gorger
DELETE FROM `creature_template` WHERE entry = 9101866;
INSERT INTO `creature_template` VALUES (9101866, '0', '0', '0', '0', '0', '12818', '0', '0', '0', 'Mythic Ramstein the Gorger', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '1', '1757', '', '1', '1.0', '8.37', '2.0', 
'1.05', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101866 WHERE (`entry` = 10439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10439);
-- Mythic Skul
DELETE FROM `creature_template` WHERE entry = 9101867;
INSERT INTO `creature_template` VALUES (9101867, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Mythic Skul', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.1', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '346', '2854', '', '1', '1.0', '8.1', '2.0', '2.1', '2.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101867 WHERE (`entry` = 10393);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10393);
-- Mythic Stonespine
DELETE FROM `creature_template` WHERE entry = 9101868;
INSERT INTO `creature_template` VALUES (9101868, '0', '0', '0', '0', '0', '7856', '0', '0', '0', 'Mythic Stonespine', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.03', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.26', '2.0', '2.15', '1.0', '0', '144', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101868 WHERE (`entry` = 10809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10809);
-- Mythic Sothos
DELETE FROM `creature_template` WHERE entry = 9101869;
INSERT INTO `creature_template` VALUES (9101869, '0', '0', '0', '0', '0', '16003', '0', '0', '0', 'Mythic Sothos', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '871', '4568', '', '1', '1.0', '8.03', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101869 WHERE (`entry` = 16102);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16102);
-- Mythic Stratholme Courier
DELETE FROM `creature_template` WHERE entry = 9101870;
INSERT INTO `creature_template` VALUES (9101870, '0', '0', '0', '0', '0', '10547', '0', '0', '0', 'Mythic Stratholme Courier', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '1301', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '604', '794', '', '1', '1.0', '8.27', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101870 WHERE (`entry` = 11082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11082);
-- Mythic The Unforgiven
DELETE FROM `creature_template` WHERE entry = 9101871;
INSERT INTO `creature_template` VALUES (9101871, '0', '0', '0', '0', '0', '10771', '0', '0', '0', 'Mythic The Unforgiven', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '534', '2669', '', '1', '1.0', '8.21', '2.0', 
'1.25', '2.0', '0', '0', '1', '646675226', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101871 WHERE (`entry` = 10516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10516);
-- Mythic Timmy the Cruel
DELETE FROM `creature_template` WHERE entry = 9101872;
INSERT INTO `creature_template` VALUES (9101872, '0', '0', '0', '0', '0', '571', '0', '0', '0', 'Mythic Timmy the Cruel', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.93', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10808', '0', '0', '0', '142', '2828', '', '1', '1.0', '8.46', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101872 WHERE (`entry` = 10808);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10808);
-- Mythic Atiesh
DELETE FROM `creature_template` WHERE entry = 9101873;
INSERT INTO `creature_template` VALUES (9101873, '0', '0', '0', '0', '0', '16164', '0', '0', '0', 'Mythic Atiesh', 'Hand of Sargeras', NULL, '0', '63', '63', '0', '954', '0', '1.0', '2.85714', '1.0', '1.0', '20.0', '1.0', '3', '0', '7.0', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '7.91', '100.0', '1.35', '1.0', '0', '220', '1', '2113912827', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101873 WHERE (`entry` = 16387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16387);
-- Mythic Balzaphon
DELETE FROM `creature_template` WHERE entry = 9101874;
INSERT INTO `creature_template` VALUES (9101874, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Mythic Balzaphon', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '2275', '2984', '', '0', '1.0', '8.08', '6.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101874 WHERE (`entry` = 14684);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14684);
-- Mythic Baron Rivendare
DELETE FROM `creature_template` WHERE entry = 9101875;
INSERT INTO `creature_template` VALUES (9101875, '0', '0', '0', '0', '0', '10729', '0', '0', '0', 'Mythic Baron Rivendare', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'1.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '2057', '2692', '', '1', '1.0', '8.17', '5.0', '1.4', '2.0', '0', '0', '1', '1053507419', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101875 WHERE (`entry` = 10440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10440);