-- Heroic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9102000;
INSERT INTO `creature_template` VALUES (9102000, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '1.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102000 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Heroic Death Knight Darkreaver
DELETE FROM `creature_template` WHERE entry = 9102001;
INSERT INTO `creature_template` VALUES (9102001, '0', '0', '0', '0', '0', '14591', '0', '0', '0', 'Heroic Death Knight Darkreaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.65', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14516', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '15.0', '4.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102001 WHERE (`entry` = 14516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14516);
-- Heroic Illusion of Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9102002;
INSERT INTO `creature_template` VALUES (9102002, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Heroic Illusion of Jandice Barov', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.1', '2000', '1283', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102002 WHERE (`entry` = 11439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11439);
-- Heroic Blood Steward of Kirtonos
DELETE FROM `creature_template` WHERE entry = 9102003;
INSERT INTO `creature_template` VALUES (9102003, '0', '0', '0', '0', '0', '10925', '0', '0', '0', 'Heroic Blood Steward of Kirtonos', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14861', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '6.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102003 WHERE (`entry` = 14861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14861);
-- Heroic Risen Warrior
DELETE FROM `creature_template` WHERE entry = 9102004;
INSERT INTO `creature_template` VALUES (9102004, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Heroic Risen Warrior', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10486', '10486', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '3.0', '1.1', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102004 WHERE (`entry` = 10486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10486);
-- Heroic Risen Guardian
DELETE FROM `creature_template` WHERE entry = 9102005;
INSERT INTO `creature_template` VALUES (9102005, '0', '0', '0', '0', '0', '775', '5432', '533', '10975', 'Heroic Risen Guardian', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.6', '2400', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11598', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.3', '1.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102005 WHERE (`entry` = 11598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11598);
-- Heroic Spectral Teacher
DELETE FROM `creature_template` WHERE entry = 9102006;
INSERT INTO `creature_template` VALUES (9102006, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Teacher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102006 WHERE (`entry` = 10500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10500);
-- Heroic Risen Construct
DELETE FROM `creature_template` WHERE entry = 9102007;
INSERT INTO `creature_template` VALUES (9102007, '0', '0', '0', '0', '0', '12074', '0', '0', '0', 'Heroic Risen Construct', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10488', '10488', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '3.0', '1.05', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102007 WHERE (`entry` = 10488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10488);
-- Heroic Shadowed Spirit
DELETE FROM `creature_template` WHERE entry = 9102008;
INSERT INTO `creature_template` VALUES (9102008, '0', '0', '0', '0', '0', '14594', '0', '0', '0', 'Heroic Shadowed Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '3.6', '1.28571', '1.0', '1.0', 
'45.0', '1.0', '1', '0', '5.4', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '2.0', '1.35', '1.0', '0', '138', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102008 WHERE (`entry` = 14511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14511);
-- Heroic Bone Mage
DELETE FROM `creature_template` WHERE entry = 9102009;
INSERT INTO `creature_template` VALUES (9102009, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Heroic Bone Mage', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.0', '1.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102009 WHERE (`entry` = 16120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16120);
-- Heroic Aspect of Shadow
DELETE FROM `creature_template` WHERE entry = 9102010;
INSERT INTO `creature_template` VALUES (9102010, '0', '0', '0', '0', '0', '11649', '0', '0', '0', 'Heroic Aspect of Shadow', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.85', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14521', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '4.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102010 WHERE (`entry` = 14521);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14521);
-- Heroic Aspect of Malice
DELETE FROM `creature_template` WHERE entry = 9102011;
INSERT INTO `creature_template` VALUES (9102011, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Heroic Aspect of Malice', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.45', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14520', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '1.0', '1.1', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102011 WHERE (`entry` = 14520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14520);
-- Heroic Aspect of Corruption
DELETE FROM `creature_template` WHERE entry = 9102012;
INSERT INTO `creature_template` VALUES (9102012, '0', '0', '0', '0', '0', '10703', '0', '0', '0', 'Heroic Aspect of Corruption', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.45', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14519', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '1.0', '1.1', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102012 WHERE (`entry` = 14519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14519);
-- Heroic Aspect of Banality
DELETE FROM `creature_template` WHERE entry = 9102013;
INSERT INTO `creature_template` VALUES (9102013, '0', '0', '0', '0', '0', '14560', '0', '0', '0', 'Heroic Aspect of Banality', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.85', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14518', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '4.0', '1.35', '1.0', '0', '76', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102013 WHERE (`entry` = 14518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14518);
-- Heroic Darkreavers Fallen Charger
DELETE FROM `creature_template` WHERE entry = 9102014;
INSERT INTO `creature_template` VALUES (9102014, '0', '0', '0', '0', '0', '14590', '0', '0', '0', 'Heroic Darkreavers Fallen Charger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', 
'1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102014 WHERE (`entry` = 14568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14568);
-- Heroic Bone Minion
DELETE FROM `creature_template` WHERE entry = 9102015;
INSERT INTO `creature_template` VALUES (9102015, '0', '0', '0', '0', '0', '158', '0', '0', '0', 'Heroic Bone Minion', '', NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', 
'1.0', '0', '0', '1.05', '1930', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.5', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102015 WHERE (`entry` = 16119);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16119);
-- Heroic Banal Spirit
DELETE FROM `creature_template` WHERE entry = 9102016;
INSERT INTO `creature_template` VALUES (9102016, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Banal Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.1', '1.0', '0', 
'76', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102016 WHERE (`entry` = 14514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14514);
-- Heroic Splintered Skeleton
DELETE FROM `creature_template` WHERE entry = 9102017;
INSERT INTO `creature_template` VALUES (9102017, '0', '0', '0', '0', '0', '11401', '9788', '9789', '9790', 'Heroic Splintered Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '1000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10478', '10478', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', 
'3.0', '1.05', '1.0', '0', '164', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102017 WHERE (`entry` = 10478);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10478);
-- Heroic Scholomance Handler
DELETE FROM `creature_template` WHERE entry = 9102018;
INSERT INTO `creature_template` VALUES (9102018, '0', '0', '0', '0', '0', '11161', '11122', '11123', '11124', 'Heroic Scholomance Handler', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11257', '11257', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102018 WHERE (`entry` = 11257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11257);
-- Heroic Malicious Spirit
DELETE FROM `creature_template` WHERE entry = 9102019;
INSERT INTO `creature_template` VALUES (9102019, '0', '0', '0', '0', '0', '14593', '0', '0', '0', 'Heroic Malicious Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '4.9', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.05', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102019 WHERE (`entry` = 14513);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14513);
-- Heroic Corrupted Spirit
DELETE FROM `creature_template` WHERE entry = 9102020;
INSERT INTO `creature_template` VALUES (9102020, '0', '0', '0', '0', '0', '14592', '0', '0', '0', 'Heroic Corrupted Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '4.9', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.05', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102020 WHERE (`entry` = 14512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14512);
-- Heroic Spectral Tutor
DELETE FROM `creature_template` WHERE entry = 9102021;
INSERT INTO `creature_template` VALUES (9102021, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Tutor', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10498', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.05', 
'1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102021 WHERE (`entry` = 10498);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10498);
-- Heroic Spectral Researcher
DELETE FROM `creature_template` WHERE entry = 9102022;
INSERT INTO `creature_template` VALUES (9102022, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Researcher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10499', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102022 WHERE (`entry` = 10499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10499);
-- Heroic Risen Protector
DELETE FROM `creature_template` WHERE entry = 9102023;
INSERT INTO `creature_template` VALUES (9102023, '0', '0', '0', '0', '0', '11489', '0', '0', '0', 'Heroic Risen Protector', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10487', '10487', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.55', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102023 WHERE (`entry` = 10487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10487);
-- Heroic Necrofiend
DELETE FROM `creature_template` WHERE entry = 9102024;
INSERT INTO `creature_template` VALUES (9102024, '0', '0', '0', '0', '0', '11178', '0', '0', '0', 'Heroic Necrofiend', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11551', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102024 WHERE (`entry` = 11551);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11551);
-- Heroic Spectral Projection
DELETE FROM `creature_template` WHERE entry = 9102025;
INSERT INTO `creature_template` VALUES (9102025, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Projection', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.15', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.33', '1.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102025 WHERE (`entry` = 11263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11263);
-- Heroic Scholomance Student
DELETE FROM `creature_template` WHERE entry = 9102026;
INSERT INTO `creature_template` VALUES (9102026, '0', '0', '0', '0', '0', '11161', '11134', '11135', '11136', 'Heroic Scholomance Student', NULL, NULL, '3647', '60', '60', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.25', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10475', '10475', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102026 WHERE (`entry` = 10475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10475);
-- Heroic Scholomance Occultist
DELETE FROM `creature_template` WHERE entry = 9102027;
INSERT INTO `creature_template` VALUES (9102027, '0', '0', '0', '0', '0', '11157', '11125', '11126', '11176', 'Heroic Scholomance Occultist', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10472', '10472', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102027 WHERE (`entry` = 10472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10472);
-- Heroic Scholomance Necromancer
DELETE FROM `creature_template` WHERE entry = 9102028;
INSERT INTO `creature_template` VALUES (9102028, '0', '0', '0', '0', '0', '11163', '11154', '11155', '11156', 'Heroic Scholomance Necromancer', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10477', '10477', '0', '0', '0', '0', '0', '', '1', '1.0', 
'3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102028 WHERE (`entry` = 10477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10477);
-- Heroic Scholomance Dark Summoner
DELETE FROM `creature_template` WHERE entry = 9102029;
INSERT INTO `creature_template` VALUES (9102029, '0', '0', '0', '0', '0', '11163', '11128', '11129', '11177', 'Heroic Scholomance Dark Summoner', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11582', '11582', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102029 WHERE (`entry` = 11582);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11582);
-- Heroic Scholomance Adept
DELETE FROM `creature_template` WHERE entry = 9102030;
INSERT INTO `creature_template` VALUES (9102030, '0', '0', '0', '0', '0', '11161', '11148', '11149', '11150', 'Heroic Scholomance Adept', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10469', '10469', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102030 WHERE (`entry` = 10469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10469);
-- Heroic Risen Bonewarder
DELETE FROM `creature_template` WHERE entry = 9102031;
INSERT INTO `creature_template` VALUES (9102031, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Heroic Risen Bonewarder', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10491', '10491', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102031 WHERE (`entry` = 10491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10491);
-- Heroic Diseased Ghoul
DELETE FROM `creature_template` WHERE entry = 9102032;
INSERT INTO `creature_template` VALUES (9102032, '0', '0', '0', '0', '0', '519', '0', '0', '0', 'Heroic Diseased Ghoul', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10495', '10495', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102032 WHERE (`entry` = 10495);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10495);
-- Heroic Unstable Corpse
DELETE FROM `creature_template` WHERE entry = 9102033;
INSERT INTO `creature_template` VALUES (9102033, '0', '0', '0', '0', '0', '10978', '10972', '0', '0', 'Heroic Unstable Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.571429', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10480', '10480', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '80', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102033 WHERE (`entry` = 10480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10480);
-- Heroic Reanimated Corpse
DELETE FROM `creature_template` WHERE entry = 9102034;
INSERT INTO `creature_template` VALUES (9102034, '0', '0', '0', '0', '0', '10975', '10976', '0', '0', 'Heroic Reanimated Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.428571', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10481', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.5', '1.0', '1.0', '1.0', '0', '73', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102034 WHERE (`entry` = 10481);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10481);
-- Heroic Risen Guard
DELETE FROM `creature_template` WHERE entry = 9102035;
INSERT INTO `creature_template` VALUES (9102035, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Heroic Risen Guard', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10489', '10489', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.5', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102035 WHERE (`entry` = 10489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10489);
-- Heroic Plagued Hatchling
DELETE FROM `creature_template` WHERE entry = 9102036;
INSERT INTO `creature_template` VALUES (9102036, '0', '0', '0', '0', '0', '10007', '0', '0', '0', 'Heroic Plagued Hatchling', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10678', '0', '10678', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102036 WHERE (`entry` = 10678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10678);
-- Heroic Risen Lackey
DELETE FROM `creature_template` WHERE entry = 9102037;
INSERT INTO `creature_template` VALUES (9102037, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Heroic Risen Lackey', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10482', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.1', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102037 WHERE (`entry` = 10482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10482);
-- Heroic Frail Skeleton
DELETE FROM `creature_template` WHERE entry = 9102038;
INSERT INTO `creature_template` VALUES (9102038, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Heroic Frail Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.3', '2000', '2000', '1.0', '1.0', '1', '774', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.25', '1.0', '1.0', '1.0', 
'0', '0', '1', '8602131', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102038 WHERE (`entry` = 11258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11258);
-- Heroic Jeevee
DELETE FROM `creature_template` WHERE entry = 9102039;
INSERT INTO `creature_template` VALUES (9102039, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Heroic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '0.85', '1.0', '0', '0', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102039 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500);
-- Heroic Scholomance Neophyte
DELETE FROM `creature_template` WHERE entry = 9102040;
INSERT INTO `creature_template` VALUES (9102040, '0', '0', '0', '0', '0', '11164', '11131', '11132', '11133', 'Heroic Scholomance Neophyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.8', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10470', '10470', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102040 WHERE (`entry` = 10470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10470);
-- Heroic Scholomance Necrolyte
DELETE FROM `creature_template` WHERE entry = 9102041;
INSERT INTO `creature_template` VALUES (9102041, '0', '0', '0', '0', '0', '11161', '11151', '11152', '11175', 'Heroic Scholomance Necrolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10476', '10476', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102041 WHERE (`entry` = 10476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10476);
-- Heroic Scholomance Acolyte
DELETE FROM `creature_template` WHERE entry = 9102042;
INSERT INTO `creature_template` VALUES (9102042, '0', '0', '0', '0', '0', '11157', '11145', '11146', '11173', 'Heroic Scholomance Acolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10471', '10471', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102042 WHERE (`entry` = 10471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10471);
-- Heroic Risen Aberration
DELETE FROM `creature_template` WHERE entry = 9102043;
INSERT INTO `creature_template` VALUES (9102043, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Heroic Risen Aberration', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10485', '10485', '0', '0', '0', '0', '0', '', '1', '1.0', '0.75', '1.0', '1.0', '1.0', '0', '164', '1', '8602131', '124', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102043 WHERE (`entry` = 10485);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10485);
-- Heroic Kirtonos the Herald
DELETE FROM `creature_template` WHERE entry = 9102044;
INSERT INTO `creature_template` VALUES (9102044, '0', '0', '0', '0', '0', '7534', '0', '0', '0', 'Heroic Kirtonos the Herald', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '3000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.98', '3.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '512', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102044 WHERE (`entry` = 10506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10506);
-- Heroic Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9102045;
INSERT INTO `creature_template` VALUES (9102045, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Heroic Jandice Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.22', '3.0', '1.15', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102045 WHERE (`entry` = 10503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10503);
-- Heroic Rattlegore
DELETE FROM `creature_template` WHERE entry = 9102046;
INSERT INTO `creature_template` VALUES (9102046, '0', '0', '0', '0', '0', '12073', '0', '0', '0', 'Heroic Rattlegore', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '11622', '0', '0', '0', '0', '0', '', '1', '1.0', '6.24', '3.0', '1.15', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102046 WHERE (`entry` = 11622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11622);
-- Heroic Marduk Blackpool
DELETE FROM `creature_template` WHERE entry = 9102047;
INSERT INTO `creature_template` VALUES (9102047, '0', '0', '0', '0', '0', '10248', '0', '0', '0', 'Heroic Marduk Blackpool', NULL, NULL, '3649', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2500', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.06', '2.0', 
'1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102047 WHERE (`entry` = 10433);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10433);
-- Heroic Vectus
DELETE FROM `creature_template` WHERE entry = 9102048;
INSERT INTO `creature_template` VALUES (9102048, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Heroic Vectus', NULL, NULL, '3648', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.38', '2.0', '1.1', '2.0', 
'0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102048 WHERE (`entry` = 10432);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10432);
-- Heroic Ras Frostwhisper
DELETE FROM `creature_template` WHERE entry = 9102049;
INSERT INTO `creature_template` VALUES (9102049, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Heroic Ras Frostwhisper', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10508', '0', '0', '0', '0', '0', '', '1', '1.0', '6.35', '6.0', '1.5', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102049 WHERE (`entry` = 10508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10508);
-- Heroic Instructor Malicia
DELETE FROM `creature_template` WHERE entry = 9102050;
INSERT INTO `creature_template` VALUES (9102050, '0', '0', '0', '0', '0', '11069', '0', '0', '0', 'Heroic Instructor Malicia', NULL, NULL, '0', '63', '63', '0', '233', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10505', '0', '0', '0', '0', '0', '', '1', '1.0', '6.4', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102050 WHERE (`entry` = 10505);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10505);
-- Heroic Doctor Theolen Krastinov
DELETE FROM `creature_template` WHERE entry = 9102051;
INSERT INTO `creature_template` VALUES (9102051, '0', '0', '0', '0', '0', '10901', '0', '0', '0', 'Heroic Doctor Theolen Krastinov', 'The Butcher', NULL, '0', '63', '63', '0', '21', '2', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11261', '0', '0', '0', '0', '0', '', '1', '1.0', 
'6.46', '3.0', '1.1', '2.0', '0', '144', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102051 WHERE (`entry` = 11261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11261);
-- Heroic Lorekeeper Polkelt
DELETE FROM `creature_template` WHERE entry = 9102052;
INSERT INTO `creature_template` VALUES (9102052, '0', '0', '0', '0', '0', '11492', '0', '0', '0', 'Heroic Lorekeeper Polkelt', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10901', '0', '0', '0', '0', '0', '', '1', '1.0', '6.18', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102052 WHERE (`entry` = 10901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10901);
-- Heroic The Ravenian
DELETE FROM `creature_template` WHERE entry = 9102053;
INSERT INTO `creature_template` VALUES (9102053, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Heroic The Ravenian', NULL, NULL, '0', '63', '63', '0', '233', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10507', '0', '0', '0', '0', '0', '', '1', '1.0', '6.13', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102053 WHERE (`entry` = 10507);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10507);
-- Heroic Lord Alexei Barov
DELETE FROM `creature_template` WHERE entry = 9102054;
INSERT INTO `creature_template` VALUES (9102054, '0', '0', '0', '0', '0', '11072', '0', '0', '0', 'Heroic Lord Alexei Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.01', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102054 WHERE (`entry` = 10504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10504);
-- Heroic Lady Illucia Barov
DELETE FROM `creature_template` WHERE entry = 9102055;
INSERT INTO `creature_template` VALUES (9102055, '0', '0', '0', '0', '0', '11835', '0', '0', '0', 'Heroic Lady Illucia Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102055 WHERE (`entry` = 10502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10502);
-- Heroic Darkmaster Gandling
DELETE FROM `creature_template` WHERE entry = 9102056;
INSERT INTO `creature_template` VALUES (9102056, '0', '0', '0', '0', '0', '11070', '0', '0', '0', 'Heroic Darkmaster Gandling', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1853', '0', '0', '0', '0', '0', '', '1', '1.0', '5.87', '3.0', '1.35', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102056 WHERE (`entry` = 1853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1853);
-- Heroic Kormok
DELETE FROM `creature_template` WHERE entry = 9102057;
INSERT INTO `creature_template` VALUES (9102057, '0', '0', '0', '0', '0', '16020', '0', '0', '0', 'Heroic Kormok', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '1100', '1300', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.08', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102057 WHERE (`entry` = 16118);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16118);
-- Heroic Lord Blackwood
DELETE FROM `creature_template` WHERE entry = 9102058;
INSERT INTO `creature_template` VALUES (9102058, '0', '0', '0', '0', '0', '14699', '0', '0', '0', 'Heroic Lord Blackwood', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.45', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9102058 WHERE (`entry` = 14695);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14695);
-- Mythic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9102059;
INSERT INTO `creature_template` VALUES (9102059, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.93', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102059 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Mythic Death Knight Darkreaver
DELETE FROM `creature_template` WHERE entry = 9102060;
INSERT INTO `creature_template` VALUES (9102060, '0', '0', '0', '0', '0', '14591', '0', '0', '0', 'Mythic Death Knight Darkreaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14516', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.16', '4.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102060 WHERE (`entry` = 14516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14516);
-- Mythic Illusion of Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9102061;
INSERT INTO `creature_template` VALUES (9102061, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Mythic Illusion of Jandice Barov', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '1283', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.07', '1.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102061 WHERE (`entry` = 11439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11439);
-- Mythic Blood Steward of Kirtonos
DELETE FROM `creature_template` WHERE entry = 9102062;
INSERT INTO `creature_template` VALUES (9102062, '0', '0', '0', '0', '0', '10925', '0', '0', '0', 'Mythic Blood Steward of Kirtonos', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14861', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.22', '6.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102062 WHERE (`entry` = 14861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14861);
-- Mythic Risen Warrior
DELETE FROM `creature_template` WHERE entry = 9102063;
INSERT INTO `creature_template` VALUES (9102063, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Mythic Risen Warrior', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10486', '10486', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '3.0', '1.1', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102063 WHERE (`entry` = 10486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10486);
-- Mythic Risen Guardian
DELETE FROM `creature_template` WHERE entry = 9102064;
INSERT INTO `creature_template` VALUES (9102064, '0', '0', '0', '0', '0', '775', '5432', '533', '10975', 'Mythic Risen Guardian', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.95', '2400', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11598', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.49', '1.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102064 WHERE (`entry` = 11598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11598);
-- Mythic Spectral Teacher
DELETE FROM `creature_template` WHERE entry = 9102065;
INSERT INTO `creature_template` VALUES (9102065, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Teacher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.36', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102065 WHERE (`entry` = 10500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10500);
-- Mythic Risen Construct
DELETE FROM `creature_template` WHERE entry = 9102066;
INSERT INTO `creature_template` VALUES (9102066, '0', '0', '0', '0', '0', '12074', '0', '0', '0', 'Mythic Risen Construct', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10488', '10488', '0', '0', '0', '0', '0', '', '1', '1.0', '3.87', '3.0', '1.05', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102066 WHERE (`entry` = 10488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10488);
-- Mythic Shadowed Spirit
DELETE FROM `creature_template` WHERE entry = 9102067;
INSERT INTO `creature_template` VALUES (9102067, '0', '0', '0', '0', '0', '14594', '0', '0', '0', 'Mythic Shadowed Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '3.6', '1.28571', '1.0', '1.0', 
'45.0', '1.0', '1', '0', '3.05', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.01', '2.0', '1.35', '1.0', '0', '138', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102067 WHERE (`entry` = 14511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14511);
-- Mythic Bone Mage
DELETE FROM `creature_template` WHERE entry = 9102068;
INSERT INTO `creature_template` VALUES (9102068, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Mythic Bone Mage', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.42', '1.0', '1.35', '1.0', '0', 
'0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102068 WHERE (`entry` = 16120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16120);
-- Mythic Aspect of Shadow
DELETE FROM `creature_template` WHERE entry = 9102069;
INSERT INTO `creature_template` VALUES (9102069, '0', '0', '0', '0', '0', '11649', '0', '0', '0', 'Mythic Aspect of Shadow', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.9', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14521', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.43', '4.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102069 WHERE (`entry` = 14521);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14521);
-- Mythic Aspect of Malice
DELETE FROM `creature_template` WHERE entry = 9102070;
INSERT INTO `creature_template` VALUES (9102070, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Mythic Aspect of Malice', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.01', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14520', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '1.0', '1.1', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102070 WHERE (`entry` = 14520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14520);
-- Mythic Aspect of Corruption
DELETE FROM `creature_template` WHERE entry = 9102071;
INSERT INTO `creature_template` VALUES (9102071, '0', '0', '0', '0', '0', '10703', '0', '0', '0', 'Mythic Aspect of Corruption', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.99', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14519', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '1.0', '1.1', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102071 WHERE (`entry` = 14519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14519);
-- Mythic Aspect of Banality
DELETE FROM `creature_template` WHERE entry = 9102072;
INSERT INTO `creature_template` VALUES (9102072, '0', '0', '0', '0', '0', '14560', '0', '0', '0', 'Mythic Aspect of Banality', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.95', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14518', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.91', '4.0', '1.35', '1.0', '0', '76', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102072 WHERE (`entry` = 14518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14518);
-- Mythic Darkreavers Fallen Charger
DELETE FROM `creature_template` WHERE entry = 9102073;
INSERT INTO `creature_template` VALUES (9102073, '0', '0', '0', '0', '0', '14590', '0', '0', '0', 'Mythic Darkreavers Fallen Charger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.0', '1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102073 WHERE (`entry` = 14568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14568);
-- Mythic Bone Minion
DELETE FROM `creature_template` WHERE entry = 9102074;
INSERT INTO `creature_template` VALUES (9102074, '0', '0', '0', '0', '0', '158', '0', '0', '0', 'Mythic Bone Minion', '', NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', 
'1.0', '0', '0', '2.92', '1930', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.47', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102074 WHERE (`entry` = 16119);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16119);
-- Mythic Banal Spirit
DELETE FROM `creature_template` WHERE entry = 9102075;
INSERT INTO `creature_template` VALUES (9102075, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Banal Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '0', '0', '2.95', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '1.1', '1.0', '0', '76', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102075 WHERE (`entry` = 14514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14514);
-- Mythic Splintered Skeleton
DELETE FROM `creature_template` WHERE entry = 9102076;
INSERT INTO `creature_template` VALUES (9102076, '0', '0', '0', '0', '0', '11401', '9788', '9789', '9790', 'Mythic Splintered Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '1000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10478', '10478', '0', '0', '0', '0', '0', '', '1', '1.0', '4.17', '3.0', '1.05', '1.0', '0', '164', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102076 WHERE (`entry` = 10478);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10478);
-- Mythic Scholomance Handler
DELETE FROM `creature_template` WHERE entry = 9102077;
INSERT INTO `creature_template` VALUES (9102077, '0', '0', '0', '0', '0', '11161', '11122', '11123', '11124', 'Mythic Scholomance Handler', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11257', '11257', '0', '0', '0', '0', '0', '', '1', '1.0', '4.45', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102077 WHERE (`entry` = 11257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11257);
-- Mythic Malicious Spirit
DELETE FROM `creature_template` WHERE entry = 9102078;
INSERT INTO `creature_template` VALUES (9102078, '0', '0', '0', '0', '0', '14593', '0', '0', '0', 'Mythic Malicious Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.99', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.17', '1.0', '1.05', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102078 WHERE (`entry` = 14513);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14513);
-- Mythic Corrupted Spirit
DELETE FROM `creature_template` WHERE entry = 9102079;
INSERT INTO `creature_template` VALUES (9102079, '0', '0', '0', '0', '0', '14592', '0', '0', '0', 'Mythic Corrupted Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.04', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.33', '1.0', '1.05', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102079 WHERE (`entry` = 14512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14512);
-- Mythic Spectral Tutor
DELETE FROM `creature_template` WHERE entry = 9102080;
INSERT INTO `creature_template` VALUES (9102080, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Tutor', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10498', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.9', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102080 WHERE (`entry` = 10498);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10498);
-- Mythic Spectral Researcher
DELETE FROM `creature_template` WHERE entry = 9102081;
INSERT INTO `creature_template` VALUES (9102081, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Researcher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10499', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.3', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102081 WHERE (`entry` = 10499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10499);
-- Mythic Risen Protector
DELETE FROM `creature_template` WHERE entry = 9102082;
INSERT INTO `creature_template` VALUES (9102082, '0', '0', '0', '0', '0', '11489', '0', '0', '0', 'Mythic Risen Protector', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10487', '10487', '0', '0', '0', '0', '0', '', '1', '1.0', '4.14', '3.0', '1.55', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102082 WHERE (`entry` = 10487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10487);
-- Mythic Necrofiend
DELETE FROM `creature_template` WHERE entry = 9102083;
INSERT INTO `creature_template` VALUES (9102083, '0', '0', '0', '0', '0', '11178', '0', '0', '0', 'Mythic Necrofiend', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11551', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '3.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102083 WHERE (`entry` = 11551);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11551);
-- Mythic Spectral Projection
DELETE FROM `creature_template` WHERE entry = 9102084;
INSERT INTO `creature_template` VALUES (9102084, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Projection', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '1.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102084 WHERE (`entry` = 11263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11263);
-- Mythic Scholomance Student
DELETE FROM `creature_template` WHERE entry = 9102085;
INSERT INTO `creature_template` VALUES (9102085, '0', '0', '0', '0', '0', '11161', '11134', '11135', '11136', 'Mythic Scholomance Student', NULL, NULL, '3647', '60', '60', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10475', '10475', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102085 WHERE (`entry` = 10475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10475);
-- Mythic Scholomance Occultist
DELETE FROM `creature_template` WHERE entry = 9102086;
INSERT INTO `creature_template` VALUES (9102086, '0', '0', '0', '0', '0', '11157', '11125', '11126', '11176', 'Mythic Scholomance Occultist', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10472', '10472', '0', '0', '0', '0', '0', '', '1', '1.0', '4.38', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102086 WHERE (`entry` = 10472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10472);
-- Mythic Scholomance Necromancer
DELETE FROM `creature_template` WHERE entry = 9102087;
INSERT INTO `creature_template` VALUES (9102087, '0', '0', '0', '0', '0', '11163', '11154', '11155', '11156', 'Mythic Scholomance Necromancer', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10477', '10477', '0', '0', '0', '0', '0', '', '1', '1.0', '4.05', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102087 WHERE (`entry` = 10477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10477);
-- Mythic Scholomance Dark Summoner
DELETE FROM `creature_template` WHERE entry = 9102088;
INSERT INTO `creature_template` VALUES (9102088, '0', '0', '0', '0', '0', '11163', '11128', '11129', '11177', 'Mythic Scholomance Dark Summoner', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11582', '11582', '0', '0', '0', '0', '0', '', '0', '1.0', '3.95', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102088 WHERE (`entry` = 11582);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11582);
-- Mythic Scholomance Adept
DELETE FROM `creature_template` WHERE entry = 9102089;
INSERT INTO `creature_template` VALUES (9102089, '0', '0', '0', '0', '0', '11161', '11148', '11149', '11150', 'Mythic Scholomance Adept', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10469', '10469', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102089 WHERE (`entry` = 10469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10469);
-- Mythic Risen Bonewarder
DELETE FROM `creature_template` WHERE entry = 9102090;
INSERT INTO `creature_template` VALUES (9102090, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Mythic Risen Bonewarder', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10491', '10491', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '3.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102090 WHERE (`entry` = 10491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10491);
-- Mythic Diseased Ghoul
DELETE FROM `creature_template` WHERE entry = 9102091;
INSERT INTO `creature_template` VALUES (9102091, '0', '0', '0', '0', '0', '519', '0', '0', '0', 'Mythic Diseased Ghoul', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10495', '10495', '0', '0', '0', '0', '0', '', '1', '1.0', '4.08', '3.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102091 WHERE (`entry` = 10495);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10495);
-- Mythic Unstable Corpse
DELETE FROM `creature_template` WHERE entry = 9102092;
INSERT INTO `creature_template` VALUES (9102092, '0', '0', '0', '0', '0', '10978', '10972', '0', '0', 'Mythic Unstable Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.571429', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10480', '10480', '0', '0', '0', '0', '0', '', '1', '1.0', '3.85', '1.0', 
'1.0', '1.0', '0', '80', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102092 WHERE (`entry` = 10480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10480);
-- Mythic Reanimated Corpse
DELETE FROM `creature_template` WHERE entry = 9102093;
INSERT INTO `creature_template` VALUES (9102093, '0', '0', '0', '0', '0', '10975', '10976', '0', '0', 'Mythic Reanimated Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.428571', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10481', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '1.0', '1.0', '1.0', '0', '73', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102093 WHERE (`entry` = 10481);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10481);
-- Mythic Risen Guard
DELETE FROM `creature_template` WHERE entry = 9102094;
INSERT INTO `creature_template` VALUES (9102094, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Mythic Risen Guard', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10489', '10489', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '3.0', '1.5', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102094 WHERE (`entry` = 10489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10489);
-- Mythic Plagued Hatchling
DELETE FROM `creature_template` WHERE entry = 9102095;
INSERT INTO `creature_template` VALUES (9102095, '0', '0', '0', '0', '0', '10007', '0', '0', '0', 'Mythic Plagued Hatchling', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10678', '0', '10678', '0', '0', '0', '0', '', '1', '1.0', '4.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102095 WHERE (`entry` = 10678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10678);
-- Mythic Risen Lackey
DELETE FROM `creature_template` WHERE entry = 9102096;
INSERT INTO `creature_template` VALUES (9102096, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Mythic Risen Lackey', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10482', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.01', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102096 WHERE (`entry` = 10482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10482);
-- Mythic Frail Skeleton
DELETE FROM `creature_template` WHERE entry = 9102097;
INSERT INTO `creature_template` VALUES (9102097, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Mythic Frail Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '774', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.36', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102097 WHERE (`entry` = 11258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11258);
-- Mythic Jeevee
DELETE FROM `creature_template` WHERE entry = 9102098;
INSERT INTO `creature_template` VALUES (9102098, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Mythic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.39', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102098 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500);
-- Mythic Scholomance Neophyte
DELETE FROM `creature_template` WHERE entry = 9102099;
INSERT INTO `creature_template` VALUES (9102099, '0', '0', '0', '0', '0', '11164', '11131', '11132', '11133', 'Mythic Scholomance Neophyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10470', '10470', '0', '0', '0', '0', '0', '', '1', '1.0', '4.48', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102099 WHERE (`entry` = 10470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10470);
-- Mythic Scholomance Necrolyte
DELETE FROM `creature_template` WHERE entry = 9102100;
INSERT INTO `creature_template` VALUES (9102100, '0', '0', '0', '0', '0', '11161', '11151', '11152', '11175', 'Mythic Scholomance Necrolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10476', '10476', '0', '0', '0', '0', '0', '', '1', '1.0', '4.07', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102100 WHERE (`entry` = 10476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10476);
-- Mythic Scholomance Acolyte
DELETE FROM `creature_template` WHERE entry = 9102101;
INSERT INTO `creature_template` VALUES (9102101, '0', '0', '0', '0', '0', '11157', '11145', '11146', '11173', 'Mythic Scholomance Acolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10471', '10471', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102101 WHERE (`entry` = 10471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10471);
-- Mythic Risen Aberration
DELETE FROM `creature_template` WHERE entry = 9102102;
INSERT INTO `creature_template` VALUES (9102102, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Mythic Risen Aberration', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10485', '10485', '0', '0', '0', '0', '0', '', '1', '1.0', '3.81', '1.0', '1.0', '1.0', '0', '164', '1', '8602131', '124', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102102 WHERE (`entry` = 10485);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10485);
-- Mythic Kirtonos the Herald
DELETE FROM `creature_template` WHERE entry = 9102103;
INSERT INTO `creature_template` VALUES (9102103, '0', '0', '0', '0', '0', '7534', '0', '0', '0', 'Mythic Kirtonos the Herald', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '3000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.93', '3.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '512', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102103 WHERE (`entry` = 10506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10506);
-- Mythic Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9102104;
INSERT INTO `creature_template` VALUES (9102104, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Mythic Jandice Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.13', '3.0', '1.15', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102104 WHERE (`entry` = 10503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10503);
-- Mythic Rattlegore
DELETE FROM `creature_template` WHERE entry = 9102105;
INSERT INTO `creature_template` VALUES (9102105, '0', '0', '0', '0', '0', '12073', '0', '0', '0', 'Mythic Rattlegore', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '11622', '0', '0', '0', '0', '0', '', '1', '1.0', '8.02', '3.0', '1.15', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102105 WHERE (`entry` = 11622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11622);
-- Mythic Marduk Blackpool
DELETE FROM `creature_template` WHERE entry = 9102106;
INSERT INTO `creature_template` VALUES (9102106, '0', '0', '0', '0', '0', '10248', '0', '0', '0', 'Mythic Marduk Blackpool', NULL, NULL, '3649', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2500', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.38', '2.0', 
'1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102106 WHERE (`entry` = 10433);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10433);
-- Mythic Vectus
DELETE FROM `creature_template` WHERE entry = 9102107;
INSERT INTO `creature_template` VALUES (9102107, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Mythic Vectus', NULL, NULL, '3648', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.4', '2.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102107 WHERE (`entry` = 10432);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10432);
-- Mythic Ras Frostwhisper
DELETE FROM `creature_template` WHERE entry = 9102108;
INSERT INTO `creature_template` VALUES (9102108, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Mythic Ras Frostwhisper', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10508', '0', '0', '0', '0', '0', '', '1', '1.0', '8.24', '6.0', '1.5', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102108 WHERE (`entry` = 10508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10508);
-- Mythic Instructor Malicia
DELETE FROM `creature_template` WHERE entry = 9102109;
INSERT INTO `creature_template` VALUES (9102109, '0', '0', '0', '0', '0', '11069', '0', '0', '0', 'Mythic Instructor Malicia', NULL, NULL, '0', '63', '63', '0', '233', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10505', '0', '0', '0', '0', '0', '', '1', '1.0', '7.87', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102109 WHERE (`entry` = 10505);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10505);
-- Mythic Doctor Theolen Krastinov
DELETE FROM `creature_template` WHERE entry = 9102110;
INSERT INTO `creature_template` VALUES (9102110, '0', '0', '0', '0', '0', '10901', '0', '0', '0', 'Mythic Doctor Theolen Krastinov', 'The Butcher', NULL, '0', '63', '63', '0', '21', '2', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11261', '0', '0', '0', '0', '0', '', '1', '1.0', 
'8.27', '3.0', '1.1', '2.0', '0', '144', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102110 WHERE (`entry` = 11261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11261);
-- Mythic Lorekeeper Polkelt
DELETE FROM `creature_template` WHERE entry = 9102111;
INSERT INTO `creature_template` VALUES (9102111, '0', '0', '0', '0', '0', '11492', '0', '0', '0', 'Mythic Lorekeeper Polkelt', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10901', '0', '0', '0', '0', '0', '', '1', '1.0', '7.95', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102111 WHERE (`entry` = 10901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10901);
-- Mythic The Ravenian
DELETE FROM `creature_template` WHERE entry = 9102112;
INSERT INTO `creature_template` VALUES (9102112, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Mythic The Ravenian', NULL, NULL, '0', '63', '63', '0', '233', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10507', '0', '0', '0', '0', '0', '', '1', '1.0', '8.11', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102112 WHERE (`entry` = 10507);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10507);
-- Mythic Lord Alexei Barov
DELETE FROM `creature_template` WHERE entry = 9102113;
INSERT INTO `creature_template` VALUES (9102113, '0', '0', '0', '0', '0', '11072', '0', '0', '0', 'Mythic Lord Alexei Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.45', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102113 WHERE (`entry` = 10504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10504);
-- Mythic Lady Illucia Barov
DELETE FROM `creature_template` WHERE entry = 9102114;
INSERT INTO `creature_template` VALUES (9102114, '0', '0', '0', '0', '0', '11835', '0', '0', '0', 'Mythic Lady Illucia Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.28', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102114 WHERE (`entry` = 10502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10502);
-- Mythic Darkmaster Gandling
DELETE FROM `creature_template` WHERE entry = 9102115;
INSERT INTO `creature_template` VALUES (9102115, '0', '0', '0', '0', '0', '11070', '0', '0', '0', 'Mythic Darkmaster Gandling', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1853', '0', '0', '0', '0', '0', '', '1', '1.0', '8.23', '3.0', '1.35', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102115 WHERE (`entry` = 1853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1853);
-- Mythic Kormok
DELETE FROM `creature_template` WHERE entry = 9102116;
INSERT INTO `creature_template` VALUES (9102116, '0', '0', '0', '0', '0', '16020', '0', '0', '0', 'Mythic Kormok', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '1100', '1300', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.16', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102116 WHERE (`entry` = 16118);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16118);
-- Mythic Lord Blackwood
DELETE FROM `creature_template` WHERE entry = 9102117;
INSERT INTO `creature_template` VALUES (9102117, '0', '0', '0', '0', '0', '14699', '0', '0', '0', 'Mythic Lord Blackwood', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.42', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9102117 WHERE (`entry` = 14695);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14695)