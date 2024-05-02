-- Heroic Agamar
DELETE FROM `creature_template` WHERE entry = 9100700;
INSERT INTO `creature_template` VALUES (9100700, '0', '0', '0', '0', '0', '4713', '0', '0', '0', 'Heroic Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4511', '0', '100007', '9089', '0', '0', '0', '', '1', '1.0', '3.01', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100700 WHERE (`entry` = 4511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4511) AND (`map` = 47);
-- Heroic Blood of Agamaggan
DELETE FROM `creature_template` WHERE entry = 9100701;
INSERT INTO `creature_template` VALUES (9100701, '0', '0', '0', '0', '0', '4754', '0', '0', '0', 'Heroic Blood of Agamaggan', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '4541', '4541', '0', '0', '0', '0', '0', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100701 WHERE (`entry` = 4541);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4541) AND (`map` = 47);
-- Heroic Boar Spirit
DELETE FROM `creature_template` WHERE entry = 9100702;
INSERT INTO `creature_template` VALUES (9100702, '0', '0', '0', '0', '0', '4716', '0', '0', '0', 'Heroic Boar Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.03', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100702 WHERE (`entry` = 6021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6021) AND (`map` = 47);
-- Heroic Deaths Head Acolyte
DELETE FROM `creature_template` WHERE entry = 9100703;
INSERT INTO `creature_template` VALUES (9100703, '0', '0', '0', '0', '0', '6093', '0', '0', '0', 'Heroic Deaths Head Acolyte', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4515', '4515', '0', '0', '0', '0', '0', '', '1', '1.0', '3.15', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100703 WHERE (`entry` = 4515);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4515) AND (`map` = 47);
-- Heroic Deaths Head Adept
DELETE FROM `creature_template` WHERE entry = 9100704;
INSERT INTO `creature_template` VALUES (9100704, '0', '0', '0', '0', '0', '6098', '0', '0', '0', 'Heroic Deaths Head Adept', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4516', '4516', '0', '0', '0', '0', '0', '', '1', '1.0', '3.39', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100704 WHERE (`entry` = 4516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4516) AND (`map` = 47);
-- Heroic Deaths Head Priest
DELETE FROM `creature_template` WHERE entry = 9100705;
INSERT INTO `creature_template` VALUES (9100705, '0', '0', '0', '0', '0', '6096', '0', '0', '0', 'Heroic Deaths Head Priest', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4517', '4517', '0', '0', '0', '0', '0', '', '0', '1.0', '2.86', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100705 WHERE (`entry` = 4517);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4517) AND (`map` = 47);
-- Heroic Deaths Head Sage
DELETE FROM `creature_template` WHERE entry = 9100706;
INSERT INTO `creature_template` VALUES (9100706, '0', '0', '0', '0', '0', '6099', '0', '0', '0', 'Heroic Deaths Head Sage', NULL, NULL, '0', '60', '60', '0', '154', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4518', '4518', '0', '0', '0', '0', '0', '', '0', '1.0', '3.31', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100706 WHERE (`entry` = 4518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4518) AND (`map` = 47);
-- Heroic Deaths Head Seer
DELETE FROM `creature_template` WHERE entry = 9100707;
INSERT INTO `creature_template` VALUES (9100707, '0', '0', '0', '0', '0', '6100', '0', '0', '0', 'Heroic Deaths Head Seer', NULL, NULL, '0', '60', '60', '0', '154', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4519', '4519', '0', '0', '0', '0', '0', '', '1', '1.0', '3.03', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100707 WHERE (`entry` = 4519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4519) AND (`map` = 47);
-- Heroic Greater Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100708;
INSERT INTO `creature_template` VALUES (9100708, '0', '0', '0', '0', '0', '1954', '0', '0', '0', 'Heroic Greater Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4539', '0', '4539', '8300', '0', '0', '0', '', '0', '1.0', '3.15', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100708 WHERE (`entry` = 4539);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4539) AND (`map` = 47);
-- Heroic Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100709;
INSERT INTO `creature_template` VALUES (9100709, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Heroic Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4538', '0', 
'100012', '5790', '0', '0', '0', '', '1', '1.0', '3.02', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100709 WHERE (`entry` = 4538);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4538) AND (`map` = 47);
-- Heroic Quilguard Champion
DELETE FROM `creature_template` WHERE entry = 9100710;
INSERT INTO `creature_template` VALUES (9100710, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Heroic Quilguard Champion', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4623', '4623', '0', '0', '0', '0', '0', '', '0', '1.0', '3.28', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100710 WHERE (`entry` = 4623);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4623) AND (`map` = 47);
-- Heroic Raging Agamar
DELETE FROM `creature_template` WHERE entry = 9100711;
INSERT INTO `creature_template` VALUES (9100711, '0', '0', '0', '0', '0', '2453', '0', '0', '0', 'Heroic Raging Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4514', '0', '100007', '9090', '0', '0', '0', '', '0', '1.0', '3.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100711 WHERE (`entry` = 4514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4514) AND (`map` = 47);
-- Heroic Razorfen Beast Trainer
DELETE FROM `creature_template` WHERE entry = 9100712;
INSERT INTO `creature_template` VALUES (9100712, '0', '0', '0', '0', '0', '4453', '0', '0', '0', 'Heroic Razorfen Beast Trainer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4531', '4531', '0', '0', '0', '0', '0', '', '0', '1.0', '2.82', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100712 WHERE (`entry` = 4531);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4531) AND (`map` = 47);
-- Heroic Razorfen Beastmaster
DELETE FROM `creature_template` WHERE entry = 9100713;
INSERT INTO `creature_template` VALUES (9100713, '0', '0', '0', '0', '0', '6105', '0', '0', '0', 'Heroic Razorfen Beastmaster', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4532', '4532', '0', '0', '0', '0', '0', '', '1', '1.0', '3.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100713 WHERE (`entry` = 4532);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4532) AND (`map` = 47);
-- Heroic Razorfen Defender
DELETE FROM `creature_template` WHERE entry = 9100714;
INSERT INTO `creature_template` VALUES (9100714, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Heroic Razorfen Defender', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4442', '4442', '0', '0', '0', '0', '0', '', '0', '1.0', '3.07', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100714 WHERE (`entry` = 4442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4442) AND (`map` = 47);
-- Heroic Razorfen Dustweaver
DELETE FROM `creature_template` WHERE entry = 9100715;
INSERT INTO `creature_template` VALUES (9100715, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Heroic Razorfen Dustweaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4522', '4522', '0', '0', '0', '0', '0', '', '0', '1.0', '2.83', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100715 WHERE (`entry` = 4522);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4522) AND (`map` = 47);
-- Heroic Razorfen Earthbreaker
DELETE FROM `creature_template` WHERE entry = 9100716;
INSERT INTO `creature_template` VALUES (9100716, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Heroic Razorfen Earthbreaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4525', '4525', '0', '0', '0', '0', '0', '', '0', '1.0', '2.95', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100716 WHERE (`entry` = 4525);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4525) AND (`map` = 47);
-- Heroic Razorfen Geomancer
DELETE FROM `creature_template` WHERE entry = 9100717;
INSERT INTO `creature_template` VALUES (9100717, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Heroic Razorfen Geomancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4520', '4520', '0', '0', '0', '0', '0', '', '0', '1.0', '3.16', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100717 WHERE (`entry` = 4520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4520) AND (`map` = 47);
-- Heroic Razorfen Groundshaker
DELETE FROM `creature_template` WHERE entry = 9100718;
INSERT INTO `creature_template` VALUES (9100718, '0', '0', '0', '0', '0', '6111', '0', '0', '0', 'Heroic Razorfen Groundshaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4523', '4523', '0', '0', '0', '0', '0', '', '0', '1.0', '3.13', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100718 WHERE (`entry` = 4523);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4523) AND (`map` = 47);
-- Heroic Razorfen Handler
DELETE FROM `creature_template` WHERE entry = 9100719;
INSERT INTO `creature_template` VALUES (9100719, '0', '0', '0', '0', '0', '1963', '0', '0', '0', 'Heroic Razorfen Handler', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4530', '4530', '0', '0', '0', '0', '0', '', '0', '1.0', '3.06', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100719 WHERE (`entry` = 4530);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4530) AND (`map` = 47);
-- Heroic Razorfen Quilguard
DELETE FROM `creature_template` WHERE entry = 9100720;
INSERT INTO `creature_template` VALUES (9100720, '0', '0', '0', '0', '0', '6108', '0', '0', '0', 'Heroic Razorfen Quilguard', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4436', '4436', '0', '0', '0', '0', '0', '', '0', '1.0', '3.21', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100720 WHERE (`entry` = 4436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4436) AND (`map` = 47);
-- Heroic Razorfen Spearhide
DELETE FROM `creature_template` WHERE entry = 9100721;
INSERT INTO `creature_template` VALUES (9100721, '0', '0', '0', '0', '0', '6078', '0', '0', '0', 'Heroic Razorfen Spearhide', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4438', '4438', '0', '0', '0', '0', '0', '', '0', '1.0', '3.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100721 WHERE (`entry` = 4438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4438) AND (`map` = 47);
-- Heroic Razorfen Stalker
DELETE FROM `creature_template` WHERE entry = 9100722;
INSERT INTO `creature_template` VALUES (9100722, '0', '0', '0', '0', '0', '6106', '0', '0', '0', 'Heroic Razorfen Stalker', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '6035', '6035', '0', '0', '0', '0', '0', '', '0', '1.0', '3.02', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100722 WHERE (`entry` = 6035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6035) AND (`map` = 47);
-- Heroic Razorfen Totemic
DELETE FROM `creature_template` WHERE entry = 9100723;
INSERT INTO `creature_template` VALUES (9100723, '0', '0', '0', '0', '0', '6112', '0', '0', '0', 'Heroic Razorfen Totemic', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4440', '4440', '0', '0', '0', '0', '0', '', '0', '1.0', '2.95', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100723 WHERE (`entry` = 4440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4440) AND (`map` = 47);
-- Heroic Razorfen Warden
DELETE FROM `creature_template` WHERE entry = 9100724;
INSERT INTO `creature_template` VALUES (9100724, '0', '0', '0', '0', '0', '4758', '0', '0', '0', 'Heroic Razorfen Warden', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4437', '4437', '0', '0', '0', '0', '0', '', '0', '1.0', '2.84', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100724 WHERE (`entry` = 4437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4437) AND (`map` = 47);
-- Heroic Razorfen Warrior
DELETE FROM `creature_template` WHERE entry = 9100725;
INSERT INTO `creature_template` VALUES (9100725, '0', '0', '0', '0', '0', '6109', '0', '0', '0', 'Heroic Razorfen Warrior', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4435', '4435', '0', '0', '0', '0', '0', '', '0', '1.0', '3.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100725 WHERE (`entry` = 4435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4435) AND (`map` = 47);
-- Heroic Rotting Agamar
DELETE FROM `creature_template` WHERE entry = 9100726;
INSERT INTO `creature_template` VALUES (9100726, '0', '0', '0', '0', '0', '4714', '0', '0', '0', 'Heroic Rotting Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4512', '0', '4512', '9091', '0', '0', '0', '', '0', '1.0', '3.27', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100726 WHERE (`entry` = 4512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4512) AND (`map` = 47);
-- Heroic Stone Rumbler
DELETE FROM `creature_template` WHERE entry = 9100727;
INSERT INTO `creature_template` VALUES (9100727, '0', '0', '0', '0', '0', '9589', '0', '0', '0', 'Heroic Stone Rumbler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '0', 
'0', '100022', '0', '0', '0', '0', '', '0', '1.0', '3.18', '1.0', '2.0', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100727 WHERE (`entry` = 4528);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4528) AND (`map` = 47);
-- Heroic Tamed Battleboar
DELETE FROM `creature_template` WHERE entry = 9100728;
INSERT INTO `creature_template` VALUES (9100728, '0', '0', '0', '0', '0', '704', '0', '0', '0', 'Heroic Tamed Battleboar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '0', '0', '0', '13334', '0', '0', '0', '', '0', '1.0', '3.01', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100728 WHERE (`entry` = 4535);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4535) AND (`map` = 47);
-- Heroic Tamed Hyena
DELETE FROM `creature_template` WHERE entry = 9100729;
INSERT INTO `creature_template` VALUES (9100729, '0', '0', '0', '0', '0', '1535', '0', '0', '0', 'Heroic Tamed Hyena', NULL, NULL, '0', '60', '60', '0', '38', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '1200', '2000', '1.0', '1.0', '1', '0', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '0', '0', '100005', '12902', '0', '0', '0', '', '0', '1.0', '2.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100729 WHERE (`entry` = 4534);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4534) AND (`map` = 47);
-- Heroic Ward Guardian
DELETE FROM `creature_template` WHERE entry = 9100730;
INSERT INTO `creature_template` VALUES (9100730, '0', '0', '0', '0', '0', '6104', '0', '0', '0', 'Heroic Ward Guardian', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4427', '4427', '0', '0', '0', '0', '0', '', '1', '1.0', '3.3', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100730 WHERE (`entry` = 4427);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4427) AND (`map` = 47);
-- Heroic Wind Howler
DELETE FROM `creature_template` WHERE entry = 9100731;
INSERT INTO `creature_template` VALUES (9100731, '0', '0', '0', '0', '0', '5494', '0', '0', '0', 'Heroic Wind Howler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.05', '1.0', '0.95', '1.0', '0', '0', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100731 WHERE (`entry` = 4526);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4526) AND (`map` = 47);
-- Heroic Willix the Importer
DELETE FROM `creature_template` WHERE entry = 9100732;
INSERT INTO `creature_template` VALUES (9100732, '0', '0', '0', '0', '0', '7155', '0', '0', '0', 'Heroic Willix the Importer', NULL, NULL, '0', '60', '60', '0', '69', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.91', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100732 WHERE (`entry` = 4508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4508) AND (`map` = 47);
-- Heroic Agathelos the Raging
DELETE FROM `creature_template` WHERE entry = 9100733;
INSERT INTO `creature_template` VALUES (9100733, '0', '0', '0', '0', '0', '2450', '0', '0', '0', 'Heroic Agathelos the Raging', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '4422', '0', '0', '0', '0', '', '1', '1.0', '6.46', '1.0', '1.0', '2.0', '0', '0', '1', '608910931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100733 WHERE (`entry` = 4422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4422) AND (`map` = 47);
-- Heroic Aggem Thorncurse
DELETE FROM `creature_template` WHERE entry = 9100734;
INSERT INTO `creature_template` VALUES (9100734, '0', '0', '0', '0', '0', '6097', '0', '0', '0', 'Heroic Aggem Thorncurse', 'Death''s Head Prophet', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4424', '0', '0', '0', '0', '0', '', '1', '1.0', '6.13', '3.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100734 WHERE (`entry` = 4424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4424) AND (`map` = 47);
-- Heroic Charlga Razorflank
DELETE FROM `creature_template` WHERE entry = 9100735;
INSERT INTO `creature_template` VALUES (9100735, '0', '0', '0', '0', '0', '4642', '0', '0', '0', 'Heroic Charlga Razorflank', 'The Crone', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4421', '0', '0', '0', '0', '0', '', '1', '1.0', '5.93', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100735 WHERE (`entry` = 4421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4421) AND (`map` = 47);
-- Heroic Death Speaker Jargba
DELETE FROM `creature_template` WHERE entry = 9100736;
INSERT INTO `creature_template` VALUES (9100736, '0', '0', '0', '0', '0', '4644', '0', '0', '0', 'Heroic Death Speaker Jargba', 'Death''s Head Captain', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4428', '0', '0', '0', '0', '0', '', '1', '1.0', '6.09', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100736 WHERE (`entry` = 4428);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4428) AND (`map` = 47);
-- Heroic Overlord Ramtusk
DELETE FROM `creature_template` WHERE entry = 9100737;
INSERT INTO `creature_template` VALUES (9100737, '0', '0', '0', '0', '0', '4652', '0', '0', '0', 'Heroic Overlord Ramtusk', NULL, NULL, '0', '63', '63', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '4420', '0', '0', '0', '0', '0', '', '1', '1.0', '6.27', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100737 WHERE (`entry` = 4420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4420) AND (`map` = 47);
-- Heroic Roogug
DELETE FROM `creature_template` WHERE entry = 9100738;
INSERT INTO `creature_template` VALUES (9100738, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Heroic Roogug', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '5.87', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100738 WHERE (`entry` = 6168);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6168) AND (`map` = 47);
-- Heroic Blind Hunter
DELETE FROM `creature_template` WHERE entry = 9100739;
INSERT INTO `creature_template` VALUES (9100739, '0', '0', '0', '0', '0', '4735', '0', '0', '0', 'Heroic Blind Hunter', NULL, NULL, '0', '60', '60', '0', '16', '2', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.04', '2000', '1521', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4425', '0', '4425', '5794', '0', '0', '0', '', '1', '1.0', '5.29', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100739 WHERE (`entry` = 4425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4425) AND (`map` = 47);
-- Heroic Earthcaller Halmgar
DELETE FROM `creature_template` WHERE entry = 9100740;
INSERT INTO `creature_template` VALUES (9100740, '0', '0', '0', '0', '0', '6102', '0', '0', '0', 'Heroic Earthcaller Halmgar', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.09', '2000', '1475', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4842', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.04', '1.0', '1.0', '1.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100740 WHERE (`entry` = 4842);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4842) AND (`map` = 47);
-- Heroic Deaths Head Ward Keeper
DELETE FROM `creature_template` WHERE entry = 9100741;
INSERT INTO `creature_template` VALUES (9100741, '0', '0', '0', '0', '0', '6101', '0', '0', '0', 'Heroic Deaths Head Ward Keeper', NULL, NULL, '0', '60', '60', '0', 
'153', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', 
'0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100741 WHERE (`entry` = 4625);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4625) AND (`map` = 47);
-- Heroic Heralath Fallowbrook
DELETE FROM `creature_template` WHERE entry = 9100742;
INSERT INTO `creature_template` VALUES (9100742, '0', '0', '0', '0', '0', '2596', '0', '0', '0', 'Heroic Heralath Fallowbrook', NULL, NULL, '0', '60', '60', '0', '80', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.98', '2000', '2000', '1.0', '1.0', '1', '4608', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.04', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100742 WHERE (`entry` = 4510);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4510) AND (`map` = 47);
-- Mythic Agamar
DELETE FROM `creature_template` WHERE entry = 9100743;
INSERT INTO `creature_template` VALUES (9100743, '0', '0', '0', '0', '0', '4713', '0', '0', '0', 'Mythic Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4511', '0', '100007', '9089', '0', '0', '0', '', '1', '1.0', '3.88', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100743 WHERE (`entry` = 4511);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4511) AND (`map` = 47);
-- Mythic Blood of Agamaggan
DELETE FROM `creature_template` WHERE entry = 9100744;
INSERT INTO `creature_template` VALUES (9100744, '0', '0', '0', '0', '0', '4754', '0', '0', '0', 'Mythic Blood of Agamaggan', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '4541', '4541', '0', '0', '0', '0', '0', '', '1', '1.0', '3.9', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100744 WHERE (`entry` = 4541);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4541) AND (`map` = 47);
-- Mythic Boar Spirit
DELETE FROM `creature_template` WHERE entry = 9100745;
INSERT INTO `creature_template` VALUES (9100745, '0', '0', '0', '0', '0', '4716', '0', '0', '0', 'Mythic Boar Spirit', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '8413718', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100745 WHERE (`entry` = 6021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6021) AND (`map` = 47);
-- Mythic Deaths Head Acolyte
DELETE FROM `creature_template` WHERE entry = 9100746;
INSERT INTO `creature_template` VALUES (9100746, '0', '0', '0', '0', '0', '6093', '0', '0', '0', 'Mythic Deaths Head Acolyte', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4515', '4515', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100746 WHERE (`entry` = 4515);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4515) AND (`map` = 47);
-- Mythic Deaths Head Adept
DELETE FROM `creature_template` WHERE entry = 9100747;
INSERT INTO `creature_template` VALUES (9100747, '0', '0', '0', '0', '0', '6098', '0', '0', '0', 'Mythic Deaths Head Adept', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4516', '4516', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100747 WHERE (`entry` = 4516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4516) AND (`map` = 47);
-- Mythic Deaths Head Priest
DELETE FROM `creature_template` WHERE entry = 9100748;
INSERT INTO `creature_template` VALUES (9100748, '0', '0', '0', '0', '0', '6096', '0', '0', '0', 'Mythic Deaths Head Priest', NULL, NULL, '0', '60', '60', '0', '154', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4517', '4517', '0', '0', '0', '0', '0', '', '0', '1.0', '4.44', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100748 WHERE (`entry` = 4517);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4517) AND (`map` = 47);
-- Mythic Deaths Head Sage
DELETE FROM `creature_template` WHERE entry = 9100749;
INSERT INTO `creature_template` VALUES (9100749, '0', '0', '0', '0', '0', '6099', '0', '0', '0', 'Mythic Deaths Head Sage', NULL, NULL, '0', '60', '60', '0', '154', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4518', '4518', '0', '0', '0', '0', '0', '', '0', '1.0', '4.11', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100749 WHERE (`entry` = 4518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4518) AND (`map` = 47);
-- Mythic Deaths Head Seer
DELETE FROM `creature_template` WHERE entry = 9100750;
INSERT INTO `creature_template` VALUES (9100750, '0', '0', '0', '0', '0', '6100', '0', '0', '0', 'Mythic Deaths Head Seer', NULL, NULL, '0', '60', '60', '0', '154', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4519', '4519', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100750 WHERE (`entry` = 4519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4519) AND (`map` = 47);
-- Mythic Greater Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100751;
INSERT INTO `creature_template` VALUES (9100751, '0', '0', '0', '0', '0', '1954', '0', '0', '0', 'Mythic Greater Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4539', '0', '4539', '8300', '0', '0', '0', '', '0', '1.0', '4.39', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100751 WHERE (`entry` = 4539);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4539) AND (`map` = 47);
-- Mythic Kraul Bat
DELETE FROM `creature_template` WHERE entry = 9100752;
INSERT INTO `creature_template` VALUES (9100752, '0', '0', '0', '0', '0', '1955', '0', '0', '0', 'Mythic Kraul Bat', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4538', '0', 
'100012', '5790', '0', '0', '0', '', '1', '1.0', '3.95', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100752 WHERE (`entry` = 4538);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4538) AND (`map` = 47);
-- Mythic Quilguard Champion
DELETE FROM `creature_template` WHERE entry = 9100753;
INSERT INTO `creature_template` VALUES (9100753, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Mythic Quilguard Champion', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4623', '4623', '0', '0', '0', '0', '0', '', '0', '1.0', '4.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100753 WHERE (`entry` = 4623);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4623) AND (`map` = 47);
-- Mythic Raging Agamar
DELETE FROM `creature_template` WHERE entry = 9100754;
INSERT INTO `creature_template` VALUES (9100754, '0', '0', '0', '0', '0', '2453', '0', '0', '0', 'Mythic Raging Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4514', '0', '100007', '9090', '0', '0', '0', '', '0', '1.0', '4.48', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100754 WHERE (`entry` = 4514);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4514) AND (`map` = 47);
-- Mythic Razorfen Beast Trainer
DELETE FROM `creature_template` WHERE entry = 9100755;
INSERT INTO `creature_template` VALUES (9100755, '0', '0', '0', '0', '0', '4453', '0', '0', '0', 'Mythic Razorfen Beast Trainer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', 
'4531', '4531', '0', '0', '0', '0', '0', '', '0', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100755 WHERE (`entry` = 4531);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4531) AND (`map` = 47);
-- Mythic Razorfen Beastmaster
DELETE FROM `creature_template` WHERE entry = 9100756;
INSERT INTO `creature_template` VALUES (9100756, '0', '0', '0', '0', '0', '6105', '0', '0', '0', 'Mythic Razorfen Beastmaster', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4532', '4532', '0', '0', '0', '0', '0', '', '1', '1.0', '3.85', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100756 WHERE (`entry` = 4532);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4532) AND (`map` = 47);
-- Mythic Razorfen Defender
DELETE FROM `creature_template` WHERE entry = 9100757;
INSERT INTO `creature_template` VALUES (9100757, '0', '0', '0', '0', '0', '6103', '0', '0', '0', 'Mythic Razorfen Defender', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4442', '4442', '0', '0', '0', '0', '0', '', '0', '1.0', '4.06', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100757 WHERE (`entry` = 4442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4442) AND (`map` = 47);
-- Mythic Razorfen Dustweaver
DELETE FROM `creature_template` WHERE entry = 9100758;
INSERT INTO `creature_template` VALUES (9100758, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Mythic Razorfen Dustweaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4522', '4522', '0', '0', '0', '0', '0', '', '0', '1.0', '4.04', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100758 WHERE (`entry` = 4522);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4522) AND (`map` = 47);
-- Mythic Razorfen Earthbreaker
DELETE FROM `creature_template` WHERE entry = 9100759;
INSERT INTO `creature_template` VALUES (9100759, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Mythic Razorfen Earthbreaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4525', '4525', '0', '0', '0', '0', '0', '', '0', '1.0', '4.22', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100759 WHERE (`entry` = 4525);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4525) AND (`map` = 47);
-- Mythic Razorfen Geomancer
DELETE FROM `creature_template` WHERE entry = 9100760;
INSERT INTO `creature_template` VALUES (9100760, '0', '0', '0', '0', '0', '4647', '0', '0', '0', 'Mythic Razorfen Geomancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4520', '4520', '0', '0', '0', '0', '0', '', '0', '1.0', '3.86', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100760 WHERE (`entry` = 4520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4520) AND (`map` = 47);
-- Mythic Razorfen Groundshaker
DELETE FROM `creature_template` WHERE entry = 9100761;
INSERT INTO `creature_template` VALUES (9100761, '0', '0', '0', '0', '0', '6111', '0', '0', '0', 'Mythic Razorfen Groundshaker', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4523', '4523', '0', '0', '0', '0', '0', '', '0', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100761 WHERE (`entry` = 4523);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4523) AND (`map` = 47);
-- Mythic Razorfen Handler
DELETE FROM `creature_template` WHERE entry = 9100762;
INSERT INTO `creature_template` VALUES (9100762, '0', '0', '0', '0', '0', '1963', '0', '0', '0', 'Mythic Razorfen Handler', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4530', '4530', '0', '0', '0', '0', '0', '', '0', '1.0', '4.03', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100762 WHERE (`entry` = 4530);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4530) AND (`map` = 47);
-- Mythic Razorfen Quilguard
DELETE FROM `creature_template` WHERE entry = 9100763;
INSERT INTO `creature_template` VALUES (9100763, '0', '0', '0', '0', '0', '6108', '0', '0', '0', 'Mythic Razorfen Quilguard', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4436', '4436', '0', '0', '0', '0', '0', '', '0', '1.0', '4.08', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100763 WHERE (`entry` = 4436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4436) AND (`map` = 47);
-- Mythic Razorfen Spearhide
DELETE FROM `creature_template` WHERE entry = 9100764;
INSERT INTO `creature_template` VALUES (9100764, '0', '0', '0', '0', '0', '6078', '0', '0', '0', 'Mythic Razorfen Spearhide', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4438', '4438', '0', '0', '0', '0', '0', '', '0', '1.0', '4.22', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100764 WHERE (`entry` = 4438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4438) AND (`map` = 47);
-- Mythic Razorfen Stalker
DELETE FROM `creature_template` WHERE entry = 9100765;
INSERT INTO `creature_template` VALUES (9100765, '0', '0', '0', '0', '0', '6106', '0', '0', '0', 'Mythic Razorfen Stalker', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '6035', '6035', '0', '0', '0', '0', '0', '', '0', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100765 WHERE (`entry` = 6035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6035) AND (`map` = 47);
-- Mythic Razorfen Totemic
DELETE FROM `creature_template` WHERE entry = 9100766;
INSERT INTO `creature_template` VALUES (9100766, '0', '0', '0', '0', '0', '6112', '0', '0', '0', 'Mythic Razorfen Totemic', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4440', '4440', '0', '0', '0', '0', '0', '', '0', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100766 WHERE (`entry` = 4440);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4440) AND (`map` = 47);
-- Mythic Razorfen Warden
DELETE FROM `creature_template` WHERE entry = 9100767;
INSERT INTO `creature_template` VALUES (9100767, '0', '0', '0', '0', '0', '4758', '0', '0', '0', 'Mythic Razorfen Warden', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4437', '4437', '0', '0', '0', '0', '0', '', '0', '1.0', '4.38', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100767 WHERE (`entry` = 4437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4437) AND (`map` = 47);
-- Mythic Razorfen Warrior
DELETE FROM `creature_template` WHERE entry = 9100768;
INSERT INTO `creature_template` VALUES (9100768, '0', '0', '0', '0', '0', '6109', '0', '0', '0', 'Mythic Razorfen Warrior', NULL, NULL, '0', '60', '60', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4435', '4435', '0', '0', '0', '0', '0', '', '0', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100768 WHERE (`entry` = 4435);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4435) AND (`map` = 47);
-- Mythic Rotting Agamar
DELETE FROM `creature_template` WHERE entry = 9100769;
INSERT INTO `creature_template` VALUES (9100769, '0', '0', '0', '0', '0', '4714', '0', '0', '0', 'Mythic Rotting Agamar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '4512', '0', '4512', '9091', '0', '0', '0', '', '0', '1.0', '4.45', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100769 WHERE (`entry` = 4512);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4512) AND (`map` = 47);
-- Mythic Stone Rumbler
DELETE FROM `creature_template` WHERE entry = 9100770;
INSERT INTO `creature_template` VALUES (9100770, '0', '0', '0', '0', '0', '9589', '0', '0', '0', 'Mythic Stone Rumbler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '0', 
'0', '100022', '0', '0', '0', '0', '', '0', '1.0', '3.91', '1.0', '2.0', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100770 WHERE (`entry` = 4528);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4528) AND (`map` = 47);
-- Mythic Tamed Battleboar
DELETE FROM `creature_template` WHERE entry = 9100771;
INSERT INTO `creature_template` VALUES (9100771, '0', '0', '0', '0', '0', '704', '0', '0', '0', 'Mythic Tamed Battleboar', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '5', '0', '0', '0', '0', '1', '1', '0', '0', '0', '13334', '0', '0', '0', '', '0', '1.0', '4.12', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100771 WHERE (`entry` = 4535);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4535) AND (`map` = 47);
-- Mythic Tamed Hyena
DELETE FROM `creature_template` WHERE entry = 9100772;
INSERT INTO `creature_template` VALUES (9100772, '0', '0', '0', '0', '0', '1535', '0', '0', '0', 'Mythic Tamed Hyena', NULL, NULL, '0', '60', '60', '0', '38', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '1200', '2000', '1.0', '1.0', '1', '0', '2048', '0', '25', '0', '0', '0', '0', '1', '1', '0', '0', '100005', '12902', '0', '0', '0', '', '0', '1.0', '4.47', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100772 WHERE (`entry` = 4534);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4534) AND (`map` = 47);
-- Mythic Ward Guardian
DELETE FROM `creature_template` WHERE entry = 9100773;
INSERT INTO `creature_template` VALUES (9100773, '0', '0', '0', '0', '0', '6104', '0', '0', '0', 'Mythic Ward Guardian', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4427', '4427', '0', '0', '0', '0', '0', '', '1', '1.0', '3.98', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100773 WHERE (`entry` = 4427);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4427) AND (`map` = 47);
-- Mythic Wind Howler
DELETE FROM `creature_template` WHERE entry = 9100774;
INSERT INTO `creature_template` VALUES (9100774, '0', '0', '0', '0', '0', '5494', '0', '0', '0', 'Mythic Wind Howler', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.23', '1.0', '0.95', '1.0', '0', '0', '1', '16384', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100774 WHERE (`entry` = 4526);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4526) AND (`map` = 47);
-- Mythic Willix the Importer
DELETE FROM `creature_template` WHERE entry = 9100775;
INSERT INTO `creature_template` VALUES (9100775, '0', '0', '0', '0', '0', '7155', '0', '0', '0', 'Mythic Willix the Importer', NULL, NULL, '0', '60', '60', '0', '69', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.07', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100775 WHERE (`entry` = 4508);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4508) AND (`map` = 47);
-- Mythic Agathelos the Raging
DELETE FROM `creature_template` WHERE entry = 9100776;
INSERT INTO `creature_template` VALUES (9100776, '0', '0', '0', '0', '0', '2450', '0', '0', '0', 'Mythic Agathelos the Raging', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '4422', '0', '0', '0', '0', '', '1', '1.0', '7.87', '1.0', '1.0', '2.0', '0', '0', '1', '608910931', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100776 WHERE (`entry` = 4422);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4422) AND (`map` = 47);
-- Mythic Aggem Thorncurse
DELETE FROM `creature_template` WHERE entry = 9100777;
INSERT INTO `creature_template` VALUES (9100777, '0', '0', '0', '0', '0', '6097', '0', '0', '0', 'Mythic Aggem Thorncurse', 'Death''s Head Prophet', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.1', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4424', '0', '0', '0', '0', '0', '', '1', '1.0', '8.45', '3.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100777 WHERE (`entry` = 4424);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4424) AND (`map` = 47);
-- Mythic Charlga Razorflank
DELETE FROM `creature_template` WHERE entry = 9100778;
INSERT INTO `creature_template` VALUES (9100778, '0', '0', '0', '0', '0', '4642', '0', '0', '0', 'Mythic Charlga Razorflank', 'The Crone', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4421', '0', '0', '0', '0', '0', '', '1', '1.0', '8.22', '3.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100778 WHERE (`entry` = 4421);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4421) AND (`map` = 47);
-- Mythic Death Speaker Jargba
DELETE FROM `creature_template` WHERE entry = 9100779;
INSERT INTO `creature_template` VALUES (9100779, '0', '0', '0', '0', '0', '4644', '0', '0', '0', 'Mythic Death Speaker Jargba', 'Death''s Head Captain', NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4428', '0', '0', '0', '0', '0', '', '1', '1.0', '8.28', '2.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');        
UPDATE `creature_template` SET `difficulty_entry_2` = 9100779 WHERE (`entry` = 4428);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4428) AND (`map` = 47);
-- Mythic Overlord Ramtusk
DELETE FROM `creature_template` WHERE entry = 9100780;
INSERT INTO `creature_template` VALUES (9100780, '0', '0', '0', '0', '0', '4652', '0', '0', '0', 'Mythic Overlord Ramtusk', NULL, NULL, '0', '63', '63', '0', '152', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '4420', '0', '0', '0', '0', '0', '', '1', '1.0', '8.31', '1.0', '1.0', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100780 WHERE (`entry` = 4420);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4420) AND (`map` = 47);
-- Mythic Roogug
DELETE FROM `creature_template` WHERE entry = 9100781;
INSERT INTO `creature_template` VALUES (9100781, '0', '0', '0', '0', '0', '6110', '0', '0', '0', 'Mythic Roogug', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', 
'0', '0', '0', '0', '0', '', '1', '1.0', '8.24', '1.0', '0.95', '2.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100781 WHERE (`entry` = 6168);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 6168) AND (`map` = 47);
-- Mythic Blind Hunter
DELETE FROM `creature_template` WHERE entry = 9100782;
INSERT INTO `creature_template` VALUES (9100782, '0', '0', '0', '0', '0', '4735', '0', '0', '0', 'Mythic Blind Hunter', NULL, NULL, '0', '60', '60', '0', '16', '2', 
'1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.92', '2000', '1521', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '4425', '0', '4425', '5794', '0', '0', '0', '', '1', '1.0', '7.1', '1.0', '0.85', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100782 WHERE (`entry` = 4425);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4425) AND (`map` = 47);
-- Mythic Earthcaller Halmgar
DELETE FROM `creature_template` WHERE entry = 9100783;
INSERT INTO `creature_template` VALUES (9100783, '0', '0', '0', '0', '0', '6102', '0', '0', '0', 'Mythic Earthcaller Halmgar', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.09', '2000', '1475', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '4842', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.14', '1.0', '1.0', '1.0', '0', '0', '1', '608908883', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100783 WHERE (`entry` = 4842);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4842) AND (`map` = 47);
-- Mythic Deaths Head Ward Keeper
DELETE FROM `creature_template` WHERE entry = 9100784;
INSERT INTO `creature_template` VALUES (9100784, '0', '0', '0', '0', '0', '6101', '0', '0', '0', 'Mythic Deaths Head Ward Keeper', NULL, NULL, '0', '60', '60', '0', 
'153', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', 
'0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.19', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100784 WHERE (`entry` = 4625);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4625) AND (`map` = 47);
-- Mythic Heralath Fallowbrook
DELETE FROM `creature_template` WHERE entry = 9100785;
INSERT INTO `creature_template` VALUES (9100785, '0', '0', '0', '0', '0', '2596', '0', '0', '0', 'Mythic Heralath Fallowbrook', NULL, NULL, '0', '60', '60', '0', '80', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '4608', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.28', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100785 WHERE (`entry` = 4510);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 4510) AND (`map` = 47);