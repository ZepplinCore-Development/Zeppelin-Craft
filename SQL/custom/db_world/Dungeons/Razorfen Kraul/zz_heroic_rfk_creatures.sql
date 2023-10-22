-- Heroic Agam'ar
DELETE FROM `creature_template` WHERE entry = 9100700;
INSERT INTO `creature_template` VALUES (9100700, '0', '0', '0', '0', '0', '4713', '0', '0', '0', 'Heroic Agam\'ar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.15', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4511', '0', '100007', '9089', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100700 WHERE (`entry` = 4511);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4511);
-- Heroic Blood of Agamaggan
DELETE FROM `creature_template` WHERE entry = 9100701;
INSERT INTO `creature_template` VALUES (9100701, '0', '0', '0', '0', '0', '4754', '0', '0', '0', 'Heroic Blood of Agamaggan', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '4541', '4541', '0', '0', '0', '96', '205', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100701 WHERE (`entry` = 4541);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4541);
-- Heroic Boar Spirit
DELETE FROM `creature_template` WHERE entry = 9100702;
INSERT INTO `creature_template` VALUES (9100702, '0', '0', '0', '0', '0', '4716', '0', '0', '0', 'Heroic Boar Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '27', '136', '', '0', '1.0', '0.75', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100702 WHERE (`entry` = 6021);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 6021);
-- Heroic Death's Head Acolyte
DELETE FROM `creature_template` WHERE entry = 9100703;
INSERT INTO `creature_template` VALUES (9100703, '0', '0', '0', '0', '0', '6093', '0', '0', '0', 'Heroic Death\'s Head Acolyte', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4515', '4515', '0', '0', '0', '147', '378', '', '1', '1.0', '3.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100703 WHERE (`entry` = 4515);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4515);
-- Heroic Death's Head Adept
DELETE FROM `creature_template` WHERE entry = 9100704;
INSERT INTO `creature_template` VALUES (9100704, '0', '0', '0', '0', '0', '6098', '0', '0', '0', 'Heroic Death\'s Head Adept', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4516', '4516', '0', '0', '0', '128', '216', '', '1', '1.0', '4.0', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100704 WHERE (`entry` = 4516);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4516);
-- Heroic Death's Head Priest
DELETE FROM `creature_template` WHERE entry = 9100705;
INSERT INTO `creature_template` VALUES (9100705, '0', '0', '0', '0', '0', '6096', '0', '0', '0', 'Heroic Death\'s Head Priest', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4517', '4517', '0', '0', '0', '74', '298', '', '0', '1.0', '3.0', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100705 WHERE (`entry` = 4517);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4517);
-- Heroic Death's Head Sage
DELETE FROM `creature_template` WHERE entry = 9100706;
INSERT INTO `creature_template` VALUES (9100706, '0', '0', '0', '0', '0', '6099', '0', '0', '0', 'Heroic Death\'s Head Sage', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4518', '4518', '0', '0', '0', '150', '424', '', '0', '1.0', '3.0', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100706 WHERE (`entry` = 4518);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4518);
-- Heroic Death's Head Seer
DELETE FROM `creature_template` WHERE entry = 9100707;
INSERT INTO `creature_template` VALUES (9100707, '0', '0', '0', '0', '0', '6100', '0', '0', '0', 'Heroic Death\'s Head Seer', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4519', '4519', '0', '0', '0', '147', '373', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100707 WHERE (`entry` = 4519);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4519);
-- Heroic Death's Head Ward Keeper
DELETE FROM `creature_template` WHERE entry = 9100708;
INSERT INTO `creature_template` VALUES (9100708, '0', '0', '0', '0', '0', '6101', '0', '0', '0', 'Heroic Death\'s Head Ward Keeper', NULL, NULL, '0', '60', '60', '0', '153', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100708 WHERE (`entry` = 4625);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4625);
-- Heroic Greater Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100709;
INSERT INTO `creature_template` VALUES (9100709, '0', '0', '0', '0', '0', '1954', '0', '0', '0', 'Heroic Greater Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.25', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4539', '0', '4539', '8300', '0', '0', '0', '', '0', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100709 WHERE (`entry` = 4539);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4539);
-- Heroic Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100710;
INSERT INTO `creature_template` VALUES (9100710, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Heroic Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4538', '0', '100012', '5790', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100710 WHERE (`entry` = 4538);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4538);
-- Heroic Quilguard Champion
DELETE FROM `creature_template` WHERE entry = 9100711;
INSERT INTO `creature_template` VALUES (9100711, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Heroic Quilguard Champion', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4623', '4623', '0', '0', '0', '137', '506', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100711 WHERE (`entry` = 4623);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4623);
-- Heroic Raging Agam'ar
DELETE FROM `creature_template` WHERE entry = 9100712;
INSERT INTO `creature_template` VALUES (9100712, '0', '0', '0', '0', '0', '2453', '0', '0', '0', 'Heroic Raging Agam\'ar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.85', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4514', '0', '100007', '9090', '0', '0', '0', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100712 WHERE (`entry` = 4514);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4514);
-- Heroic Razorfen Beast Trainer
DELETE FROM `creature_template` WHERE entry = 9100713;
INSERT INTO `creature_template` VALUES (9100713, '0', '0', '0', '0', '0', '4453', '0', '0', '0', 'Heroic Razorfen Beast Trainer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4531', '4531', '0', '0', '0', '164', '314', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100713 WHERE (`entry` = 4531);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4531);
-- Heroic Razorfen Beastmaster
DELETE FROM `creature_template` WHERE entry = 9100714;
INSERT INTO `creature_template` VALUES (9100714, '0', '0', '0', '0', '0', '6105', '0', '0', '0', 'Heroic Razorfen Beastmaster', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4532', '4532', '0', '0', '0', '135', '410', '', '1', '1.0', '3.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100714 WHERE (`entry` = 4532);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4532);
-- Heroic Razorfen Defender
DELETE FROM `creature_template` WHERE entry = 9100715;
INSERT INTO `creature_template` VALUES (9100715, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Heroic Razorfen Defender', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4442', '4442', '0', '0', '0', '153', '400', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100715 WHERE (`entry` = 4442);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4442);
-- Heroic Razorfen Dustweaver
DELETE FROM `creature_template` WHERE entry = 9100716;
INSERT INTO `creature_template` VALUES (9100716, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Heroic Razorfen Dustweaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4522', '4522', '0', '0', '0', '151', '202', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100716 WHERE (`entry` = 4522);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4522);
-- Heroic Razorfen Earthbreaker
DELETE FROM `creature_template` WHERE entry = 9100717;
INSERT INTO `creature_template` VALUES (9100717, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Heroic Razorfen Earthbreaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4525', '4525', '0', '0', '0', '163', '355', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100717 WHERE (`entry` = 4525);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4525);
-- Heroic Razorfen Geomancer
DELETE FROM `creature_template` WHERE entry = 9100718;
INSERT INTO `creature_template` VALUES (9100718, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Heroic Razorfen Geomancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4520', '4520', '0', '0', '0', '86', '228', '', '0', '1.0', '3.0', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100718 WHERE (`entry` = 4520);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4520);
-- Heroic Razorfen Groundshaker
DELETE FROM `creature_template` WHERE entry = 9100719;
INSERT INTO `creature_template` VALUES (9100719, '0', '0', '0', '0', '0', '6111', '0', '0', '0', 'Heroic Razorfen Groundshaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4523', '4523', '0', '0', '0', '103', '351', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100719 WHERE (`entry` = 4523);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4523);
-- Heroic Razorfen Handler
DELETE FROM `creature_template` WHERE entry = 9100720;
INSERT INTO `creature_template` VALUES (9100720, '0', '0', '0', '0', '0', '1963', '0', '0', '0', 'Heroic Razorfen Handler', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4530', '4530', '0', '0', '0', '117', '184', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100720 WHERE (`entry` = 4530);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4530);
-- Heroic Razorfen Quilguard
DELETE FROM `creature_template` WHERE entry = 9100721;
INSERT INTO `creature_template` VALUES (9100721, '0', '0', '0', '0', '0', '6108', '0', '0', '0', 'Heroic Razorfen Quilguard', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4436', '4436', '0', '0', '0', '137', '350', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100721 WHERE (`entry` = 4436);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4436);
-- Heroic Razorfen Spearhide
DELETE FROM `creature_template` WHERE entry = 9100722;
INSERT INTO `creature_template` VALUES (9100722, '0', '0', '0', '0', '0', '6078', '0', '0', '0', 'Heroic Razorfen Spearhide', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4438', '4438', '0', '0', '0', '167', '459', '', '0', '1.0', '1.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100722 WHERE (`entry` = 4438);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4438);
-- Heroic Razorfen Stalker
DELETE FROM `creature_template` WHERE entry = 9100723;
INSERT INTO `creature_template` VALUES (9100723, '0', '0', '0', '0', '0', '6106', '0', '0', '0', 'Heroic Razorfen Stalker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '6035', '6035', '0', '0', '0', '168', '354', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100723 WHERE (`entry` = 6035);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 6035);
-- Heroic Razorfen Totemic
DELETE FROM `creature_template` WHERE entry = 9100724;
INSERT INTO `creature_template` VALUES (9100724, '0', '0', '0', '0', '0', '6112', '0', '0', '0', 'Heroic Razorfen Totemic', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4440', '4440', '0', '0', '0', '148', '284', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100724 WHERE (`entry` = 4440);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4440);
-- Heroic Razorfen Warden
DELETE FROM `creature_template` WHERE entry = 9100725;
INSERT INTO `creature_template` VALUES (9100725, '0', '0', '0', '0', '0', '4758', '0', '0', '0', 'Heroic Razorfen Warden', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4437', '4437', '0', '0', '0', '112', '179', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100725 WHERE (`entry` = 4437);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4437);
-- Heroic Razorfen Warrior
DELETE FROM `creature_template` WHERE entry = 9100726;
INSERT INTO `creature_template` VALUES (9100726, '0', '0', '0', '0', '0', '6109', '0', '0', '0', 'Heroic Razorfen Warrior', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4435', '4435', '0', '0', '0', '94', '182', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100726 WHERE (`entry` = 4435);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4435);
-- Heroic Rotting Agam'ar
DELETE FROM `creature_template` WHERE entry = 9100727;
INSERT INTO `creature_template` VALUES (9100727, '0', '0', '0', '0', '0', '4714', '0', '0', '0', 'Heroic Rotting Agam\'ar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4512', '0', '4512', '9091', '0', '0', '0', '', '0', '1.0', '3.0', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100727 WHERE (`entry` = 4512);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4512);
-- Heroic Stone Rumbler
DELETE FROM `creature_template` WHERE entry = 9100728;
INSERT INTO `creature_template` VALUES (9100728, '0', '0', '0', '0', '0', '9589', '0', '0', '0', 'Heroic Stone Rumbler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '0', '0', '100022', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.75', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100728 WHERE (`entry` = 4528);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4528);
-- Heroic Tamed Battleboar
DELETE FROM `creature_template` WHERE entry = 9100729;
INSERT INTO `creature_template` VALUES (9100729, '0', '0', '0', '0', '0', '704', '0', '0', '0', 'Heroic Tamed Battleboar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '0', '0', '0', '13334', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100729 WHERE (`entry` = 4535);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4535);
-- Heroic Tamed Hyena
DELETE FROM `creature_template` WHERE entry = 9100730;
INSERT INTO `creature_template` VALUES (9100730, '0', '0', '0', '0', '0', '1535', '0', '0', '0', 'Heroic Tamed Hyena', NULL, NULL, '0', '60', '60', '0', '38', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.8', '1200', '2000', '1.0', '1.0', '1', '0', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '0', '0', '100005', '12902', '0', '0', '0', '', '0', '1.0', '0.8', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100730 WHERE (`entry` = 4534);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4534);
-- Heroic Ward Guardian
DELETE FROM `creature_template` WHERE entry = 9100731;
INSERT INTO `creature_template` VALUES (9100731, '0', '0', '0', '0', '0', '6104', '0', '0', '0', 'Heroic Ward Guardian', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4427', '4427', '0', '0', '0', '164', '220', '', '1', '1.0', '3.0', '3.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100731 WHERE (`entry` = 4427);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4427);
-- Heroic Wind Howler
DELETE FROM `creature_template` WHERE entry = 9100732;
INSERT INTO `creature_template` VALUES (9100732, '0', '0', '0', '0', '0', '5494', '0', '0', '0', 'Heroic Wind Howler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '3', '1.75', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.8', '1.0', '0.95', '1.0', '0', 
'0', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100732 WHERE (`entry` = 4526);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4526);
-- Heroic Willix the Importer
DELETE FROM `creature_template` WHERE entry = 9100733;
INSERT INTO `creature_template` VALUES (9100733, '0', '0', '0', '0', '0', '7155', '0', '0', '0', 'Heroic Willix the Importer', NULL, NULL, '0', '60', '60', '0', '69', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100733 WHERE (`entry` = 4508);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4508);
-- Heroic Heralath Fallowbrook
DELETE FROM `creature_template` WHERE entry = 9100734;
INSERT INTO `creature_template` VALUES (9100734, '0', '0', '0', '0', '0', '2596', '0', '0', '0', 'Heroic Heralath Fallowbrook', NULL, NULL, '0', '60', '60', '0', '80', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '4608', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.02', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100734 WHERE (`entry` = 4510);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4510);
-- Heroic Agathelos the Raging
DELETE FROM `creature_template` WHERE entry = 9100735;
INSERT INTO `creature_template` VALUES (9100735, '0', '0', '0', '0', '0', '2450', '0', '0', '0', 'Heroic Agathelos the Raging', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100700', '0', '4422', '0', '0', '0', '0', '', '1', '1.0', '4.43', '1.0', 
'0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100735 WHERE (`entry` = 4422);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4422);
-- Heroic Aggem Thorncurse
DELETE FROM `creature_template` WHERE entry = 9100736;
INSERT INTO `creature_template` VALUES (9100736, '0', '0', '0', '0', '0', '6097', '0', '0', '0', 'Heroic Aggem Thorncurse', 'Death\'s Head Prophet', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '4424', '0', '0', '0', '116', '356', '', '1', '1.0', '4.31', '3.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100736 WHERE (`entry` = 4424);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4424);
-- Heroic Blind Hunter
DELETE FROM `creature_template` WHERE entry = 9100737;
INSERT INTO `creature_template` VALUES (9100737, '0', '0', '0', '0', '0', '4735', '0', '0', '0', 'Heroic Blind Hunter', NULL, NULL, '0', '63', '63', '0', '16', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.92', '2000', '1521', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '9100700', '0', '4425', '5794', '0', '0', '0', '', '1', '1.0', '4.4', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100737 WHERE (`entry` = 4425);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4425);
-- Heroic Charlga Razorflank
DELETE FROM `creature_template` WHERE entry = 9100738;
INSERT INTO `creature_template` VALUES (9100738, '0', '0', '0', '0', '0', '4642', '0', '0', '0', 'Heroic Charlga Razorflank', 'The Crone', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '4421', '0', '0', '0', '328', '602', '', '1', '1.0', '4.25', '3.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100738 WHERE (`entry` = 4421);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4421);
-- Heroic Death Speaker Jargba
DELETE FROM `creature_template` WHERE entry = 9100739;
INSERT INTO `creature_template` VALUES (9100739, '0', '0', '0', '0', '0', '4644', '0', '0', '0', 'Heroic Death Speaker Jargba', 'Death\'s Head Captain', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '4428', '0', '0', '0', '226', '301', '', '1', '1.0', '4.1', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100739 WHERE (`entry` = 4428);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4428);
-- Heroic Earthcaller Halmgar
DELETE FROM `creature_template` WHERE entry = 9100740;
INSERT INTO `creature_template` VALUES (9100740, '0', '0', '0', '0', '0', '6102', '0', '0', '0', 'Heroic Earthcaller Halmgar', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.04', '2000', '1475', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '0', '0', '0', '0', '70', '349', '', '1', '1.0', '3.94', '1.0', '1.0', '1.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100740 WHERE (`entry` = 4842);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4842);
-- Heroic Overlord Ramtusk
DELETE FROM `creature_template` WHERE entry = 9100741;
INSERT INTO `creature_template` VALUES (9100741, '0', '0', '0', '0', '0', '4652', '0', '0', '0', 'Heroic Overlord Ramtusk', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '4420', '0', '0', '0', '156', '483', '', '1', '1.0', '3.97', '1.0', '0.85', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100741 WHERE (`entry` = 4420);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 4420);
-- Heroic Roogug
DELETE FROM `creature_template` WHERE entry = 9100742;
INSERT INTO `creature_template` VALUES (9100742, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Heroic Roogug', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100700', '0', '0', '0', '0', '128', '191', '', '1', '1.0', '3.95', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100742 WHERE (`entry` = 6168);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 6168);