-- Heroic Aelmar the Vanquisher
DELETE FROM `creature_template` WHERE entry = 9102200;
INSERT INTO `creature_template` VALUES (9102200, '0', '0', '0', '0', '0', '17317', '0', '0', '0', 'Heroic Aelmar the Vanquisher', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', 
'2.91', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102200 WHERE (`entry` = 17913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17913) AND (`map` = 329);
-- Heroic Aurius
DELETE FROM `creature_template` WHERE entry = 9102201;
INSERT INTO `creature_template` VALUES (9102201, '0', '0', '0', '0', '0', '10217', '0', '0', '0', 'Heroic Aurius', NULL, NULL, '3043', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.08', '1.5', '1.05', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102201 WHERE (`entry` = 10917);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10917) AND (`map` = 329);
-- Heroic Bile Spewer
DELETE FROM `creature_template` WHERE entry = 9102202;
INSERT INTO `creature_template` VALUES (9102202, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Heroic Bile Spewer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10416', '10416', '0', '0', '0', '0', '0', '', '1', '1.0', '2.98', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102202 WHERE (`entry` = 10416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10416) AND (`map` = 329);
-- Heroic Black Guard Sentry
DELETE FROM `creature_template` WHERE entry = 9102203;
INSERT INTO `creature_template` VALUES (9102203, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Heroic Black Guard Sentry', NULL, NULL, '0', '60', '60', '0', '974', '0', '0.888888', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10394', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.39', '2.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102203 WHERE (`entry` = 10394);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10394) AND (`map` = 329);
-- Heroic Cathela the Seeker
DELETE FROM `creature_template` WHERE entry = 9102204;
INSERT INTO `creature_template` VALUES (9102204, '0', '0', '0', '0', '0', '17315', '0', '0', '0', 'Heroic Cathela the Seeker', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.3', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102204 WHERE (`entry` = 17911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17911) AND (`map` = 329);
-- Heroic Crimson Battle Mage
DELETE FROM `creature_template` WHERE entry = 9102205;
INSERT INTO `creature_template` VALUES (9102205, '0', '0', '0', '0', '0', '10529', '10531', '10530', '10532', 'Heroic Crimson Battle Mage', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10425', '10425', '0', '0', '0', '0', '0', '', '1', '1.0', '3.44', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102205 WHERE (`entry` = 10425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10425) AND (`map` = 329);
-- Heroic Crimson Conjuror
DELETE FROM `creature_template` WHERE entry = 9102206;
INSERT INTO `creature_template` VALUES (9102206, '0', '0', '0', '0', '0', '10488', '10489', '10490', '10491', 'Heroic Crimson Conjuror', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10419', '10419', '0', '0', '0', '0', '0', '', '1', '1.0', '3.16', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102206 WHERE (`entry` = 10419);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10419) AND (`map` = 329);
-- Heroic Crimson Defender
DELETE FROM `creature_template` WHERE entry = 9102207;
INSERT INTO `creature_template` VALUES (9102207, '0', '0', '0', '0', '0', '10500', '10502', '10501', '10503', 'Heroic Crimson Defender', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10421', '10421', '0', '0', '0', '0', '0', '', '1', '1.0', '2.94', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102207 WHERE (`entry` = 10421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10421) AND (`map` = 329);
-- Heroic Crimson Gallant
DELETE FROM `creature_template` WHERE entry = 9102208;
INSERT INTO `creature_template` VALUES (9102208, '0', '0', '0', '0', '0', '10512', '10513', '10514', '10515', 'Heroic Crimson Gallant', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10424', '10424', '0', '0', '0', '0', '0', '', '1', '1.0', '3.41', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102208 WHERE (`entry` = 10424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10424) AND (`map` = 329);
-- Heroic Crimson Guardsman
DELETE FROM `creature_template` WHERE entry = 9102209;
INSERT INTO `creature_template` VALUES (9102209, '0', '0', '0', '0', '0', '10492', '10494', '10493', '10495', 'Heroic Crimson Guardsman', NULL, NULL, '0', '60', '60', '0', '89', '0', '1.0', '1.14286', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10418', '10418', '0', '0', '0', '0', '0', '', '1', '1.0', '3.21', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102209 WHERE (`entry` = 10418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10418) AND (`map` = 329);
-- Heroic Crimson Initiate
DELETE FROM `creature_template` WHERE entry = 9102210;
INSERT INTO `creature_template` VALUES (9102210, '0', '0', '0', '0', '0', '10496', '10497', '10498', '10499', 'Heroic Crimson Initiate', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10420', '10420', '0', '0', '0', '0', '0', '', '1', '1.0', '3.4', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102210 WHERE (`entry` = 10420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10420) AND (`map` = 329);
-- Heroic Crimson Inquisitor
DELETE FROM `creature_template` WHERE entry = 9102211;
INSERT INTO `creature_template` VALUES (9102211, '0', '0', '0', '0', '0', '10516', '10517', '10518', '10519', 'Heroic Crimson Inquisitor', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10426', '10426', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102211 WHERE (`entry` = 10426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10426) AND (`map` = 329);
-- Heroic Crimson Monk
DELETE FROM `creature_template` WHERE entry = 9102212;
INSERT INTO `creature_template` VALUES (9102212, '0', '0', '0', '0', '0', '10463', '10464', '10533', '10534', 'Heroic Crimson Monk', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11043', '11043', '0', '0', '0', '0', '0', '', '1', '1.0', '2.8', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102212 WHERE (`entry` = 11043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11043) AND (`map` = 329);
-- Heroic Crimson Priest
DELETE FROM `creature_template` WHERE entry = 9102213;
INSERT INTO `creature_template` VALUES (9102213, '0', '0', '0', '0', '0', '10508', '10510', '10509', '10511', 'Heroic Crimson Priest', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10423', '10423', '0', '0', '0', '0', '0', '', '1', '1.0', '2.94', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102213 WHERE (`entry` = 10423);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10423) AND (`map` = 329);
-- Heroic Crimson Sorcerer
DELETE FROM `creature_template` WHERE entry = 9102214;
INSERT INTO `creature_template` VALUES (9102214, '0', '0', '0', '0', '0', '10504', '10505', '10506', '10507', 'Heroic Crimson Sorcerer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10422', '10422', '0', '0', '0', '0', '0', '', '0', '1.0', '3.37', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102214 WHERE (`entry` = 10422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10422) AND (`map` = 329);
-- Heroic Crypt Beast
DELETE FROM `creature_template` WHERE entry = 9102215;
INSERT INTO `creature_template` VALUES (9102215, '0', '0', '0', '0', '0', '9758', '0', '0', '0', 'Heroic Crypt Beast', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10413', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.43', '2.0', '1.05', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102215 WHERE (`entry` = 10413);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10413) AND (`map` = 329);
-- Heroic Crypt Crawler
DELETE FROM `creature_template` WHERE entry = 9102216;
INSERT INTO `creature_template` VALUES (9102216, '0', '0', '0', '0', '0', '6841', '0', '0', '0', 'Heroic Crypt Crawler', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10412', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.37', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102216 WHERE (`entry` = 10412);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10412) AND (`map` = 329);
-- Heroic Felguard
DELETE FROM `creature_template` WHERE entry = 9102217;
INSERT INTO `creature_template` VALUES (9102217, '0', '0', '0', '0', '0', '14255', '0', '0', '0', 'Heroic Felguard', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '29', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '0.77', '1.0', '1.0', '0', 
'121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102217 WHERE (`entry` = 17252);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17252) AND (`map` = 329);
-- Heroic Felhunter
DELETE FROM `creature_template` WHERE entry = 9102218;
INSERT INTO `creature_template` VALUES (9102218, '0', '0', '0', '0', '0', '850', '0', '0', '0', 'Heroic Felhunter', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '15', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.26', '0.77', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102218 WHERE (`entry` = 417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 417) AND (`map` = 329);
-- Heroic Fleshflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9102219;
INSERT INTO `creature_template` VALUES (9102219, '0', '0', '0', '0', '0', '414', '0', '0', '0', 'Heroic Fleshflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10407', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.41', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102219 WHERE (`entry` = 10407);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10407) AND (`map` = 329);
-- Heroic Ghostly Citizen
DELETE FROM `creature_template` WHERE entry = 9102220;
INSERT INTO `creature_template` VALUES (9102220, '0', '0', '0', '0', '0', '10478', '10480', '10479', '10481', 'Heroic Ghostly Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10385', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.09', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102220 WHERE (`entry` = 10385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10385) AND (`map` = 329);
-- Heroic Ghoul Ravener
DELETE FROM `creature_template` WHERE entry = 9102221;
INSERT INTO `creature_template` VALUES (9102221, '0', '0', '0', '0', '0', '10626', '0', '0', '0', 'Heroic Ghoul Ravener', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10406', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.28', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102221 WHERE (`entry` = 10406);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10406) AND (`map` = 329);
-- Heroic Grand Crusader Dathrohan
DELETE FROM `creature_template` WHERE entry = 9102222;
INSERT INTO `creature_template` VALUES (9102222, '0', '0', '0', '0', '0', '10545', '0', '0', '0', 'Heroic Grand Crusader Dathrohan', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '10812', '0', '0', '0', '0', '0', '', '0', '1.0', '3.03', '3.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102222 WHERE (`entry` = 10812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10812) AND (`map` = 329);
-- Heroic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9102223;
INSERT INTO `creature_template` VALUES (9102223, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '2.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102223 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438) AND (`map` = 329);
-- Heroic Gregor the Justiciar
DELETE FROM `creature_template` WHERE entry = 9102224;
INSERT INTO `creature_template` VALUES (9102224, '0', '0', '0', '0', '0', '17314', '0', '0', '0', 'Heroic Gregor the Justiciar', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.49', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102224 WHERE (`entry` = 17910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17910) AND (`map` = 329);
-- Heroic Imp
DELETE FROM `creature_template` WHERE entry = 9102225;
INSERT INTO `creature_template` VALUES (9102225, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Heroic Imp', '', '', '0', '60', '60', '0', '73', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '23', '0', '0', '0', '0', '3', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.1', '0.33', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102225 WHERE (`entry` = 416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 416) AND (`map` = 329);
-- Heroic Mangled Cadaver
DELETE FROM `creature_template` WHERE entry = 9102226;
INSERT INTO `creature_template` VALUES (9102226, '0', '0', '0', '0', '0', '10972', '5431', '4631', '0', 'Heroic Mangled Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10382', '10382', '0', '0', '0', '0', '0', '', '1', '1.0', '3.15', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102226 WHERE (`entry` = 10382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10382) AND (`map` = 329);
-- Heroic Nemas the Arbiter
DELETE FROM `creature_template` WHERE entry = 9102227;
INSERT INTO `creature_template` VALUES (9102227, '0', '0', '0', '0', '0', '17316', '0', '0', '0', 'Heroic Nemas the Arbiter', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.13', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102227 WHERE (`entry` = 17912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17912) AND (`map` = 329);
-- Heroic Patchwork Horror
DELETE FROM `creature_template` WHERE entry = 9102228;
INSERT INTO `creature_template` VALUES (9102228, '0', '0', '0', '0', '0', '1693', '0', '0', '0', 'Heroic Patchwork Horror', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.02', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10414', '10414', '0', '0', '0', '0', '0', '', '1', '1.0', '3.26', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102228 WHERE (`entry` = 10414);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10414) AND (`map` = 329);
-- Heroic Plague Ghoul
DELETE FROM `creature_template` WHERE entry = 9102229;
INSERT INTO `creature_template` VALUES (9102229, '0', '0', '0', '0', '0', '559', '0', '0', '0', 'Heroic Plague Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.03', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10405', '10405', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102229 WHERE (`entry` = 10405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10405) AND (`map` = 329);
-- Heroic Ravaged Cadaver
DELETE FROM `creature_template` WHERE entry = 9102230;
INSERT INTO `creature_template` VALUES (9102230, '0', '0', '0', '0', '0', '10974', '10255', '5432', '0', 'Heroic Ravaged Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10381', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.01', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102230 WHERE (`entry` = 10381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10381) AND (`map` = 329);
-- Heroic Rockwing Gargoyle
DELETE FROM `creature_template` WHERE entry = 9102231;
INSERT INTO `creature_template` VALUES (9102231, '0', '0', '0', '0', '0', '7533', '0', '0', '0', 'Heroic Rockwing Gargoyle', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10408', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.45', '2.0', '1.25', 
'1.0', '0', '144', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102231 WHERE (`entry` = 10408);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10408) AND (`map` = 329);
-- Heroic Rockwing Screecher
DELETE FROM `creature_template` WHERE entry = 9102232;
INSERT INTO `creature_template` VALUES (9102232, '0', '0', '0', '0', '0', '11071', '0', '0', '0', 'Heroic Rockwing Screecher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10409', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.42', '2.0', '1.25', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102232 WHERE (`entry` = 10409);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10409) AND (`map` = 329);
-- Heroic Shrieking Banshee
DELETE FROM `creature_template` WHERE entry = 9102233;
INSERT INTO `creature_template` VALUES (9102233, '0', '0', '0', '0', '0', '10728', '0', '0', '0', 'Heroic Shrieking Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10463', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.48', '2.0', '1.0', 
'1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102233 WHERE (`entry` = 10463);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10463) AND (`map` = 329);
-- Heroic Spectral Citizen
DELETE FROM `creature_template` WHERE entry = 9102234;
INSERT INTO `creature_template` VALUES (9102234, '0', '0', '0', '0', '0', '10483', '10484', '10485', '10486', 'Heroic Spectral Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10384', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.31', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102234 WHERE (`entry` = 10384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10384) AND (`map` = 329);
-- Heroic Spirit of Jarien
DELETE FROM `creature_template` WHERE entry = 9102235;
INSERT INTO `creature_template` VALUES (9102235, '0', '0', '0', '0', '0', '16019', '0', '0', '0', 'Heroic Spirit of Jarien', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.91', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102235 WHERE (`entry` = 16103);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16103) AND (`map` = 329);
-- Heroic Spirit of Sothos
DELETE FROM `creature_template` WHERE entry = 9102236;
INSERT INTO `creature_template` VALUES (9102236, '0', '0', '0', '0', '0', '16004', '0', '0', '0', 'Heroic Spirit of Sothos', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.01', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.84', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102236 WHERE (`entry` = 16104);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16104) AND (`map` = 329);
-- Heroic Thuzadin Necromancer
DELETE FROM `creature_template` WHERE entry = 9102237;
INSERT INTO `creature_template` VALUES (9102237, '0', '0', '0', '0', '0', '10539', '10541', '10540', '10542', 'Heroic Thuzadin Necromancer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10400', '10400', '0', '0', '0', '0', '0', '', '1', '1.0', '2.94', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102237 WHERE (`entry` = 10400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10400) AND (`map` = 329);
-- Heroic Thuzadin Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9102238;
INSERT INTO `creature_template` VALUES (9102238, '0', '0', '0', '0', '0', '10631', '10633', '10632', '10634', 'Heroic Thuzadin Shadowcaster', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10398', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.21', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102238 WHERE (`entry` = 10398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10398) AND (`map` = 329);
-- Heroic Undead Postman
DELETE FROM `creature_template` WHERE entry = 9102239;
INSERT INTO `creature_template` VALUES (9102239, '0', '0', '0', '0', '0', '10668', '0', '0', '0', 'Heroic Undead Postman', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '1310', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11142', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.47', '1.0', '1.0', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102239 WHERE (`entry` = 11142);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11142) AND (`map` = 329);
-- Heroic Venom Belcher
DELETE FROM `creature_template` WHERE entry = 9102240;
INSERT INTO `creature_template` VALUES (9102240, '0', '0', '0', '0', '0', '12819', '0', '0', '0', 'Heroic Venom Belcher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10417', '10417', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102240 WHERE (`entry` = 10417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10417) AND (`map` = 329);
-- Heroic Vicar Hieronymus
DELETE FROM `creature_template` WHERE entry = 9102241;
INSERT INTO `creature_template` VALUES (9102241, '0', '0', '0', '0', '0', '17318', '0', '0', '0', 'Heroic Vicar Hieronymus', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.82', '5.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102241 WHERE (`entry` = 17914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17914) AND (`map` = 329);
-- Heroic Wailing Banshee
DELETE FROM `creature_template` WHERE entry = 9102242;
INSERT INTO `creature_template` VALUES (9102242, '0', '0', '0', '0', '0', '8782', '0', '0', '0', 'Heroic Wailing Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10464', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.44', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102242 WHERE (`entry` = 10464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10464) AND (`map` = 329);
-- Heroic Archivist Galford
DELETE FROM `creature_template` WHERE entry = 9102243;
INSERT INTO `creature_template` VALUES (9102243, '0', '0', '0', '0', '0', '10544', '0', '0', '0', 'Heroic Archivist Galford', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10811', '0', '0', '0', '0', '0', '', '1', '1.0', '6.4', '3.0', '1.0', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102243 WHERE (`entry` = 10811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10811) AND (`map` = 329);
-- Heroic Balnazzar
DELETE FROM `creature_template` WHERE entry = 9102244;
INSERT INTO `creature_template` VALUES (9102244, '0', '0', '0', '0', '0', '10691', '0', '0', '0', 'Heroic Balnazzar', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '1150', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.47', '6.0', '1.0', '2.0', 
'0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102244 WHERE (`entry` = 10813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10813) AND (`map` = 329);
-- Heroic Baroness Anastari
DELETE FROM `creature_template` WHERE entry = 9102245;
INSERT INTO `creature_template` VALUES (9102245, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Heroic Baroness Anastari', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '5.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.81', '4.0', '1.0', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102245 WHERE (`entry` = 10436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10436) AND (`map` = 329);
-- Heroic Black Guard Swordsmith
DELETE FROM `creature_template` WHERE entry = 9102246;
INSERT INTO `creature_template` VALUES (9102246, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Heroic Black Guard Swordsmith', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '1133', '1246', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.84', '2.0', '1.15', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102246 WHERE (`entry` = 11121);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11121) AND (`map` = 329);
-- Heroic Cannon Master Willey
DELETE FROM `creature_template` WHERE entry = 9102247;
INSERT INTO `creature_template` VALUES (9102247, '0', '0', '0', '0', '0', '10674', '0', '0', '0', 'Heroic Cannon Master Willey', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10997', '0', '0', '0', '0', '0', '', '1', '1.0', '5.89', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102247 WHERE (`entry` = 10997);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10997) AND (`map` = 329);
-- Heroic Crimson Hammersmith
DELETE FROM `creature_template` WHERE entry = 9102248;
INSERT INTO `creature_template` VALUES (9102248, '0', '0', '0', '0', '0', '10637', '10638', '10639', '10640', 'Heroic Crimson Hammersmith', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.89', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102248 WHERE (`entry` = 11120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11120) AND (`map` = 329);
-- Heroic Fras Siabi
DELETE FROM `creature_template` WHERE entry = 9102249;
INSERT INTO `creature_template` VALUES (9102249, '0', '0', '0', '0', '0', '10475', '0', '0', '0', 'Heroic Fras Siabi', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '1255', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '2.0', '1.0', '2.0', 
'0', '0', '1', '1026', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102249 WHERE (`entry` = 11058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11058) AND (`map` = 329);
-- Heroic Jarien
DELETE FROM `creature_template` WHERE entry = 9102250;
INSERT INTO `creature_template` VALUES (9102250, '0', '0', '0', '0', '0', '16018', '0', '0', '0', 'Heroic Jarien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.9', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102250 WHERE (`entry` = 16101);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16101) AND (`map` = 329);
-- Heroic Magistrate Barthilas
DELETE FROM `creature_template` WHERE entry = 9102251;
INSERT INTO `creature_template` VALUES (9102251, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Heroic Magistrate Barthilas', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10435', '0', '0', '0', '0', '0', '', '1', '1.0', '6.39', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102251 WHERE (`entry` = 10435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10435) AND (`map` = 329);
-- Heroic Maleki the Pallid
DELETE FROM `creature_template` WHERE entry = 9102252;
INSERT INTO `creature_template` VALUES (9102252, '0', '0', '0', '0', '0', '10546', '0', '0', '0', 'Heroic Maleki the Pallid', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10438', '0', '0', '0', '0', '0', '', '1', '1.0', '5.81', '1.5', '1.15', '2.0', '0', '0', '1', '617299931', '0', '67108864', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102252 WHERE (`entry` = 10438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10438) AND (`map` = 329);
-- Heroic Malor the Zealous
DELETE FROM `creature_template` WHERE entry = 9102253;
INSERT INTO `creature_template` VALUES (9102253, '0', '0', '0', '0', '0', '10458', '0', '0', '0', 'Heroic Malor the Zealous', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11032', '0', '0', '0', '0', '0', '', '1', '1.0', '6.38', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102253 WHERE (`entry` = 11032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11032) AND (`map` = 329);
-- Heroic Nerubenkan
DELETE FROM `creature_template` WHERE entry = 9102254;
INSERT INTO `creature_template` VALUES (9102254, '0', '0', '0', '0', '0', '9793', '0', '0', '0', 'Heroic Nerubenkan', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '2.0', '1.35', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102254 WHERE (`entry` = 10437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10437) AND (`map` = 329);
-- Heroic Postmaster Malown
DELETE FROM `creature_template` WHERE entry = 9102255;
INSERT INTO `creature_template` VALUES (9102255, '0', '0', '0', '0', '0', '10669', '0', '0', '0', 'Heroic Postmaster Malown', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2200', '1283', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.33', '1.0', '1.0', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102255 WHERE (`entry` = 11143);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11143) AND (`map` = 329);
-- Heroic Ramstein the Gorger
DELETE FROM `creature_template` WHERE entry = 9102256;
INSERT INTO `creature_template` VALUES (9102256, '0', '0', '0', '0', '0', '12818', '0', '0', '0', 'Heroic Ramstein the Gorger', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.97', '2.0', '1.05', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102256 WHERE (`entry` = 10439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10439) AND (`map` = 329);
-- Heroic Sothos
DELETE FROM `creature_template` WHERE entry = 9102257;
INSERT INTO `creature_template` VALUES (9102257, '0', '0', '0', '0', '0', '16003', '0', '0', '0', 'Heroic Sothos', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102257 WHERE (`entry` = 16102);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16102) AND (`map` = 329);
-- Heroic Stratholme Courier
DELETE FROM `creature_template` WHERE entry = 9102258;
INSERT INTO `creature_template` VALUES (9102258, '0', '0', '0', '0', '0', '10547', '0', '0', '0', 'Heroic Stratholme Courier', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '1301', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.21', '1.0', '1.0', '1.0', '0', '0', '1', '12583952', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102258 WHERE (`entry` = 11082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11082) AND (`map` = 329);
-- Heroic The Unforgiven
DELETE FROM `creature_template` WHERE entry = 9102259;
INSERT INTO `creature_template` VALUES (9102259, '0', '0', '0', '0', '0', '10771', '0', '0', '0', 'Heroic The Unforgiven', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.82', '2.0', '1.25', '2.0', '0', '0', '1', '646675226', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102259 WHERE (`entry` = 10516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10516) AND (`map` = 329);
-- Heroic Timmy the Cruel
DELETE FROM `creature_template` WHERE entry = 9102260;
INSERT INTO `creature_template` VALUES (9102260, '0', '0', '0', '0', '0', '571', '0', '0', '0', 'Heroic Timmy the Cruel', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.04', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10808', '0', '0', '0', '0', '0', '', '1', '1.0', '6.21', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102260 WHERE (`entry` = 10808);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10808) AND (`map` = 329);
-- Heroic Atiesh
DELETE FROM `creature_template` WHERE entry = 9102261;
INSERT INTO `creature_template` VALUES (9102261, '0', '0', '0', '0', '0', '16164', '0', '0', '0', 'Heroic Atiesh', 'Hand of Sargeras', NULL, '0', '63', '63', '0', '954', '0', '1.0', '2.85714', '1.0', '1.0', '20.0', '1.0', '3', '0', '5.1', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.2', '100.0', '1.0', '1.0', '0', '220', '1', '1073741819', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102261 WHERE (`entry` = 16387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16387) AND (`map` = 329);
-- Heroic Balzaphon
DELETE FROM `creature_template` WHERE entry = 9102262;
INSERT INTO `creature_template` VALUES (9102262, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Heroic Balzaphon', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.42', '6.0', '1.1', '1.0', '0', '0', '1', '8415248', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102262 WHERE (`entry` = 14684);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14684) AND (`map` = 329);
-- Heroic Baron Rivendare
DELETE FROM `creature_template` WHERE entry = 9102263;
INSERT INTO `creature_template` VALUES (9102263, '0', '0', '0', '0', '0', '10729', '0', '0', '0', 'Heroic Baron Rivendare', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'1.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.08', '5.0', '1.0', '2.0', '0', '0', '1', '1053507419', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102263 WHERE (`entry` = 10440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10440) AND (`map` = 329);
-- Heroic Hearthsinger Forresten
DELETE FROM `creature_template` WHERE entry = 9102264;
INSERT INTO `creature_template` VALUES (9102264, '0', '0', '0', '0', '0', '10482', '0', '0', '0', 'Heroic Hearthsinger Forresten', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10558', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.84', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102264 WHERE (`entry` = 10558);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10558) AND (`map` = 329);
-- Heroic Skul
DELETE FROM `creature_template` WHERE entry = 9102265;
INSERT INTO `creature_template` VALUES (9102265, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Heroic Skul', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.05', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10393', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.85', '2.0', '2.1', '2.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102265 WHERE (`entry` = 10393);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10393) AND (`map` = 329);
-- Heroic Stonespine
DELETE FROM `creature_template` WHERE entry = 9102266;
INSERT INTO `creature_template` VALUES (9102266, '0', '0', '0', '0', '0', '7856', '0', '0', '0', 'Heroic Stonespine', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.91', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10809', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.02', '2.0', '2.15', '1.0', '0', '144', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102266 WHERE (`entry` = 10809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10809) AND (`map` = 329);
-- Heroic Bile Slime
DELETE FROM `creature_template` WHERE entry = 9102267;
INSERT INTO `creature_template` VALUES (9102267, '0', '0', '0', '0', '0', '10029', '0', '0', '0', 'Heroic Bile Slime', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.95', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102267 WHERE (`entry` = 10697);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10697) AND (`map` = 329);
-- Heroic Broken Cadaver
DELETE FROM `creature_template` WHERE entry = 9102268;
INSERT INTO `creature_template` VALUES (9102268, '0', '0', '0', '0', '0', '10970', '0', '0', '0', 'Heroic Broken Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.27', '1.0', '0.95', '1.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102268 WHERE (`entry` = 10383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10383) AND (`map` = 329);
-- Heroic Crimson Rifleman
DELETE FROM `creature_template` WHERE entry = 9102269;
INSERT INTO `creature_template` VALUES (9102269, '0', '0', '0', '0', '0', '10820', '10822', '10821', '10823', 'Heroic Crimson Rifleman', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.93', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.83', '1.0', '1.0', '1.0', '0', '0', '1', '1024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102269 WHERE (`entry` = 11054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11054) AND (`map` = 329);
-- Heroic Elder Farwhisper
DELETE FROM `creature_template` WHERE entry = 9102270;
INSERT INTO `creature_template` VALUES (9102270, '0', '0', '0', '0', '0', '15610', '0', '0', '0', 'Heroic Elder Farwhisper', NULL, NULL, '21016', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.02', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.05', '1.0', '2.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102270 WHERE (`entry` = 15607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15607) AND (`map` = 329);
-- Heroic Eye of Naxxramas
DELETE FROM `creature_template` WHERE entry = 9102271;
INSERT INTO `creature_template` VALUES (9102271, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Heroic Eye of Naxxramas', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10411', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.07', '1.0', '1.05', '0.25', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102271 WHERE (`entry` = 10411);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10411) AND (`map` = 329);
-- Heroic Mindless Skeleton
DELETE FROM `creature_template` WHERE entry = 9102272;
INSERT INTO `creature_template` VALUES (9102272, '0', '0', '0', '0', '0', '9784', '7550', '7555', '0', 'Heroic Mindless Skeleton', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.05', '1.0', '0.95', 
'1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102272 WHERE (`entry` = 11197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11197) AND (`map` = 329);
-- Heroic Mindless Undead
DELETE FROM `creature_template` WHERE entry = 9102273;
INSERT INTO `creature_template` VALUES (9102273, '0', '0', '0', '0', '0', '9784', '1200', '646', '0', 'Heroic Mindless Undead', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.46', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102273 WHERE (`entry` = 11030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11030) AND (`map` = 329);
-- Heroic Plagued Insect
DELETE FROM `creature_template` WHERE entry = 9102274;
INSERT INTO `creature_template` VALUES (9102274, '0', '0', '0', '0', '0', '7511', '2177', '9829', '0', 'Heroic Plagued Insect', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.02', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102274 WHERE (`entry` = 10461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10461) AND (`map` = 329);
-- Heroic Plagued Maggot
DELETE FROM `creature_template` WHERE entry = 9102275;
INSERT INTO `creature_template` VALUES (9102275, '0', '0', '0', '0', '0', '9903', '9904', '9905', '9906', 'Heroic Plagued Maggot', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.95', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102275 WHERE (`entry` = 10536);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10536) AND (`map` = 329);
-- Heroic Plagued Rat
DELETE FROM `creature_template` WHERE entry = 9102276;
INSERT INTO `creature_template` VALUES (9102276, '0', '0', '0', '0', '0', '1141', '1418', '2176', '0', 'Heroic Plagued Rat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.47', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102276 WHERE (`entry` = 10441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10441) AND (`map` = 329);
-- Heroic Restless Soul
DELETE FROM `creature_template` WHERE entry = 9102277;
INSERT INTO `creature_template` VALUES (9102277, '0', '0', '0', '0', '0', '1825', '0', '0', '0', 'Heroic Restless Soul', NULL, NULL, '0', '60', '60', '0', '35', '0', '6.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '2200', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.87', '1.0', '1.0', '1.0', '0', '197', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102277 WHERE (`entry` = 11122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11122) AND (`map` = 329);
-- Heroic Skeletal Berserker
DELETE FROM `creature_template` WHERE entry = 9102278;
INSERT INTO `creature_template` VALUES (9102278, '0', '0', '0', '0', '0', '9784', '9787', '9786', '9788', 'Heroic Skeletal Berserker', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10391', '10391', '0', '0', '0', '0', '0', '', '1', '1.0', '1.92', '1.0', '1.0', '1.0', '0', '0', '1', '8602129', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102278 WHERE (`entry` = 10391);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10391) AND (`map` = 329);
-- Heroic Skeletal Guardian
DELETE FROM `creature_template` WHERE entry = 9102279;
INSERT INTO `creature_template` VALUES (9102279, '0', '0', '0', '0', '0', '9789', '9785', '7555', '9790', 'Heroic Skeletal Guardian', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.93', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10390', '10390', '0', '0', '0', '0', '0', '', '1', '1.0', '2.19', '1.0', '1.0', '1.0', '0', '0', '1', '8602129', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102279 WHERE (`entry` = 10390);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10390) AND (`map` = 329);
-- Heroic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9102280;
INSERT INTO `creature_template` VALUES (9102280, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Heroic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.09', '1.0', '1.0', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102280 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477) AND (`map` = 329);
-- Heroic Spiteful Phantom
DELETE FROM `creature_template` WHERE entry = 9102281;
INSERT INTO `creature_template` VALUES (9102281, '0', '0', '0', '0', '0', '10700', '0', '0', '0', 'Heroic Spiteful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.01', '2000', '1562', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.13', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102281 WHERE (`entry` = 10388);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10388) AND (`map` = 329);
-- Heroic Summoned Water Elemental
DELETE FROM `creature_template` WHERE entry = 9102282;
INSERT INTO `creature_template` VALUES (9102282, '0', '0', '0', '0', '0', '4606', '0', '0', '0', 'Heroic Summoned Water Elemental', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '0.9', '2000', '1606', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.86', '1.0', '1.0', '1.0', '0', '0', '1', '646016863', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102282 WHERE (`entry` = 10955);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10955) AND (`map` = 329);
-- Heroic Thuzadin Acolyte
DELETE FROM `creature_template` WHERE entry = 9102283;
INSERT INTO `creature_template` VALUES (9102283, '0', '0', '0', '0', '0', '10535', '10536', '10537', '10538', 'Heroic Thuzadin Acolyte', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.91', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10399', '10399', '0', '0', '0', '0', '0', '', '1', '1.0', '1.85', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102283 WHERE (`entry` = 10399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10399) AND (`map` = 329);
-- Heroic Undead Scarab
DELETE FROM `creature_template` WHERE entry = 9102284;
INSERT INTO `creature_template` VALUES (9102284, '0', '0', '0', '0', '0', '10031', '0', '0', '0', 'Heroic Undead Scarab', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.98', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.03', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102284 WHERE (`entry` = 10876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10876) AND (`map` = 329);
-- Heroic Vengeful Phantom
DELETE FROM `creature_template` WHERE entry = 9102285;
INSERT INTO `creature_template` VALUES (9102285, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Vengeful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '0.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10387', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.41', '1.0', '1.0', 
'0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102285 WHERE (`entry` = 10387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10387) AND (`map` = 329);
-- Heroic Wrath Phantom
DELETE FROM `creature_template` WHERE entry = 9102286;
INSERT INTO `creature_template` VALUES (9102286, '0', '0', '0', '0', '0', '10701', '0', '0', '0', 'Heroic Wrath Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '5', '1.04', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.06', '1.0', '1.0', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102286 WHERE (`entry` = 10389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10389) AND (`map` = 329);
-- Heroic Ysida Harmon
DELETE FROM `creature_template` WHERE entry = 9102287;
INSERT INTO `creature_template` VALUES (9102287, '0', '0', '0', '0', '0', '15967', '0', '0', '0', 'Heroic Ysida Harmon', NULL, NULL, '7091', '60', '60', '0', '794', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.08', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.1', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102287 WHERE (`entry` = 16031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16031) AND (`map` = 329);
-- Mythic Aelmar the Vanquisher
DELETE FROM `creature_template` WHERE entry = 9102288;
INSERT INTO `creature_template` VALUES (9102288, '0', '0', '0', '0', '0', '17317', '0', '0', '0', 'Mythic Aelmar the Vanquisher', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', 
'4.22', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102288 WHERE (`entry` = 17913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17913) AND (`map` = 329);
-- Mythic Aurius
DELETE FROM `creature_template` WHERE entry = 9102289;
INSERT INTO `creature_template` VALUES (9102289, '0', '0', '0', '0', '0', '10217', '0', '0', '0', 'Mythic Aurius', NULL, NULL, '3043', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '1.5', '1.05', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102289 WHERE (`entry` = 10917);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10917) AND (`map` = 329);
-- Mythic Bile Spewer
DELETE FROM `creature_template` WHERE entry = 9102290;
INSERT INTO `creature_template` VALUES (9102290, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Mythic Bile Spewer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10416', '10416', '0', '0', '0', '0', '0', '', '1', '1.0', '3.87', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102290 WHERE (`entry` = 10416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10416) AND (`map` = 329);
-- Mythic Black Guard Sentry
DELETE FROM `creature_template` WHERE entry = 9102291;
INSERT INTO `creature_template` VALUES (9102291, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Mythic Black Guard Sentry', NULL, NULL, '0', '60', '60', '0', '974', '0', '0.888888', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10394', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '2.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102291 WHERE (`entry` = 10394);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10394) AND (`map` = 329);
-- Mythic Cathela the Seeker
DELETE FROM `creature_template` WHERE entry = 9102292;
INSERT INTO `creature_template` VALUES (9102292, '0', '0', '0', '0', '0', '17315', '0', '0', '0', 'Mythic Cathela the Seeker', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.48', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102292 WHERE (`entry` = 17911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17911) AND (`map` = 329);
-- Mythic Crimson Battle Mage
DELETE FROM `creature_template` WHERE entry = 9102293;
INSERT INTO `creature_template` VALUES (9102293, '0', '0', '0', '0', '0', '10529', '10531', '10530', '10532', 'Mythic Crimson Battle Mage', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10425', '10425', '0', '0', '0', '0', '0', '', '1', '1.0', '4.49', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102293 WHERE (`entry` = 10425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10425) AND (`map` = 329);
-- Mythic Crimson Conjuror
DELETE FROM `creature_template` WHERE entry = 9102294;
INSERT INTO `creature_template` VALUES (9102294, '0', '0', '0', '0', '0', '10488', '10489', '10490', '10491', 'Mythic Crimson Conjuror', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10419', '10419', '0', '0', '0', '0', '0', '', '1', '1.0', '4.35', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102294 WHERE (`entry` = 10419);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10419) AND (`map` = 329);
-- Mythic Crimson Defender
DELETE FROM `creature_template` WHERE entry = 9102295;
INSERT INTO `creature_template` VALUES (9102295, '0', '0', '0', '0', '0', '10500', '10502', '10501', '10503', 'Mythic Crimson Defender', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10421', '10421', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102295 WHERE (`entry` = 10421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10421) AND (`map` = 329);
-- Mythic Crimson Gallant
DELETE FROM `creature_template` WHERE entry = 9102296;
INSERT INTO `creature_template` VALUES (9102296, '0', '0', '0', '0', '0', '10512', '10513', '10514', '10515', 'Mythic Crimson Gallant', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10424', '10424', '0', '0', '0', '0', '0', '', '1', '1.0', '4.14', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102296 WHERE (`entry` = 10424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10424) AND (`map` = 329);
-- Mythic Crimson Guardsman
DELETE FROM `creature_template` WHERE entry = 9102297;
INSERT INTO `creature_template` VALUES (9102297, '0', '0', '0', '0', '0', '10492', '10494', '10493', '10495', 'Mythic Crimson Guardsman', NULL, NULL, '0', '60', '60', '0', '89', '0', '1.0', '1.14286', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10418', '10418', '0', '0', '0', '0', '0', '', '1', '1.0', '4.08', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102297 WHERE (`entry` = 10418);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10418) AND (`map` = 329);
-- Mythic Crimson Initiate
DELETE FROM `creature_template` WHERE entry = 9102298;
INSERT INTO `creature_template` VALUES (9102298, '0', '0', '0', '0', '0', '10496', '10497', '10498', '10499', 'Mythic Crimson Initiate', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10420', '10420', '0', '0', '0', '0', '0', '', '1', '1.0', '4.31', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102298 WHERE (`entry` = 10420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10420) AND (`map` = 329);
-- Mythic Crimson Inquisitor
DELETE FROM `creature_template` WHERE entry = 9102299;
INSERT INTO `creature_template` VALUES (9102299, '0', '0', '0', '0', '0', '10516', '10517', '10518', '10519', 'Mythic Crimson Inquisitor', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10426', '10426', '0', '0', '0', '0', '0', '', '1', '1.0', '3.96', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102299 WHERE (`entry` = 10426);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10426) AND (`map` = 329);
-- Mythic Crimson Monk
DELETE FROM `creature_template` WHERE entry = 9102300;
INSERT INTO `creature_template` VALUES (9102300, '0', '0', '0', '0', '0', '10463', '10464', '10533', '10534', 'Mythic Crimson Monk', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11043', '11043', '0', '0', '0', '0', '0', '', '1', '1.0', '3.82', '2.0', '0.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102300 WHERE (`entry` = 11043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11043) AND (`map` = 329);
-- Mythic Crimson Priest
DELETE FROM `creature_template` WHERE entry = 9102301;
INSERT INTO `creature_template` VALUES (9102301, '0', '0', '0', '0', '0', '10508', '10510', '10509', '10511', 'Mythic Crimson Priest', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10423', '10423', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102301 WHERE (`entry` = 10423);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10423) AND (`map` = 329);
-- Mythic Crimson Sorcerer
DELETE FROM `creature_template` WHERE entry = 9102302;
INSERT INTO `creature_template` VALUES (9102302, '0', '0', '0', '0', '0', '10504', '10505', '10506', '10507', 'Mythic Crimson Sorcerer', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10422', '10422', '0', '0', '0', '0', '0', '', '0', '1.0', '3.86', 
'2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102302 WHERE (`entry` = 10422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10422) AND (`map` = 329);
-- Mythic Crypt Beast
DELETE FROM `creature_template` WHERE entry = 9102303;
INSERT INTO `creature_template` VALUES (9102303, '0', '0', '0', '0', '0', '9758', '0', '0', '0', 'Mythic Crypt Beast', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10413', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.25', '2.0', '1.05', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102303 WHERE (`entry` = 10413);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10413) AND (`map` = 329);
-- Mythic Crypt Crawler
DELETE FROM `creature_template` WHERE entry = 9102304;
INSERT INTO `creature_template` VALUES (9102304, '0', '0', '0', '0', '0', '6841', '0', '0', '0', 'Mythic Crypt Crawler', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10412', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102304 WHERE (`entry` = 10412);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10412) AND (`map` = 329);
-- Mythic Felguard
DELETE FROM `creature_template` WHERE entry = 9102305;
INSERT INTO `creature_template` VALUES (9102305, '0', '0', '0', '0', '0', '14255', '0', '0', '0', 'Mythic Felguard', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '29', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.22', '0.77', '1.0', '1.0', '0', 
'121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102305 WHERE (`entry` = 17252);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17252) AND (`map` = 329);
-- Mythic Felhunter
DELETE FROM `creature_template` WHERE entry = 9102306;
INSERT INTO `creature_template` VALUES (9102306, '0', '0', '0', '0', '0', '850', '0', '0', '0', 'Mythic Felhunter', '', '', '0', '60', '60', '2', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '15', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.86', '0.77', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102306 WHERE (`entry` = 417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 417) AND (`map` = 329);
-- Mythic Fleshflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9102307;
INSERT INTO `creature_template` VALUES (9102307, '0', '0', '0', '0', '0', '414', '0', '0', '0', 'Mythic Fleshflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10407', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '2.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102307 WHERE (`entry` = 10407);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10407) AND (`map` = 329);
-- Mythic Ghostly Citizen
DELETE FROM `creature_template` WHERE entry = 9102308;
INSERT INTO `creature_template` VALUES (9102308, '0', '0', '0', '0', '0', '10478', '10480', '10479', '10481', 'Mythic Ghostly Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10385', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102308 WHERE (`entry` = 10385);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10385) AND (`map` = 329);
-- Mythic Ghoul Ravener
DELETE FROM `creature_template` WHERE entry = 9102309;
INSERT INTO `creature_template` VALUES (9102309, '0', '0', '0', '0', '0', '10626', '0', '0', '0', 'Mythic Ghoul Ravener', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10406', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102309 WHERE (`entry` = 10406);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10406) AND (`map` = 329);
-- Mythic Grand Crusader Dathrohan
DELETE FROM `creature_template` WHERE entry = 9102310;
INSERT INTO `creature_template` VALUES (9102310, '0', '0', '0', '0', '0', '10545', '0', '0', '0', 'Mythic Grand Crusader Dathrohan', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '10812', '0', '0', '0', '0', '0', '', '0', '1.0', '4.47', '3.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102310 WHERE (`entry` = 10812);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10812) AND (`map` = 329);
-- Mythic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9102311;
INSERT INTO `creature_template` VALUES (9102311, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '2.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102311 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438) AND (`map` = 329);
-- Mythic Gregor the Justiciar
DELETE FROM `creature_template` WHERE entry = 9102312;
INSERT INTO `creature_template` VALUES (9102312, '0', '0', '0', '0', '0', '17314', '0', '0', '0', 'Mythic Gregor the Justiciar', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.01', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102312 WHERE (`entry` = 17910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17910) AND (`map` = 329);
-- Mythic Imp
DELETE FROM `creature_template` WHERE entry = 9102313;
INSERT INTO `creature_template` VALUES (9102313, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Mythic Imp', '', '', '0', '60', '60', '0', '73', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '23', '0', '0', '0', '0', '3', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.39', '0.33', '1.0', '1.0', '0', '121', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102313 WHERE (`entry` = 416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 416) AND (`map` = 329);
-- Mythic Mangled Cadaver
DELETE FROM `creature_template` WHERE entry = 9102314;
INSERT INTO `creature_template` VALUES (9102314, '0', '0', '0', '0', '0', '10972', '5431', '4631', '0', 'Mythic Mangled Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10382', '10382', '0', '0', '0', '0', '0', '', '1', '1.0', '4.14', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102314 WHERE (`entry` = 10382);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10382) AND (`map` = 329);
-- Mythic Nemas the Arbiter
DELETE FROM `creature_template` WHERE entry = 9102315;
INSERT INTO `creature_template` VALUES (9102315, '0', '0', '0', '0', '0', '17316', '0', '0', '0', 'Mythic Nemas the Arbiter', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.48', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102315 WHERE (`entry` = 17912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17912) AND (`map` = 329);
-- Mythic Patchwork Horror
DELETE FROM `creature_template` WHERE entry = 9102316;
INSERT INTO `creature_template` VALUES (9102316, '0', '0', '0', '0', '0', '1693', '0', '0', '0', 'Mythic Patchwork Horror', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.94', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10414', '10414', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102316 WHERE (`entry` = 10414);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10414) AND (`map` = 329);
-- Mythic Plague Ghoul
DELETE FROM `creature_template` WHERE entry = 9102317;
INSERT INTO `creature_template` VALUES (9102317, '0', '0', '0', '0', '0', '559', '0', '0', '0', 'Mythic Plague Ghoul', NULL, NULL, '0', '60', '60', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.95', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10405', '10405', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102317 WHERE (`entry` = 10405);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10405) AND (`map` = 329);
-- Mythic Ravaged Cadaver
DELETE FROM `creature_template` WHERE entry = 9102318;
INSERT INTO `creature_template` VALUES (9102318, '0', '0', '0', '0', '0', '10974', '10255', '5432', '0', 'Mythic Ravaged Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10381', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102318 WHERE (`entry` = 10381);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10381) AND (`map` = 329);
-- Mythic Rockwing Gargoyle
DELETE FROM `creature_template` WHERE entry = 9102319;
INSERT INTO `creature_template` VALUES (9102319, '0', '0', '0', '0', '0', '7533', '0', '0', '0', 'Mythic Rockwing Gargoyle', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10408', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.89', '2.0', '1.25', 
'1.0', '0', '144', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102319 WHERE (`entry` = 10408);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10408) AND (`map` = 329);
-- Mythic Rockwing Screecher
DELETE FROM `creature_template` WHERE entry = 9102320;
INSERT INTO `creature_template` VALUES (9102320, '0', '0', '0', '0', '0', '11071', '0', '0', '0', 'Mythic Rockwing Screecher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10409', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.93', '2.0', '1.25', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102320 WHERE (`entry` = 10409);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10409) AND (`map` = 329);
-- Mythic Shrieking Banshee
DELETE FROM `creature_template` WHERE entry = 9102321;
INSERT INTO `creature_template` VALUES (9102321, '0', '0', '0', '0', '0', '10728', '0', '0', '0', 'Mythic Shrieking Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10463', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.25', '2.0', '1.0', 
'1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102321 WHERE (`entry` = 10463);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10463) AND (`map` = 329);
-- Mythic Spectral Citizen
DELETE FROM `creature_template` WHERE entry = 9102322;
INSERT INTO `creature_template` VALUES (9102322, '0', '0', '0', '0', '0', '10483', '10484', '10485', '10486', 'Mythic Spectral Citizen', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10384', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.38', '2.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102322 WHERE (`entry` = 10384);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10384) AND (`map` = 329);
-- Mythic Spirit of Jarien
DELETE FROM `creature_template` WHERE entry = 9102323;
INSERT INTO `creature_template` VALUES (9102323, '0', '0', '0', '0', '0', '16019', '0', '0', '0', 'Mythic Spirit of Jarien', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.98', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102323 WHERE (`entry` = 16103);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16103) AND (`map` = 329);
-- Mythic Spirit of Sothos
DELETE FROM `creature_template` WHERE entry = 9102324;
INSERT INTO `creature_template` VALUES (9102324, '0', '0', '0', '0', '0', '16004', '0', '0', '0', 'Mythic Spirit of Sothos', NULL, NULL, '0', '60', '60', '0', '42', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.07', '1200', '1450', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.15', '15.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102324 WHERE (`entry` = 16104);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16104) AND (`map` = 329);
-- Mythic Thuzadin Necromancer
DELETE FROM `creature_template` WHERE entry = 9102325;
INSERT INTO `creature_template` VALUES (9102325, '0', '0', '0', '0', '0', '10539', '10541', '10540', '10542', 'Mythic Thuzadin Necromancer', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10400', '10400', '0', '0', '0', '0', '0', '', '1', '1.0', 
'4.27', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102325 WHERE (`entry` = 10400);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10400) AND (`map` = 329);
-- Mythic Thuzadin Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9102326;
INSERT INTO `creature_template` VALUES (9102326, '0', '0', '0', '0', '0', '10631', '10633', '10632', '10634', 'Mythic Thuzadin Shadowcaster', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10398', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.92', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102326 WHERE (`entry` = 10398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10398) AND (`map` = 329);
-- Mythic Undead Postman
DELETE FROM `creature_template` WHERE entry = 9102327;
INSERT INTO `creature_template` VALUES (9102327, '0', '0', '0', '0', '0', '10668', '0', '0', '0', 'Mythic Undead Postman', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '1310', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11142', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102327 WHERE (`entry` = 11142);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11142) AND (`map` = 329);
-- Mythic Venom Belcher
DELETE FROM `creature_template` WHERE entry = 9102328;
INSERT INTO `creature_template` VALUES (9102328, '0', '0', '0', '0', '0', '12819', '0', '0', '0', 'Mythic Venom Belcher', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10417', '10417', '0', '0', '0', '0', '0', '', '1', '1.0', '4.25', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102328 WHERE (`entry` = 10417);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10417) AND (`map` = 329);
-- Mythic Vicar Hieronymus
DELETE FROM `creature_template` WHERE entry = 9102329;
INSERT INTO `creature_template` VALUES (9102329, '0', '0', '0', '0', '0', '17318', '0', '0', '0', 'Mythic Vicar Hieronymus', 'Order of the Silver Hand', NULL, '0', '60', '60', '0', '123', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.81', '5.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102329 WHERE (`entry` = 17914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17914) AND (`map` = 329);
-- Mythic Wailing Banshee
DELETE FROM `creature_template` WHERE entry = 9102330;
INSERT INTO `creature_template` VALUES (9102330, '0', '0', '0', '0', '0', '8782', '0', '0', '0', 'Mythic Wailing Banshee', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10464', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '2.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102330 WHERE (`entry` = 10464);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10464) AND (`map` = 329);
-- Mythic Archivist Galford
DELETE FROM `creature_template` WHERE entry = 9102331;
INSERT INTO `creature_template` VALUES (9102331, '0', '0', '0', '0', '0', '10544', '0', '0', '0', 'Mythic Archivist Galford', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10811', '0', '0', '0', '0', '0', '', '1', '1.0', '7.98', '3.0', '1.0', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102331 WHERE (`entry` = 10811);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10811) AND (`map` = 329);
-- Mythic Balnazzar
DELETE FROM `creature_template` WHERE entry = 9102332;
INSERT INTO `creature_template` VALUES (9102332, '0', '0', '0', '0', '0', '10691', '0', '0', '0', 'Mythic Balnazzar', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '1150', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.26', '6.0', '1.0', '2.0', 
'0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102332 WHERE (`entry` = 10813);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10813) AND (`map` = 329);
-- Mythic Baroness Anastari
DELETE FROM `creature_template` WHERE entry = 9102333;
INSERT INTO `creature_template` VALUES (9102333, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Mythic Baroness Anastari', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '6.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.21', '4.0', '1.0', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102333 WHERE (`entry` = 10436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10436) AND (`map` = 329);
-- Mythic Black Guard Swordsmith
DELETE FROM `creature_template` WHERE entry = 9102334;
INSERT INTO `creature_template` VALUES (9102334, '0', '0', '0', '0', '0', '775', '0', '0', '0', 'Mythic Black Guard Swordsmith', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '1133', '1246', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.92', '2.0', '1.15', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102334 WHERE (`entry` = 11121);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11121) AND (`map` = 329);
-- Mythic Cannon Master Willey
DELETE FROM `creature_template` WHERE entry = 9102335;
INSERT INTO `creature_template` VALUES (9102335, '0', '0', '0', '0', '0', '10674', '0', '0', '0', 'Mythic Cannon Master Willey', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10997', '0', '0', '0', '0', '0', '', '1', '1.0', '7.93', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102335 WHERE (`entry` = 10997);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10997) AND (`map` = 329);
-- Mythic Crimson Hammersmith
DELETE FROM `creature_template` WHERE entry = 9102336;
INSERT INTO `creature_template` VALUES (9102336, '0', '0', '0', '0', '0', '10637', '10638', '10639', '10640', 'Mythic Crimson Hammersmith', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '3.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102336 WHERE (`entry` = 11120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11120) AND (`map` = 329);
-- Mythic Fras Siabi
DELETE FROM `creature_template` WHERE entry = 9102337;
INSERT INTO `creature_template` VALUES (9102337, '0', '0', '0', '0', '0', '10475', '0', '0', '0', 'Mythic Fras Siabi', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '1255', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.25', '2.0', '1.0', '2.0', 
'0', '0', '1', '1026', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102337 WHERE (`entry` = 11058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11058) AND (`map` = 329);
-- Mythic Jarien
DELETE FROM `creature_template` WHERE entry = 9102338;
INSERT INTO `creature_template` VALUES (9102338, '0', '0', '0', '0', '0', '16018', '0', '0', '0', 'Mythic Jarien', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.38', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102338 WHERE (`entry` = 16101);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16101) AND (`map` = 329);
-- Mythic Magistrate Barthilas
DELETE FROM `creature_template` WHERE entry = 9102339;
INSERT INTO `creature_template` VALUES (9102339, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Mythic Magistrate Barthilas', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10435', '0', '0', '0', '0', '0', '', '1', '1.0', '8.05', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102339 WHERE (`entry` = 10435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10435) AND (`map` = 329);
-- Mythic Maleki the Pallid
DELETE FROM `creature_template` WHERE entry = 9102340;
INSERT INTO `creature_template` VALUES (9102340, '0', '0', '0', '0', '0', '10546', '0', '0', '0', 'Mythic Maleki the Pallid', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10438', '0', '0', '0', '0', '0', '', '1', '1.0', '7.89', '1.5', '1.15', '2.0', '0', '0', '1', '617299931', '0', '67108864', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102340 WHERE (`entry` = 10438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10438) AND (`map` = 329);
-- Mythic Malor the Zealous
DELETE FROM `creature_template` WHERE entry = 9102341;
INSERT INTO `creature_template` VALUES (9102341, '0', '0', '0', '0', '0', '10458', '0', '0', '0', 'Mythic Malor the Zealous', NULL, NULL, '0', '63', '63', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11032', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102341 WHERE (`entry` = 11032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11032) AND (`map` = 329);
-- Mythic Nerubenkan
DELETE FROM `creature_template` WHERE entry = 9102342;
INSERT INTO `creature_template` VALUES (9102342, '0', '0', '0', '0', '0', '9793', '0', '0', '0', 'Mythic Nerubenkan', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '2.0', '1.35', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102342 WHERE (`entry` = 10437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10437) AND (`map` = 329);
-- Mythic Postmaster Malown
DELETE FROM `creature_template` WHERE entry = 9102343;
INSERT INTO `creature_template` VALUES (9102343, '0', '0', '0', '0', '0', '10669', '0', '0', '0', 'Mythic Postmaster Malown', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2200', '1283', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.39', '1.0', '1.0', '2.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102343 WHERE (`entry` = 11143);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11143) AND (`map` = 329);
-- Mythic Ramstein the Gorger
DELETE FROM `creature_template` WHERE entry = 9102344;
INSERT INTO `creature_template` VALUES (9102344, '0', '0', '0', '0', '0', '12818', '0', '0', '0', 'Mythic Ramstein the Gorger', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.8', '2.0', '1.05', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102344 WHERE (`entry` = 10439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10439) AND (`map` = 329);
-- Mythic Sothos
DELETE FROM `creature_template` WHERE entry = 9102345;
INSERT INTO `creature_template` VALUES (9102345, '0', '0', '0', '0', '0', '16003', '0', '0', '0', 'Mythic Sothos', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '1083', '1191', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.27', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102345 WHERE (`entry` = 16102);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16102) AND (`map` = 329);
-- Mythic Stratholme Courier
DELETE FROM `creature_template` WHERE entry = 9102346;
INSERT INTO `creature_template` VALUES (9102346, '0', '0', '0', '0', '0', '10547', '0', '0', '0', 'Mythic Stratholme Courier', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '1301', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.32', '1.0', '1.0', '1.0', '0', '0', '1', '12583952', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102346 WHERE (`entry` = 11082);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11082) AND (`map` = 329);
-- Mythic The Unforgiven
DELETE FROM `creature_template` WHERE entry = 9102347;
INSERT INTO `creature_template` VALUES (9102347, '0', '0', '0', '0', '0', '10771', '0', '0', '0', 'Mythic The Unforgiven', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.33', '2.0', '1.25', '2.0', '0', '0', '1', '646675226', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102347 WHERE (`entry` = 10516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10516) AND (`map` = 329);
-- Mythic Timmy the Cruel
DELETE FROM `creature_template` WHERE entry = 9102348;
INSERT INTO `creature_template` VALUES (9102348, '0', '0', '0', '0', '0', '571', '0', '0', '0', 'Mythic Timmy the Cruel', NULL, NULL, '0', '63', '63', '0', '21', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.0', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10808', '0', '0', '0', '0', '0', '', '1', '1.0', '7.99', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102348 WHERE (`entry` = 10808);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10808) AND (`map` = 329);
-- Mythic Atiesh
DELETE FROM `creature_template` WHERE entry = 9102349;
INSERT INTO `creature_template` VALUES (9102349, '0', '0', '0', '0', '0', '16164', '0', '0', '0', 'Mythic Atiesh', 'Hand of Sargeras', NULL, '0', '63', '63', '0', '954', '0', '1.0', '2.85714', '1.0', '1.0', '20.0', '1.0', '3', '0', '7.05', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.17', '100.0', 
'1.0', '1.0', '0', '220', '1', '1073741819', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102349 WHERE (`entry` = 16387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16387) AND (`map` = 329);
-- Mythic Balzaphon
DELETE FROM `creature_template` WHERE entry = 9102350;
INSERT INTO `creature_template` VALUES (9102350, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Mythic Balzaphon', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.29', '6.0', '1.1', '1.0', '0', '0', '1', '8415248', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102350 WHERE (`entry` = 14684);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14684) AND (`map` = 329);
-- Mythic Baron Rivendare
DELETE FROM `creature_template` WHERE entry = 9102351;
INSERT INTO `creature_template` VALUES (9102351, '0', '0', '0', '0', '0', '10729', '0', '0', '0', 'Mythic Baron Rivendare', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'1.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.09', '5.0', '1.0', '2.0', '0', '0', '1', '1053507419', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102351 WHERE (`entry` = 10440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10440) AND (`map` = 329);
-- Mythic Hearthsinger Forresten
DELETE FROM `creature_template` WHERE entry = 9102352;
INSERT INTO `creature_template` VALUES (9102352, '0', '0', '0', '0', '0', '10482', '0', '0', '0', 'Mythic Hearthsinger Forresten', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10558', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.4', '2.0', '1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102352 WHERE (`entry` = 10558);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10558) AND (`map` = 329);
-- Mythic Skul
DELETE FROM `creature_template` WHERE entry = 9102353;
INSERT INTO `creature_template` VALUES (9102353, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Mythic Skul', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.91', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10393', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.02', '2.0', '2.1', '2.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102353 WHERE (`entry` = 10393);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10393) AND (`map` = 329);
-- Mythic Stonespine
DELETE FROM `creature_template` WHERE entry = 9102354;
INSERT INTO `creature_template` VALUES (9102354, '0', '0', '0', '0', '0', '7856', '0', '0', '0', 'Mythic Stonespine', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.92', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10809', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.5', '2.0', '2.15', '1.0', '0', '144', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102354 WHERE (`entry` = 10809);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10809) AND (`map` = 329);
-- Mythic Bile Slime
DELETE FROM `creature_template` WHERE entry = 9102355;
INSERT INTO `creature_template` VALUES (9102355, '0', '0', '0', '0', '0', '10029', '0', '0', '0', 'Mythic Bile Slime', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102355 WHERE (`entry` = 10697);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10697) AND (`map` = 329);
-- Mythic Broken Cadaver
DELETE FROM `creature_template` WHERE entry = 9102356;
INSERT INTO `creature_template` VALUES (9102356, '0', '0', '0', '0', '0', '10970', '0', '0', '0', 'Mythic Broken Cadaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '0.95', '1.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102356 WHERE (`entry` = 10383);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10383) AND (`map` = 329);
-- Mythic Crimson Rifleman
DELETE FROM `creature_template` WHERE entry = 9102357;
INSERT INTO `creature_template` VALUES (9102357, '0', '0', '0', '0', '0', '10820', '10822', '10821', '10823', 'Mythic Crimson Rifleman', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.92', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.87', '1.0', '1.0', '1.0', '0', '0', '1', '1024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102357 WHERE (`entry` = 11054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11054) AND (`map` = 329);
-- Mythic Elder Farwhisper
DELETE FROM `creature_template` WHERE entry = 9102358;
INSERT INTO `creature_template` VALUES (9102358, '0', '0', '0', '0', '0', '15610', '0', '0', '0', 'Mythic Elder Farwhisper', NULL, NULL, '21016', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.27', '1.0', '2.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102358 WHERE (`entry` = 15607);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15607) AND (`map` = 329);
-- Mythic Eye of Naxxramas
DELETE FROM `creature_template` WHERE entry = 9102359;
INSERT INTO `creature_template` VALUES (9102359, '0', '0', '0', '0', '0', '4629', '0', '0', '0', 'Mythic Eye of Naxxramas', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10411', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.89', '1.0', '1.05', '0.25', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102359 WHERE (`entry` = 10411);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10411) AND (`map` = 329);
-- Mythic Mindless Skeleton
DELETE FROM `creature_template` WHERE entry = 9102360;
INSERT INTO `creature_template` VALUES (9102360, '0', '0', '0', '0', '0', '9784', '7550', '7555', '0', 'Mythic Mindless Skeleton', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.13', '1.0', '0.95', 
'1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102360 WHERE (`entry` = 11197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11197) AND (`map` = 329);
-- Mythic Mindless Undead
DELETE FROM `creature_template` WHERE entry = 9102361;
INSERT INTO `creature_template` VALUES (9102361, '0', '0', '0', '0', '0', '9784', '1200', '646', '0', 'Mythic Mindless Undead', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.83', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102361 WHERE (`entry` = 11030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11030) AND (`map` = 329);
-- Mythic Plagued Insect
DELETE FROM `creature_template` WHERE entry = 9102362;
INSERT INTO `creature_template` VALUES (9102362, '0', '0', '0', '0', '0', '7511', '2177', '9829', '0', 'Mythic Plagued Insect', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.97', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102362 WHERE (`entry` = 10461);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10461) AND (`map` = 329);
-- Mythic Plagued Maggot
DELETE FROM `creature_template` WHERE entry = 9102363;
INSERT INTO `creature_template` VALUES (9102363, '0', '0', '0', '0', '0', '9903', '9904', '9905', '9906', 'Mythic Plagued Maggot', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.24', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102363 WHERE (`entry` = 10536);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10536) AND (`map` = 329);
-- Mythic Plagued Rat
DELETE FROM `creature_template` WHERE entry = 9102364;
INSERT INTO `creature_template` VALUES (9102364, '0', '0', '0', '0', '0', '1141', '1418', '2176', '0', 'Mythic Plagued Rat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.04', '1.0', '1.0', '0.5', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102364 WHERE (`entry` = 10441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10441) AND (`map` = 329);
-- Mythic Restless Soul
DELETE FROM `creature_template` WHERE entry = 9102365;
INSERT INTO `creature_template` VALUES (9102365, '0', '0', '0', '0', '0', '1825', '0', '0', '0', 'Mythic Restless Soul', NULL, NULL, '0', '60', '60', '0', '35', '0', '6.0', '2.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.07', '2000', '2200', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.09', '1.0', '1.0', '1.0', '0', '197', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102365 WHERE (`entry` = 11122);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11122) AND (`map` = 329);
-- Mythic Skeletal Berserker
DELETE FROM `creature_template` WHERE entry = 9102366;
INSERT INTO `creature_template` VALUES (9102366, '0', '0', '0', '0', '0', '9784', '9787', '9786', '9788', 'Mythic Skeletal Berserker', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10391', '10391', '0', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '1.0', '1.0', '0', '0', '1', '8602129', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102366 WHERE (`entry` = 10391);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10391) AND (`map` = 329);
-- Mythic Skeletal Guardian
DELETE FROM `creature_template` WHERE entry = 9102367;
INSERT INTO `creature_template` VALUES (9102367, '0', '0', '0', '0', '0', '9789', '9785', '7555', '9790', 'Mythic Skeletal Guardian', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.05', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10390', '10390', '0', '0', '0', '0', '0', '', '1', '1.0', '3.19', '1.0', '1.0', '1.0', '0', '0', '1', '8602129', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102367 WHERE (`entry` = 10390);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10390) AND (`map` = 329);
-- Mythic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9102368;
INSERT INTO `creature_template` VALUES (9102368, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Mythic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.11', '1.0', '1.0', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102368 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477) AND (`map` = 329);
-- Mythic Spiteful Phantom
DELETE FROM `creature_template` WHERE entry = 9102369;
INSERT INTO `creature_template` VALUES (9102369, '0', '0', '0', '0', '0', '10700', '0', '0', '0', 'Mythic Spiteful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '1.99', '2000', '1562', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.06', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102369 WHERE (`entry` = 10388);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10388) AND (`map` = 329);
-- Mythic Summoned Water Elemental
DELETE FROM `creature_template` WHERE entry = 9102370;
INSERT INTO `creature_template` VALUES (9102370, '0', '0', '0', '0', '0', '4606', '0', '0', '0', 'Mythic Summoned Water Elemental', NULL, NULL, '0', '60', '60', '0', '67', '0', '1.55556', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.06', '2000', '1606', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.98', '1.0', '1.0', '1.0', '0', '0', '1', '646016863', '16', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102370 WHERE (`entry` = 10955);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10955) AND (`map` = 329);
-- Mythic Thuzadin Acolyte
DELETE FROM `creature_template` WHERE entry = 9102371;
INSERT INTO `creature_template` VALUES (9102371, '0', '0', '0', '0', '0', '10535', '10536', '10537', '10538', 'Mythic Thuzadin Acolyte', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10399', '10399', '0', '0', '0', '0', '0', '', '1', '1.0', '2.87', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102371 WHERE (`entry` = 10399);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10399) AND (`map` = 329);
-- Mythic Undead Scarab
DELETE FROM `creature_template` WHERE entry = 9102372;
INSERT INTO `creature_template` VALUES (9102372, '0', '0', '0', '0', '0', '10031', '0', '0', '0', 'Mythic Undead Scarab', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.01', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.1', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102372 WHERE (`entry` = 10876);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10876) AND (`map` = 329);
-- Mythic Vengeful Phantom
DELETE FROM `creature_template` WHERE entry = 9102373;
INSERT INTO `creature_template` VALUES (9102373, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Vengeful Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '4', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10387', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.38', '1.0', '1.0', 
'0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102373 WHERE (`entry` = 10387);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10387) AND (`map` = 329);
-- Mythic Wrath Phantom
DELETE FROM `creature_template` WHERE entry = 9102374;
INSERT INTO `creature_template` VALUES (9102374, '0', '0', '0', '0', '0', '10701', '0', '0', '0', 'Mythic Wrath Phantom', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '5', '1.96', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.25', '1.0', '1.0', '0.5', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102374 WHERE (`entry` = 10389);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10389) AND (`map` = 329);
-- Mythic Ysida Harmon
DELETE FROM `creature_template` WHERE entry = 9102375;
INSERT INTO `creature_template` VALUES (9102375, '0', '0', '0', '0', '0', '15967', '0', '0', '0', 'Mythic Ysida Harmon', NULL, NULL, '7091', '60', '60', '0', '794', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.9', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102375 WHERE (`entry` = 16031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16031) AND (`map` = 329);