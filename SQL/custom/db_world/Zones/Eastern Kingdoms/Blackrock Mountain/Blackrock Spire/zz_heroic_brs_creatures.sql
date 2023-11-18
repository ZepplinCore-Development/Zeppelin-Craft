-- Heroic Bloodaxe Worg Pup
DELETE FROM `creature_template` WHERE entry = 9101500;
INSERT INTO `creature_template` VALUES (9101500, '0', '0', '0', '0', '0', '9563', '0', '0', '0', 'Heroic Bloodaxe Worg Pup', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '10221', '0', '10221', '13035', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101500 WHERE (`entry` = 10221);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10221);
-- Heroic Scarshield Worg
DELETE FROM `creature_template` WHERE entry = 9101501;
INSERT INTO `creature_template` VALUES (9101501, '0', '0', '0', '0', '0', '11420', '0', '0', '0', 'Heroic Scarshield Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.5', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9416', '0', '9416', '8297', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101501 WHERE (`entry` = 9416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9416);
-- Heroic Burning Felhound
DELETE FROM `creature_template` WHERE entry = 9101502;
INSERT INTO `creature_template` VALUES (9101502, '0', '0', '0', '0', '0', '1913', '0', '0', '0', 'Heroic Burning Felhound', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.4', '1400', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101502 WHERE (`entry` = 10261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10261);
-- Heroic Burning Imp
DELETE FROM `creature_template` WHERE entry = 9101503;
INSERT INTO `creature_template` VALUES (9101503, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Heroic Burning Imp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101503 WHERE (`entry` = 9708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9708);
-- Heroic Scarshield Acolyte
DELETE FROM `creature_template` WHERE entry = 9101504;
INSERT INTO `creature_template` VALUES (9101504, '0', '0', '0', '0', '0', '8898', '9596', '9853', '9854', 'Heroic Scarshield Acolyte', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9045', '9045', '0', '0', '0', '369', '2306', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101504 WHERE (`entry` = 9045);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9045);
-- Heroic Scarshield Infiltrator
DELETE FROM `creature_template` WHERE entry = 9101505;
INSERT INTO `creature_template` VALUES (9101505, '0', '0', '0', '0', '0', '9642', '0', '0', '0', 'Heroic Scarshield Infiltrator', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.15', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101505 WHERE (`entry` = 10299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10299);
-- Heroic Scarshield Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101506;
INSERT INTO `creature_template` VALUES (9101506, '0', '0', '0', '0', '0', '9629', '9630', '9857', '9858', 'Heroic Scarshield Legionnaire', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9097', '9097', '0', '0', '0', '402', '2367', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101506 WHERE (`entry` = 9097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9097);
-- Heroic Scarshield Spellbinder
DELETE FROM `creature_template` WHERE entry = 9101507;
INSERT INTO `creature_template` VALUES (9101507, '0', '0', '0', '0', '0', '9618', '9620', '9863', '9864', 'Heroic Scarshield Spellbinder', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9098', '9098', '0', '0', '0', '361', '2313', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101507 WHERE (`entry` = 9098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9098);
-- Heroic Scarshield Warlock
DELETE FROM `creature_template` WHERE entry = 9101508;
INSERT INTO `creature_template` VALUES (9101508, '0', '0', '0', '0', '0', '9609', '9610', '9865', '9866', 'Heroic Scarshield Warlock', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9257', '9257', '0', '0', '0', '369', '2228', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101508 WHERE (`entry` = 9257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9257);
-- Heroic Spirestone Enforcer
DELETE FROM `creature_template` WHERE entry = 9101509;
INSERT INTO `creature_template` VALUES (9101509, '0', '0', '0', '0', '0', '11577', '0', '0', '0', 'Heroic Spirestone Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9199', '9199', '0', '0', '0', '394', '2303', '', '1', '1.0', '5.0', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101509 WHERE (`entry` = 9199);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9199);
-- Heroic Spirestone Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101510;
INSERT INTO `creature_template` VALUES (9101510, '0', '0', '0', '0', '0', '11562', '0', '0', '0', 'Heroic Spirestone Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9201', '9201', '0', '0', '0', '518', '1687', '', '1', '1.0', '5.0', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101510 WHERE (`entry` = 9201);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9201);
-- Heroic Urok Enforcer
DELETE FROM `creature_template` WHERE entry = 9101511;
INSERT INTO `creature_template` VALUES (9101511, '0', '0', '0', '0', '0', '11584', '0', '0', '0', 'Heroic Urok Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10601', '0', '0', '0', '0', '133', '666', '', '1', '1.0', '5.0', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101511 WHERE (`entry` = 10601);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10601);
-- Heroic Urok Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101512;
INSERT INTO `creature_template` VALUES (9101512, '0', '0', '0', '0', '0', '11585', '0', '0', '0', 'Heroic Urok Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10602', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101512 WHERE (`entry` = 10602);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10602);
-- Heroic Spire Spiderling
DELETE FROM `creature_template` WHERE entry = 9101513;
INSERT INTO `creature_template` VALUES (9101513, '0', '0', '0', '0', '0', '9756', '0', '0', '0', 'Heroic Spire Spiderling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.35', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '10375', '0', '0', '10515', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101513 WHERE (`entry` = 10375);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10375);
-- Heroic Scarshield Raider
DELETE FROM `creature_template` WHERE entry = 9101514;
INSERT INTO `creature_template` VALUES (9101514, '0', '0', '0', '0', '0', '9637', '9638', '9859', '9860', 'Heroic Scarshield Raider', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.55', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9258', '9258', '0', '0', '0', '419', '2288', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101514 WHERE (`entry` = 9258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9258);
-- Heroic Smolderthorn Axe Thrower
DELETE FROM `creature_template` WHERE entry = 9101515;
INSERT INTO `creature_template` VALUES (9101515, '0', '0', '0', '0', '0', '9674', '9675', '9676', '9677', 'Heroic Smolderthorn Axe Thrower', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9267', '9267', '0', '0', '0', '379', '2466', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101515 WHERE (`entry` = 9267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9267);
-- Heroic Smolderthorn Mystic
DELETE FROM `creature_template` WHERE entry = 9101516;
INSERT INTO `creature_template` VALUES (9101516, '0', '0', '0', '0', '0', '9709', '9710', '9711', '9712', 'Heroic Smolderthorn Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9239', '9239', '0', '0', '0', '375', '2470', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101516 WHERE (`entry` = 9239);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9239);
-- Heroic Smolderthorn Shadow Priest
DELETE FROM `creature_template` WHERE entry = 9101517;
INSERT INTO `creature_template` VALUES (9101517, '0', '0', '0', '0', '0', '9728', '9729', '9730', '9731', 'Heroic Smolderthorn Shadow Priest', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9240', '9240', '0', '0', '0', '427', '2460', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101517 WHERE (`entry` = 9240);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9240);
-- Heroic Spirestone Mystic
DELETE FROM `creature_template` WHERE entry = 9101518;
INSERT INTO `creature_template` VALUES (9101518, '0', '0', '0', '0', '0', '11579', '0', '0', '0', 'Heroic Spirestone Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9198', '9198', '0', '0', '0', '558', '734', '', '0', '1.0', '5.0', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101518 WHERE (`entry` = 9198);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9198);
-- Heroic Spirestone Reaver
DELETE FROM `creature_template` WHERE entry = 9101519;
INSERT INTO `creature_template` VALUES (9101519, '0', '0', '0', '0', '0', '11581', '0', '0', '0', 'Heroic Spirestone Reaver', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9200', '9200', '0', '0', '0', '388', '2391', '', '1', '1.0', '5.0', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101519 WHERE (`entry` = 9200);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9200);
-- Heroic Bloodaxe Worg
DELETE FROM `creature_template` WHERE entry = 9101520;
INSERT INTO `creature_template` VALUES (9101520, '0', '0', '0', '0', '0', '9562', '741', '0', '0', 'Heroic Bloodaxe Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '2.05', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9696', '0', '9696', '7344', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101520 WHERE (`entry` = 9696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9696);
-- Heroic Rookery Whelp
DELETE FROM `creature_template` WHERE entry = 9101521;
INSERT INTO `creature_template` VALUES (9101521, '0', '0', '0', '0', '0', '397', '0', '0', '0', 'Heroic Rookery Whelp', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.95', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '64', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101521 WHERE (`entry` = 10161);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10161);
-- Heroic Firebrand Darkweaver
DELETE FROM `creature_template` WHERE entry = 9101522;
INSERT INTO `creature_template` VALUES (9101522, '0', '0', '0', '0', '0', '9644', '9645', '9867', '9868', 'Heroic Firebrand Darkweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9261', '9261', '0', '0', '0', '390', '2553', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101522 WHERE (`entry` = 9261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9261);
-- Heroic Firebrand Grunt
DELETE FROM `creature_template` WHERE entry = 9101523;
INSERT INTO `creature_template` VALUES (9101523, '0', '0', '0', '0', '0', '9664', '9665', '9871', '9872', 'Heroic Firebrand Grunt', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.6', '2700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9259', '9259', '0', '0', '0', '474', '2573', '', '1', 
'1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101523 WHERE (`entry` = 9259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9259);
-- Heroic Firebrand Invoker
DELETE FROM `creature_template` WHERE entry = 9101524;
INSERT INTO `creature_template` VALUES (9101524, '0', '0', '0', '0', '0', '9648', '9649', '9877', '9878', 'Heroic Firebrand Invoker', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9262', '9262', '0', '0', '0', '385', '2574', '', '1', '1.0', '3.0', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101524 WHERE (`entry` = 9262);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9262);
-- Heroic Smolderthorn Headhunter
DELETE FROM `creature_template` WHERE entry = 9101525;
INSERT INTO `creature_template` VALUES (9101525, '0', '0', '0', '0', '0', '9682', '9683', '9684', '9685', 'Heroic Smolderthorn Headhunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9241', '9241', '0', '0', '0', '458', '2378', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101525 WHERE (`entry` = 9241);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9241);
-- Heroic Smolderthorn Seer
DELETE FROM `creature_template` WHERE entry = 9101526;
INSERT INTO `creature_template` VALUES (9101526, '0', '0', '0', '0', '0', '9715', '9716', '9717', '9718', 'Heroic Smolderthorn Seer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9269', '9269', '0', '0', '0', '385', '2594', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101526 WHERE (`entry` = 9269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9269);
-- Heroic Smolderthorn Shadow Hunter
DELETE FROM `creature_template` WHERE entry = 9101527;
INSERT INTO `creature_template` VALUES (9101527, '0', '0', '0', '0', '0', '9724', '9725', '9726', '9727', 'Heroic Smolderthorn Shadow Hunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '1400', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9265', '9265', '0', '0', '0', '385', '2242', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101527 WHERE (`entry` = 9265);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9265);
-- Heroic Smolderthorn Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101528;
INSERT INTO `creature_template` VALUES (9101528, '0', '0', '0', '0', '0', '9719', '9720', '9721', '9722', 'Heroic Smolderthorn Witch Doctor', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9266', '9266', '0', '0', '0', '381', '2611', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101528 WHERE (`entry` = 9266);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9266);
-- Heroic Superior Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101529;
INSERT INTO `creature_template` VALUES (9101529, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Heroic Superior Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '11', '0', '0', '0', '0', '0', '0', '44', '220', '', '0', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101529 WHERE (`entry` = 10218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10218);
-- Heroic Awbee
DELETE FROM `creature_template` WHERE entry = 9101530;
INSERT INTO `creature_template` VALUES (9101530, '0', '0', '0', '0', '0', '6293', '0', '0', '0', 'Heroic Awbee', NULL, NULL, '3063', '60', '60', '0', '35', '3', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.3', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101530 WHERE (`entry` = 10740);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10740);
-- Heroic Chromatic Whelp
DELETE FROM `creature_template` WHERE entry = 9101531;
INSERT INTO `creature_template` VALUES (9101531, '0', '0', '0', '0', '0', '10095', '0', '0', '0', 'Heroic Chromatic Whelp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.11111', '1.14286', '1.0', '1.0', '25.0', '1.0', '0', '0', '4.3', '1500', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10442', '0', '10442', '0', '0', '159', '896', '', '1', '1.0', '1.5', '3.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101531 WHERE (`entry` = 10442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10442);
-- Heroic Bloodaxe Raider
DELETE FROM `creature_template` WHERE entry = 9101532;
INSERT INTO `creature_template` VALUES (9101532, '0', '0', '0', '0', '0', '9602', '9603', '9875', '9876', 'Heroic Bloodaxe Raider', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9692', '9692', '0', '0', '0', '464', '1732', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101532 WHERE (`entry` = 9692);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9692);
-- Heroic Bloodaxe Summoner
DELETE FROM `creature_template` WHERE entry = 9101533;
INSERT INTO `creature_template` VALUES (9101533, '0', '0', '0', '0', '0', '9613', '9614', '9879', '9880', 'Heroic Bloodaxe Summoner', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9717', '9717', '0', '0', '0', '387', '2104', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101533 WHERE (`entry` = 9717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9717);
-- Heroic Bloodaxe Warmonger
DELETE FROM `creature_template` WHERE entry = 9101534;
INSERT INTO `creature_template` VALUES (9101534, '0', '0', '0', '0', '0', '9617', '9619', '9883', '9886', 'Heroic Bloodaxe Warmonger', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9716', '9716', '0', '0', '0', '468', '2526', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101534 WHERE (`entry` = 9716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9716);
-- Heroic Firebrand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101535;
INSERT INTO `creature_template` VALUES (9101535, '0', '0', '0', '0', '0', '9652', '9653', '9869', '9870', 'Heroic Firebrand Dreadweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9263', '9263', '0', '0', '0', '400', '2694', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101535 WHERE (`entry` = 9263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9263);
-- Heroic Firebrand Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101536;
INSERT INTO `creature_template` VALUES (9101536, '0', '0', '0', '0', '0', '9660', '9661', '9884', '9885', 'Heroic Firebrand Legionnaire', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.6', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9260', '9260', '0', '0', '0', '464', '2655', '', '1', '1.0', '3.0', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101536 WHERE (`entry` = 9260);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9260);
-- Heroic Firebrand Pyromancer
DELETE FROM `creature_template` WHERE entry = 9101537;
INSERT INTO `creature_template` VALUES (9101537, '0', '0', '0', '0', '0', '9656', '9657', '9888', '9889', 'Heroic Firebrand Pyromancer', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '1300', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9264', '9264', '0', '0', '0', '396', '2532', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101537 WHERE (`entry` = 9264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9264);
-- Heroic Smolderthorn Berserker
DELETE FROM `creature_template` WHERE entry = 9101538;
INSERT INTO `creature_template` VALUES (9101538, '0', '0', '0', '0', '0', '7803', '0', '0', '0', 'Heroic Smolderthorn Berserker', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9268', '9268', '0', '0', '0', '464', '2533', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101538 WHERE (`entry` = 9268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9268);
-- Heroic Spire Spider
DELETE FROM `creature_template` WHERE entry = 9101539;
INSERT INTO `creature_template` VALUES (9101539, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Heroic Spire Spider', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10374', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101539 WHERE (`entry` = 10374);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10374);
-- Heroic Spirestone Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101540;
INSERT INTO `creature_template` VALUES (9101540, '0', '0', '0', '0', '0', '11543', '0', '0', '0', 'Heroic Spirestone Battle Mage', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9197', '9197', '0', '0', '0', '561', '2274', '', '1', '1.0', '5.0', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101540 WHERE (`entry` = 9197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9197);
-- Heroic Spirestone Warlord
DELETE FROM `creature_template` WHERE entry = 9101541;
INSERT INTO `creature_template` VALUES (9101541, '0', '0', '0', '0', '0', '11582', '0', '0', '0', 'Heroic Spirestone Warlord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9216', '9216', '0', '0', '0', '689', '2376', '', '1', '1.0', '5.0', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101541 WHERE (`entry` = 9216);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9216);
-- Heroic Spire Scarab
DELETE FROM `creature_template` WHERE entry = 9101542;
INSERT INTO `creature_template` VALUES (9101542, '0', '0', '0', '0', '0', '9469', '0', '0', '0', 'Heroic Spire Scarab', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10177', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101542 WHERE (`entry` = 10177);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10177);
-- Heroic Spire Scorpid
DELETE FROM `creature_template` WHERE entry = 9101543;
INSERT INTO `creature_template` VALUES (9101543, '0', '0', '0', '0', '0', '2864', '0', '0', '0', 'Heroic Spire Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9701', '0', '9701', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101543 WHERE (`entry` = 9701);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9701);
-- Heroic Bijou
DELETE FROM `creature_template` WHERE entry = 9101544;
INSERT INTO `creature_template` VALUES (9101544, '0', '0', '0', '0', '0', '9553', '0', '0', '0', 'Heroic Bijou', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.35', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '10257', '0', '0', '1', '817', '', '1', '1.0', '1.35', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101544 WHERE (`entry` = 10257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10257);
-- Heroic Bloodaxe Evoker
DELETE FROM `creature_template` WHERE entry = 9101545;
INSERT INTO `creature_template` VALUES (9101545, '0', '0', '0', '0', '0', '9625', '9626', '9873', '9874', 'Heroic Bloodaxe Evoker', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9693', '9693', '0', '0', '0', '414', '2640', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101545 WHERE (`entry` = 9693);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9693);
-- Heroic Bloodaxe Veteran
DELETE FROM `creature_template` WHERE entry = 9101546;
INSERT INTO `creature_template` VALUES (9101546, '0', '0', '0', '0', '0', '9633', '9634', '9881', '9882', 'Heroic Bloodaxe Veteran', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9583', '9583', '0', '0', '0', '620', '2692', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101546 WHERE (`entry` = 9583);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9583);
-- Heroic Rage Talon Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101547;
INSERT INTO `creature_template` VALUES (9101547, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Heroic Rage Talon Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.8', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9096', '0', '9096', '0', '0', '497', '2819', '', '1', '1.0', '5.0', 
'1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101547 WHERE (`entry` = 9096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9096);
-- Heroic Rage Talon Flamescale
DELETE FROM `creature_template` WHERE entry = 9101548;
INSERT INTO `creature_template` VALUES (9101548, '0', '0', '0', '0', '0', '8249', '0', '0', '0', 'Heroic Rage Talon Flamescale', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.15', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10083', '0', '10083', '0', '0', '406', '2600', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101548 WHERE (`entry` = 10083);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10083);
-- Heroic Rookery Guardian
DELETE FROM `creature_template` WHERE entry = 9101549;
INSERT INTO `creature_template` VALUES (9101549, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Heroic Rookery Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.25', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10258', '0', '10258', '0', '0', '152', '761', '', '1', '1.0', '3.5', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101549 WHERE (`entry` = 10258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10258);
-- Heroic Rookery Hatcher
DELETE FROM `creature_template` WHERE entry = 9101550;
INSERT INTO `creature_template` VALUES (9101550, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Heroic Rookery Hatcher', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.45', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10683', '0', '10683', '0', '0', '152', '903', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101550 WHERE (`entry` = 10683);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10683);
-- Heroic Blackhand Incarcerator
DELETE FROM `creature_template` WHERE entry = 9101551;
INSERT INTO `creature_template` VALUES (9101551, '0', '0', '0', '0', '0', '9690', '9692', '9892', '9893', 'Heroic Blackhand Incarcerator', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.85', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10316', '9818', '0', '0', '0', '193', '985', '', '1', '1.0', '2.5', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101551 WHERE (`entry` = 10316);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10316);
-- Heroic Blackhand Dragon Handler
DELETE FROM `creature_template` WHERE entry = 9101552;
INSERT INTO `creature_template` VALUES (9101552, '0', '0', '0', '0', '0', '10176', '10177', '10178', '10179', 'Heroic Blackhand Dragon Handler', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '5.25', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10742', '9818', '0', '0', '0', '493', '1506', '', '1', '1.0', '3.0', '1.0', '3.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101552 WHERE (`entry` = 10742);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10742);
-- Heroic Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101553;
INSERT INTO `creature_template` VALUES (9101553, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Heroic Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.25', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9817', '9817', '0', '0', '0', '416', '2911', '', '1', '1.0', '3.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101553 WHERE (`entry` = 9817);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9817);
-- Heroic Blackhand Summoner
DELETE FROM `creature_template` WHERE entry = 9101554;
INSERT INTO `creature_template` VALUES (9101554, '0', '0', '0', '0', '0', '9849', '9850', '9851', '9852', 'Heroic Blackhand Summoner', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.85', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9818', '9818', '0', '0', '0', '412', '2937', '', '1', '1.0', '3.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101554 WHERE (`entry` = 9818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9818);
-- Heroic Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101555;
INSERT INTO `creature_template` VALUES (9101555, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Heroic Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.15', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9819', '9818', '0', '0', '0', '480', '3001', '', '1', '1.0', '3.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101555 WHERE (`entry` = 9819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9819);
-- Heroic Chromatic Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101556;
INSERT INTO `creature_template` VALUES (9101556, '0', '0', '0', '0', '0', '10094', '0', '0', '0', 'Heroic Chromatic Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '5.5', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10447', '0', '10447', '0', '0', '663', '2288', '', '1', '1.0', '5.0', '1.0', '1.1', '1.0', '0', '0', '1', '1', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101556 WHERE (`entry` = 10447);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10447);
-- Heroic Chromatic Elite Guard
DELETE FROM `creature_template` WHERE entry = 9101557;
INSERT INTO `creature_template` VALUES (9101557, '0', '0', '0', '0', '0', '10116', '0', '0', '0', 'Heroic Chromatic Elite Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '9.45', '2600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10814', '0', '10814', '0', '0', '1117', '2830', '', '1', '1.0', '8.0', '1.0', '1.1', '1.0', '0', '0', '1', '537601024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101557 WHERE (`entry` = 10814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10814);
-- Heroic Summoned Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101558;
INSERT INTO `creature_template` VALUES (9101558, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Heroic Summoned Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.25', '2000', '1274', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10680', '0', '0', '0', '0', '412', '1363', '', '0', '1.0', '3.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101558 WHERE (`entry` = 10680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10680);
-- Heroic Summoned Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101559;
INSERT INTO `creature_template` VALUES (9101559, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Heroic Summoned Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.15', '2000', '1274', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10681', '0', '0', '0', '0', '488', '643', 
'', '0', '1.0', '3.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101559 WHERE (`entry` = 10681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10681);
-- Heroic Doomguard
DELETE FROM `creature_template` WHERE entry = 9101560;
INSERT INTO `creature_template` VALUES (9101560, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Heroic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '1.85', '0.77', '1.35', '1.0', 
'0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101560 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859);
-- Heroic Elder Stonefort
DELETE FROM `creature_template` WHERE entry = 9101561;
INSERT INTO `creature_template` VALUES (9101561, '0', '0', '0', '0', '0', '15641', '0', '0', '0', 'Heroic Elder Stonefort', NULL, NULL, '21061', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.3', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.2', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101561 WHERE (`entry` = 15560);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15560);
-- Heroic Spectral Assassin
DELETE FROM `creature_template` WHERE entry = 9101562;
INSERT INTO `creature_template` VALUES (9101562, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Heroic Spectral Assassin', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '0.5', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101562 WHERE (`entry` = 16066);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16066);
-- Heroic Warosh
DELETE FROM `creature_template` WHERE entry = 9101563;
INSERT INTO `creature_template` VALUES (9101563, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Heroic Warosh', 'The Cursed', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '1', '752', '', '1', '1.0', '1.35', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101563 WHERE (`entry` = 10799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10799);
-- Heroic Blackhand Thug
DELETE FROM `creature_template` WHERE entry = 9101564;
INSERT INTO `creature_template` VALUES (9101564, '0', '0', '0', '0', '0', '10172', '10173', '10174', '10175', 'Heroic Blackhand Thug', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.25', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10762', '9818', '0', '0', '0', '737', '967', '', '1', '1.0', '5.0', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101564 WHERE (`entry` = 10762);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10762);
-- Heroic Finkle Einhorn
DELETE FROM `creature_template` WHERE entry = 9101565;
INSERT INTO `creature_template` VALUES (9101565, '0', '0', '0', '0', '0', '10089', '0', '0', '0', 'Heroic Finkle Einhorn', NULL, NULL, '2951', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101565 WHERE (`entry` = 10776);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10776);
-- Heroic Blackhand Assassin
DELETE FROM `creature_template` WHERE entry = 9101566;
INSERT INTO `creature_template` VALUES (9101566, '0', '0', '0', '0', '0', '9691', '9887', '0', '0', 'Heroic Blackhand Assassin', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.55', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10318', '10318', '0', '0', '0', '766', '2658', '', '1', 
'1.0', '5.0', '1.0', '0.6', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101566 WHERE (`entry` = 10318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10318);
-- Heroic Blackhand Elite
DELETE FROM `creature_template` WHERE entry = 9101567;
INSERT INTO `creature_template` VALUES (9101567, '0', '0', '0', '0', '0', '9734', '9735', '9890', '9891', 'Heroic Blackhand Elite', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '9.3', '2300', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10317', '10317', '0', '0', '0', '528', '3166', '', '1', '1.0', '5.0', '1.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101567 WHERE (`entry` = 10317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10317);
-- Heroic Blackhand Iron Guard
DELETE FROM `creature_template` WHERE entry = 9101568;
INSERT INTO `creature_template` VALUES (9101568, '0', '0', '0', '0', '0', '9696', '9697', '9894', '9895', 'Heroic Blackhand Iron Guard', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.4', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10319', '9818', '0', '0', '0', '609', '2771', '', '1', '1.0', '4.0', '1.0', '2.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101568 WHERE (`entry` = 10319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10319);
-- Heroic Rage Talon Dragon Guard
DELETE FROM `creature_template` WHERE entry = 9101569;
INSERT INTO `creature_template` VALUES (9101569, '0', '0', '0', '0', '0', '9753', '0', '0', '0', 'Heroic Rage Talon Dragon Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.2', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10366', '0', '10366', '0', '0', '907', '2717', '', '1', '1.0', '6.0', '1.0', '1.75', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101569 WHERE (`entry` = 10366);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10366);
-- Heroic Rage Talon Fire Tongue
DELETE FROM `creature_template` WHERE entry = 9101570;
INSERT INTO `creature_template` VALUES (9101570, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Heroic Rage Talon Fire Tongue', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.4', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10372', '0', '10372', '0', '0', '619', '2979', '', '1', '1.0', '6.0', '3.0', '1.15', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101570 WHERE (`entry` = 10372);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10372);
-- Heroic Rage Talon Captain
DELETE FROM `creature_template` WHERE entry = 9101571;
INSERT INTO `creature_template` VALUES (9101571, '0', '0', '0', '0', '0', '8310', '0', '0', '0', 'Heroic Rage Talon Captain', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '6.4', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10371', '0', '10371', '0', '0', '910', '2568', '', '1', '1.0', '6.0', '1.0', '1.2', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101571 WHERE (`entry` = 10371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10371);
-- Heroic Vaelastrasz the Red
DELETE FROM `creature_template` WHERE entry = 9101572;
INSERT INTO `creature_template` VALUES (9101572, '0', '0', '0', '0', '0', '9912', '0', '0', '0', 'Heroic Vaelastrasz the Red', NULL, NULL, '0', '60', '60', '0', '250', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '164', '818', '', '0', '1.0', '30.0', '60.0', '1.2', '1.0', '0', '0', '1', '650854239', '0', '1073741824', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101572 WHERE (`entry` = 10340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10340);
-- Heroic Spirit of Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101573;
INSERT INTO `creature_template` VALUES (9101573, '0', '0', '0', '0', '0', '15987', '0', '0', '0', 'Heroic Spirit of Lord Valthalak', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '13.8', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '2.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101573 WHERE (`entry` = 16073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16073);
-- Heroic Lord Victor Nefarius
DELETE FROM `creature_template` WHERE entry = 9101574;
INSERT INTO `creature_template` VALUES (9101574, '0', '0', '0', '0', '0', '9472', '0', '0', '0', 'Heroic Lord Victor Nefarius', 'Lord of Blackrock', NULL, '21330', '60', '60', '0', '14', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '16.85', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '2', '68', '0', '0', '100001', '0', '0', '1360', '1781', '', '1', '1.0', '115.0', '100.0', '1.6', '1.0', '0', '0', '1', '1691041627', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101574 WHERE (`entry` = 10162);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10162);
-- Heroic General Drakkisath
DELETE FROM `creature_template` WHERE entry = 9101575;
INSERT INTO `creature_template` VALUES (9101575, '0', '0', '0', '0', '0', '10115', '0', '0', '0', 'Heroic General Drakkisath', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '0.992063', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10363', '0', '0', '1439', '2164', '', '1', '1.0', '5.8', '3.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101575 WHERE (`entry` = 10363);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10363);
-- Heroic Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101576;
INSERT INTO `creature_template` VALUES (9101576, '0', '0', '0', '0', '0', '14308', '0', '0', '0', 'Heroic Lord Valthalak', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '5.0', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '0', '0', '0', '1000', '3000', '', '0', '1.0', '6.4', '1.0', '1.3', '1.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101576 WHERE (`entry` = 16042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16042);
-- Heroic Pyroguard Emberseer
DELETE FROM `creature_template` WHERE entry = 9101577;
INSERT INTO `creature_template` VALUES (9101577, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Heroic Pyroguard Emberseer', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '3', '2', '4.97', '2000', '2000', '1.0', '1.0', '1', '33554752', '2048', '0', '0', '0', '0', '0', '0', '4', '8', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.18', '3.0', '1.1', '2.0', '0', '144', '1', '1686863835', '4', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101577 WHERE (`entry` = 9816);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9816);
-- Heroic The Beast
DELETE FROM `creature_template` WHERE entry = 9101578;
INSERT INTO `creature_template` VALUES (9101578, '0', '0', '0', '0', '0', '10193', '0', '0', '0', 'Heroic The Beast', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '45', '0', '0', '0', '0', '1', '65545', '9100400', '0', '10430', '0', '0', '0', '0', '', '1', '1.0', '6.06', '1.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101578 WHERE (`entry` = 10430);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10430);
-- Heroic Warchief Rend Blackhand
DELETE FROM `creature_template` WHERE entry = 9101579;
INSERT INTO `creature_template` VALUES (9101579, '0', '0', '0', '0', '0', '9778', '0', '0', '0', 'Heroic Warchief Rend Blackhand', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '3', '0', '4.9', '2400', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '8', '9100400', '0', '0', '0', '0', '6929', '34647', '', '1', '1.0', '6.19', 
'1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101579 WHERE (`entry` = 10429);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10429);
-- Heroic Gyth
DELETE FROM `creature_template` WHERE entry = 9101580;
INSERT INTO `creature_template` VALUES (9101580, '0', '0', '0', '0', '0', '9806', '0', '0', '0', 'Heroic Gyth', 'Rend Blackhands Mount', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10339', '0', '0', '1462', '1915', '', '1', '1.0', '6.49', '1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101580 WHERE (`entry` = 10339);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10339);
-- Heroic Goraluk Anvilcrack
DELETE FROM `creature_template` WHERE entry = 9101581;
INSERT INTO `creature_template` VALUES (9101581, '0', '0', '0', '0', '0', '10222', '0', '0', '0', 'Heroic Goraluk Anvilcrack', 'Blackhand Legion Armorsmith', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '981', '1286', '', '1', '1.0', '6.11', '3.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101581 WHERE (`entry` = 10899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10899);
-- Heroic Crystal Fang
DELETE FROM `creature_template` WHERE entry = 9101582;
INSERT INTO `creature_template` VALUES (9101582, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Heroic Crystal Fang', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.98', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '6.03', '1.0', '1.1', 
'1.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101582 WHERE (`entry` = 10376);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10376);
-- Heroic Urok Doomhowl
DELETE FROM `creature_template` WHERE entry = 9101583;
INSERT INTO `creature_template` VALUES (9101583, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Heroic Urok Doomhowl', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.91', '3200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '1425', '1866', '', '1', '1.0', '6.38', '1.0', '1.1', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101583 WHERE (`entry` = 10584);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10584);
-- Heroic Gizrul the Slavener
DELETE FROM `creature_template` WHERE entry = 9101584;
INSERT INTO `creature_template` VALUES (9101584, '0', '0', '0', '0', '0', '9564', '0', '0', '0', 'Heroic Gizrul the Slavener', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '10268', '0', '0', '0', '0', '', '2', '1.0', '6.21', '1.0', 
'1.1', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101584 WHERE (`entry` = 10268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10268);
-- Heroic Mor Grayhoof
DELETE FROM `creature_template` WHERE entry = 9101585;
INSERT INTO `creature_template` VALUES (9101585, '0', '0', '0', '0', '0', '15997', '0', '0', '0', 'Heroic Mor Grayhoof', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '2139', '2798', '', '1', '1.0', '6.24', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101585 WHERE (`entry` = 16080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16080);
-- Heroic Overlord Wyrmthalak
DELETE FROM `creature_template` WHERE entry = 9101586;
INSERT INTO `creature_template` VALUES (9101586, '0', '0', '0', '0', '0', '8711', '0', '0', '0', 'Heroic Overlord Wyrmthalak', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '9568', '0', '0', '1124', '1966', '', '1', '1.0', '5.97', '1.0', '1.1', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101586 WHERE (`entry` = 9568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9568);
-- Heroic Solakar Flamewreath
DELETE FROM `creature_template` WHERE entry = 9101587;
INSERT INTO `creature_template` VALUES (9101587, '0', '0', '0', '0', '0', '9581', '0', '0', '0', 'Heroic Solakar Flamewreath', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.2', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '1283', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10264', '0', '0', '1119', '1466', '', '1', '1.0', '6.38', '1.0', '1.1', '1.0', '0', '147', '1', '646655835', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101587 WHERE (`entry` = 10264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10264);
-- Heroic Bannok Grimaxe
DELETE FROM `creature_template` WHERE entry = 9101588;
INSERT INTO `creature_template` VALUES (9101588, '0', '0', '0', '0', '0', '9668', '0', '0', '0', 'Heroic Bannok Grimaxe', 'Firebrand Legion Champion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9596', '0', '0', '0', '728', '2688', '', '1', '1.0', '5.88', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101588 WHERE (`entry` = 9596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9596);
-- Heroic Ghok Bashguud
DELETE FROM `creature_template` WHERE entry = 9101589;
INSERT INTO `creature_template` VALUES (9101589, '0', '0', '0', '0', '0', '11809', '0', '0', '0', 'Heroic Ghok Bashguud', 'Bloodaxe Champion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.97', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '142', '708', '', '1', '1.0', '5.96', '1.0', '1.1', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101589 WHERE (`entry` = 9718);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9718);
-- Heroic Quartermaster Zigris
DELETE FROM `creature_template` WHERE entry = 9101590;
INSERT INTO `creature_template` VALUES (9101590, '0', '0', '0', '0', '0', '9738', '0', '0', '0', 'Heroic Quartermaster Zigris', 'Bloodaxe Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '737', '2195', '', '1', '1.0', '6.39', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101590 WHERE (`entry` = 9736);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9736);
-- Heroic Jed Runewatcher
DELETE FROM `creature_template` WHERE entry = 9101591;
INSERT INTO `creature_template` VALUES (9101591, '0', '0', '0', '0', '0', '9686', '0', '0', '0', 'Heroic Jed Runewatcher', 'Blackhand Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '310', '1552', '', '1', '1.0', '6.33', '1.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101591 WHERE (`entry` = 10509);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10509);
-- Heroic Halycon
DELETE FROM `creature_template` WHERE entry = 9101592;
INSERT INTO `creature_template` VALUES (9101592, '0', '0', '0', '0', '0', '9567', '0', '0', '0', 'Heroic Halycon', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '1100', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '10220', '0', '0', '0', '0', '', '1', '1.0', '6.19', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101592 WHERE (`entry` = 10220);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10220);
-- Heroic Highlord Omokk
DELETE FROM `creature_template` WHERE entry = 9101593;
INSERT INTO `creature_template` VALUES (9101593, '0', '0', '0', '0', '0', '11565', '0', '0', '0', 'Heroic Highlord Omokk', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9196', '0', '0', '0', '920', '2139', '', '1', '1.0', '6.16', '1.0', 
'1.0', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101593 WHERE (`entry` = 9196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9196);
-- Heroic Mother Smolderweb
DELETE FROM `creature_template` WHERE entry = 9101594;
INSERT INTO `creature_template` VALUES (9101594, '0', '0', '0', '0', '0', '9929', '0', '0', '0', 'Heroic Mother Smolderweb', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.26', '1.0', '1.0', '2.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101594 WHERE (`entry` = 10596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10596);
-- Heroic War Master Voone
DELETE FROM `creature_template` WHERE entry = 9101595;
INSERT INTO `creature_template` VALUES (9101595, '0', '0', '0', '0', '0', '9733', '0', '0', '0', 'Heroic War Master Voone', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9237', '0', '0', '0', '1330', '2212', '', '1', '1.0', '6.25', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101595 WHERE (`entry` = 9237);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9237);
-- Heroic Spirestone Battle Lord
DELETE FROM `creature_template` WHERE entry = 9101596;
INSERT INTO `creature_template` VALUES (9101596, '0', '0', '0', '0', '0', '11576', '0', '0', '0', 'Heroic Spirestone Battle Lord', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '2', '0', '4.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9218', '0', '0', '0', '1229', '1609', '', '1', '1.0', '6.05', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101596 WHERE (`entry` = 9218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9218);
-- Heroic Spirestone Lord Magus
DELETE FROM `creature_template` WHERE entry = 9101597;
INSERT INTO `creature_template` VALUES (9101597, '0', '0', '0', '0', '0', '11578', '0', '0', '0', 'Heroic Spirestone Lord Magus', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '1037', '1360', '', '0', '1.0', '5.88', '6.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101597 WHERE (`entry` = 9217);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9217);
-- Heroic Shadow Hunter Voshgajin
DELETE FROM `creature_template` WHERE entry = 9101598;
INSERT INTO `creature_template` VALUES (9101598, '0', '0', '0', '0', '0', '9732', '0', '0', '0', 'Heroic Shadow Hunter Voshgajin', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '5.02', '1300', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9236', '0', '0', '0', '988', '2172', '', '1', '1.0', '6.39', '1.0', '1.0', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101598 WHERE (`entry` = 9236);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9236);
-- Heroic Spirestone Butcher
DELETE FROM `creature_template` WHERE entry = 9101599;
INSERT INTO `creature_template` VALUES (9101599, '0', '0', '0', '0', '0', '11574', '0', '0', '0', 'Heroic Spirestone Butcher', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '1226', '2245', '', '1', '1.0', '6.39', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101599 WHERE (`entry` = 9219);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9219);
-- Heroic Burning Felguard
DELETE FROM `creature_template` WHERE entry = 9101600;
INSERT INTO `creature_template` VALUES (9101600, '0', '0', '0', '0', '0', '5047', '0', '0', '0', 'Heroic Burning Felguard', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '2', '0', '4.98', '2300', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '905', '1186', '', '1', '1.0', '6.14', '2.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101600 WHERE (`entry` = 10263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10263);
-- Mythic Bloodaxe Worg Pup
DELETE FROM `creature_template` WHERE entry = 9101601;
INSERT INTO `creature_template` VALUES (9101601, '0', '0', '0', '0', '0', '9563', '0', '0', '0', 'Mythic Bloodaxe Worg Pup', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '10221', '0', '10221', '13035', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101601 WHERE (`entry` = 10221);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10221);
-- Mythic Scarshield Worg
DELETE FROM `creature_template` WHERE entry = 9101602;
INSERT INTO `creature_template` VALUES (9101602, '0', '0', '0', '0', '0', '11420', '0', '0', '0', 'Mythic Scarshield Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9416', '0', '9416', '8297', '0', '0', '0', '', '1', '1.0', '4.09', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101602 WHERE (`entry` = 9416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9416);
-- Mythic Burning Felhound
DELETE FROM `creature_template` WHERE entry = 9101603;
INSERT INTO `creature_template` VALUES (9101603, '0', '0', '0', '0', '0', '1913', '0', '0', '0', 'Mythic Burning Felhound', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.91', '1400', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101603 WHERE (`entry` = 10261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10261);
-- Mythic Burning Imp
DELETE FROM `creature_template` WHERE entry = 9101604;
INSERT INTO `creature_template` VALUES (9101604, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Mythic Burning Imp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101604 WHERE (`entry` = 9708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9708);
-- Mythic Scarshield Acolyte
DELETE FROM `creature_template` WHERE entry = 9101605;
INSERT INTO `creature_template` VALUES (9101605, '0', '0', '0', '0', '0', '8898', '9596', '9853', '9854', 'Mythic Scarshield Acolyte', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9045', '9045', '0', '0', '0', '369', '2306', '', 
'1', '1.0', '4.38', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101605 WHERE (`entry` = 9045);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9045);
-- Mythic Scarshield Infiltrator
DELETE FROM `creature_template` WHERE entry = 9101606;
INSERT INTO `creature_template` VALUES (9101606, '0', '0', '0', '0', '0', '9642', '0', '0', '0', 'Mythic Scarshield Infiltrator', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.95', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101606 WHERE (`entry` = 10299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10299);
-- Mythic Scarshield Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101607;
INSERT INTO `creature_template` VALUES (9101607, '0', '0', '0', '0', '0', '9629', '9630', '9857', '9858', 'Mythic Scarshield Legionnaire', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9097', '9097', '0', '0', '0', '402', '2367', 
'', '1', '1.0', '3.93', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101607 WHERE (`entry` = 9097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9097);
-- Mythic Scarshield Spellbinder
DELETE FROM `creature_template` WHERE entry = 9101608;
INSERT INTO `creature_template` VALUES (9101608, '0', '0', '0', '0', '0', '9618', '9620', '9863', '9864', 'Mythic Scarshield Spellbinder', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9098', '9098', '0', '0', '0', '361', '2313', 
'', '1', '1.0', '3.91', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101608 WHERE (`entry` = 9098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9098);
-- Mythic Scarshield Warlock
DELETE FROM `creature_template` WHERE entry = 9101609;
INSERT INTO `creature_template` VALUES (9101609, '0', '0', '0', '0', '0', '9609', '9610', '9865', '9866', 'Mythic Scarshield Warlock', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9257', '9257', '0', '0', '0', '369', '2228', '', 
'1', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101609 WHERE (`entry` = 9257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9257);
-- Mythic Spirestone Enforcer
DELETE FROM `creature_template` WHERE entry = 9101610;
INSERT INTO `creature_template` VALUES (9101610, '0', '0', '0', '0', '0', '11577', '0', '0', '0', 'Mythic Spirestone Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9199', '9199', '0', '0', '0', '394', '2303', '', '1', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101610 WHERE (`entry` = 9199);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9199);
-- Mythic Spirestone Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101611;
INSERT INTO `creature_template` VALUES (9101611, '0', '0', '0', '0', '0', '11562', '0', '0', '0', 'Mythic Spirestone Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9201', '9201', '0', '0', '0', '518', '1687', '', '1', '1.0', '4.3', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101611 WHERE (`entry` = 9201);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9201);
-- Mythic Urok Enforcer
DELETE FROM `creature_template` WHERE entry = 9101612;
INSERT INTO `creature_template` VALUES (9101612, '0', '0', '0', '0', '0', '11584', '0', '0', '0', 'Mythic Urok Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10601', '0', '0', '0', '0', '133', '666', '', '1', '1.0', '3.9', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101612 WHERE (`entry` = 10601);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10601);
-- Mythic Urok Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101613;
INSERT INTO `creature_template` VALUES (9101613, '0', '0', '0', '0', '0', '11585', '0', '0', '0', 'Mythic Urok Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10602', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.86', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101613 WHERE (`entry` = 10602);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10602);
-- Mythic Spire Spiderling
DELETE FROM `creature_template` WHERE entry = 9101614;
INSERT INTO `creature_template` VALUES (9101614, '0', '0', '0', '0', '0', '9756', '0', '0', '0', 'Mythic Spire Spiderling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.96', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '10375', '0', '0', '10515', '0', '0', '0', '', '1', '1.0', '3.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101614 WHERE (`entry` = 10375);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10375);
-- Mythic Scarshield Raider
DELETE FROM `creature_template` WHERE entry = 9101615;
INSERT INTO `creature_template` VALUES (9101615, '0', '0', '0', '0', '0', '9637', '9638', '9859', '9860', 'Mythic Scarshield Raider', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9258', '9258', '0', '0', '0', '419', '2288', '', '1', '1.0', '4.19', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101615 WHERE (`entry` = 9258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9258);
-- Mythic Smolderthorn Axe Thrower
DELETE FROM `creature_template` WHERE entry = 9101616;
INSERT INTO `creature_template` VALUES (9101616, '0', '0', '0', '0', '0', '9674', '9675', '9676', '9677', 'Mythic Smolderthorn Axe Thrower', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9267', '9267', '0', '0', '0', '379', '2466', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101616 WHERE (`entry` = 9267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9267);
-- Mythic Smolderthorn Mystic
DELETE FROM `creature_template` WHERE entry = 9101617;
INSERT INTO `creature_template` VALUES (9101617, '0', '0', '0', '0', '0', '9709', '9710', '9711', '9712', 'Mythic Smolderthorn Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9239', '9239', '0', '0', '0', '375', '2470', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101617 WHERE (`entry` = 9239);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9239);
-- Mythic Smolderthorn Shadow Priest
DELETE FROM `creature_template` WHERE entry = 9101618;
INSERT INTO `creature_template` VALUES (9101618, '0', '0', '0', '0', '0', '9728', '9729', '9730', '9731', 'Mythic Smolderthorn Shadow Priest', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9240', '9240', '0', '0', '0', '427', '2460', '', '1', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101618 WHERE (`entry` = 9240);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9240);
-- Mythic Spirestone Mystic
DELETE FROM `creature_template` WHERE entry = 9101619;
INSERT INTO `creature_template` VALUES (9101619, '0', '0', '0', '0', '0', '11579', '0', '0', '0', 'Mythic Spirestone Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9198', '9198', '0', '0', '0', '558', '734', '', '0', '1.0', '4.35', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101619 WHERE (`entry` = 9198);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9198);
-- Mythic Spirestone Reaver
DELETE FROM `creature_template` WHERE entry = 9101620;
INSERT INTO `creature_template` VALUES (9101620, '0', '0', '0', '0', '0', '11581', '0', '0', '0', 'Mythic Spirestone Reaver', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9200', '9200', '0', '0', '0', '388', '2391', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101620 WHERE (`entry` = 9200);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9200);
-- Mythic Bloodaxe Worg
DELETE FROM `creature_template` WHERE entry = 9101621;
INSERT INTO `creature_template` VALUES (9101621, '0', '0', '0', '0', '0', '9562', '741', '0', '0', 'Mythic Bloodaxe Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9696', '0', '9696', '7344', '0', '0', '0', '', '1', '1.0', '4.49', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101621 WHERE (`entry` = 9696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9696);
-- Mythic Rookery Whelp
DELETE FROM `creature_template` WHERE entry = 9101622;
INSERT INTO `creature_template` VALUES (9101622, '0', '0', '0', '0', '0', '397', '0', '0', '0', 'Mythic Rookery Whelp', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '3.07', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '64', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101622 WHERE (`entry` = 10161);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10161);
-- Mythic Firebrand Darkweaver
DELETE FROM `creature_template` WHERE entry = 9101623;
INSERT INTO `creature_template` VALUES (9101623, '0', '0', '0', '0', '0', '9644', '9645', '9867', '9868', 'Mythic Firebrand Darkweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9261', '9261', '0', '0', '0', '390', '2553', '', 
'1', '1.0', '3.88', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101623 WHERE (`entry` = 9261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9261);
-- Mythic Firebrand Grunt
DELETE FROM `creature_template` WHERE entry = 9101624;
INSERT INTO `creature_template` VALUES (9101624, '0', '0', '0', '0', '0', '9664', '9665', '9871', '9872', 'Mythic Firebrand Grunt', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9259', '9259', '0', '0', '0', '474', '2573', '', '1', '1.0', '4.01', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101624 WHERE (`entry` = 9259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9259);
-- Mythic Firebrand Invoker
DELETE FROM `creature_template` WHERE entry = 9101625;
INSERT INTO `creature_template` VALUES (9101625, '0', '0', '0', '0', '0', '9648', '9649', '9877', '9878', 'Mythic Firebrand Invoker', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9262', '9262', '0', '0', '0', '385', '2574', '', '1', '1.0', '3.86', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101625 WHERE (`entry` = 9262);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9262);
-- Mythic Smolderthorn Headhunter
DELETE FROM `creature_template` WHERE entry = 9101626;
INSERT INTO `creature_template` VALUES (9101626, '0', '0', '0', '0', '0', '9682', '9683', '9684', '9685', 'Mythic Smolderthorn Headhunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9241', '9241', '0', '0', '0', '458', '2378', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101626 WHERE (`entry` = 9241);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9241);
-- Mythic Smolderthorn Seer
DELETE FROM `creature_template` WHERE entry = 9101627;
INSERT INTO `creature_template` VALUES (9101627, '0', '0', '0', '0', '0', '9715', '9716', '9717', '9718', 'Mythic Smolderthorn Seer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9269', '9269', '0', '0', '0', '385', '2594', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101627 WHERE (`entry` = 9269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9269);
-- Mythic Smolderthorn Shadow Hunter
DELETE FROM `creature_template` WHERE entry = 9101628;
INSERT INTO `creature_template` VALUES (9101628, '0', '0', '0', '0', '0', '9724', '9725', '9726', '9727', 'Mythic Smolderthorn Shadow Hunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '1400', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9265', '9265', '0', '0', '0', '385', '2242', '', '1', '1.0', '3.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101628 WHERE (`entry` = 9265);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9265);
-- Mythic Smolderthorn Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101629;
INSERT INTO `creature_template` VALUES (9101629, '0', '0', '0', '0', '0', '9719', '9720', '9721', '9722', 'Mythic Smolderthorn Witch Doctor', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9266', '9266', '0', '0', '0', '381', '2611', '', '1', '1.0', '3.84', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101629 WHERE (`entry` = 9266);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9266);
-- Mythic Superior Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101630;
INSERT INTO `creature_template` VALUES (9101630, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Mythic Superior Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '11', '0', '0', '0', '0', '0', '0', '44', '220', '', '0', '1.0', '4.06', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101630 WHERE (`entry` = 10218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10218);
-- Mythic Awbee
DELETE FROM `creature_template` WHERE entry = 9101631;
INSERT INTO `creature_template` VALUES (9101631, '0', '0', '0', '0', '0', '6293', '0', '0', '0', 'Mythic Awbee', NULL, NULL, '3063', '60', '60', '0', '35', '3', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '4.15', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101631 WHERE (`entry` = 10740);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10740);
-- Mythic Chromatic Whelp
DELETE FROM `creature_template` WHERE entry = 9101632;
INSERT INTO `creature_template` VALUES (9101632, '0', '0', '0', '0', '0', '10095', '0', '0', '0', 'Mythic Chromatic Whelp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.11111', '1.14286', '1.0', '1.0', '25.0', '1.0', '0', '0', '3.09', '1500', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10442', '0', '10442', '0', '0', '159', '896', '', '1', '1.0', '3.91', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101632 WHERE (`entry` = 10442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10442);
-- Mythic Bloodaxe Raider
DELETE FROM `creature_template` WHERE entry = 9101633;
INSERT INTO `creature_template` VALUES (9101633, '0', '0', '0', '0', '0', '9602', '9603', '9875', '9876', 'Mythic Bloodaxe Raider', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9692', '9692', '0', '0', '0', '464', '1732', '', '1', 
'1.0', '4.13', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101633 WHERE (`entry` = 9692);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9692);
-- Mythic Bloodaxe Summoner
DELETE FROM `creature_template` WHERE entry = 9101634;
INSERT INTO `creature_template` VALUES (9101634, '0', '0', '0', '0', '0', '9613', '9614', '9879', '9880', 'Mythic Bloodaxe Summoner', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9717', '9717', '0', '0', '0', '387', '2104', '', '0', '1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101634 WHERE (`entry` = 9717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9717);
-- Mythic Bloodaxe Warmonger
DELETE FROM `creature_template` WHERE entry = 9101635;
INSERT INTO `creature_template` VALUES (9101635, '0', '0', '0', '0', '0', '9617', '9619', '9883', '9886', 'Mythic Bloodaxe Warmonger', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9716', '9716', '0', '0', '0', '468', '2526', '', '1', '1.0', '4.41', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101635 WHERE (`entry` = 9716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9716);
-- Mythic Firebrand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101636;
INSERT INTO `creature_template` VALUES (9101636, '0', '0', '0', '0', '0', '9652', '9653', '9869', '9870', 'Mythic Firebrand Dreadweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9263', '9263', '0', '0', '0', '400', '2694', '', '1', '1.0', '4.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101636 WHERE (`entry` = 9263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9263);
-- Mythic Firebrand Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101637;
INSERT INTO `creature_template` VALUES (9101637, '0', '0', '0', '0', '0', '9660', '9661', '9884', '9885', 'Mythic Firebrand Legionnaire', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9260', '9260', '0', '0', '0', '464', '2655', '', '1', '1.0', '4.37', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101637 WHERE (`entry` = 9260);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9260);
-- Mythic Firebrand Pyromancer
DELETE FROM `creature_template` WHERE entry = 9101638;
INSERT INTO `creature_template` VALUES (9101638, '0', '0', '0', '0', '0', '9656', '9657', '9888', '9889', 'Mythic Firebrand Pyromancer', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '1300', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9264', '9264', '0', '0', '0', '396', '2532', '', '1', '1.0', '4.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101638 WHERE (`entry` = 9264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9264);
-- Mythic Smolderthorn Berserker
DELETE FROM `creature_template` WHERE entry = 9101639;
INSERT INTO `creature_template` VALUES (9101639, '0', '0', '0', '0', '0', '7803', '0', '0', '0', 'Mythic Smolderthorn Berserker', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9268', '9268', '0', '0', '0', '464', '2533', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101639 WHERE (`entry` = 9268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9268);
-- Mythic Spire Spider
DELETE FROM `creature_template` WHERE entry = 9101640;
INSERT INTO `creature_template` VALUES (9101640, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Mythic Spire Spider', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10374', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.89', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101640 WHERE (`entry` = 10374);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10374);
-- Mythic Spirestone Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101641;
INSERT INTO `creature_template` VALUES (9101641, '0', '0', '0', '0', '0', '11543', '0', '0', '0', 'Mythic Spirestone Battle Mage', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9197', '9197', '0', '0', '0', '561', '2274', '', '1', '1.0', '4.18', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101641 WHERE (`entry` = 9197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9197);
-- Mythic Spirestone Warlord
DELETE FROM `creature_template` WHERE entry = 9101642;
INSERT INTO `creature_template` VALUES (9101642, '0', '0', '0', '0', '0', '11582', '0', '0', '0', 'Mythic Spirestone Warlord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9216', '9216', '0', '0', '0', '689', '2376', '', '1', '1.0', '3.86', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101642 WHERE (`entry` = 9216);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9216);
-- Mythic Spire Scarab
DELETE FROM `creature_template` WHERE entry = 9101643;
INSERT INTO `creature_template` VALUES (9101643, '0', '0', '0', '0', '0', '9469', '0', '0', '0', 'Mythic Spire Scarab', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10177', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101643 WHERE (`entry` = 10177);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10177);
-- Mythic Spire Scorpid
DELETE FROM `creature_template` WHERE entry = 9101644;
INSERT INTO `creature_template` VALUES (9101644, '0', '0', '0', '0', '0', '2864', '0', '0', '0', 'Mythic Spire Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9701', '0', '9701', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101644 WHERE (`entry` = 9701);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9701);
-- Mythic Bijou
DELETE FROM `creature_template` WHERE entry = 9101645;
INSERT INTO `creature_template` VALUES (9101645, '0', '0', '0', '0', '0', '9553', '0', '0', '0', 'Mythic Bijou', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '10257', '0', '0', '1', '817', '', '1', '1.0', '4.11', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101645 WHERE (`entry` = 10257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10257);
-- Mythic Bloodaxe Evoker
DELETE FROM `creature_template` WHERE entry = 9101646;
INSERT INTO `creature_template` VALUES (9101646, '0', '0', '0', '0', '0', '9625', '9626', '9873', '9874', 'Mythic Bloodaxe Evoker', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9693', '9693', '0', '0', '0', '414', '2640', '', '1', 
'1.0', '4.15', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101646 WHERE (`entry` = 9693);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9693);
-- Mythic Bloodaxe Veteran
DELETE FROM `creature_template` WHERE entry = 9101647;
INSERT INTO `creature_template` VALUES (9101647, '0', '0', '0', '0', '0', '9633', '9634', '9881', '9882', 'Mythic Bloodaxe Veteran', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9583', '9583', '0', '0', '0', '620', '2692', '', '1', 
'1.0', '4.14', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101647 WHERE (`entry` = 9583);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9583);
-- Mythic Rage Talon Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101648;
INSERT INTO `creature_template` VALUES (9101648, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Mythic Rage Talon Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9096', '0', '9096', '0', '0', '497', '2819', '', '1', '1.0', '4.33', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101648 WHERE (`entry` = 9096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9096);
-- Mythic Rage Talon Flamescale
DELETE FROM `creature_template` WHERE entry = 9101649;
INSERT INTO `creature_template` VALUES (9101649, '0', '0', '0', '0', '0', '8249', '0', '0', '0', 'Mythic Rage Talon Flamescale', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10083', '0', '10083', '0', '0', '406', '2600', '', '1', '1.0', '4.21', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101649 WHERE (`entry` = 10083);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10083);
-- Mythic Rookery Guardian
DELETE FROM `creature_template` WHERE entry = 9101650;
INSERT INTO `creature_template` VALUES (9101650, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Mythic Rookery Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10258', '0', '10258', '0', '0', '152', '761', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101650 WHERE (`entry` = 10258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10258);
-- Mythic Rookery Hatcher
DELETE FROM `creature_template` WHERE entry = 9101651;
INSERT INTO `creature_template` VALUES (9101651, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Mythic Rookery Hatcher', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10683', '0', '10683', '0', '0', '152', '903', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101651 WHERE (`entry` = 10683);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10683);
-- Mythic Blackhand Incarcerator
DELETE FROM `creature_template` WHERE entry = 9101652;
INSERT INTO `creature_template` VALUES (9101652, '0', '0', '0', '0', '0', '9690', '9692', '9892', '9893', 'Mythic Blackhand Incarcerator', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10316', '9818', '0', '0', '0', '193', '985', '', '1', '1.0', '4.13', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101652 WHERE (`entry` = 10316);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10316);
-- Mythic Blackhand Dragon Handler
DELETE FROM `creature_template` WHERE entry = 9101653;
INSERT INTO `creature_template` VALUES (9101653, '0', '0', '0', '0', '0', '10176', '10177', '10178', '10179', 'Mythic Blackhand Dragon Handler', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10742', '9818', '0', '0', '0', '493', '1506', '', '1', '1.0', '4.25', '1.0', '3.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101653 WHERE (`entry` = 10742);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10742);
-- Mythic Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101654;
INSERT INTO `creature_template` VALUES (9101654, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Mythic Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9817', '9817', '0', '0', '0', '416', '2911', '', '1', '1.0', '4.02', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101654 WHERE (`entry` = 9817);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9817);
-- Mythic Blackhand Summoner
DELETE FROM `creature_template` WHERE entry = 9101655;
INSERT INTO `creature_template` VALUES (9101655, '0', '0', '0', '0', '0', '9849', '9850', '9851', '9852', 'Mythic Blackhand Summoner', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9818', '9818', '0', '0', '0', '412', '2937', '', '1', '1.0', '4.29', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101655 WHERE (`entry` = 9818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9818);
-- Mythic Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101656;
INSERT INTO `creature_template` VALUES (9101656, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Mythic Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9819', '9818', '0', '0', '0', '480', '3001', '', '1', '1.0', '4.05', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101656 WHERE (`entry` = 9819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9819);
-- Mythic Chromatic Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101657;
INSERT INTO `creature_template` VALUES (9101657, '0', '0', '0', '0', '0', '10094', '0', '0', '0', 'Mythic Chromatic Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '2.9', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10447', '0', '10447', '0', '0', '663', '2288', '', '1', '1.0', '4.06', '1.0', '1.1', '1.0', '0', '0', '1', '1', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101657 WHERE (`entry` = 10447);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10447);
-- Mythic Chromatic Elite Guard
DELETE FROM `creature_template` WHERE entry = 9101658;
INSERT INTO `creature_template` VALUES (9101658, '0', '0', '0', '0', '0', '10116', '0', '0', '0', 'Mythic Chromatic Elite Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10814', '0', '10814', '0', '0', '1117', '2830', '', '1', '1.0', '4.16', '1.0', '1.1', '1.0', '0', '0', '1', '537601024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101658 WHERE (`entry` = 10814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10814);
-- Mythic Summoned Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101659;
INSERT INTO `creature_template` VALUES (9101659, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Mythic Summoned Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '1274', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10680', '0', '0', '0', '0', '412', '1363', '', '0', '1.0', '4.02', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101659 WHERE (`entry` = 10680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10680);
-- Mythic Summoned Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101660;
INSERT INTO `creature_template` VALUES (9101660, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Mythic Summoned Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '1274', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10681', '0', '0', '0', '0', '488', '643', 
'', '0', '1.0', '3.9', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101660 WHERE (`entry` = 10681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10681);
-- Mythic Doomguard
DELETE FROM `creature_template` WHERE entry = 9101661;
INSERT INTO `creature_template` VALUES (9101661, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Mythic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.97', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '4.4', '0.77', '1.35', '1.0', 
'0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101661 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859);
-- Mythic Elder Stonefort
DELETE FROM `creature_template` WHERE entry = 9101662;
INSERT INTO `creature_template` VALUES (9101662, '0', '0', '0', '0', '0', '15641', '0', '0', '0', 'Mythic Elder Stonefort', NULL, NULL, '21061', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.91', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.18', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101662 WHERE (`entry` = 15560);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15560);
-- Mythic Spectral Assassin
DELETE FROM `creature_template` WHERE entry = 9101663;
INSERT INTO `creature_template` VALUES (9101663, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Mythic Spectral Assassin', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.31', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101663 WHERE (`entry` = 16066);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16066);
-- Mythic Warosh
DELETE FROM `creature_template` WHERE entry = 9101664;
INSERT INTO `creature_template` VALUES (9101664, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Mythic Warosh', 'The Cursed', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '1', '752', '', '1', '1.0', '4.06', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101664 WHERE (`entry` = 10799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10799);
-- Mythic Blackhand Thug
DELETE FROM `creature_template` WHERE entry = 9101665;
INSERT INTO `creature_template` VALUES (9101665, '0', '0', '0', '0', '0', '10172', '10173', '10174', '10175', 'Mythic Blackhand Thug', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10762', '9818', '0', '0', '0', '737', '967', '', '1', '1.0', '4.49', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101665 WHERE (`entry` = 10762);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10762);
-- Mythic Finkle Einhorn
DELETE FROM `creature_template` WHERE entry = 9101666;
INSERT INTO `creature_template` VALUES (9101666, '0', '0', '0', '0', '0', '10089', '0', '0', '0', 'Mythic Finkle Einhorn', NULL, NULL, '2951', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.29', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101666 WHERE (`entry` = 10776);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10776);
-- Mythic Blackhand Assassin
DELETE FROM `creature_template` WHERE entry = 9101667;
INSERT INTO `creature_template` VALUES (9101667, '0', '0', '0', '0', '0', '9691', '9887', '0', '0', 'Mythic Blackhand Assassin', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10318', '10318', '0', '0', '0', '766', '2658', '', '1', 
'1.0', '4.04', '1.0', '0.6', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101667 WHERE (`entry` = 10318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10318);
-- Mythic Blackhand Elite
DELETE FROM `creature_template` WHERE entry = 9101668;
INSERT INTO `creature_template` VALUES (9101668, '0', '0', '0', '0', '0', '9734', '9735', '9890', '9891', 'Mythic Blackhand Elite', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2300', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10317', '10317', '0', '0', '0', '528', '3166', '', '1', '1.0', '4.46', '1.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101668 WHERE (`entry` = 10317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10317);
-- Mythic Blackhand Iron Guard
DELETE FROM `creature_template` WHERE entry = 9101669;
INSERT INTO `creature_template` VALUES (9101669, '0', '0', '0', '0', '0', '9696', '9697', '9894', '9895', 'Mythic Blackhand Iron Guard', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10319', '9818', '0', '0', '0', '609', '2771', '', '1', '1.0', '4.47', '1.0', '2.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101669 WHERE (`entry` = 10319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10319);
-- Mythic Rage Talon Dragon Guard
DELETE FROM `creature_template` WHERE entry = 9101670;
INSERT INTO `creature_template` VALUES (9101670, '0', '0', '0', '0', '0', '9753', '0', '0', '0', 'Mythic Rage Talon Dragon Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10366', '0', '10366', '0', '0', '907', '2717', '', '1', '1.0', '4.5', '1.0', '1.75', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101670 WHERE (`entry` = 10366);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10366);
-- Mythic Rage Talon Fire Tongue
DELETE FROM `creature_template` WHERE entry = 9101671;
INSERT INTO `creature_template` VALUES (9101671, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Mythic Rage Talon Fire Tongue', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10372', '0', '10372', '0', '0', '619', '2979', '', '1', '1.0', '3.92', '3.0', '1.15', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101671 WHERE (`entry` = 10372);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10372);
-- Mythic Rage Talon Captain
DELETE FROM `creature_template` WHERE entry = 9101672;
INSERT INTO `creature_template` VALUES (9101672, '0', '0', '0', '0', '0', '8310', '0', '0', '0', 'Mythic Rage Talon Captain', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10371', '0', '10371', '0', '0', '910', '2568', '', '1', '1.0', '4.44', 
'1.0', '1.2', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101672 WHERE (`entry` = 10371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10371);
-- Mythic Vaelastrasz the Red
DELETE FROM `creature_template` WHERE entry = 9101673;
INSERT INTO `creature_template` VALUES (9101673, '0', '0', '0', '0', '0', '9912', '0', '0', '0', 'Mythic Vaelastrasz the Red', NULL, NULL, '0', '60', '60', '0', '250', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '164', '818', '', '0', '1.0', '4.07', '60.0', '1.2', '1.0', '0', '0', '1', '650854239', '0', '1073741824', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101673 WHERE (`entry` = 10340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10340);
-- Mythic Spirit of Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101674;
INSERT INTO `creature_template` VALUES (9101674, '0', '0', '0', '0', '0', '15987', '0', '0', '0', 'Mythic Spirit of Lord Valthalak', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.89', '1.0', '2.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101674 WHERE (`entry` = 16073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16073);
-- Mythic Lord Victor Nefarius
DELETE FROM `creature_template` WHERE entry = 9101675;
INSERT INTO `creature_template` VALUES (9101675, '0', '0', '0', '0', '0', '9472', '0', '0', '0', 'Mythic Lord Victor Nefarius', 'Lord of Blackrock', NULL, '21330', '60', '60', '0', '14', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '2.91', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '2', '68', '0', '0', '100001', '0', '0', '1360', '1781', '', '1', '1.0', '4.5', '100.0', '1.6', '1.0', '0', '0', '1', '1691041627', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101675 WHERE (`entry` = 10162);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10162);
-- Mythic General Drakkisath
DELETE FROM `creature_template` WHERE entry = 9101676;
INSERT INTO `creature_template` VALUES (9101676, '0', '0', '0', '0', '0', '10115', '0', '0', '0', 'Mythic General Drakkisath', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '0.992063', '1.0', '1.0', '20.0', '1.0', '3', '0', '6.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10363', '0', '0', '1439', '2164', '', '1', '1.0', '8.45', '3.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101676 WHERE (`entry` = 10363);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10363);
-- Mythic Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101677;
INSERT INTO `creature_template` VALUES (9101677, '0', '0', '0', '0', '0', '14308', '0', '0', '0', 'Mythic Lord Valthalak', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '6.98', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '0', '0', '0', '1000', '3000', '', '0', '1.0', '8.39', '1.0', '1.3', '1.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101677 WHERE (`entry` = 16042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16042);
-- Mythic Pyroguard Emberseer
DELETE FROM `creature_template` WHERE entry = 9101678;
INSERT INTO `creature_template` VALUES (9101678, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Mythic Pyroguard Emberseer', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '3', '2', '7.02', '2000', '2000', '1.0', '1.0', '1', '33554752', '2048', '0', '0', '0', '0', '0', '0', '4', '8', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.35', '3.0', '1.1', '2.0', '0', '144', '1', '1686863835', '4', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101678 WHERE (`entry` = 9816);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9816);
-- Mythic The Beast
DELETE FROM `creature_template` WHERE entry = 9101679;
INSERT INTO `creature_template` VALUES (9101679, '0', '0', '0', '0', '0', '10193', '0', '0', '0', 'Mythic The Beast', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '45', '0', '0', '0', '0', '1', '65545', '9100500', '0', '10430', '0', '0', '0', '0', '', '1', '1.0', '8.07', '1.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101679 WHERE (`entry` = 10430);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10430);
-- Mythic Warchief Rend Blackhand
DELETE FROM `creature_template` WHERE entry = 9101680;
INSERT INTO `creature_template` VALUES (9101680, '0', '0', '0', '0', '0', '9778', '0', '0', '0', 'Mythic Warchief Rend Blackhand', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '3', '0', '6.98', '2400', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '8', '9100500', '0', '0', '0', '0', '6929', '34647', '', '1', '1.0', '7.9', 
'1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101680 WHERE (`entry` = 10429);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10429);
-- Mythic Gyth
DELETE FROM `creature_template` WHERE entry = 9101681;
INSERT INTO `creature_template` VALUES (9101681, '0', '0', '0', '0', '0', '9806', '0', '0', '0', 'Mythic Gyth', 'Rend Blackhands Mount', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10339', '0', '0', '1462', '1915', '', '1', '1.0', '8.01', '1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101681 WHERE (`entry` = 10339);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10339);
-- Mythic Goraluk Anvilcrack
DELETE FROM `creature_template` WHERE entry = 9101682;
INSERT INTO `creature_template` VALUES (9101682, '0', '0', '0', '0', '0', '10222', '0', '0', '0', 'Mythic Goraluk Anvilcrack', 'Blackhand Legion Armorsmith', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '981', '1286', '', '1', '1.0', '8.1', '3.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101682 WHERE (`entry` = 10899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10899);
-- Mythic Crystal Fang
DELETE FROM `creature_template` WHERE entry = 9101683;
INSERT INTO `creature_template` VALUES (9101683, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Mythic Crystal Fang', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.94', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '8.2', '1.0', '1.1', '1.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101683 WHERE (`entry` = 10376);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10376);
-- Mythic Urok Doomhowl
DELETE FROM `creature_template` WHERE entry = 9101684;
INSERT INTO `creature_template` VALUES (9101684, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Mythic Urok Doomhowl', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.99', '3200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '1425', '1866', '', '1', '1.0', '7.95', '1.0', '1.1', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101684 WHERE (`entry` = 10584);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10584);
-- Mythic Gizrul the Slavener
DELETE FROM `creature_template` WHERE entry = 9101685;
INSERT INTO `creature_template` VALUES (9101685, '0', '0', '0', '0', '0', '9564', '0', '0', '0', 'Mythic Gizrul the Slavener', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '10268', '0', '0', '0', '0', '', '2', '1.0', '8.47', '1.0', 
'1.1', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101685 WHERE (`entry` = 10268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10268);
-- Mythic Mor Grayhoof
DELETE FROM `creature_template` WHERE entry = 9101686;
INSERT INTO `creature_template` VALUES (9101686, '0', '0', '0', '0', '0', '15997', '0', '0', '0', 'Mythic Mor Grayhoof', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '2139', '2798', '', '1', '1.0', '8.09', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101686 WHERE (`entry` = 16080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16080);
-- Mythic Overlord Wyrmthalak
DELETE FROM `creature_template` WHERE entry = 9101687;
INSERT INTO `creature_template` VALUES (9101687, '0', '0', '0', '0', '0', '8711', '0', '0', '0', 'Mythic Overlord Wyrmthalak', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '9568', '0', '0', '1124', '1966', '', '1', '1.0', '8.36', '1.0', '1.1', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101687 WHERE (`entry` = 9568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9568);
-- Mythic Solakar Flamewreath
DELETE FROM `creature_template` WHERE entry = 9101688;
INSERT INTO `creature_template` VALUES (9101688, '0', '0', '0', '0', '0', '9581', '0', '0', '0', 'Mythic Solakar Flamewreath', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.2', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '1283', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10264', '0', '0', '1119', '1466', '', '1', '1.0', '8.44', '1.0', '1.1', '1.0', '0', '147', '1', '646655835', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101688 WHERE (`entry` = 10264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10264);
-- Mythic Bannok Grimaxe
DELETE FROM `creature_template` WHERE entry = 9101689;
INSERT INTO `creature_template` VALUES (9101689, '0', '0', '0', '0', '0', '9668', '0', '0', '0', 'Mythic Bannok Grimaxe', 'Firebrand Legion Champion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9596', '0', '0', '0', '728', '2688', '', '1', '1.0', '8.18', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101689 WHERE (`entry` = 9596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9596);
-- Mythic Ghok Bashguud
DELETE FROM `creature_template` WHERE entry = 9101690;
INSERT INTO `creature_template` VALUES (9101690, '0', '0', '0', '0', '0', '11809', '0', '0', '0', 'Mythic Ghok Bashguud', 'Bloodaxe Champion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.96', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '142', '708', '', '1', '1.0', '8.11', '1.0', '1.1', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101690 WHERE (`entry` = 9718);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9718);
-- Mythic Quartermaster Zigris
DELETE FROM `creature_template` WHERE entry = 9101691;
INSERT INTO `creature_template` VALUES (9101691, '0', '0', '0', '0', '0', '9738', '0', '0', '0', 'Mythic Quartermaster Zigris', 'Bloodaxe Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.96', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '737', '2195', '', '1', '1.0', 
'7.91', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101691 WHERE (`entry` = 9736);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9736);
-- Mythic Jed Runewatcher
DELETE FROM `creature_template` WHERE entry = 9101692;
INSERT INTO `creature_template` VALUES (9101692, '0', '0', '0', '0', '0', '9686', '0', '0', '0', 'Mythic Jed Runewatcher', 'Blackhand Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '310', '1552', '', '1', '1.0', '7.97', '1.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101692 WHERE (`entry` = 10509);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10509);
-- Mythic Halycon
DELETE FROM `creature_template` WHERE entry = 9101693;
INSERT INTO `creature_template` VALUES (9101693, '0', '0', '0', '0', '0', '9567', '0', '0', '0', 'Mythic Halycon', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '1100', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '10220', '0', '0', '0', '0', '', '1', '1.0', '7.82', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101693 WHERE (`entry` = 10220);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10220);
-- Mythic Highlord Omokk
DELETE FROM `creature_template` WHERE entry = 9101694;
INSERT INTO `creature_template` VALUES (9101694, '0', '0', '0', '0', '0', '11565', '0', '0', '0', 'Mythic Highlord Omokk', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9196', '0', '0', '0', '920', '2139', '', '1', '1.0', '8.41', '1.0', 
'1.0', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101694 WHERE (`entry` = 9196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9196);
-- Mythic Mother Smolderweb
DELETE FROM `creature_template` WHERE entry = 9101695;
INSERT INTO `creature_template` VALUES (9101695, '0', '0', '0', '0', '0', '9929', '0', '0', '0', 'Mythic Mother Smolderweb', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.46', '1.0', '1.0', '2.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101695 WHERE (`entry` = 10596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10596);
-- Mythic War Master Voone
DELETE FROM `creature_template` WHERE entry = 9101696;
INSERT INTO `creature_template` VALUES (9101696, '0', '0', '0', '0', '0', '9733', '0', '0', '0', 'Mythic War Master Voone', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9237', '0', '0', '0', '1330', '2212', '', '1', '1.0', '8.07', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101696 WHERE (`entry` = 9237);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9237);
-- Mythic Spirestone Battle Lord
DELETE FROM `creature_template` WHERE entry = 9101697;
INSERT INTO `creature_template` VALUES (9101697, '0', '0', '0', '0', '0', '11576', '0', '0', '0', 'Mythic Spirestone Battle Lord', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '2', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9218', '0', '0', '0', '1229', '1609', '', '1', '1.0', '7.81', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101697 WHERE (`entry` = 9218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9218);
-- Mythic Spirestone Lord Magus
DELETE FROM `creature_template` WHERE entry = 9101698;
INSERT INTO `creature_template` VALUES (9101698, '0', '0', '0', '0', '0', '11578', '0', '0', '0', 'Mythic Spirestone Lord Magus', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '1037', '1360', '', '0', '1.0', '8.48', '6.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101698 WHERE (`entry` = 9217);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9217);
-- Mythic Shadow Hunter Voshgajin
DELETE FROM `creature_template` WHERE entry = 9101699;
INSERT INTO `creature_template` VALUES (9101699, '0', '0', '0', '0', '0', '9732', '0', '0', '0', 'Mythic Shadow Hunter Voshgajin', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.01', '1300', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9236', '0', '0', '0', '988', '2172', '', '1', '1.0', '7.95', '1.0', '1.0', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101699 WHERE (`entry` = 9236);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9236);
-- Mythic Spirestone Butcher
DELETE FROM `creature_template` WHERE entry = 9101700;
INSERT INTO `creature_template` VALUES (9101700, '0', '0', '0', '0', '0', '11574', '0', '0', '0', 'Mythic Spirestone Butcher', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '1226', '2245', '', '1', '1.0', '8.4', '1.0', 
'1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101700 WHERE (`entry` = 9219);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9219);
-- Mythic Burning Felguard
DELETE FROM `creature_template` WHERE entry = 9101701;
INSERT INTO `creature_template` VALUES (9101701, '0', '0', '0', '0', '0', '5047', '0', '0', '0', 'Mythic Burning Felguard', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '2', '0', '6.96', '2300', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '905', '1186', '', '1', '1.0', '7.96', '2.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101701 WHERE (`entry` = 10263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10263);