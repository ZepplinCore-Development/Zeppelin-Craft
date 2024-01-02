-- Heroic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9101600;
INSERT INTO `creature_template` VALUES (9101600, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '1.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101600 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Heroic Death Knight Darkreaver
DELETE FROM `creature_template` WHERE entry = 9101601;
INSERT INTO `creature_template` VALUES (9101601, '0', '0', '0', '0', '0', '14591', '0', '0', '0', 'Heroic Death Knight Darkreaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.65', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14516', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '15.0', '4.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101601 WHERE (`entry` = 14516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14516);
-- Heroic Illusion of Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9101602;
INSERT INTO `creature_template` VALUES (9101602, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Heroic Illusion of Jandice Barov', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.1', '2000', '1283', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101602 WHERE (`entry` = 11439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11439);
-- Heroic Blood Steward of Kirtonos
DELETE FROM `creature_template` WHERE entry = 9101603;
INSERT INTO `creature_template` VALUES (9101603, '0', '0', '0', '0', '0', '10925', '0', '0', '0', 'Heroic Blood Steward of Kirtonos', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14861', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '6.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101603 WHERE (`entry` = 14861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14861);
-- Heroic Risen Warrior
DELETE FROM `creature_template` WHERE entry = 9101604;
INSERT INTO `creature_template` VALUES (9101604, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Heroic Risen Warrior', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10486', '10486', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '3.0', '1.1', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101604 WHERE (`entry` = 10486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10486);
-- Heroic Risen Guardian
DELETE FROM `creature_template` WHERE entry = 9101605;
INSERT INTO `creature_template` VALUES (9101605, '0', '0', '0', '0', '0', '775', '5432', '533', '10975', 'Heroic Risen Guardian', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.6', '2400', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11598', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.3', '1.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101605 WHERE (`entry` = 11598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11598);
-- Heroic Spectral Teacher
DELETE FROM `creature_template` WHERE entry = 9101606;
INSERT INTO `creature_template` VALUES (9101606, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Teacher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101606 WHERE (`entry` = 10500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10500);
-- Heroic Risen Construct
DELETE FROM `creature_template` WHERE entry = 9101607;
INSERT INTO `creature_template` VALUES (9101607, '0', '0', '0', '0', '0', '12074', '0', '0', '0', 'Heroic Risen Construct', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10488', '10488', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '3.0', '1.05', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101607 WHERE (`entry` = 10488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10488);
-- Heroic Shadowed Spirit
DELETE FROM `creature_template` WHERE entry = 9101608;
INSERT INTO `creature_template` VALUES (9101608, '0', '0', '0', '0', '0', '14594', '0', '0', '0', 'Heroic Shadowed Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '3.6', '1.28571', '1.0', '1.0', 
'45.0', '1.0', '1', '0', '5.4', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '2.0', '1.35', '1.0', '0', '138', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101608 WHERE (`entry` = 14511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14511);
-- Heroic Bone Mage
DELETE FROM `creature_template` WHERE entry = 9101609;
INSERT INTO `creature_template` VALUES (9101609, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Heroic Bone Mage', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.0', '1.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101609 WHERE (`entry` = 16120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16120);
-- Heroic Aspect of Shadow
DELETE FROM `creature_template` WHERE entry = 9101610;
INSERT INTO `creature_template` VALUES (9101610, '0', '0', '0', '0', '0', '11649', '0', '0', '0', 'Heroic Aspect of Shadow', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.85', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14521', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '4.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101610 WHERE (`entry` = 14521);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14521);
-- Heroic Aspect of Malice
DELETE FROM `creature_template` WHERE entry = 9101611;
INSERT INTO `creature_template` VALUES (9101611, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Heroic Aspect of Malice', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.45', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14520', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '1.0', '1.1', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101611 WHERE (`entry` = 14520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14520);
-- Heroic Aspect of Corruption
DELETE FROM `creature_template` WHERE entry = 9101612;
INSERT INTO `creature_template` VALUES (9101612, '0', '0', '0', '0', '0', '10703', '0', '0', '0', 'Heroic Aspect of Corruption', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.45', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14519', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '1.0', '1.1', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101612 WHERE (`entry` = 14519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14519);
-- Heroic Aspect of Banality
DELETE FROM `creature_template` WHERE entry = 9101613;
INSERT INTO `creature_template` VALUES (9101613, '0', '0', '0', '0', '0', '14560', '0', '0', '0', 'Heroic Aspect of Banality', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '1', '0', '5.85', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14518', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '4.0', '1.35', '1.0', '0', '76', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101613 WHERE (`entry` = 14518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14518);
-- Heroic Darkreavers Fallen Charger
DELETE FROM `creature_template` WHERE entry = 9101614;
INSERT INTO `creature_template` VALUES (9101614, '0', '0', '0', '0', '0', '14590', '0', '0', '0', 'Heroic Darkreavers Fallen Charger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', 
'1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101614 WHERE (`entry` = 14568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14568);
-- Heroic Bone Minion
DELETE FROM `creature_template` WHERE entry = 9101615;
INSERT INTO `creature_template` VALUES (9101615, '0', '0', '0', '0', '0', '158', '0', '0', '0', 'Heroic Bone Minion', '', NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', 
'1.0', '0', '0', '1.05', '1930', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.5', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101615 WHERE (`entry` = 16119);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16119);
-- Heroic Banal Spirit
DELETE FROM `creature_template` WHERE entry = 9101616;
INSERT INTO `creature_template` VALUES (9101616, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Banal Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '0', '0', '2.2', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.1', '1.0', '0', 
'76', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101616 WHERE (`entry` = 14514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14514);
-- Heroic Splintered Skeleton
DELETE FROM `creature_template` WHERE entry = 9101617;
INSERT INTO `creature_template` VALUES (9101617, '0', '0', '0', '0', '0', '11401', '9788', '9789', '9790', 'Heroic Splintered Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '1000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10478', '10478', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', 
'3.0', '1.05', '1.0', '0', '164', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101617 WHERE (`entry` = 10478);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10478);
-- Heroic Scholomance Handler
DELETE FROM `creature_template` WHERE entry = 9101618;
INSERT INTO `creature_template` VALUES (9101618, '0', '0', '0', '0', '0', '11161', '11122', '11123', '11124', 'Heroic Scholomance Handler', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11257', '11257', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101618 WHERE (`entry` = 11257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11257);
-- Heroic Malicious Spirit
DELETE FROM `creature_template` WHERE entry = 9101619;
INSERT INTO `creature_template` VALUES (9101619, '0', '0', '0', '0', '0', '14593', '0', '0', '0', 'Heroic Malicious Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '4.9', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.05', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101619 WHERE (`entry` = 14513);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14513);
-- Heroic Corrupted Spirit
DELETE FROM `creature_template` WHERE entry = 9101620;
INSERT INTO `creature_template` VALUES (9101620, '0', '0', '0', '0', '0', '14592', '0', '0', '0', 'Heroic Corrupted Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '4.9', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.05', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101620 WHERE (`entry` = 14512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14512);
-- Heroic Spectral Tutor
DELETE FROM `creature_template` WHERE entry = 9101621;
INSERT INTO `creature_template` VALUES (9101621, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Tutor', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10498', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.05', 
'1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101621 WHERE (`entry` = 10498);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10498);
-- Heroic Spectral Researcher
DELETE FROM `creature_template` WHERE entry = 9101622;
INSERT INTO `creature_template` VALUES (9101622, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Researcher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10499', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101622 WHERE (`entry` = 10499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10499);
-- Heroic Risen Protector
DELETE FROM `creature_template` WHERE entry = 9101623;
INSERT INTO `creature_template` VALUES (9101623, '0', '0', '0', '0', '0', '11489', '0', '0', '0', 'Heroic Risen Protector', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10487', '10487', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.55', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101623 WHERE (`entry` = 10487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10487);
-- Heroic Necrofiend
DELETE FROM `creature_template` WHERE entry = 9101624;
INSERT INTO `creature_template` VALUES (9101624, '0', '0', '0', '0', '0', '11178', '0', '0', '0', 'Heroic Necrofiend', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11551', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101624 WHERE (`entry` = 11551);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11551);
-- Heroic Spectral Projection
DELETE FROM `creature_template` WHERE entry = 9101625;
INSERT INTO `creature_template` VALUES (9101625, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Heroic Spectral Projection', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.15', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.33', '1.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101625 WHERE (`entry` = 11263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11263);
-- Heroic Scholomance Student
DELETE FROM `creature_template` WHERE entry = 9101626;
INSERT INTO `creature_template` VALUES (9101626, '0', '0', '0', '0', '0', '11161', '11134', '11135', '11136', 'Heroic Scholomance Student', NULL, NULL, '3647', '60', '60', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.25', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10475', '10475', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101626 WHERE (`entry` = 10475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10475);
-- Heroic Scholomance Occultist
DELETE FROM `creature_template` WHERE entry = 9101627;
INSERT INTO `creature_template` VALUES (9101627, '0', '0', '0', '0', '0', '11157', '11125', '11126', '11176', 'Heroic Scholomance Occultist', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10472', '10472', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101627 WHERE (`entry` = 10472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10472);
-- Heroic Scholomance Necromancer
DELETE FROM `creature_template` WHERE entry = 9101628;
INSERT INTO `creature_template` VALUES (9101628, '0', '0', '0', '0', '0', '11163', '11154', '11155', '11156', 'Heroic Scholomance Necromancer', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10477', '10477', '0', '0', '0', '0', '0', '', '1', '1.0', 
'3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101628 WHERE (`entry` = 10477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10477);
-- Heroic Scholomance Dark Summoner
DELETE FROM `creature_template` WHERE entry = 9101629;
INSERT INTO `creature_template` VALUES (9101629, '0', '0', '0', '0', '0', '11163', '11128', '11129', '11177', 'Heroic Scholomance Dark Summoner', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11582', '11582', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101629 WHERE (`entry` = 11582);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11582);
-- Heroic Scholomance Adept
DELETE FROM `creature_template` WHERE entry = 9101630;
INSERT INTO `creature_template` VALUES (9101630, '0', '0', '0', '0', '0', '11161', '11148', '11149', '11150', 'Heroic Scholomance Adept', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10469', '10469', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101630 WHERE (`entry` = 10469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10469);
-- Heroic Risen Bonewarder
DELETE FROM `creature_template` WHERE entry = 9101631;
INSERT INTO `creature_template` VALUES (9101631, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Heroic Risen Bonewarder', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10491', '10491', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101631 WHERE (`entry` = 10491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10491);
-- Heroic Diseased Ghoul
DELETE FROM `creature_template` WHERE entry = 9101632;
INSERT INTO `creature_template` VALUES (9101632, '0', '0', '0', '0', '0', '519', '0', '0', '0', 'Heroic Diseased Ghoul', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10495', '10495', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101632 WHERE (`entry` = 10495);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10495);
-- Heroic Unstable Corpse
DELETE FROM `creature_template` WHERE entry = 9101633;
INSERT INTO `creature_template` VALUES (9101633, '0', '0', '0', '0', '0', '10978', '10972', '0', '0', 'Heroic Unstable Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.571429', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10480', '10480', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '80', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101633 WHERE (`entry` = 10480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10480);
-- Heroic Reanimated Corpse
DELETE FROM `creature_template` WHERE entry = 9101634;
INSERT INTO `creature_template` VALUES (9101634, '0', '0', '0', '0', '0', '10975', '10976', '0', '0', 'Heroic Reanimated Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.428571', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10481', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.5', '1.0', '1.0', '1.0', '0', '73', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101634 WHERE (`entry` = 10481);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10481);
-- Heroic Risen Guard
DELETE FROM `creature_template` WHERE entry = 9101635;
INSERT INTO `creature_template` VALUES (9101635, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Heroic Risen Guard', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10489', '10489', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.5', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101635 WHERE (`entry` = 10489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10489);
-- Heroic Plagued Hatchling
DELETE FROM `creature_template` WHERE entry = 9101636;
INSERT INTO `creature_template` VALUES (9101636, '0', '0', '0', '0', '0', '10007', '0', '0', '0', 'Heroic Plagued Hatchling', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10678', '0', '10678', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101636 WHERE (`entry` = 10678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10678);
-- Heroic Risen Lackey
DELETE FROM `creature_template` WHERE entry = 9101637;
INSERT INTO `creature_template` VALUES (9101637, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Heroic Risen Lackey', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10482', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.1', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101637 WHERE (`entry` = 10482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10482);
-- Heroic Frail Skeleton
DELETE FROM `creature_template` WHERE entry = 9101638;
INSERT INTO `creature_template` VALUES (9101638, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Heroic Frail Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.3', '2000', '2000', '1.0', '1.0', '1', '774', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.25', '1.0', '1.0', '1.0', 
'0', '0', '1', '8602131', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101638 WHERE (`entry` = 11258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11258);
-- Heroic Jeevee
DELETE FROM `creature_template` WHERE entry = 9101639;
INSERT INTO `creature_template` VALUES (9101639, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Heroic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '0.85', '1.0', '0', '0', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101639 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500);
-- Heroic Scholomance Neophyte
DELETE FROM `creature_template` WHERE entry = 9101640;
INSERT INTO `creature_template` VALUES (9101640, '0', '0', '0', '0', '0', '11164', '11131', '11132', '11133', 'Heroic Scholomance Neophyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.8', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10470', '10470', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101640 WHERE (`entry` = 10470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10470);
-- Heroic Scholomance Necrolyte
DELETE FROM `creature_template` WHERE entry = 9101641;
INSERT INTO `creature_template` VALUES (9101641, '0', '0', '0', '0', '0', '11161', '11151', '11152', '11175', 'Heroic Scholomance Necrolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10476', '10476', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101641 WHERE (`entry` = 10476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10476);
-- Heroic Scholomance Acolyte
DELETE FROM `creature_template` WHERE entry = 9101642;
INSERT INTO `creature_template` VALUES (9101642, '0', '0', '0', '0', '0', '11157', '11145', '11146', '11173', 'Heroic Scholomance Acolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10471', '10471', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101642 WHERE (`entry` = 10471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10471);
-- Heroic Risen Aberration
DELETE FROM `creature_template` WHERE entry = 9101643;
INSERT INTO `creature_template` VALUES (9101643, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Heroic Risen Aberration', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10485', '10485', '0', '0', '0', '0', '0', '', '1', '1.0', '0.75', '1.0', '1.0', '1.0', '0', '164', '1', '8602131', '124', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101643 WHERE (`entry` = 10485);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10485);
-- Heroic Kirtonos the Herald
DELETE FROM `creature_template` WHERE entry = 9101644;
INSERT INTO `creature_template` VALUES (9101644, '0', '0', '0', '0', '0', '7534', '0', '0', '0', 'Heroic Kirtonos the Herald', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '3000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.14', '3.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '512', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101644 WHERE (`entry` = 10506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10506);
-- Heroic Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9101645;
INSERT INTO `creature_template` VALUES (9101645, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Heroic Jandice Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.48', '3.0', '1.15', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101645 WHERE (`entry` = 10503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10503);
-- Heroic Rattlegore
DELETE FROM `creature_template` WHERE entry = 9101646;
INSERT INTO `creature_template` VALUES (9101646, '0', '0', '0', '0', '0', '12073', '0', '0', '0', 'Heroic Rattlegore', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '11622', '0', '0', '0', '0', '0', '', '1', '1.0', '5.94', '3.0', '1.15', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101646 WHERE (`entry` = 11622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11622);
-- Heroic Marduk Blackpool
DELETE FROM `creature_template` WHERE entry = 9101647;
INSERT INTO `creature_template` VALUES (9101647, '0', '0', '0', '0', '0', '10248', '0', '0', '0', 'Heroic Marduk Blackpool', NULL, NULL, '3649', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2500', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.17', '2.0', 
'1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101647 WHERE (`entry` = 10433);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10433);
-- Heroic Vectus
DELETE FROM `creature_template` WHERE entry = 9101648;
INSERT INTO `creature_template` VALUES (9101648, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Heroic Vectus', NULL, NULL, '3648', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.36', '2.0', '1.1', '2.0', 
'0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101648 WHERE (`entry` = 10432);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10432);
-- Heroic Ras Frostwhisper
DELETE FROM `creature_template` WHERE entry = 9101649;
INSERT INTO `creature_template` VALUES (9101649, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Heroic Ras Frostwhisper', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10508', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '6.0', '1.5', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101649 WHERE (`entry` = 10508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10508);
-- Heroic Instructor Malicia
DELETE FROM `creature_template` WHERE entry = 9101650;
INSERT INTO `creature_template` VALUES (9101650, '0', '0', '0', '0', '0', '11069', '0', '0', '0', 'Heroic Instructor Malicia', NULL, NULL, '0', '63', '63', '0', '233', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '10505', '0', '0', '0', '0', '0', '', '1', '1.0', '6.31', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101650 WHERE (`entry` = 10505);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10505);
-- Heroic Doctor Theolen Krastinov
DELETE FROM `creature_template` WHERE entry = 9101651;
INSERT INTO `creature_template` VALUES (9101651, '0', '0', '0', '0', '0', '10901', '0', '0', '0', 'Heroic Doctor Theolen Krastinov', 'The Butcher', NULL, '0', '63', '63', '0', '21', '2', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11261', '0', '0', '0', '0', '0', '', '1', '1.0', 
'6.06', '3.0', '1.1', '2.0', '0', '144', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101651 WHERE (`entry` = 11261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11261);
-- Heroic Lorekeeper Polkelt
DELETE FROM `creature_template` WHERE entry = 9101652;
INSERT INTO `creature_template` VALUES (9101652, '0', '0', '0', '0', '0', '11492', '0', '0', '0', 'Heroic Lorekeeper Polkelt', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10901', '0', '0', '0', '0', '0', '', '1', '1.0', '6.15', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101652 WHERE (`entry` = 10901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10901);
-- Heroic The Ravenian
DELETE FROM `creature_template` WHERE entry = 9101653;
INSERT INTO `creature_template` VALUES (9101653, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Heroic The Ravenian', NULL, NULL, '0', '63', '63', '0', '233', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '10507', '0', '0', '0', '0', '0', '', '1', '1.0', '6.01', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101653 WHERE (`entry` = 10507);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10507);
-- Heroic Lord Alexei Barov
DELETE FROM `creature_template` WHERE entry = 9101654;
INSERT INTO `creature_template` VALUES (9101654, '0', '0', '0', '0', '0', '11072', '0', '0', '0', 'Heroic Lord Alexei Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.14', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101654 WHERE (`entry` = 10504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10504);
-- Heroic Lady Illucia Barov
DELETE FROM `creature_template` WHERE entry = 9101655;
INSERT INTO `creature_template` VALUES (9101655, '0', '0', '0', '0', '0', '11835', '0', '0', '0', 'Heroic Lady Illucia Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.91', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101655 WHERE (`entry` = 10502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10502);
-- Heroic Darkmaster Gandling
DELETE FROM `creature_template` WHERE entry = 9101656;
INSERT INTO `creature_template` VALUES (9101656, '0', '0', '0', '0', '0', '11070', '0', '0', '0', 'Heroic Darkmaster Gandling', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1853', '0', '0', '0', '0', '0', '', '1', '1.0', '6.11', '3.0', '1.35', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101656 WHERE (`entry` = 1853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1853);
-- Heroic Kormok
DELETE FROM `creature_template` WHERE entry = 9101657;
INSERT INTO `creature_template` VALUES (9101657, '0', '0', '0', '0', '0', '16020', '0', '0', '0', 'Heroic Kormok', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '1100', '1300', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.5', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101657 WHERE (`entry` = 16118);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16118);
-- Heroic Lord Blackwood
DELETE FROM `creature_template` WHERE entry = 9101658;
INSERT INTO `creature_template` VALUES (9101658, '0', '0', '0', '0', '0', '14699', '0', '0', '0', 'Heroic Lord Blackwood', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.44', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101658 WHERE (`entry` = 14695);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14695);
-- Mythic Greater Fire Elemental
DELETE FROM `creature_template` WHERE entry = 9101659;
INSERT INTO `creature_template` VALUES (9101659, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Greater Fire Elemental', '', NULL, '0', '60', '60', '1', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '0', '2', '3.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '0', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101659 WHERE (`entry` = 15438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15438);
-- Mythic Death Knight Darkreaver
DELETE FROM `creature_template` WHERE entry = 9101660;
INSERT INTO `creature_template` VALUES (9101660, '0', '0', '0', '0', '0', '14591', '0', '0', '0', 'Mythic Death Knight Darkreaver', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14516', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '4.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101660 WHERE (`entry` = 14516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14516);
-- Mythic Illusion of Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9101661;
INSERT INTO `creature_template` VALUES (9101661, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Mythic Illusion of Jandice Barov', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '1283', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.91', '1.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101661 WHERE (`entry` = 11439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11439);
-- Mythic Blood Steward of Kirtonos
DELETE FROM `creature_template` WHERE entry = 9101662;
INSERT INTO `creature_template` VALUES (9101662, '0', '0', '0', '0', '0', '10925', '0', '0', '0', 'Mythic Blood Steward of Kirtonos', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '14861', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.03', '6.0', '1.15', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101662 WHERE (`entry` = 14861);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14861);
-- Mythic Risen Warrior
DELETE FROM `creature_template` WHERE entry = 9101663;
INSERT INTO `creature_template` VALUES (9101663, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Mythic Risen Warrior', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10486', '10486', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '3.0', '1.1', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101663 WHERE (`entry` = 10486);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10486);
-- Mythic Risen Guardian
DELETE FROM `creature_template` WHERE entry = 9101664;
INSERT INTO `creature_template` VALUES (9101664, '0', '0', '0', '0', '0', '775', '5432', '533', '10975', 'Mythic Risen Guardian', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '2.91', '2400', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11598', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.0', '1.1', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101664 WHERE (`entry` = 11598);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11598);
-- Mythic Spectral Teacher
DELETE FROM `creature_template` WHERE entry = 9101665;
INSERT INTO `creature_template` VALUES (9101665, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Teacher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.49', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101665 WHERE (`entry` = 10500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10500);
-- Mythic Risen Construct
DELETE FROM `creature_template` WHERE entry = 9101666;
INSERT INTO `creature_template` VALUES (9101666, '0', '0', '0', '0', '0', '12074', '0', '0', '0', 'Mythic Risen Construct', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10488', '10488', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '3.0', '1.05', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101666 WHERE (`entry` = 10488);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10488);
-- Mythic Shadowed Spirit
DELETE FROM `creature_template` WHERE entry = 9101667;
INSERT INTO `creature_template` VALUES (9101667, '0', '0', '0', '0', '0', '14594', '0', '0', '0', 'Mythic Shadowed Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '3.6', '1.28571', '1.0', '1.0', 
'45.0', '1.0', '1', '0', '2.99', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.85', '2.0', '1.35', '1.0', '0', '138', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101667 WHERE (`entry` = 14511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14511);
-- Mythic Bone Mage
DELETE FROM `creature_template` WHERE entry = 9101668;
INSERT INTO `creature_template` VALUES (9101668, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Mythic Bone Mage', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.02', '1.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101668 WHERE (`entry` = 16120);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16120);
-- Mythic Aspect of Shadow
DELETE FROM `creature_template` WHERE entry = 9101669;
INSERT INTO `creature_template` VALUES (9101669, '0', '0', '0', '0', '0', '11649', '0', '0', '0', 'Mythic Aspect of Shadow', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.11111', '1.14286', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.06', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14521', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '4.0', '1.35', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101669 WHERE (`entry` = 14521);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14521);
-- Mythic Aspect of Malice
DELETE FROM `creature_template` WHERE entry = 9101670;
INSERT INTO `creature_template` VALUES (9101670, '0', '0', '0', '0', '0', '14368', '0', '0', '0', 'Mythic Aspect of Malice', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.04', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14520', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.19', '1.0', '1.1', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101670 WHERE (`entry` = 14520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14520);
-- Mythic Aspect of Corruption
DELETE FROM `creature_template` WHERE entry = 9101671;
INSERT INTO `creature_template` VALUES (9101671, '0', '0', '0', '0', '0', '10703', '0', '0', '0', 'Mythic Aspect of Corruption', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.95', '2000', '1265', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14519', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '1.1', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101671 WHERE (`entry` = 14519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14519);
-- Mythic Aspect of Banality
DELETE FROM `creature_template` WHERE entry = 9101672;
INSERT INTO `creature_template` VALUES (9101672, '0', '0', '0', '0', '0', '14560', '0', '0', '0', 'Mythic Aspect of Banality', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.02', '2000', '1265', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '14518', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.36', '4.0', '1.35', '1.0', '0', '76', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101672 WHERE (`entry` = 14518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14518);
-- Mythic Darkreavers Fallen Charger
DELETE FROM `creature_template` WHERE entry = 9101673;
INSERT INTO `creature_template` VALUES (9101673, '0', '0', '0', '0', '0', '14590', '0', '0', '0', 'Mythic Darkreavers Fallen Charger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.38571', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '4.42', '1.0', '1.1', '1.0', '0', '140', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101673 WHERE (`entry` = 14568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14568);
-- Mythic Bone Minion
DELETE FROM `creature_template` WHERE entry = 9101674;
INSERT INTO `creature_template` VALUES (9101674, '0', '0', '0', '0', '0', '158', '0', '0', '0', 'Mythic Bone Minion', '', NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', 
'1.0', '0', '0', '3.05', '1930', '1573', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.16', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101674 WHERE (`entry` = 16119);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16119);
-- Mythic Banal Spirit
DELETE FROM `creature_template` WHERE entry = 9101675;
INSERT INTO `creature_template` VALUES (9101675, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Banal Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '1.2', '0.428571', '1.0', '1.0', '45.0', '1.0', '0', '0', '2.95', '2000', '1551', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.37', '1.0', '1.1', '1.0', '0', '76', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101675 WHERE (`entry` = 14514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14514);
-- Mythic Splintered Skeleton
DELETE FROM `creature_template` WHERE entry = 9101676;
INSERT INTO `creature_template` VALUES (9101676, '0', '0', '0', '0', '0', '11401', '9788', '9789', '9790', 'Mythic Splintered Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', 
'1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '1000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10478', '10478', '0', '0', '0', '0', '0', '', '1', '1.0', '3.8', '3.0', '1.05', '1.0', '0', '164', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101676 WHERE (`entry` = 10478);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10478);
-- Mythic Scholomance Handler
DELETE FROM `creature_template` WHERE entry = 9101677;
INSERT INTO `creature_template` VALUES (9101677, '0', '0', '0', '0', '0', '11161', '11122', '11123', '11124', 'Mythic Scholomance Handler', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11257', '11257', '0', '0', '0', '0', '0', '', '1', '1.0', '4.31', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101677 WHERE (`entry` = 11257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11257);
-- Mythic Malicious Spirit
DELETE FROM `creature_template` WHERE entry = 9101678;
INSERT INTO `creature_template` VALUES (9101678, '0', '0', '0', '0', '0', '14593', '0', '0', '0', 'Mythic Malicious Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.0', '0.714286', '1.0', '1.0', '45.0', '1.0', '1', '0', '2.97', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.07', '1.0', '1.05', '1.0', '0', '94', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101678 WHERE (`entry` = 14513);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14513);
-- Mythic Corrupted Spirit
DELETE FROM `creature_template` WHERE entry = 9101679;
INSERT INTO `creature_template` VALUES (9101679, '0', '0', '0', '0', '0', '14592', '0', '0', '0', 'Mythic Corrupted Spirit', NULL, NULL, '0', '60', '60', '0', '21', '0', '2.8', '1.0', '1.0', '1.0', '45.0', '1.0', '1', '0', '3.0', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.97', '1.0', '1.05', '1.0', '0', '118', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101679 WHERE (`entry` = 14512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14512);
-- Mythic Spectral Tutor
DELETE FROM `creature_template` WHERE entry = 9101680;
INSERT INTO `creature_template` VALUES (9101680, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Tutor', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10498', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101680 WHERE (`entry` = 10498);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10498);
-- Mythic Spectral Researcher
DELETE FROM `creature_template` WHERE entry = 9101681;
INSERT INTO `creature_template` VALUES (9101681, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Researcher', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10499', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.45', '3.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101681 WHERE (`entry` = 10499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10499);
-- Mythic Risen Protector
DELETE FROM `creature_template` WHERE entry = 9101682;
INSERT INTO `creature_template` VALUES (9101682, '0', '0', '0', '0', '0', '11489', '0', '0', '0', 'Mythic Risen Protector', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10487', '10487', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '3.0', '1.55', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101682 WHERE (`entry` = 10487);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10487);
-- Mythic Necrofiend
DELETE FROM `creature_template` WHERE entry = 9101683;
INSERT INTO `creature_template` VALUES (9101683, '0', '0', '0', '0', '0', '11178', '0', '0', '0', 'Mythic Necrofiend', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '11551', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.88', '3.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101683 WHERE (`entry` = 11551);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11551);
-- Mythic Spectral Projection
DELETE FROM `creature_template` WHERE entry = 9101684;
INSERT INTO `creature_template` VALUES (9101684, '0', '0', '0', '0', '0', '3942', '0', '0', '0', 'Mythic Spectral Projection', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.31', '1.0', '1.05', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101684 WHERE (`entry` = 11263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11263);
-- Mythic Scholomance Student
DELETE FROM `creature_template` WHERE entry = 9101685;
INSERT INTO `creature_template` VALUES (9101685, '0', '0', '0', '0', '0', '11161', '11134', '11135', '11136', 'Mythic Scholomance Student', NULL, NULL, '3647', '60', '60', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '1200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10475', '10475', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101685 WHERE (`entry` = 10475);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10475);
-- Mythic Scholomance Occultist
DELETE FROM `creature_template` WHERE entry = 9101686;
INSERT INTO `creature_template` VALUES (9101686, '0', '0', '0', '0', '0', '11157', '11125', '11126', '11176', 'Mythic Scholomance Occultist', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10472', '10472', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101686 WHERE (`entry` = 10472);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10472);
-- Mythic Scholomance Necromancer
DELETE FROM `creature_template` WHERE entry = 9101687;
INSERT INTO `creature_template` VALUES (9101687, '0', '0', '0', '0', '0', '11163', '11154', '11155', '11156', 'Mythic Scholomance Necromancer', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10477', '10477', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101687 WHERE (`entry` = 10477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10477);
-- Mythic Scholomance Dark Summoner
DELETE FROM `creature_template` WHERE entry = 9101688;
INSERT INTO `creature_template` VALUES (9101688, '0', '0', '0', '0', '0', '11163', '11128', '11129', '11177', 'Mythic Scholomance Dark Summoner', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11582', '11582', '0', '0', '0', '0', '0', '', '0', '1.0', '4.14', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101688 WHERE (`entry` = 11582);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11582);
-- Mythic Scholomance Adept
DELETE FROM `creature_template` WHERE entry = 9101689;
INSERT INTO `creature_template` VALUES (9101689, '0', '0', '0', '0', '0', '11161', '11148', '11149', '11150', 'Mythic Scholomance Adept', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10469', '10469', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101689 WHERE (`entry` = 10469);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10469);
-- Mythic Risen Bonewarder
DELETE FROM `creature_template` WHERE entry = 9101690;
INSERT INTO `creature_template` VALUES (9101690, '0', '0', '0', '0', '0', '11397', '0', '0', '0', 'Mythic Risen Bonewarder', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10491', '10491', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '3.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101690 WHERE (`entry` = 10491);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10491);
-- Mythic Diseased Ghoul
DELETE FROM `creature_template` WHERE entry = 9101691;
INSERT INTO `creature_template` VALUES (9101691, '0', '0', '0', '0', '0', '519', '0', '0', '0', 'Mythic Diseased Ghoul', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '1400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10495', '10495', '0', '0', '0', '0', '0', '', '1', '1.0', '4.3', '3.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101691 WHERE (`entry` = 10495);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10495);
-- Mythic Unstable Corpse
DELETE FROM `creature_template` WHERE entry = 9101692;
INSERT INTO `creature_template` VALUES (9101692, '0', '0', '0', '0', '0', '10978', '10972', '0', '0', 'Mythic Unstable Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.571429', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10480', '10480', '0', '0', '0', '0', '0', '', '1', '1.0', '4.2', '1.0', '1.0', '1.0', '0', '80', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101692 WHERE (`entry` = 10480);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10480);
-- Mythic Reanimated Corpse
DELETE FROM `creature_template` WHERE entry = 9101693;
INSERT INTO `creature_template` VALUES (9101693, '0', '0', '0', '0', '0', '10975', '10976', '0', '0', 'Mythic Reanimated Corpse', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '0.428571', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10481', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '1.0', '1.0', '0', '73', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101693 WHERE (`entry` = 10481);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10481);
-- Mythic Risen Guard
DELETE FROM `creature_template` WHERE entry = 9101694;
INSERT INTO `creature_template` VALUES (9101694, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Mythic Risen Guard', NULL, NULL, '0', '60', '60', '0', '233', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10489', '10489', '0', '0', '0', '0', '0', '', '1', '1.0', '3.82', '3.0', '1.5', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101694 WHERE (`entry` = 10489);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10489);
-- Mythic Plagued Hatchling
DELETE FROM `creature_template` WHERE entry = 9101695;
INSERT INTO `creature_template` VALUES (9101695, '0', '0', '0', '0', '0', '10007', '0', '0', '0', 'Mythic Plagued Hatchling', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.11111', '1.14286', '1.0', 
'1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10678', '0', '10678', '0', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101695 WHERE (`entry` = 10678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10678);
-- Mythic Risen Lackey
DELETE FROM `creature_template` WHERE entry = 9101696;
INSERT INTO `creature_template` VALUES (9101696, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Mythic Risen Lackey', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10482', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.27', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101696 WHERE (`entry` = 10482);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10482);
-- Mythic Frail Skeleton
DELETE FROM `creature_template` WHERE entry = 9101697;
INSERT INTO `creature_template` VALUES (9101697, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Mythic Frail Skeleton', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '774', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.9', '1.0', '1.0', '1.0', 
'0', '0', '1', '8602131', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101697 WHERE (`entry` = 11258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11258);
-- Mythic Jeevee
DELETE FROM `creature_template` WHERE entry = 9101698;
INSERT INTO `creature_template` VALUES (9101698, '0', '0', '0', '0', '0', '10812', '0', '0', '0', 'Mythic Jeevee', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.26', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101698 WHERE (`entry` = 14500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14500);
-- Mythic Scholomance Neophyte
DELETE FROM `creature_template` WHERE entry = 9101699;
INSERT INTO `creature_template` VALUES (9101699, '0', '0', '0', '0', '0', '11164', '11131', '11132', '11133', 'Mythic Scholomance Neophyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10470', '10470', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101699 WHERE (`entry` = 10470);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10470);
-- Mythic Scholomance Necrolyte
DELETE FROM `creature_template` WHERE entry = 9101700;
INSERT INTO `creature_template` VALUES (9101700, '0', '0', '0', '0', '0', '11161', '11151', '11152', '11175', 'Mythic Scholomance Necrolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10476', '10476', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101700 WHERE (`entry` = 10476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10476);
-- Mythic Scholomance Acolyte
DELETE FROM `creature_template` WHERE entry = 9101701;
INSERT INTO `creature_template` VALUES (9101701, '0', '0', '0', '0', '0', '11157', '11145', '11146', '11173', 'Mythic Scholomance Acolyte', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10471', '10471', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101701 WHERE (`entry` = 10471);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10471);
-- Mythic Risen Aberration
DELETE FROM `creature_template` WHERE entry = 9101702;
INSERT INTO `creature_template` VALUES (9101702, '0', '0', '0', '0', '0', '9786', '7550', '0', '0', 'Mythic Risen Aberration', NULL, NULL, '0', '60', '60', '0', '233', '0', '1.0', '1.71429', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '10485', '10485', '0', '0', '0', '0', '0', '', '1', '1.0', '3.82', '1.0', '1.0', '1.0', '0', '164', '1', '8602131', '124', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101702 WHERE (`entry` = 10485);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10485);
-- Mythic Kirtonos the Herald
DELETE FROM `creature_template` WHERE entry = 9101703;
INSERT INTO `creature_template` VALUES (9101703, '0', '0', '0', '0', '0', '7534', '0', '0', '0', 'Mythic Kirtonos the Herald', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '3000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.48', '3.0', '0.9', '2.0', '0', '0', '1', '617299931', '0', '512', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101703 WHERE (`entry` = 10506);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10506);
-- Mythic Jandice Barov
DELETE FROM `creature_template` WHERE entry = 9101704;
INSERT INTO `creature_template` VALUES (9101704, '0', '0', '0', '0', '0', '11073', '0', '0', '0', 'Mythic Jandice Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.02', '3.0', '1.15', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101704 WHERE (`entry` = 10503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10503);
-- Mythic Rattlegore
DELETE FROM `creature_template` WHERE entry = 9101705;
INSERT INTO `creature_template` VALUES (9101705, '0', '0', '0', '0', '0', '12073', '0', '0', '0', 'Mythic Rattlegore', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.19048', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '11622', '0', '0', '0', '0', '0', '', '1', '1.0', '8.01', '3.0', '1.15', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101705 WHERE (`entry` = 11622);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11622);
-- Mythic Marduk Blackpool
DELETE FROM `creature_template` WHERE entry = 9101706;
INSERT INTO `creature_template` VALUES (9101706, '0', '0', '0', '0', '0', '10248', '0', '0', '0', 'Mythic Marduk Blackpool', NULL, NULL, '3649', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2500', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '2.0', 
'1.0', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101706 WHERE (`entry` = 10433);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10433);
-- Mythic Vectus
DELETE FROM `creature_template` WHERE entry = 9101707;
INSERT INTO `creature_template` VALUES (9101707, '0', '0', '0', '0', '0', '2606', '0', '0', '0', 'Mythic Vectus', NULL, NULL, '3648', '63', '63', '0', '15', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.09', '2.0', '1.1', '2.0', 
'0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101707 WHERE (`entry` = 10432);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10432);
-- Mythic Ras Frostwhisper
DELETE FROM `creature_template` WHERE entry = 9101708;
INSERT INTO `creature_template` VALUES (9101708, '0', '0', '0', '0', '0', '7919', '0', '0', '0', 'Mythic Ras Frostwhisper', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10508', '0', '0', '0', '0', '0', '', '1', '1.0', '7.92', '6.0', '1.5', '2.0', '0', '0', '1', '617316315', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101708 WHERE (`entry` = 10508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10508);
-- Mythic Instructor Malicia
DELETE FROM `creature_template` WHERE entry = 9101709;
INSERT INTO `creature_template` VALUES (9101709, '0', '0', '0', '0', '0', '11069', '0', '0', '0', 'Mythic Instructor Malicia', NULL, NULL, '0', '63', '63', '0', '233', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '10505', '0', '0', '0', '0', '0', '', '1', '1.0', '8.1', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101709 WHERE (`entry` = 10505);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10505);
-- Mythic Doctor Theolen Krastinov
DELETE FROM `creature_template` WHERE entry = 9101710;
INSERT INTO `creature_template` VALUES (9101710, '0', '0', '0', '0', '0', '10901', '0', '0', '0', 'Mythic Doctor Theolen Krastinov', 'The Butcher', NULL, '0', '63', '63', '0', '21', '2', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11261', '0', '0', '0', '0', '0', '', '1', '1.0', 
'8.32', '3.0', '1.1', '2.0', '0', '144', '1', '617299931', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101710 WHERE (`entry` = 11261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11261);
-- Mythic Lorekeeper Polkelt
DELETE FROM `creature_template` WHERE entry = 9101711;
INSERT INTO `creature_template` VALUES (9101711, '0', '0', '0', '0', '0', '11492', '0', '0', '0', 'Mythic Lorekeeper Polkelt', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10901', '0', '0', '0', '0', '0', '', '1', '1.0', '8.2', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101711 WHERE (`entry` = 10901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10901);
-- Mythic The Ravenian
DELETE FROM `creature_template` WHERE entry = 9101712;
INSERT INTO `creature_template` VALUES (9101712, '0', '0', '0', '0', '0', '10433', '0', '0', '0', 'Mythic The Ravenian', NULL, NULL, '0', '63', '63', '0', '233', '0', '0.8', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '10507', '0', '0', '0', '0', '0', '', '1', '1.0', '7.98', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101712 WHERE (`entry` = 10507);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10507);
-- Mythic Lord Alexei Barov
DELETE FROM `creature_template` WHERE entry = 9101713;
INSERT INTO `creature_template` VALUES (9101713, '0', '0', '0', '0', '0', '11072', '0', '0', '0', 'Mythic Lord Alexei Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.22', '3.0', '1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101713 WHERE (`entry` = 10504);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10504);
-- Mythic Lady Illucia Barov
DELETE FROM `creature_template` WHERE entry = 9101714;
INSERT INTO `creature_template` VALUES (9101714, '0', '0', '0', '0', '0', '11835', '0', '0', '0', 'Mythic Lady Illucia Barov', NULL, NULL, '0', '63', '63', '0', '233', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.34', '3.0', 
'1.1', '2.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101714 WHERE (`entry` = 10502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10502);
-- Mythic Darkmaster Gandling
DELETE FROM `creature_template` WHERE entry = 9101715;
INSERT INTO `creature_template` VALUES (9101715, '0', '0', '0', '0', '0', '11070', '0', '0', '0', 'Mythic Darkmaster Gandling', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1853', '0', '0', '0', '0', '0', '', '1', '1.0', '7.99', '3.0', '1.35', '2.0', '0', '0', '1', '650854363', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101715 WHERE (`entry` = 1853);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1853);
-- Mythic Kormok
DELETE FROM `creature_template` WHERE entry = 9101716;
INSERT INTO `creature_template` VALUES (9101716, '0', '0', '0', '0', '0', '16020', '0', '0', '0', 'Mythic Kormok', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '1100', '1300', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '15.0', '1.1', '1.0', '0', '0', '1', '617299931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101716 WHERE (`entry` = 16118);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16118);
-- Mythic Lord Blackwood
DELETE FROM `creature_template` WHERE entry = 9101717;
INSERT INTO `creature_template` VALUES (9101717, '0', '0', '0', '0', '0', '14699', '0', '0', '0', 'Mythic Lord Blackwood', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '7.88', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101717 WHERE (`entry` = 14695);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14695);