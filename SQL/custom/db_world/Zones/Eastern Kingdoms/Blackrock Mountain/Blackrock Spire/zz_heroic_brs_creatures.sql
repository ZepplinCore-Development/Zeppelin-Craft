-- Heroic Scarshield Acolyte
DELETE FROM `creature_template` WHERE entry = 9101700;
INSERT INTO `creature_template` VALUES (9101700, '0', '0', '0', '0', '0', '8898', '9596', '9853', '9854', 'Heroic Scarshield Acolyte', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9045', '9045', '0', '0', '0', '369', '2306', '', 
'1', '1.0', '3.36', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101700 WHERE (`entry` = 9045);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9045) AND (`map` = 229);
-- Heroic Scarshield Infiltrator
DELETE FROM `creature_template` WHERE entry = 9101701;
INSERT INTO `creature_template` VALUES (9101701, '0', '0', '0', '0', '0', '9642', '0', '0', '0', 'Heroic Scarshield Infiltrator', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.9', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101701 WHERE (`entry` = 10299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10299) AND (`map` = 229);
-- Heroic Scarshield Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101702;
INSERT INTO `creature_template` VALUES (9101702, '0', '0', '0', '0', '0', '9629', '9630', '9857', '9858', 'Heroic Scarshield Legionnaire', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9097', '9097', '0', '0', '0', '402', '2367', 
'', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101702 WHERE (`entry` = 9097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9097) AND (`map` = 229);
-- Heroic Scarshield Spellbinder
DELETE FROM `creature_template` WHERE entry = 9101703;
INSERT INTO `creature_template` VALUES (9101703, '0', '0', '0', '0', '0', '9618', '9620', '9863', '9864', 'Heroic Scarshield Spellbinder', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9098', '9098', '0', '0', '0', '361', '2313', 
'', '1', '1.0', '3.3', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101703 WHERE (`entry` = 9098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9098) AND (`map` = 229);
-- Heroic Scarshield Warlock
DELETE FROM `creature_template` WHERE entry = 9101704;
INSERT INTO `creature_template` VALUES (9101704, '0', '0', '0', '0', '0', '9609', '9610', '9865', '9866', 'Heroic Scarshield Warlock', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9257', '9257', '0', '0', '0', '369', '2228', '', 
'1', '1.0', '3.47', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101704 WHERE (`entry` = 9257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9257) AND (`map` = 229);
-- Heroic Spirestone Enforcer
DELETE FROM `creature_template` WHERE entry = 9101705;
INSERT INTO `creature_template` VALUES (9101705, '0', '0', '0', '0', '0', '11577', '0', '0', '0', 'Heroic Spirestone Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9199', '9199', '0', '0', '0', '394', '2303', '', '1', '1.0', '3.27', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101705 WHERE (`entry` = 9199);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9199) AND (`map` = 229);
-- Heroic Spirestone Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101706;
INSERT INTO `creature_template` VALUES (9101706, '0', '0', '0', '0', '0', '11562', '0', '0', '0', 'Heroic Spirestone Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9201', '9201', '0', '0', '0', '518', '1687', '', '1', '1.0', '3.24', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101706 WHERE (`entry` = 9201);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9201) AND (`map` = 229);
-- Heroic Urok Enforcer
DELETE FROM `creature_template` WHERE entry = 9101707;
INSERT INTO `creature_template` VALUES (9101707, '0', '0', '0', '0', '0', '11584', '0', '0', '0', 'Heroic Urok Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10601', '0', '0', '0', '0', '133', '666', '', '1', '1.0', '3.34', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101707 WHERE (`entry` = 10601);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10601) AND (`map` = 229);
-- Heroic Urok Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101708;
INSERT INTO `creature_template` VALUES (9101708, '0', '0', '0', '0', '0', '11585', '0', '0', '0', 'Heroic Urok Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10602', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.83', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101708 WHERE (`entry` = 10602);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10602) AND (`map` = 229);
-- Heroic Spire Spiderling
DELETE FROM `creature_template` WHERE entry = 9101709;
INSERT INTO `creature_template` VALUES (9101709, '0', '0', '0', '0', '0', '9756', '0', '0', '0', 'Heroic Spire Spiderling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.91', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '10375', '0', '0', '10515', '0', '0', '0', '', '1', '1.0', '3.5', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101709 WHERE (`entry` = 10375);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10375) AND (`map` = 229);
-- Heroic Scarshield Raider
DELETE FROM `creature_template` WHERE entry = 9101710;
INSERT INTO `creature_template` VALUES (9101710, '0', '0', '0', '0', '0', '9637', '9638', '9859', '9860', 'Heroic Scarshield Raider', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9258', '9258', '0', '0', '0', '419', '2288', '', '1', '1.0', '3.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101710 WHERE (`entry` = 9258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9258) AND (`map` = 229);
-- Heroic Smolderthorn Axe Thrower
DELETE FROM `creature_template` WHERE entry = 9101711;
INSERT INTO `creature_template` VALUES (9101711, '0', '0', '0', '0', '0', '9674', '9675', '9676', '9677', 'Heroic Smolderthorn Axe Thrower', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9267', '9267', '0', '0', '0', '379', '2466', '', '1', '1.0', '3.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101711 WHERE (`entry` = 9267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9267) AND (`map` = 229);
-- Heroic Smolderthorn Mystic
DELETE FROM `creature_template` WHERE entry = 9101712;
INSERT INTO `creature_template` VALUES (9101712, '0', '0', '0', '0', '0', '9709', '9710', '9711', '9712', 'Heroic Smolderthorn Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9239', '9239', '0', '0', '0', '375', '2470', '', '1', '1.0', '3.08', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101712 WHERE (`entry` = 9239);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9239) AND (`map` = 229);
-- Heroic Smolderthorn Shadow Priest
DELETE FROM `creature_template` WHERE entry = 9101713;
INSERT INTO `creature_template` VALUES (9101713, '0', '0', '0', '0', '0', '9728', '9729', '9730', '9731', 'Heroic Smolderthorn Shadow Priest', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9240', '9240', '0', '0', '0', '427', '2460', '', '1', '1.0', '3.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101713 WHERE (`entry` = 9240);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9240) AND (`map` = 229);
-- Heroic Spirestone Mystic
DELETE FROM `creature_template` WHERE entry = 9101714;
INSERT INTO `creature_template` VALUES (9101714, '0', '0', '0', '0', '0', '11579', '0', '0', '0', 'Heroic Spirestone Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9198', '9198', '0', '0', '0', '558', '734', '', '0', '1.0', '3.43', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101714 WHERE (`entry` = 9198);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9198) AND (`map` = 229);
-- Heroic Spirestone Reaver
DELETE FROM `creature_template` WHERE entry = 9101715;
INSERT INTO `creature_template` VALUES (9101715, '0', '0', '0', '0', '0', '11581', '0', '0', '0', 'Heroic Spirestone Reaver', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9200', '9200', '0', '0', '0', '388', '2391', '', '1', '1.0', '3.47', '1.0', 
'1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101715 WHERE (`entry` = 9200);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9200) AND (`map` = 229);
-- Heroic Firebrand Darkweaver
DELETE FROM `creature_template` WHERE entry = 9101716;
INSERT INTO `creature_template` VALUES (9101716, '0', '0', '0', '0', '0', '9644', '9645', '9867', '9868', 'Heroic Firebrand Darkweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9261', '9261', '0', '0', '0', '390', '2553', '', '1', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101716 WHERE (`entry` = 9261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9261) AND (`map` = 229);
-- Heroic Firebrand Grunt
DELETE FROM `creature_template` WHERE entry = 9101717;
INSERT INTO `creature_template` VALUES (9101717, '0', '0', '0', '0', '0', '9664', '9665', '9871', '9872', 'Heroic Firebrand Grunt', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9259', '9259', '0', '0', '0', '474', '2573', '', '1', '1.0', '3.05', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101717 WHERE (`entry` = 9259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9259) AND (`map` = 229);
-- Heroic Firebrand Invoker
DELETE FROM `creature_template` WHERE entry = 9101718;
INSERT INTO `creature_template` VALUES (9101718, '0', '0', '0', '0', '0', '9648', '9649', '9877', '9878', 'Heroic Firebrand Invoker', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9262', '9262', '0', '0', '0', '385', '2574', '', '1', '1.0', '2.92', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101718 WHERE (`entry` = 9262);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9262) AND (`map` = 229);
-- Heroic Smolderthorn Headhunter
DELETE FROM `creature_template` WHERE entry = 9101719;
INSERT INTO `creature_template` VALUES (9101719, '0', '0', '0', '0', '0', '9682', '9683', '9684', '9685', 'Heroic Smolderthorn Headhunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9241', '9241', '0', '0', '0', '458', '2378', '', '1', '1.0', '3.26', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101719 WHERE (`entry` = 9241);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9241) AND (`map` = 229);
-- Heroic Smolderthorn Seer
DELETE FROM `creature_template` WHERE entry = 9101720;
INSERT INTO `creature_template` VALUES (9101720, '0', '0', '0', '0', '0', '9715', '9716', '9717', '9718', 'Heroic Smolderthorn Seer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9269', '9269', '0', '0', '0', '385', '2594', '', '1', '1.0', '2.97', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101720 WHERE (`entry` = 9269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9269) AND (`map` = 229);
-- Heroic Smolderthorn Shadow Hunter
DELETE FROM `creature_template` WHERE entry = 9101721;
INSERT INTO `creature_template` VALUES (9101721, '0', '0', '0', '0', '0', '9724', '9725', '9726', '9727', 'Heroic Smolderthorn Shadow Hunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '1400', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9265', '9265', '0', '0', '0', '385', '2242', '', '1', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101721 WHERE (`entry` = 9265);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9265) AND (`map` = 229);
-- Heroic Smolderthorn Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101722;
INSERT INTO `creature_template` VALUES (9101722, '0', '0', '0', '0', '0', '9719', '9720', '9721', '9722', 'Heroic Smolderthorn Witch Doctor', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9266', '9266', '0', '0', '0', '381', '2611', '', '1', '1.0', '2.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101722 WHERE (`entry` = 9266);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9266) AND (`map` = 229);
-- Heroic Superior Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101723;
INSERT INTO `creature_template` VALUES (9101723, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Heroic Superior Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '11', '0', '0', '0', '0', '0', '0', '44', '220', '', '0', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101723 WHERE (`entry` = 10218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10218) AND (`map` = 229);
-- Heroic Awbee
DELETE FROM `creature_template` WHERE entry = 9101724;
INSERT INTO `creature_template` VALUES (9101724, '0', '0', '0', '0', '0', '6293', '0', '0', '0', 'Heroic Awbee', NULL, NULL, '3063', '60', '60', '0', '35', '3', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '3.44', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101724 WHERE (`entry` = 10740);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10740) AND (`map` = 229);
-- Heroic Bloodaxe Raider
DELETE FROM `creature_template` WHERE entry = 9101725;
INSERT INTO `creature_template` VALUES (9101725, '0', '0', '0', '0', '0', '9602', '9603', '9875', '9876', 'Heroic Bloodaxe Raider', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9692', '9692', '0', '0', '0', '464', '1732', '', '1', 
'1.0', '3.04', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101725 WHERE (`entry` = 9692);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9692) AND (`map` = 229);
-- Heroic Bloodaxe Summoner
DELETE FROM `creature_template` WHERE entry = 9101726;
INSERT INTO `creature_template` VALUES (9101726, '0', '0', '0', '0', '0', '9613', '9614', '9879', '9880', 'Heroic Bloodaxe Summoner', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9717', '9717', '0', '0', '0', '387', '2104', '', '0', '1.0', '3.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101726 WHERE (`entry` = 9717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9717) AND (`map` = 229);
-- Heroic Bloodaxe Warmonger
DELETE FROM `creature_template` WHERE entry = 9101727;
INSERT INTO `creature_template` VALUES (9101727, '0', '0', '0', '0', '0', '9617', '9619', '9883', '9886', 'Heroic Bloodaxe Warmonger', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9716', '9716', '0', '0', '0', '468', '2526', '', '1', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101727 WHERE (`entry` = 9716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9716) AND (`map` = 229);
-- Heroic Firebrand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101728;
INSERT INTO `creature_template` VALUES (9101728, '0', '0', '0', '0', '0', '9652', '9653', '9869', '9870', 'Heroic Firebrand Dreadweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9263', '9263', '0', '0', '0', '400', '2694', '', '1', '1.0', '3.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101728 WHERE (`entry` = 9263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9263) AND (`map` = 229);
-- Heroic Firebrand Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101729;
INSERT INTO `creature_template` VALUES (9101729, '0', '0', '0', '0', '0', '9660', '9661', '9884', '9885', 'Heroic Firebrand Legionnaire', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9260', '9260', '0', '0', '0', '464', '2655', '', '1', '1.0', '3.01', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101729 WHERE (`entry` = 9260);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9260) AND (`map` = 229);
-- Heroic Firebrand Pyromancer
DELETE FROM `creature_template` WHERE entry = 9101730;
INSERT INTO `creature_template` VALUES (9101730, '0', '0', '0', '0', '0', '9656', '9657', '9888', '9889', 'Heroic Firebrand Pyromancer', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '1300', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9264', '9264', '0', '0', '0', '396', '2532', '', 
'1', '1.0', '3.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101730 WHERE (`entry` = 9264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9264) AND (`map` = 229);
-- Heroic Smolderthorn Berserker
DELETE FROM `creature_template` WHERE entry = 9101731;
INSERT INTO `creature_template` VALUES (9101731, '0', '0', '0', '0', '0', '7803', '0', '0', '0', 'Heroic Smolderthorn Berserker', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9268', '9268', '0', '0', '0', '464', '2533', '', '1', '1.0', '3.35', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101731 WHERE (`entry` = 9268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9268) AND (`map` = 229);
-- Heroic Spire Spider
DELETE FROM `creature_template` WHERE entry = 9101732;
INSERT INTO `creature_template` VALUES (9101732, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Heroic Spire Spider', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10374', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101732 WHERE (`entry` = 10374);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10374) AND (`map` = 229);
-- Heroic Spirestone Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101733;
INSERT INTO `creature_template` VALUES (9101733, '0', '0', '0', '0', '0', '11543', '0', '0', '0', 'Heroic Spirestone Battle Mage', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9197', '9197', '0', '0', '0', '561', '2274', '', '1', '1.0', '3.39', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101733 WHERE (`entry` = 9197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9197) AND (`map` = 229);
-- Heroic Spirestone Warlord
DELETE FROM `creature_template` WHERE entry = 9101734;
INSERT INTO `creature_template` VALUES (9101734, '0', '0', '0', '0', '0', '11582', '0', '0', '0', 'Heroic Spirestone Warlord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9216', '9216', '0', '0', '0', '689', '2376', '', '1', '1.0', '3.37', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101734 WHERE (`entry` = 9216);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9216) AND (`map` = 229);
-- Heroic Bijou
DELETE FROM `creature_template` WHERE entry = 9101735;
INSERT INTO `creature_template` VALUES (9101735, '0', '0', '0', '0', '0', '9553', '0', '0', '0', 'Heroic Bijou', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '10257', '0', '0', '1', '817', '', '1', '1.0', '2.95', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101735 WHERE (`entry` = 10257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10257) AND (`map` = 229);
-- Heroic Bloodaxe Evoker
DELETE FROM `creature_template` WHERE entry = 9101736;
INSERT INTO `creature_template` VALUES (9101736, '0', '0', '0', '0', '0', '9625', '9626', '9873', '9874', 'Heroic Bloodaxe Evoker', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9693', '9693', '0', '0', '0', '414', '2640', '', '1', 
'1.0', '2.81', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101736 WHERE (`entry` = 9693);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9693) AND (`map` = 229);
-- Heroic Bloodaxe Veteran
DELETE FROM `creature_template` WHERE entry = 9101737;
INSERT INTO `creature_template` VALUES (9101737, '0', '0', '0', '0', '0', '9633', '9634', '9881', '9882', 'Heroic Bloodaxe Veteran', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9583', '9583', '0', '0', '0', '620', '2692', '', '1', '1.0', '3.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101737 WHERE (`entry` = 9583);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9583) AND (`map` = 229);
-- Heroic Rage Talon Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101738;
INSERT INTO `creature_template` VALUES (9101738, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Heroic Rage Talon Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9096', '0', '9096', '0', '0', '497', '2819', '', '1', '1.0', '3.11', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101738 WHERE (`entry` = 9096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9096) AND (`map` = 229);
-- Heroic Rage Talon Flamescale
DELETE FROM `creature_template` WHERE entry = 9101739;
INSERT INTO `creature_template` VALUES (9101739, '0', '0', '0', '0', '0', '8249', '0', '0', '0', 'Heroic Rage Talon Flamescale', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10083', '0', '10083', '0', '0', '406', '2600', '', '1', '1.0', '2.81', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101739 WHERE (`entry` = 10083);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10083) AND (`map` = 229);
-- Heroic Rookery Guardian
DELETE FROM `creature_template` WHERE entry = 9101740;
INSERT INTO `creature_template` VALUES (9101740, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Heroic Rookery Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10258', '0', '10258', '0', '0', '152', '761', '', '1', '1.0', '3.23', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101740 WHERE (`entry` = 10258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10258) AND (`map` = 229);
-- Heroic Rookery Hatcher
DELETE FROM `creature_template` WHERE entry = 9101741;
INSERT INTO `creature_template` VALUES (9101741, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Heroic Rookery Hatcher', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10683', '0', '10683', '0', '0', '152', '903', '', '1', '1.0', '3.42', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101741 WHERE (`entry` = 10683);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10683) AND (`map` = 229);
-- Heroic Blackhand Dragon Handler
DELETE FROM `creature_template` WHERE entry = 9101742;
INSERT INTO `creature_template` VALUES (9101742, '0', '0', '0', '0', '0', '10176', '10177', '10178', '10179', 'Heroic Blackhand Dragon Handler', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '1.98', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10742', '9818', '0', '0', '0', '493', '1506', '', '1', '1.0', '3.12', '1.0', '3.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101742 WHERE (`entry` = 10742);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10742) AND (`map` = 229);
-- Heroic Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101743;
INSERT INTO `creature_template` VALUES (9101743, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Heroic Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9817', '9817', '0', '0', '0', '416', '2911', '', '1', '1.0', '2.82', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101743 WHERE (`entry` = 9817);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9817) AND (`map` = 229);
-- Heroic Blackhand Summoner
DELETE FROM `creature_template` WHERE entry = 9101744;
INSERT INTO `creature_template` VALUES (9101744, '0', '0', '0', '0', '0', '9849', '9850', '9851', '9852', 'Heroic Blackhand Summoner', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9818', '9818', '0', '0', '0', '412', '2937', '', '1', '1.0', '3.04', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101744 WHERE (`entry` = 9818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9818) AND (`map` = 229);
-- Heroic Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101745;
INSERT INTO `creature_template` VALUES (9101745, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Heroic Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9819', '9818', '0', '0', '0', '480', '3001', '', '1', '1.0', '2.89', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101745 WHERE (`entry` = 9819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9819) AND (`map` = 229);
-- Heroic Chromatic Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101746;
INSERT INTO `creature_template` VALUES (9101746, '0', '0', '0', '0', '0', '10094', '0', '0', '0', 'Heroic Chromatic Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '2.09', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10447', '0', '10447', '0', '0', '663', '2288', '', '1', '1.0', '3.19', '1.0', '1.1', '1.0', '0', '0', '1', '1', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101746 WHERE (`entry` = 10447);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10447) AND (`map` = 229);
-- Heroic Chromatic Elite Guard
DELETE FROM `creature_template` WHERE entry = 9101747;
INSERT INTO `creature_template` VALUES (9101747, '0', '0', '0', '0', '0', '10116', '0', '0', '0', 'Heroic Chromatic Elite Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.92', '2600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10814', '0', '10814', '0', '0', '1117', '2830', '', '1', '1.0', '3.08', '1.0', '1.1', '1.0', '0', '0', '1', '537601024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101747 WHERE (`entry` = 10814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10814) AND (`map` = 229);
-- Heroic Summoned Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101748;
INSERT INTO `creature_template` VALUES (9101748, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Heroic Summoned Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '1274', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10680', '0', '0', '0', '0', '412', '1363', '', '0', '1.0', '3.12', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101748 WHERE (`entry` = 10680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10680) AND (`map` = 229);
-- Heroic Summoned Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101749;
INSERT INTO `creature_template` VALUES (9101749, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Heroic Summoned Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.01', '2000', '1274', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10681', '0', '0', '0', '0', '488', '643', 
'', '0', '1.0', '3.3', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101749 WHERE (`entry` = 10681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10681) AND (`map` = 229);
-- Heroic Doomguard
DELETE FROM `creature_template` WHERE entry = 9101750;
INSERT INTO `creature_template` VALUES (9101750, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Heroic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '3.25', '0.77', '1.35', '1.0', 
'0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101750 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859) AND (`map` = 229);
-- Heroic Warosh
DELETE FROM `creature_template` WHERE entry = 9101751;
INSERT INTO `creature_template` VALUES (9101751, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Heroic Warosh', 'The Cursed', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '1', '752', '', '1', '1.0', '3.41', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101751 WHERE (`entry` = 10799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10799) AND (`map` = 229);
-- Heroic Blackhand Thug
DELETE FROM `creature_template` WHERE entry = 9101752;
INSERT INTO `creature_template` VALUES (9101752, '0', '0', '0', '0', '0', '10172', '10173', '10174', '10175', 'Heroic Blackhand Thug', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10762', '9818', '0', '0', '0', '737', '967', '', '1', '1.0', '3.32', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101752 WHERE (`entry` = 10762);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10762) AND (`map` = 229);
-- Heroic Finkle Einhorn
DELETE FROM `creature_template` WHERE entry = 9101753;
INSERT INTO `creature_template` VALUES (9101753, '0', '0', '0', '0', '0', '10089', '0', '0', '0', 'Heroic Finkle Einhorn', NULL, NULL, '2951', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.08', '2000', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.14', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101753 WHERE (`entry` = 10776);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10776) AND (`map` = 229);
-- Heroic Blackhand Assassin
DELETE FROM `creature_template` WHERE entry = 9101754;
INSERT INTO `creature_template` VALUES (9101754, '0', '0', '0', '0', '0', '9691', '9887', '0', '0', 'Heroic Blackhand Assassin', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.9', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10318', '10318', '0', '0', '0', '766', '2658', '', '1', '1.0', '3.1', '1.0', '0.6', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101754 WHERE (`entry` = 10318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10318) AND (`map` = 229);
-- Heroic Blackhand Elite
DELETE FROM `creature_template` WHERE entry = 9101755;
INSERT INTO `creature_template` VALUES (9101755, '0', '0', '0', '0', '0', '9734', '9735', '9890', '9891', 'Heroic Blackhand Elite', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.94', '2300', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10317', '10317', '0', '0', '0', '528', '3166', '', '1', '1.0', '3.08', '1.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101755 WHERE (`entry` = 10317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10317) AND (`map` = 229);
-- Heroic Blackhand Iron Guard
DELETE FROM `creature_template` WHERE entry = 9101756;
INSERT INTO `creature_template` VALUES (9101756, '0', '0', '0', '0', '0', '9696', '9697', '9894', '9895', 'Heroic Blackhand Iron Guard', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10319', '9818', '0', '0', '0', '609', '2771', '', '1', '1.0', '3.3', '1.0', '2.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101756 WHERE (`entry` = 10319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10319) AND (`map` = 229);
-- Heroic Rage Talon Dragon Guard
DELETE FROM `creature_template` WHERE entry = 9101757;
INSERT INTO `creature_template` VALUES (9101757, '0', '0', '0', '0', '0', '9753', '0', '0', '0', 'Heroic Rage Talon Dragon Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10366', '0', '10366', '0', '0', '907', '2717', '', '1', '1.0', '3.16', '1.0', '1.75', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101757 WHERE (`entry` = 10366);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10366) AND (`map` = 229);
-- Heroic Rage Talon Fire Tongue
DELETE FROM `creature_template` WHERE entry = 9101758;
INSERT INTO `creature_template` VALUES (9101758, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Heroic Rage Talon Fire Tongue', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10372', '0', '10372', '0', '0', '619', '2979', '', '1', '1.0', '3.2', '3.0', '1.15', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101758 WHERE (`entry` = 10372);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10372) AND (`map` = 229);
-- Heroic Rage Talon Captain
DELETE FROM `creature_template` WHERE entry = 9101759;
INSERT INTO `creature_template` VALUES (9101759, '0', '0', '0', '0', '0', '8310', '0', '0', '0', 'Heroic Rage Talon Captain', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10371', '0', '10371', '0', '0', '910', '2568', '', '1', '1.0', '3.04', 
'1.0', '1.2', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101759 WHERE (`entry` = 10371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10371) AND (`map` = 229);
-- Heroic Vaelastrasz the Red
DELETE FROM `creature_template` WHERE entry = 9101760;
INSERT INTO `creature_template` VALUES (9101760, '0', '0', '0', '0', '0', '9912', '0', '0', '0', 'Heroic Vaelastrasz the Red', NULL, NULL, '0', '60', '60', '0', '250', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.91', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '164', '818', '', '0', '1.0', '3.31', '60.0', '1.2', '1.0', '0', '0', '1', '650854239', '0', '1073741824', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101760 WHERE (`entry` = 10340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10340) AND (`map` = 229);
-- Heroic Spirit of Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101761;
INSERT INTO `creature_template` VALUES (9101761, '0', '0', '0', '0', '0', '15987', '0', '0', '0', 'Heroic Spirit of Lord Valthalak', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.96', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.06', '1.0', '2.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101761 WHERE (`entry` = 16073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16073) AND (`map` = 229);
-- Heroic Lord Victor Nefarius
DELETE FROM `creature_template` WHERE entry = 9101762;
INSERT INTO `creature_template` VALUES (9101762, '0', '0', '0', '0', '0', '9472', '0', '0', '0', 'Heroic Lord Victor Nefarius', 'Lord of Blackrock', NULL, '21330', '60', '60', '0', '14', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '2.08', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '2', '68', '0', '0', '100001', '0', '0', '1360', '1781', '', '1', '1.0', '3.42', '100.0', '1.6', '1.0', '0', '0', '1', '1691041627', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101762 WHERE (`entry` = 10162);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10162) AND (`map` = 229);
-- Heroic General Drakkisath
DELETE FROM `creature_template` WHERE entry = 9101763;
INSERT INTO `creature_template` VALUES (9101763, '0', '0', '0', '0', '0', '10115', '0', '0', '0', 'Heroic General Drakkisath', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '0.992063', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10363', '0', '0', '1439', '2164', '', '1', '1.0', '6.04', '3.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101763 WHERE (`entry` = 10363);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10363) AND (`map` = 229);
-- Heroic Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101764;
INSERT INTO `creature_template` VALUES (9101764, '0', '0', '0', '0', '0', '14308', '0', '0', '0', 'Heroic Lord Valthalak', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.92', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '0', '0', '0', '1000', '3000', '', '0', '1.0', '6.46', '1.0', '1.3', '1.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101764 WHERE (`entry` = 16042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16042) AND (`map` = 229);
-- Heroic Pyroguard Emberseer
DELETE FROM `creature_template` WHERE entry = 9101765;
INSERT INTO `creature_template` VALUES (9101765, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Heroic Pyroguard Emberseer', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '3', '2', '4.92', '2000', '2000', '1.0', '1.0', '1', '33554752', '2048', '0', '0', '0', '0', '0', '0', '4', '8', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.22', '3.0', '1.1', '2.0', '0', '144', '1', '1686863835', '4', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101765 WHERE (`entry` = 9816);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9816) AND (`map` = 229);
-- Heroic The Beast
DELETE FROM `creature_template` WHERE entry = 9101766;
INSERT INTO `creature_template` VALUES (9101766, '0', '0', '0', '0', '0', '10193', '0', '0', '0', 'Heroic The Beast', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '45', '0', '0', '0', '0', '1', '65545', '9100400', '0', '10430', '0', '0', '0', '0', '', '1', '1.0', '6.1', '1.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101766 WHERE (`entry` = 10430);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10430) AND (`map` = 229);
-- Heroic Warchief Rend Blackhand
DELETE FROM `creature_template` WHERE entry = 9101767;
INSERT INTO `creature_template` VALUES (9101767, '0', '0', '0', '0', '0', '9778', '0', '0', '0', 'Heroic Warchief Rend Blackhand', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '3', '0', '5.07', '2400', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '8', '9100400', '0', '0', '0', '0', '6929', '34647', '', '1', '1.0', '6.37', '1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101767 WHERE (`entry` = 10429);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10429) AND (`map` = 229);
-- Heroic Gyth
DELETE FROM `creature_template` WHERE entry = 9101768;
INSERT INTO `creature_template` VALUES (9101768, '0', '0', '0', '0', '0', '9806', '0', '0', '0', 'Heroic Gyth', 'Rend Blackhand''s Mount', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10339', '0', '0', '1462', '1915', '', '1', '1.0', '6.44', '1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101768 WHERE (`entry` = 10339);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10339) AND (`map` = 229);
-- Heroic Urok Doomhowl
DELETE FROM `creature_template` WHERE entry = 9101769;
INSERT INTO `creature_template` VALUES (9101769, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Heroic Urok Doomhowl', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.02', '3200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '1425', '1866', '', '1', '1.0', '6.23', '1.0', '1.1', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101769 WHERE (`entry` = 10584);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10584) AND (`map` = 229);
-- Heroic Gizrul the Slavener
DELETE FROM `creature_template` WHERE entry = 9101770;
INSERT INTO `creature_template` VALUES (9101770, '0', '0', '0', '0', '0', '9564', '0', '0', '0', 'Heroic Gizrul the Slavener', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '10268', '0', '0', '0', '0', '', '2', '1.0', '5.95', '1.0', 
'1.1', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101770 WHERE (`entry` = 10268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10268) AND (`map` = 229);
-- Heroic Mor Grayhoof
DELETE FROM `creature_template` WHERE entry = 9101771;
INSERT INTO `creature_template` VALUES (9101771, '0', '0', '0', '0', '0', '15997', '0', '0', '0', 'Heroic Mor Grayhoof', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '2139', '2798', '', '1', '1.0', '6.02', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101771 WHERE (`entry` = 16080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16080) AND (`map` = 229);
-- Heroic Overlord Wyrmthalak
DELETE FROM `creature_template` WHERE entry = 9101772;
INSERT INTO `creature_template` VALUES (9101772, '0', '0', '0', '0', '0', '8711', '0', '0', '0', 'Heroic Overlord Wyrmthalak', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100400', '0', '9568', '0', '0', '1124', '1966', '', '1', '1.0', '6.14', '1.0', '1.1', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101772 WHERE (`entry` = 9568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9568) AND (`map` = 229);
-- Heroic Solakar Flamewreath
DELETE FROM `creature_template` WHERE entry = 9101773;
INSERT INTO `creature_template` VALUES (9101773, '0', '0', '0', '0', '0', '9581', '0', '0', '0', 'Heroic Solakar Flamewreath', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.2', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '1283', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100400', '0', '10264', '0', '0', '1119', '1466', '', '1', '1.0', '6.12', '1.0', '1.1', '1.0', '0', '147', '1', '646655835', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101773 WHERE (`entry` = 10264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10264) AND (`map` = 229);
-- Heroic Quartermaster Zigris
DELETE FROM `creature_template` WHERE entry = 9101774;
INSERT INTO `creature_template` VALUES (9101774, '0', '0', '0', '0', '0', '9738', '0', '0', '0', 'Heroic Quartermaster Zigris', 'Bloodaxe Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '737', '2195', '', '1', '1.0', 
'6.22', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101774 WHERE (`entry` = 9736);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9736) AND (`map` = 229);
-- Heroic Halycon
DELETE FROM `creature_template` WHERE entry = 9101775;
INSERT INTO `creature_template` VALUES (9101775, '0', '0', '0', '0', '0', '9567', '0', '0', '0', 'Heroic Halycon', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '1100', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '10220', '0', '0', '0', '0', '', '1', '1.0', '6.18', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101775 WHERE (`entry` = 10220);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10220) AND (`map` = 229);
-- Heroic Highlord Omokk
DELETE FROM `creature_template` WHERE entry = 9101776;
INSERT INTO `creature_template` VALUES (9101776, '0', '0', '0', '0', '0', '11565', '0', '0', '0', 'Heroic Highlord Omokk', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9196', '0', '0', '0', '920', '2139', '', '1', '1.0', '6.3', '1.0', '1.0', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101776 WHERE (`entry` = 9196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9196) AND (`map` = 229);
-- Heroic Mother Smolderweb
DELETE FROM `creature_template` WHERE entry = 9101777;
INSERT INTO `creature_template` VALUES (9101777, '0', '0', '0', '0', '0', '9929', '0', '0', '0', 'Heroic Mother Smolderweb', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.36', '1.0', '1.0', '2.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101777 WHERE (`entry` = 10596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10596) AND (`map` = 229);
-- Heroic War Master Voone
DELETE FROM `creature_template` WHERE entry = 9101778;
INSERT INTO `creature_template` VALUES (9101778, '0', '0', '0', '0', '0', '9733', '0', '0', '0', 'Heroic War Master Voone', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9237', '0', '0', '0', '1330', '2212', '', '1', '1.0', '6.12', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101778 WHERE (`entry` = 9237);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9237) AND (`map` = 229);
-- Heroic Shadow Hunter Voshgajin
DELETE FROM `creature_template` WHERE entry = 9101779;
INSERT INTO `creature_template` VALUES (9101779, '0', '0', '0', '0', '0', '9732', '0', '0', '0', 'Heroic Shadow Hunter Voshgajin', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '4.91', '1300', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9236', '0', '0', '0', '988', '2172', '', '1', '1.0', '6.36', '1.0', '1.0', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101779 WHERE (`entry` = 9236);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9236) AND (`map` = 229);
-- Heroic Bannok Grimaxe
DELETE FROM `creature_template` WHERE entry = 9101780;
INSERT INTO `creature_template` VALUES (9101780, '0', '0', '0', '0', '0', '9668', '0', '0', '0', 'Heroic Bannok Grimaxe', 'Firebrand Legion Champion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9596', '9596', '0', '0', '0', '728', '2688', '', '1', '1.0', '5.24', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101780 WHERE (`entry` = 9596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9596) AND (`map` = 229);
-- Heroic Burning Felguard
DELETE FROM `creature_template` WHERE entry = 9101781;
INSERT INTO `creature_template` VALUES (9101781, '0', '0', '0', '0', '0', '5047', '0', '0', '0', 'Heroic Burning Felguard', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '2', '0', '4.05', '2300', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '10263', '0', '0', '0', '0', '905', '1186', '', '1', '1.0', '5.46', '2.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101781 WHERE (`entry` = 10263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10263) AND (`map` = 229);
-- Heroic Crystal Fang
DELETE FROM `creature_template` WHERE entry = 9101782;
INSERT INTO `creature_template` VALUES (9101782, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Heroic Crystal Fang', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.97', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10376', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '5.45', '1.0', '1.1', '1.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101782 WHERE (`entry` = 10376);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10376) AND (`map` = 229);
-- Heroic Ghok Bashguud
DELETE FROM `creature_template` WHERE entry = 9101783;
INSERT INTO `creature_template` VALUES (9101783, '0', '0', '0', '0', '0', '11809', '0', '0', '0', 'Heroic Ghok Bashguud', 'Bloodaxe Champion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.95', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9718', '0', '0', '0', '0', '142', '708', '', '1', '1.0', '4.96', '1.0', '1.1', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101783 WHERE (`entry` = 9718);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9718) AND (`map` = 229);
-- Heroic Spirestone Battle Lord
DELETE FROM `creature_template` WHERE entry = 9101784;
INSERT INTO `creature_template` VALUES (9101784, '0', '0', '0', '0', '0', '11576', '0', '0', '0', 'Heroic Spirestone Battle Lord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '2', '0', '4.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9218', '9218', '0', '0', '0', '1229', '1609', '', '1', '1.0', '5.22', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101784 WHERE (`entry` = 9218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9218) AND (`map` = 229);
-- Heroic Spirestone Butcher
DELETE FROM `creature_template` WHERE entry = 9101785;
INSERT INTO `creature_template` VALUES (9101785, '0', '0', '0', '0', '0', '11574', '0', '0', '0', 'Heroic Spirestone Butcher', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.04', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9219', '0', '0', '0', '0', '1226', '2245', '', '1', '1.0', '5.0', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101785 WHERE (`entry` = 9219);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9219) AND (`map` = 229);
-- Heroic Spirestone Lord Magus
DELETE FROM `creature_template` WHERE entry = 9101786;
INSERT INTO `creature_template` VALUES (9101786, '0', '0', '0', '0', '0', '11578', '0', '0', '0', 'Heroic Spirestone Lord Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9217', '0', '0', '0', '0', '1037', '1360', '', '0', '1.0', '5.31', '6.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101786 WHERE (`entry` = 9217);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9217) AND (`map` = 229);
-- Heroic Jed Runewatcher
DELETE FROM `creature_template` WHERE entry = 9101787;
INSERT INTO `creature_template` VALUES (9101787, '0', '0', '0', '0', '0', '9686', '0', '0', '0', 'Heroic Jed Runewatcher', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '3.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10509', '0', '0', '0', '0', '310', '1552', '', '1', '1.0', '4.89', '1.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101787 WHERE (`entry` = 10509);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10509) AND (`map` = 229);
-- Heroic Goraluk Anvilcrack
DELETE FROM `creature_template` WHERE entry = 9101788;
INSERT INTO `creature_template` VALUES (9101788, '0', '0', '0', '0', '0', '10222', '0', '0', '0', 'Heroic Goraluk Anvilcrack', 'Blackhand Legion Armorsmith', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10899', '0', '0', '0', '0', '981', '1286', '', '1', '1.0', '5.47', '3.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101788 WHERE (`entry` = 10899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10899) AND (`map` = 229);
-- Heroic Spire Scorpid
DELETE FROM `creature_template` WHERE entry = 9101789;
INSERT INTO `creature_template` VALUES (9101789, '0', '0', '0', '0', '0', '2864', '0', '0', '0', 'Heroic Spire Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9701', '0', '9701', '0', '0', '0', '0', '', '1', '1.0', '2.2', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101789 WHERE (`entry` = 9701);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9701) AND (`map` = 229);
-- Heroic Spire Scarab
DELETE FROM `creature_template` WHERE entry = 9101790;
INSERT INTO `creature_template` VALUES (9101790, '0', '0', '0', '0', '0', '9469', '0', '0', '0', 'Heroic Spire Scarab', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10177', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '2.29', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101790 WHERE (`entry` = 10177);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10177) AND (`map` = 229);
-- Heroic Spectral Assassin
DELETE FROM `creature_template` WHERE entry = 9101791;
INSERT INTO `creature_template` VALUES (9101791, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Heroic Spectral Assassin', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.47', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101791 WHERE (`entry` = 16066);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16066) AND (`map` = 229);
-- Heroic Scarshield Worg
DELETE FROM `creature_template` WHERE entry = 9101792;
INSERT INTO `creature_template` VALUES (9101792, '0', '0', '0', '0', '0', '11420', '0', '0', '0', 'Heroic Scarshield Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.92', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9416', '0', '9416', '8297', '0', '0', '0', '', '1', '1.0', '1.82', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101792 WHERE (`entry` = 9416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9416) AND (`map` = 229);
-- Heroic Rookery Whelp
DELETE FROM `creature_template` WHERE entry = 9101793;
INSERT INTO `creature_template` VALUES (9101793, '0', '0', '0', '0', '0', '397', '0', '0', '0', 'Heroic Rookery Whelp', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.04', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.02', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '64', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101793 WHERE (`entry` = 10161);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10161) AND (`map` = 229);
-- Heroic Elder Stonefort
DELETE FROM `creature_template` WHERE entry = 9101794;
INSERT INTO `creature_template` VALUES (9101794, '0', '0', '0', '0', '0', '15641', '0', '0', '0', 'Heroic Elder Stonefort', NULL, NULL, '21061', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.08', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.23', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101794 WHERE (`entry` = 15560);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15560) AND (`map` = 229);
-- Heroic Chromatic Whelp
DELETE FROM `creature_template` WHERE entry = 9101795;
INSERT INTO `creature_template` VALUES (9101795, '0', '0', '0', '0', '0', '10095', '0', '0', '0', 'Heroic Chromatic Whelp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.11111', '1.14286', '1.0', '1.0', '25.0', '1.0', '0', '0', '1.01', '1500', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10442', '0', '10442', '0', '0', '159', '896', '', '1', '1.0', '2.37', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101795 WHERE (`entry` = 10442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10442) AND (`map` = 229);
-- Heroic Burning Imp
DELETE FROM `creature_template` WHERE entry = 9101796;
INSERT INTO `creature_template` VALUES (9101796, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Heroic Burning Imp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.04', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.18', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101796 WHERE (`entry` = 9708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9708) AND (`map` = 229);
-- Heroic Burning Felhound
DELETE FROM `creature_template` WHERE entry = 9101797;
INSERT INTO `creature_template` VALUES (9101797, '0', '0', '0', '0', '0', '1913', '0', '0', '0', 'Heroic Burning Felhound', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.06', '1400', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.93', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101797 WHERE (`entry` = 10261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10261) AND (`map` = 229);
-- Heroic Bloodaxe Worg Pup
DELETE FROM `creature_template` WHERE entry = 9101798;
INSERT INTO `creature_template` VALUES (9101798, '0', '0', '0', '0', '0', '9563', '0', '0', '0', 'Heroic Bloodaxe Worg Pup', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '10221', '0', '10221', '13035', '0', '0', '0', '', '1', '1.0', '1.86', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101798 WHERE (`entry` = 10221);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10221) AND (`map` = 229);
-- Heroic Bloodaxe Worg
DELETE FROM `creature_template` WHERE entry = 9101799;
INSERT INTO `creature_template` VALUES (9101799, '0', '0', '0', '0', '0', '9562', '741', '0', '0', 'Heroic Bloodaxe Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '0.91', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9696', '0', '9696', '7344', '0', '0', '0', '', '1', '1.0', '2.18', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101799 WHERE (`entry` = 9696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9696) AND (`map` = 229);
-- Heroic Blackhand Incarcerator
DELETE FROM `creature_template` WHERE entry = 9101800;
INSERT INTO `creature_template` VALUES (9101800, '0', '0', '0', '0', '0', '9690', '9692', '9892', '9893', 'Heroic Blackhand Incarcerator', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.94', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10316', '9818', '0', '0', '0', '193', '985', '', '1', '1.0', '1.8', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101800 WHERE (`entry` = 10316);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10316) AND (`map` = 229);
-- Mythic Scarshield Acolyte
DELETE FROM `creature_template` WHERE entry = 9101801;
INSERT INTO `creature_template` VALUES (9101801, '0', '0', '0', '0', '0', '8898', '9596', '9853', '9854', 'Mythic Scarshield Acolyte', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9045', '9045', '0', '0', '0', '369', '2306', '', 
'1', '1.0', '4.41', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101801 WHERE (`entry` = 9045);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9045) AND (`map` = 229);
-- Mythic Scarshield Infiltrator
DELETE FROM `creature_template` WHERE entry = 9101802;
INSERT INTO `creature_template` VALUES (9101802, '0', '0', '0', '0', '0', '9642', '0', '0', '0', 'Mythic Scarshield Infiltrator', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101802 WHERE (`entry` = 10299);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10299) AND (`map` = 229);
-- Mythic Scarshield Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101803;
INSERT INTO `creature_template` VALUES (9101803, '0', '0', '0', '0', '0', '9629', '9630', '9857', '9858', 'Mythic Scarshield Legionnaire', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9097', '9097', '0', '0', '0', '402', '2367', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101803 WHERE (`entry` = 9097);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9097) AND (`map` = 229);
-- Mythic Scarshield Spellbinder
DELETE FROM `creature_template` WHERE entry = 9101804;
INSERT INTO `creature_template` VALUES (9101804, '0', '0', '0', '0', '0', '9618', '9620', '9863', '9864', 'Mythic Scarshield Spellbinder', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9098', '9098', '0', '0', '0', '361', '2313', '', '1', '1.0', '3.94', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101804 WHERE (`entry` = 9098);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9098) AND (`map` = 229);
-- Mythic Scarshield Warlock
DELETE FROM `creature_template` WHERE entry = 9101805;
INSERT INTO `creature_template` VALUES (9101805, '0', '0', '0', '0', '0', '9609', '9610', '9865', '9866', 'Mythic Scarshield Warlock', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9257', '9257', '0', '0', '0', '369', '2228', '', 
'1', '1.0', '4.34', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101805 WHERE (`entry` = 9257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9257) AND (`map` = 229);
-- Mythic Spirestone Enforcer
DELETE FROM `creature_template` WHERE entry = 9101806;
INSERT INTO `creature_template` VALUES (9101806, '0', '0', '0', '0', '0', '11577', '0', '0', '0', 'Mythic Spirestone Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9199', '9199', '0', '0', '0', '394', '2303', '', '1', '1.0', '3.95', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101806 WHERE (`entry` = 9199);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9199) AND (`map` = 229);
-- Mythic Spirestone Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101807;
INSERT INTO `creature_template` VALUES (9101807, '0', '0', '0', '0', '0', '11562', '0', '0', '0', 'Mythic Spirestone Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9201', '9201', '0', '0', '0', '518', '1687', '', '1', '1.0', '3.95', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101807 WHERE (`entry` = 9201);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9201) AND (`map` = 229);
-- Mythic Urok Enforcer
DELETE FROM `creature_template` WHERE entry = 9101808;
INSERT INTO `creature_template` VALUES (9101808, '0', '0', '0', '0', '0', '11584', '0', '0', '0', 'Mythic Urok Enforcer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10601', '0', '0', '0', '0', '133', '666', '', '1', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101808 WHERE (`entry` = 10601);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10601) AND (`map` = 229);
-- Mythic Urok Ogre Magus
DELETE FROM `creature_template` WHERE entry = 9101809;
INSERT INTO `creature_template` VALUES (9101809, '0', '0', '0', '0', '0', '11585', '0', '0', '0', 'Mythic Urok Ogre Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10602', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.09', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101809 WHERE (`entry` = 10602);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10602) AND (`map` = 229);
-- Mythic Spire Spiderling
DELETE FROM `creature_template` WHERE entry = 9101810;
INSERT INTO `creature_template` VALUES (9101810, '0', '0', '0', '0', '0', '9756', '0', '0', '0', 'Mythic Spire Spiderling', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.97', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '10375', '0', '0', '10515', '0', '0', '0', '', '1', '1.0', '4.41', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101810 WHERE (`entry` = 10375);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10375) AND (`map` = 229);
-- Mythic Scarshield Raider
DELETE FROM `creature_template` WHERE entry = 9101811;
INSERT INTO `creature_template` VALUES (9101811, '0', '0', '0', '0', '0', '9637', '9638', '9859', '9860', 'Mythic Scarshield Raider', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9258', '9258', '0', '0', '0', '419', '2288', '', '1', '1.0', '4.09', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101811 WHERE (`entry` = 9258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9258) AND (`map` = 229);
-- Mythic Smolderthorn Axe Thrower
DELETE FROM `creature_template` WHERE entry = 9101812;
INSERT INTO `creature_template` VALUES (9101812, '0', '0', '0', '0', '0', '9674', '9675', '9676', '9677', 'Mythic Smolderthorn Axe Thrower', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9267', '9267', '0', '0', '0', '379', '2466', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101812 WHERE (`entry` = 9267);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9267) AND (`map` = 229);
-- Mythic Smolderthorn Mystic
DELETE FROM `creature_template` WHERE entry = 9101813;
INSERT INTO `creature_template` VALUES (9101813, '0', '0', '0', '0', '0', '9709', '9710', '9711', '9712', 'Mythic Smolderthorn Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9239', '9239', '0', '0', '0', '375', '2470', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101813 WHERE (`entry` = 9239);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9239) AND (`map` = 229);
-- Mythic Smolderthorn Shadow Priest
DELETE FROM `creature_template` WHERE entry = 9101814;
INSERT INTO `creature_template` VALUES (9101814, '0', '0', '0', '0', '0', '9728', '9729', '9730', '9731', 'Mythic Smolderthorn Shadow Priest', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9240', '9240', '0', '0', '0', '427', '2460', '', '1', '1.0', '4.44', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101814 WHERE (`entry` = 9240);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9240) AND (`map` = 229);
-- Mythic Spirestone Mystic
DELETE FROM `creature_template` WHERE entry = 9101815;
INSERT INTO `creature_template` VALUES (9101815, '0', '0', '0', '0', '0', '11579', '0', '0', '0', 'Mythic Spirestone Mystic', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9198', '9198', '0', '0', '0', '558', '734', '', '0', '1.0', '4.38', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101815 WHERE (`entry` = 9198);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9198) AND (`map` = 229);
-- Mythic Spirestone Reaver
DELETE FROM `creature_template` WHERE entry = 9101816;
INSERT INTO `creature_template` VALUES (9101816, '0', '0', '0', '0', '0', '11581', '0', '0', '0', 'Mythic Spirestone Reaver', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9200', '9200', '0', '0', '0', '388', '2391', '', '1', '1.0', '4.1', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101816 WHERE (`entry` = 9200);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9200) AND (`map` = 229);
-- Mythic Firebrand Darkweaver
DELETE FROM `creature_template` WHERE entry = 9101817;
INSERT INTO `creature_template` VALUES (9101817, '0', '0', '0', '0', '0', '9644', '9645', '9867', '9868', 'Mythic Firebrand Darkweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9261', '9261', '0', '0', '0', '390', '2553', '', '1', '1.0', '4.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101817 WHERE (`entry` = 9261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9261) AND (`map` = 229);
-- Mythic Firebrand Grunt
DELETE FROM `creature_template` WHERE entry = 9101818;
INSERT INTO `creature_template` VALUES (9101818, '0', '0', '0', '0', '0', '9664', '9665', '9871', '9872', 'Mythic Firebrand Grunt', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2700', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9259', '9259', '0', '0', '0', '474', '2573', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101818 WHERE (`entry` = 9259);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9259) AND (`map` = 229);
-- Mythic Firebrand Invoker
DELETE FROM `creature_template` WHERE entry = 9101819;
INSERT INTO `creature_template` VALUES (9101819, '0', '0', '0', '0', '0', '9648', '9649', '9877', '9878', 'Mythic Firebrand Invoker', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9262', '9262', '0', '0', '0', '385', '2574', '', '1', '1.0', '4.01', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101819 WHERE (`entry` = 9262);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9262) AND (`map` = 229);
-- Mythic Smolderthorn Headhunter
DELETE FROM `creature_template` WHERE entry = 9101820;
INSERT INTO `creature_template` VALUES (9101820, '0', '0', '0', '0', '0', '9682', '9683', '9684', '9685', 'Mythic Smolderthorn Headhunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9241', '9241', '0', '0', '0', '458', '2378', '', '1', '1.0', '4.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101820 WHERE (`entry` = 9241);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9241) AND (`map` = 229);
-- Mythic Smolderthorn Seer
DELETE FROM `creature_template` WHERE entry = 9101821;
INSERT INTO `creature_template` VALUES (9101821, '0', '0', '0', '0', '0', '9715', '9716', '9717', '9718', 'Mythic Smolderthorn Seer', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9269', '9269', '0', '0', '0', '385', '2594', '', '1', '1.0', '4.19', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101821 WHERE (`entry` = 9269);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9269) AND (`map` = 229);
-- Mythic Smolderthorn Shadow Hunter
DELETE FROM `creature_template` WHERE entry = 9101822;
INSERT INTO `creature_template` VALUES (9101822, '0', '0', '0', '0', '0', '9724', '9725', '9726', '9727', 'Mythic Smolderthorn Shadow Hunter', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '1400', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9265', '9265', '0', '0', '0', '385', '2242', '', '1', '1.0', '4.5', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101822 WHERE (`entry` = 9265);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9265) AND (`map` = 229);
-- Mythic Smolderthorn Witch Doctor
DELETE FROM `creature_template` WHERE entry = 9101823;
INSERT INTO `creature_template` VALUES (9101823, '0', '0', '0', '0', '0', '9719', '9720', '9721', '9722', 'Mythic Smolderthorn Witch Doctor', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9266', '9266', '0', '0', '0', '381', '2611', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101823 WHERE (`entry` = 9266);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9266) AND (`map` = 229);
-- Mythic Superior Healing Ward
DELETE FROM `creature_template` WHERE entry = 9101824;
INSERT INTO `creature_template` VALUES (9101824, '0', '0', '0', '0', '0', '2030', '0', '0', '0', 'Mythic Superior Healing Ward', NULL, NULL, '0', '60', '60', '0', '58', '0', '1.0', '1.0', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '11', '0', '0', '0', '0', '0', '0', '44', '220', '', '0', '1.0', '3.85', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101824 WHERE (`entry` = 10218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10218) AND (`map` = 229);
-- Mythic Awbee
DELETE FROM `creature_template` WHERE entry = 9101825;
INSERT INTO `creature_template` VALUES (9101825, '0', '0', '0', '0', '0', '6293', '0', '0', '0', 'Mythic Awbee', NULL, NULL, '3063', '60', '60', '0', '35', '3', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '4.4', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101825 WHERE (`entry` = 10740);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10740) AND (`map` = 229);
-- Mythic Bloodaxe Raider
DELETE FROM `creature_template` WHERE entry = 9101826;
INSERT INTO `creature_template` VALUES (9101826, '0', '0', '0', '0', '0', '9602', '9603', '9875', '9876', 'Mythic Bloodaxe Raider', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9692', '9692', '0', '0', '0', '464', '1732', '', '1', 
'1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101826 WHERE (`entry` = 9692);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9692) AND (`map` = 229);
-- Mythic Bloodaxe Summoner
DELETE FROM `creature_template` WHERE entry = 9101827;
INSERT INTO `creature_template` VALUES (9101827, '0', '0', '0', '0', '0', '9613', '9614', '9879', '9880', 'Mythic Bloodaxe Summoner', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9717', '9717', '0', '0', '0', '387', '2104', '', '0', '1.0', '3.87', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101827 WHERE (`entry` = 9717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9717) AND (`map` = 229);
-- Mythic Bloodaxe Warmonger
DELETE FROM `creature_template` WHERE entry = 9101828;
INSERT INTO `creature_template` VALUES (9101828, '0', '0', '0', '0', '0', '9617', '9619', '9883', '9886', 'Mythic Bloodaxe Warmonger', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9716', '9716', '0', '0', '0', '468', '2526', '', '1', '1.0', '4.46', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101828 WHERE (`entry` = 9716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9716) AND (`map` = 229);
-- Mythic Firebrand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101829;
INSERT INTO `creature_template` VALUES (9101829, '0', '0', '0', '0', '0', '9652', '9653', '9869', '9870', 'Mythic Firebrand Dreadweaver', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9263', '9263', '0', '0', '0', '400', '2694', '', '1', '1.0', '4.11', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101829 WHERE (`entry` = 9263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9263) AND (`map` = 229);
-- Mythic Firebrand Legionnaire
DELETE FROM `creature_template` WHERE entry = 9101830;
INSERT INTO `creature_template` VALUES (9101830, '0', '0', '0', '0', '0', '9660', '9661', '9884', '9885', 'Mythic Firebrand Legionnaire', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9260', '9260', '0', '0', '0', '464', '2655', '', '1', '1.0', '4.12', '1.0', '1.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101830 WHERE (`entry` = 9260);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9260) AND (`map` = 229);
-- Mythic Firebrand Pyromancer
DELETE FROM `creature_template` WHERE entry = 9101831;
INSERT INTO `creature_template` VALUES (9101831, '0', '0', '0', '0', '0', '9656', '9657', '9888', '9889', 'Mythic Firebrand Pyromancer', 'Firebrand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '1300', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9264', '9264', '0', '0', '0', '396', '2532', '', '1', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101831 WHERE (`entry` = 9264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9264) AND (`map` = 229);
-- Mythic Smolderthorn Berserker
DELETE FROM `creature_template` WHERE entry = 9101832;
INSERT INTO `creature_template` VALUES (9101832, '0', '0', '0', '0', '0', '7803', '0', '0', '0', 'Mythic Smolderthorn Berserker', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9268', '9268', '0', '0', '0', '464', '2533', '', '1', '1.0', '4.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101832 WHERE (`entry` = 9268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9268) AND (`map` = 229);
-- Mythic Spire Spider
DELETE FROM `creature_template` WHERE entry = 9101833;
INSERT INTO `creature_template` VALUES (9101833, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Mythic Spire Spider', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10374', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.48', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101833 WHERE (`entry` = 10374);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10374) AND (`map` = 229);
-- Mythic Spirestone Battle Mage
DELETE FROM `creature_template` WHERE entry = 9101834;
INSERT INTO `creature_template` VALUES (9101834, '0', '0', '0', '0', '0', '11543', '0', '0', '0', 'Mythic Spirestone Battle Mage', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9197', '9197', '0', '0', '0', '561', '2274', '', '1', '1.0', '4.41', '5.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101834 WHERE (`entry` = 9197);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9197) AND (`map` = 229);
-- Mythic Spirestone Warlord
DELETE FROM `creature_template` WHERE entry = 9101835;
INSERT INTO `creature_template` VALUES (9101835, '0', '0', '0', '0', '0', '11582', '0', '0', '0', 'Mythic Spirestone Warlord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9216', '9216', '0', '0', '0', '689', '2376', '', '1', '1.0', '4.12', '1.0', '1.0', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101835 WHERE (`entry` = 9216);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9216) AND (`map` = 229);
-- Mythic Bijou
DELETE FROM `creature_template` WHERE entry = 9101836;
INSERT INTO `creature_template` VALUES (9101836, '0', '0', '0', '0', '0', '9553', '0', '0', '0', 'Mythic Bijou', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '10257', '0', '0', '1', '817', '', '1', '1.0', '3.92', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101836 WHERE (`entry` = 10257);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10257) AND (`map` = 229);
-- Mythic Bloodaxe Evoker
DELETE FROM `creature_template` WHERE entry = 9101837;
INSERT INTO `creature_template` VALUES (9101837, '0', '0', '0', '0', '0', '9625', '9626', '9873', '9874', 'Mythic Bloodaxe Evoker', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9693', '9693', '0', '0', '0', '414', '2640', '', '1', 
'1.0', '3.87', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101837 WHERE (`entry` = 9693);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9693) AND (`map` = 229);
-- Mythic Bloodaxe Veteran
DELETE FROM `creature_template` WHERE entry = 9101838;
INSERT INTO `creature_template` VALUES (9101838, '0', '0', '0', '0', '0', '9633', '9634', '9881', '9882', 'Mythic Bloodaxe Veteran', 'Bloodaxe Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '1200', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9583', '9583', '0', '0', '0', '620', '2692', '', '1', '1.0', '3.94', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101838 WHERE (`entry` = 9583);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9583) AND (`map` = 229);
-- Mythic Rage Talon Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101839;
INSERT INTO `creature_template` VALUES (9101839, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Mythic Rage Talon Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9096', '0', '9096', '0', '0', '497', '2819', '', '1', '1.0', '3.87', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101839 WHERE (`entry` = 9096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9096) AND (`map` = 229);
-- Mythic Rage Talon Flamescale
DELETE FROM `creature_template` WHERE entry = 9101840;
INSERT INTO `creature_template` VALUES (9101840, '0', '0', '0', '0', '0', '8249', '0', '0', '0', 'Mythic Rage Talon Flamescale', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10083', '0', '10083', '0', '0', '406', '2600', '', '1', '1.0', '4.38', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101840 WHERE (`entry` = 10083);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10083) AND (`map` = 229);
-- Mythic Rookery Guardian
DELETE FROM `creature_template` WHERE entry = 9101841;
INSERT INTO `creature_template` VALUES (9101841, '0', '0', '0', '0', '0', '2554', '0', '0', '0', 'Mythic Rookery Guardian', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10258', '0', '10258', '0', '0', '152', '761', '', '1', '1.0', '4.31', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101841 WHERE (`entry` = 10258);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10258) AND (`map` = 229);
-- Mythic Rookery Hatcher
DELETE FROM `creature_template` WHERE entry = 9101842;
INSERT INTO `creature_template` VALUES (9101842, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Mythic Rookery Hatcher', NULL, NULL, '0', '60', '60', '0', '16', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '1292', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10683', '0', '10683', '0', '0', '152', '903', '', '1', '1.0', '3.85', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101842 WHERE (`entry` = 10683);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10683) AND (`map` = 229);
-- Mythic Blackhand Dragon Handler
DELETE FROM `creature_template` WHERE entry = 9101843;
INSERT INTO `creature_template` VALUES (9101843, '0', '0', '0', '0', '0', '10176', '10177', '10178', '10179', 'Mythic Blackhand Dragon Handler', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10742', '9818', '0', '0', '0', '493', '1506', '', '1', '1.0', '3.88', '1.0', '3.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101843 WHERE (`entry` = 10742);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10742) AND (`map` = 229);
-- Mythic Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101844;
INSERT INTO `creature_template` VALUES (9101844, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Mythic Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9817', '9817', '0', '0', '0', '416', '2911', '', '1', '1.0', '4.22', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101844 WHERE (`entry` = 9817);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9817) AND (`map` = 229);
-- Mythic Blackhand Summoner
DELETE FROM `creature_template` WHERE entry = 9101845;
INSERT INTO `creature_template` VALUES (9101845, '0', '0', '0', '0', '0', '9849', '9850', '9851', '9852', 'Mythic Blackhand Summoner', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', 
'1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9818', '9818', '0', '0', '0', '412', '2937', '', '1', '1.0', '4.2', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101845 WHERE (`entry` = 9818);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9818) AND (`map` = 229);
-- Mythic Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101846;
INSERT INTO `creature_template` VALUES (9101846, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Mythic Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9819', '9818', '0', '0', '0', '480', '3001', '', '1', '1.0', '4.03', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101846 WHERE (`entry` = 9819);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9819) AND (`map` = 229);
-- Mythic Chromatic Dragonspawn
DELETE FROM `creature_template` WHERE entry = 9101847;
INSERT INTO `creature_template` VALUES (9101847, '0', '0', '0', '0', '0', '10094', '0', '0', '0', 'Mythic Chromatic Dragonspawn', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '25.0', '1.0', '1', '0', '2.93', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10447', '0', '10447', '0', '0', '663', '2288', '', '1', '1.0', '4.16', '1.0', '1.1', '1.0', '0', '0', '1', '1', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101847 WHERE (`entry` = 10447);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10447) AND (`map` = 229);
-- Mythic Chromatic Elite Guard
DELETE FROM `creature_template` WHERE entry = 9101848;
INSERT INTO `creature_template` VALUES (9101848, '0', '0', '0', '0', '0', '10116', '0', '0', '0', 'Mythic Chromatic Elite Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10814', '0', '10814', '0', '0', '1117', '2830', '', '1', '1.0', '3.92', '1.0', '1.1', '1.0', '0', '0', '1', '537601024', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101848 WHERE (`entry` = 10814);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10814) AND (`map` = 229);
-- Mythic Summoned Blackhand Dreadweaver
DELETE FROM `creature_template` WHERE entry = 9101849;
INSERT INTO `creature_template` VALUES (9101849, '0', '0', '0', '0', '0', '9670', '9671', '9672', '9673', 'Mythic Summoned Blackhand Dreadweaver', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '1274', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10680', '0', '0', '0', '0', '412', '1363', '', '0', '1.0', '4.13', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101849 WHERE (`entry` = 10680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10680) AND (`map` = 229);
-- Mythic Summoned Blackhand Veteran
DELETE FROM `creature_template` WHERE entry = 9101850;
INSERT INTO `creature_template` VALUES (9101850, '0', '0', '0', '0', '0', '9686', '9687', '9896', '9897', 'Mythic Summoned Blackhand Veteran', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '1274', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10681', '0', '0', '0', '0', '488', '643', '', '0', '1.0', '4.11', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101850 WHERE (`entry` = 10681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10681) AND (`map` = 229);
-- Mythic Doomguard
DELETE FROM `creature_template` WHERE entry = 9101851;
INSERT INTO `creature_template` VALUES (9101851, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Mythic Doomguard', NULL, NULL, '0', '60', '60', '2', '954', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '1551', '1.0', '1.0', '2', '0', '2048', '0', '19', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '126', '631', '', '1', '1.0', '3.94', '0.77', '1.35', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101851 WHERE (`entry` = 11859);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11859) AND (`map` = 229);
-- Mythic Warosh
DELETE FROM `creature_template` WHERE entry = 9101852;
INSERT INTO `creature_template` VALUES (9101852, '0', '0', '0', '0', '0', '763', '0', '0', '0', 'Mythic Warosh', 'The Cursed', NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '1', '752', '', '1', '1.0', '4.49', '1.0', '0.9', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101852 WHERE (`entry` = 10799);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10799) AND (`map` = 229);
-- Mythic Blackhand Thug
DELETE FROM `creature_template` WHERE entry = 9101853;
INSERT INTO `creature_template` VALUES (9101853, '0', '0', '0', '0', '0', '10172', '10173', '10174', '10175', 'Mythic Blackhand Thug', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10762', '9818', '0', '0', '0', '737', '967', '', '1', '1.0', '4.07', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101853 WHERE (`entry` = 10762);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10762) AND (`map` = 229);
-- Mythic Finkle Einhorn
DELETE FROM `creature_template` WHERE entry = 9101854;
INSERT INTO `creature_template` VALUES (9101854, '0', '0', '0', '0', '0', '10089', '0', '0', '0', 'Mythic Finkle Einhorn', NULL, NULL, '2951', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101854 WHERE (`entry` = 10776);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10776) AND (`map` = 229);
-- Mythic Blackhand Assassin
DELETE FROM `creature_template` WHERE entry = 9101855;
INSERT INTO `creature_template` VALUES (9101855, '0', '0', '0', '0', '0', '9691', '9887', '0', '0', 'Mythic Blackhand Assassin', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10318', '10318', '0', '0', '0', '766', '2658', '', '1', 
'1.0', '3.93', '1.0', '0.6', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101855 WHERE (`entry` = 10318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10318) AND (`map` = 229);
-- Mythic Blackhand Elite
DELETE FROM `creature_template` WHERE entry = 9101856;
INSERT INTO `creature_template` VALUES (9101856, '0', '0', '0', '0', '0', '9734', '9735', '9890', '9891', 'Mythic Blackhand Elite', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2300', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10317', '10317', '0', '0', '0', '528', '3166', '', '1', '1.0', '3.82', '1.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101856 WHERE (`entry` = 10317);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10317) AND (`map` = 229);
-- Mythic Blackhand Iron Guard
DELETE FROM `creature_template` WHERE entry = 9101857;
INSERT INTO `creature_template` VALUES (9101857, '0', '0', '0', '0', '0', '9696', '9697', '9894', '9895', 'Mythic Blackhand Iron Guard', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10319', '9818', '0', '0', '0', '609', '2771', '', '1', '1.0', '4.15', '1.0', '2.3', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101857 WHERE (`entry` = 10319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10319) AND (`map` = 229);
-- Mythic Rage Talon Dragon Guard
DELETE FROM `creature_template` WHERE entry = 9101858;
INSERT INTO `creature_template` VALUES (9101858, '0', '0', '0', '0', '0', '9753', '0', '0', '0', 'Mythic Rage Talon Dragon Guard', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10366', '0', '10366', '0', '0', '907', '2717', '', '1', '1.0', '4.01', '1.0', '1.75', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101858 WHERE (`entry` = 10366);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10366) AND (`map` = 229);
-- Mythic Rage Talon Fire Tongue
DELETE FROM `creature_template` WHERE entry = 9101859;
INSERT INTO `creature_template` VALUES (9101859, '0', '0', '0', '0', '0', '8309', '0', '0', '0', 'Mythic Rage Talon Fire Tongue', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10372', '0', '10372', '0', '0', '619', '2979', '', '1', '1.0', '4.03', '3.0', '1.15', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101859 WHERE (`entry` = 10372);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10372) AND (`map` = 229);
-- Mythic Rage Talon Captain
DELETE FROM `creature_template` WHERE entry = 9101860;
INSERT INTO `creature_template` VALUES (9101860, '0', '0', '0', '0', '0', '8310', '0', '0', '0', 'Mythic Rage Talon Captain', NULL, NULL, '0', '60', '60', '0', '40', '0', '0.888888', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '10371', '0', '10371', '0', '0', '910', '2568', '', '1', '1.0', '4.03', 
'1.0', '1.2', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101860 WHERE (`entry` = 10371);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10371) AND (`map` = 229);
-- Mythic Vaelastrasz the Red
DELETE FROM `creature_template` WHERE entry = 9101861;
INSERT INTO `creature_template` VALUES (9101861, '0', '0', '0', '0', '0', '9912', '0', '0', '0', 'Mythic Vaelastrasz the Red', NULL, NULL, '0', '60', '60', '0', '250', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '100001', '0', '0', '164', '818', '', '0', '1.0', '4.0', '60.0', '1.2', '1.0', '0', '0', '1', '650854239', '0', '1073741824', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101861 WHERE (`entry` = 10340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10340) AND (`map` = 229);
-- Mythic Spirit of Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101862;
INSERT INTO `creature_template` VALUES (9101862, '0', '0', '0', '0', '0', '15987', '0', '0', '0', 'Mythic Spirit of Lord Valthalak', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.08', '1.0', '2.2', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101862 WHERE (`entry` = 16073);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16073) AND (`map` = 229);
-- Mythic Lord Victor Nefarius
DELETE FROM `creature_template` WHERE entry = 9101863;
INSERT INTO `creature_template` VALUES (9101863, '0', '0', '0', '0', '0', '9472', '0', '0', '0', 'Mythic Lord Victor Nefarius', 'Lord of Blackrock', NULL, '21330', '60', '60', '0', '14', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '33088', '2048', '0', '0', '0', '0', '0', '0', '2', '68', '0', '0', '100001', '0', '0', '1360', '1781', '', '1', '1.0', '3.96', '100.0', '1.6', '1.0', '0', '0', '1', '1691041627', '0', '3', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101863 WHERE (`entry` = 10162);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10162) AND (`map` = 229);
-- Mythic General Drakkisath
DELETE FROM `creature_template` WHERE entry = 9101864;
INSERT INTO `creature_template` VALUES (9101864, '0', '0', '0', '0', '0', '10115', '0', '0', '0', 'Mythic General Drakkisath', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '0.992063', '1.0', '1.0', '20.0', '1.0', '3', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10363', '0', '0', '1439', '2164', '', '1', '1.0', '8.05', '3.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101864 WHERE (`entry` = 10363);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10363) AND (`map` = 229);
-- Mythic Lord Valthalak
DELETE FROM `creature_template` WHERE entry = 9101865;
INSERT INTO `creature_template` VALUES (9101865, '0', '0', '0', '0', '0', '14308', '0', '0', '0', 'Mythic Lord Valthalak', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '7.04', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '0', '0', '0', '1000', '3000', '', '0', '1.0', '8.46', '1.0', '1.3', '1.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101865 WHERE (`entry` = 16042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16042) AND (`map` = 229);
-- Mythic Pyroguard Emberseer
DELETE FROM `creature_template` WHERE entry = 9101866;
INSERT INTO `creature_template` VALUES (9101866, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Mythic Pyroguard Emberseer', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '3', '2', '6.92', '2000', '2000', '1.0', '1.0', '1', '33554752', '2048', '0', '0', '0', '0', '0', '0', '4', '8', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.81', '3.0', '1.1', '2.0', '0', '144', '1', '1686863835', '4', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101866 WHERE (`entry` = 9816);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9816) AND (`map` = 229);
-- Mythic The Beast
DELETE FROM `creature_template` WHERE entry = 9101867;
INSERT INTO `creature_template` VALUES (9101867, '0', '0', '0', '0', '0', '10193', '0', '0', '0', 'Mythic The Beast', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '3', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '45', '0', '0', '0', '0', '1', '65545', '9100500', '0', '10430', '0', '0', '0', '0', '', '1', '1.0', '8.37', '1.0', '1.2', '2.0', '0', '0', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101867 WHERE (`entry` = 10430);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10430) AND (`map` = 229);
-- Mythic Warchief Rend Blackhand
DELETE FROM `creature_template` WHERE entry = 9101868;
INSERT INTO `creature_template` VALUES (9101868, '0', '0', '0', '0', '0', '9778', '0', '0', '0', 'Mythic Warchief Rend Blackhand', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', 
'1.0', '20.0', '1.0', '3', '0', '6.9', '2400', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '8', '9100500', '0', '0', '0', '0', '6929', '34647', '', '1', '1.0', '8.49', 
'1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '1', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101868 WHERE (`entry` = 10429);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10429) AND (`map` = 229);
-- Mythic Gyth
DELETE FROM `creature_template` WHERE entry = 9101869;
INSERT INTO `creature_template` VALUES (9101869, '0', '0', '0', '0', '0', '9806', '0', '0', '0', 'Mythic Gyth', 'Rend Blackhand''s Mount', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10339', '0', '0', '1462', '1915', '', '1', '1.0', '8.09', '1.0', '1.2', '2.0', '0', '144', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101869 WHERE (`entry` = 10339);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10339) AND (`map` = 229);
-- Mythic Urok Doomhowl
DELETE FROM `creature_template` WHERE entry = 9101870;
INSERT INTO `creature_template` VALUES (9101870, '0', '0', '0', '0', '0', '11583', '0', '0', '0', 'Mythic Urok Doomhowl', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.95', '3200', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '1425', '1866', '', '1', '1.0', '7.88', '1.0', '1.1', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101870 WHERE (`entry` = 10584);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10584) AND (`map` = 229);
-- Mythic Gizrul the Slavener
DELETE FROM `creature_template` WHERE entry = 9101871;
INSERT INTO `creature_template` VALUES (9101871, '0', '0', '0', '0', '0', '9564', '0', '0', '0', 'Mythic Gizrul the Slavener', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '10268', '0', '0', '0', '0', '', '2', '1.0', '8.28', '1.0', 
'1.1', '2.0', '0', '144', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101871 WHERE (`entry` = 10268);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10268) AND (`map` = 229);
-- Mythic Mor Grayhoof
DELETE FROM `creature_template` WHERE entry = 9101872;
INSERT INTO `creature_template` VALUES (9101872, '0', '0', '0', '0', '0', '15997', '0', '0', '0', 'Mythic Mor Grayhoof', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '1200', '1500', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '2139', '2798', '', '1', '1.0', '8.19', '15.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101872 WHERE (`entry` = 16080);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16080) AND (`map` = 229);
-- Mythic Overlord Wyrmthalak
DELETE FROM `creature_template` WHERE entry = 9101873;
INSERT INTO `creature_template` VALUES (9101873, '0', '0', '0', '0', '0', '8711', '0', '0', '0', 'Mythic Overlord Wyrmthalak', NULL, NULL, '0', '63', '63', '0', '40', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '9100500', '0', '9568', '0', '0', '1124', '1966', '', '1', '1.0', '7.94', '1.0', '1.1', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101873 WHERE (`entry` = 9568);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9568) AND (`map` = 229);
-- Mythic Solakar Flamewreath
DELETE FROM `creature_template` WHERE entry = 9101874;
INSERT INTO `creature_template` VALUES (9101874, '0', '0', '0', '0', '0', '9581', '0', '0', '0', 'Mythic Solakar Flamewreath', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.2', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '1283', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '2', '8', '9100500', '0', '10264', '0', '0', '1119', '1466', '', '1', '1.0', '8.0', '1.0', '1.1', '1.0', '0', '147', '1', '646655835', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101874 WHERE (`entry` = 10264);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10264) AND (`map` = 229);
-- Mythic Quartermaster Zigris
DELETE FROM `creature_template` WHERE entry = 9101875;
INSERT INTO `creature_template` VALUES (9101875, '0', '0', '0', '0', '0', '9738', '0', '0', '0', 'Mythic Quartermaster Zigris', 'Bloodaxe Legion', NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '737', '2195', '', '1', '1.0', 
'8.3', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101875 WHERE (`entry` = 9736);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9736) AND (`map` = 229);
-- Mythic Halycon
DELETE FROM `creature_template` WHERE entry = 9101876;
INSERT INTO `creature_template` VALUES (9101876, '0', '0', '0', '0', '0', '9567', '0', '0', '0', 'Mythic Halycon', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '1100', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '10220', '0', '0', '0', '0', '', '1', '1.0', '8.39', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101876 WHERE (`entry` = 10220);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10220) AND (`map` = 229);
-- Mythic Highlord Omokk
DELETE FROM `creature_template` WHERE entry = 9101877;
INSERT INTO `creature_template` VALUES (9101877, '0', '0', '0', '0', '0', '11565', '0', '0', '0', 'Mythic Highlord Omokk', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '3200', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9196', '0', '0', '0', '920', '2139', '', '1', '1.0', '8.35', '1.0', 
'1.0', '2.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101877 WHERE (`entry` = 9196);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9196) AND (`map` = 229);
-- Mythic Mother Smolderweb
DELETE FROM `creature_template` WHERE entry = 9101878;
INSERT INTO `creature_template` VALUES (9101878, '0', '0', '0', '0', '0', '9929', '0', '0', '0', 'Mythic Mother Smolderweb', NULL, NULL, '0', '63', '63', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '1500', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.94', '1.0', '1.0', '2.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101878 WHERE (`entry` = 10596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10596) AND (`map` = 229);
-- Mythic War Master Voone
DELETE FROM `creature_template` WHERE entry = 9101879;
INSERT INTO `creature_template` VALUES (9101879, '0', '0', '0', '0', '0', '9733', '0', '0', '0', 'Mythic War Master Voone', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '7.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9237', '0', '0', '0', '1330', '2212', '', '1', '1.0', '7.83', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101879 WHERE (`entry` = 9237);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9237) AND (`map` = 229);
-- Mythic Shadow Hunter Voshgajin
DELETE FROM `creature_template` WHERE entry = 9101880;
INSERT INTO `creature_template` VALUES (9101880, '0', '0', '0', '0', '0', '9732', '0', '0', '0', 'Mythic Shadow Hunter Voshgajin', NULL, NULL, '0', '63', '63', '0', '40', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.0', '1300', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9236', '0', '0', '0', '988', '2172', '', '1', '1.0', '8.07', 
'1.0', '1.0', '2.0', '0', '0', '1', '1686847451', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101880 WHERE (`entry` = 9236);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9236) AND (`map` = 229);
-- Mythic Bannok Grimaxe
DELETE FROM `creature_template` WHERE entry = 9101881;
INSERT INTO `creature_template` VALUES (9101881, '0', '0', '0', '0', '0', '9668', '0', '0', '0', 'Mythic Bannok Grimaxe', 'Firebrand Legion Champion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9596', '9596', '0', '0', '0', '728', '2688', '', '1', '1.0', '7.47', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101881 WHERE (`entry` = 9596);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9596) AND (`map` = 229);
-- Mythic Burning Felguard
DELETE FROM `creature_template` WHERE entry = 9101882;
INSERT INTO `creature_template` VALUES (9101882, '0', '0', '0', '0', '0', '5047', '0', '0', '0', 'Mythic Burning Felguard', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '2', '0', '5.95', '2300', '1292', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '10263', '0', '0', '0', '0', '905', '1186', '', '1', '1.0', '7.06', '2.0', '1.0', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101882 WHERE (`entry` = 10263);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10263) AND (`map` = 229);
-- Mythic Crystal Fang
DELETE FROM `creature_template` WHERE entry = 9101883;
INSERT INTO `creature_template` VALUES (9101883, '0', '0', '0', '0', '0', '9755', '0', '0', '0', 'Mythic Crystal Fang', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.98', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10376', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '7.39', '1.0', '1.1', '1.0', '0', '0', '1', '613105115', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101883 WHERE (`entry` = 10376);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10376) AND (`map` = 229);
-- Mythic Ghok Bashguud
DELETE FROM `creature_template` WHERE entry = 9101884;
INSERT INTO `creature_template` VALUES (9101884, '0', '0', '0', '0', '0', '11809', '0', '0', '0', 'Mythic Ghok Bashguud', 'Bloodaxe Champion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.96', '2000', '1283', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9718', '0', '0', '0', '0', '142', '708', '', '1', '1.0', '7.04', '1.0', '1.1', '1.0', '0', '0', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101884 WHERE (`entry` = 9718);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9718) AND (`map` = 229);
-- Mythic Spirestone Battle Lord
DELETE FROM `creature_template` WHERE entry = 9101885;
INSERT INTO `creature_template` VALUES (9101885, '0', '0', '0', '0', '0', '11576', '0', '0', '0', 'Mythic Spirestone Battle Lord', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '2', '0', '5.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9218', '9218', '0', '0', '0', '1229', '1609', '', '1', '1.0', '6.93', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101885 WHERE (`entry` = 9218);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9218) AND (`map` = 229);
-- Mythic Spirestone Butcher
DELETE FROM `creature_template` WHERE entry = 9101886;
INSERT INTO `creature_template` VALUES (9101886, '0', '0', '0', '0', '0', '11574', '0', '0', '0', 'Mythic Spirestone Butcher', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9219', '0', '0', '0', '0', '1226', '2245', '', '1', '1.0', '7.37', '1.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101886 WHERE (`entry` = 9219);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9219) AND (`map` = 229);
-- Mythic Spirestone Lord Magus
DELETE FROM `creature_template` WHERE entry = 9101887;
INSERT INTO `creature_template` VALUES (9101887, '0', '0', '0', '0', '0', '11578', '0', '0', '0', 'Mythic Spirestone Lord Magus', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9217', '0', '0', '0', '0', '1037', '1360', '', '0', '1.0', '7.29', '6.0', '1.0', '1.0', '0', '51', '1', '612449875', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101887 WHERE (`entry` = 9217);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9217) AND (`map` = 229);
-- Mythic Jed Runewatcher
DELETE FROM `creature_template` WHERE entry = 9101888;
INSERT INTO `creature_template` VALUES (9101888, '0', '0', '0', '0', '0', '9686', '0', '0', '0', 'Mythic Jed Runewatcher', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10509', '0', '0', '0', '0', '310', '1552', '', '1', '1.0', '7.45', '1.0', '1.1', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101888 WHERE (`entry` = 10509);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10509) AND (`map` = 229);
-- Mythic Goraluk Anvilcrack
DELETE FROM `creature_template` WHERE entry = 9101889;
INSERT INTO `creature_template` VALUES (9101889, '0', '0', '0', '0', '0', '10222', '0', '0', '0', 'Mythic Goraluk Anvilcrack', 'Blackhand Legion Armorsmith', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10899', '0', '0', '0', '0', '981', '1286', '', '1', '1.0', '7.45', '3.0', '1.15', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101889 WHERE (`entry` = 10899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10899) AND (`map` = 229);
-- Mythic Spire Scorpid
DELETE FROM `creature_template` WHERE entry = 9101890;
INSERT INTO `creature_template` VALUES (9101890, '0', '0', '0', '0', '0', '2864', '0', '0', '0', 'Mythic Spire Scorpid', NULL, NULL, '0', '60', '60', '0', '413', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9701', '0', '9701', '0', '0', '0', '0', '', '1', '1.0', '3.43', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101890 WHERE (`entry` = 9701);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9701) AND (`map` = 229);
-- Mythic Spire Scarab
DELETE FROM `creature_template` WHERE entry = 9101891;
INSERT INTO `creature_template` VALUES (9101891, '0', '0', '0', '0', '0', '9469', '0', '0', '0', 'Mythic Spire Scarab', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '10177', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '3.45', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101891 WHERE (`entry` = 10177);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10177) AND (`map` = 229);
-- Mythic Spectral Assassin
DELETE FROM `creature_template` WHERE entry = 9101892;
INSERT INTO `creature_template` VALUES (9101892, '0', '0', '0', '0', '0', '15982', '15999', '0', '0', 'Mythic Spectral Assassin', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.88', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101892 WHERE (`entry` = 16066);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16066) AND (`map` = 229);
-- Mythic Scarshield Worg
DELETE FROM `creature_template` WHERE entry = 9101893;
INSERT INTO `creature_template` VALUES (9101893, '0', '0', '0', '0', '0', '11420', '0', '0', '0', 'Mythic Scarshield Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9416', '0', '9416', '8297', '0', '0', '0', '', '1', '1.0', '3.39', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101893 WHERE (`entry` = 9416);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9416) AND (`map` = 229);
-- Mythic Rookery Whelp
DELETE FROM `creature_template` WHERE entry = 9101894;
INSERT INTO `creature_template` VALUES (9101894, '0', '0', '0', '0', '0', '397', '0', '0', '0', 'Mythic Rookery Whelp', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.11111', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.93', '2000', '1595', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.93', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '64', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101894 WHERE (`entry` = 10161);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10161) AND (`map` = 229);
-- Mythic Elder Stonefort
DELETE FROM `creature_template` WHERE entry = 9101895;
INSERT INTO `creature_template` VALUES (9101895, '0', '0', '0', '0', '0', '15641', '0', '0', '0', 'Mythic Elder Stonefort', NULL, NULL, '21061', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.0', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.9', '1.0', '1.75', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101895 WHERE (`entry` = 15560);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15560) AND (`map` = 229);
-- Mythic Chromatic Whelp
DELETE FROM `creature_template` WHERE entry = 9101896;
INSERT INTO `creature_template` VALUES (9101896, '0', '0', '0', '0', '0', '10095', '0', '0', '0', 'Mythic Chromatic Whelp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.11111', '1.14286', '1.0', '1.0', '25.0', '1.0', '0', '0', '2.08', '1500', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '2', '0', '10442', '0', '10442', '0', '0', '159', '896', '', '1', '1.0', '2.81', '3.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101896 WHERE (`entry` = 10442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10442) AND (`map` = 229);
-- Mythic Burning Imp
DELETE FROM `creature_template` WHERE entry = 9101897;
INSERT INTO `creature_template` VALUES (9101897, '0', '0', '0', '0', '0', '4449', '0', '0', '0', 'Mythic Burning Imp', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.05', '1400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.36', '1.0', '1.0', '1.0', '0', 
'0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101897 WHERE (`entry` = 9708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9708) AND (`map` = 229);
-- Mythic Burning Felhound
DELETE FROM `creature_template` WHERE entry = 9101898;
INSERT INTO `creature_template` VALUES (9101898, '0', '0', '0', '0', '0', '1913', '0', '0', '0', 'Mythic Burning Felhound', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.09', '1400', '1617', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101898 WHERE (`entry` = 10261);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10261) AND (`map` = 229);
-- Mythic Bloodaxe Worg Pup
DELETE FROM `creature_template` WHERE entry = 9101899;
INSERT INTO `creature_template` VALUES (9101899, '0', '0', '0', '0', '0', '9563', '0', '0', '0', 'Mythic Bloodaxe Worg Pup', NULL, NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '10221', '0', '10221', '13035', '0', '0', '0', '', '1', '1.0', '3.16', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101899 WHERE (`entry` = 10221);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10221) AND (`map` = 229);
-- Mythic Bloodaxe Worg
DELETE FROM `creature_template` WHERE entry = 9101900;
INSERT INTO `creature_template` VALUES (9101900, '0', '0', '0', '0', '0', '9562', '741', '0', '0', 'Mythic Bloodaxe Worg', 'Scarshield Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '1.94', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '1', '0', '0', '0', '0', '1', '1', '9696', '0', '9696', '7344', '0', '0', '0', '', '1', '1.0', '3.31', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101900 WHERE (`entry` = 9696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9696) AND (`map` = 229);
-- Mythic Blackhand Incarcerator
DELETE FROM `creature_template` WHERE entry = 9101901;
INSERT INTO `creature_template` VALUES (9101901, '0', '0', '0', '0', '0', '9690', '9692', '9892', '9893', 'Mythic Blackhand Incarcerator', 'Blackhand Legion', NULL, '0', '60', '60', '0', '40', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.99', '2000', '2000', '1.0', '1.0', '1', '33536', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10316', '9818', '0', '0', '0', '193', '985', '', '1', '1.0', '2.98', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101901 WHERE (`entry` = 10316);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10316) AND (`map` = 229);