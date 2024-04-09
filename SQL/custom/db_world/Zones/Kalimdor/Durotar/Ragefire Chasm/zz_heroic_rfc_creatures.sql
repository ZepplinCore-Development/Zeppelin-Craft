-- Heroic Earthborer
DELETE FROM `creature_template` WHERE entry = 9100000;
INSERT INTO `creature_template` VALUES (9100000, '0', '0', '0', '0', '0', '11010', '0', '0', '0', 'Heroic Earthborer', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '11320', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '2.88', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100000 WHERE (`entry` = 11320);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11320) AND (`map` = 389);
-- Heroic Molten Elemental
DELETE FROM `creature_template` WHERE entry = 9100001;
INSERT INTO `creature_template` VALUES (9100001, '0', '0', '0', '0', '0', '2075', '0', '0', '0', 'Heroic Molten Elemental', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '11321', '0', '100020', '0', '0', '0', '0', '', '1', '1.0', '2.88', '1.0', '1.2', '1.0', '0', '0', '1', '646016863', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100001 WHERE (`entry` = 11321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11321) AND (`map` = 389);
-- Heroic Ragefire Shaman
DELETE FROM `creature_template` WHERE entry = 9100002;
INSERT INTO `creature_template` VALUES (9100002, '0', '0', '0', '0', '0', '11610', '0', '0', '0', 'Heroic Ragefire Shaman', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11319', '11319', '0', '0', '0', '0', '0', '', '1', '1.0', '2.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100002 WHERE (`entry` = 11319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11319) AND (`map` = 389);
-- Heroic Ragefire Trogg
DELETE FROM `creature_template` WHERE entry = 9100003;
INSERT INTO `creature_template` VALUES (9100003, '0', '0', '0', '0', '0', '11609', '0', '0', '0', 'Heroic Ragefire Trogg', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11318', '11318', '0', '0', '0', '0', '0', '', '1', '1.0', '2.81', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100003 WHERE (`entry` = 11318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11318) AND (`map` = 389);
-- Heroic Searing Blade Cultist
DELETE FROM `creature_template` WHERE entry = 9100004;
INSERT INTO `creature_template` VALUES (9100004, '0', '0', '0', '0', '0', '11434', '11436', '11435', '11437', 'Heroic Searing Blade Cultist', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11322', '11322', '0', '0', '0', '0', '0', '', '1', '1.0', '3.19', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100004 WHERE (`entry` = 11322);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11322) AND (`map` = 389);
-- Heroic Searing Blade Enforcer
DELETE FROM `creature_template` WHERE entry = 9100005;
INSERT INTO `creature_template` VALUES (9100005, '0', '0', '0', '0', '0', '11430', '11432', '11431', '11433', 'Heroic Searing Blade Enforcer', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11323', '11323', '0', '0', '0', '0', '0', '', '1', '1.0', '3.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100005 WHERE (`entry` = 11323);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11323) AND (`map` = 389);
-- Heroic Searing Blade Warlock
DELETE FROM `creature_template` WHERE entry = 9100006;
INSERT INTO `creature_template` VALUES (9100006, '0', '0', '0', '0', '0', '11438', '11440', '11439', '11441', 'Heroic Searing Blade Warlock', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.07', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11324', '11324', '0', '0', '0', '0', '0', '', '1', '1.0', '3.2', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100006 WHERE (`entry` = 11324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11324) AND (`map` = 389);
-- Heroic Bazzalan
DELETE FROM `creature_template` WHERE entry = 9100007;
INSERT INTO `creature_template` VALUES (9100007, '0', '0', '0', '0', '0', '2007', '0', '0', '0', 'Heroic Bazzalan', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.28', '1.0', '1.0', '2.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100007 WHERE (`entry` = 11519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11519) AND (`map` = 389);
-- Heroic Jergosh the Invoker
DELETE FROM `creature_template` WHERE entry = 9100008;
INSERT INTO `creature_template` VALUES (9100008, '0', '0', '0', '0', '0', '11429', '0', '0', '0', 'Heroic Jergosh the Invoker', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11518', '0', '0', '0', '0', '0', '', '1', '1.0', '5.87', '2.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100008 WHERE (`entry` = 11518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11518) AND (`map` = 389);
-- Heroic Oggleflint
DELETE FROM `creature_template` WHERE entry = 9100009;
INSERT INTO `creature_template` VALUES (9100009, '0', '0', '0', '0', '0', '11611', '0', '0', '0', 'Heroic Oggleflint', 'Ragefire Chieftain', NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.2', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100009 WHERE (`entry` = 11517);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11517) AND (`map` = 389);
-- Heroic Taragaman the Hungerer
DELETE FROM `creature_template` WHERE entry = 9100010;
INSERT INTO `creature_template` VALUES (9100010, '0', '0', '0', '0', '0', '7970', '0', '0', '0', 'Heroic Taragaman the Hungerer', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '11520', '0', '0', '0', '0', '0', '', '1', '1.0', '5.97', 
'1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100010 WHERE (`entry` = 11520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11520) AND (`map` = 389);
-- Heroic Zelemar the Wrathful
DELETE FROM `creature_template` WHERE entry = 9100011;
INSERT INTO `creature_template` VALUES (9100011, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Heroic Zelemar the Wrathful', NULL, NULL, '0', '63', '63', '0', '954', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '5.96', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100011 WHERE (`entry` = 17830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17830) AND (`map` = 389);
-- Heroic Maur Grimtotem
DELETE FROM `creature_template` WHERE entry = 9100012;
INSERT INTO `creature_template` VALUES (9100012, '0', '0', '0', '0', '0', '11755', '0', '0', '0', 'Heroic Maur Grimtotem', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100012 WHERE (`entry` = 11834);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11834) AND (`map` = 389);
-- Heroic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100013;
INSERT INTO `creature_template` VALUES (9100013, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Heroic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.35', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100013 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996) AND (`map` = 389);
-- Mythic Earthborer
DELETE FROM `creature_template` WHERE entry = 9100014;
INSERT INTO `creature_template` VALUES (9100014, '0', '0', '0', '0', '0', '11010', '0', '0', '0', 'Mythic Earthborer', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '11320', '0', '100001', '0', '0', '0', '0', '', '1', '1.0', '4.15', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100014 WHERE (`entry` = 11320);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11320) AND (`map` = 389);
-- Mythic Molten Elemental
DELETE FROM `creature_template` WHERE entry = 9100015;
INSERT INTO `creature_template` VALUES (9100015, '0', '0', '0', '0', '0', '2075', '0', '0', '0', 'Mythic Molten Elemental', NULL, NULL, '0', '60', '60', '0', '834', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '11321', '0', '100020', '0', '0', '0', '0', '', '1', '1.0', '3.9', '1.0', '1.2', '1.0', '0', '0', '1', '646016863', '8', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100015 WHERE (`entry` = 11321);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11321) AND (`map` = 389);
-- Mythic Ragefire Shaman
DELETE FROM `creature_template` WHERE entry = 9100016;
INSERT INTO `creature_template` VALUES (9100016, '0', '0', '0', '0', '0', '11610', '0', '0', '0', 'Mythic Ragefire Shaman', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11319', '11319', '0', '0', '0', '0', '0', '', '1', '1.0', '3.88', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100016 WHERE (`entry` = 11319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11319) AND (`map` = 389);
-- Mythic Ragefire Trogg
DELETE FROM `creature_template` WHERE entry = 9100017;
INSERT INTO `creature_template` VALUES (9100017, '0', '0', '0', '0', '0', '11609', '0', '0', '0', 'Mythic Ragefire Trogg', NULL, NULL, '0', '60', '60', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11318', '11318', '0', '0', '0', '0', '0', '', '1', '1.0', '4.33', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100017 WHERE (`entry` = 11318);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11318) AND (`map` = 389);
-- Mythic Searing Blade Cultist
DELETE FROM `creature_template` WHERE entry = 9100018;
INSERT INTO `creature_template` VALUES (9100018, '0', '0', '0', '0', '0', '11434', '11436', '11435', '11437', 'Mythic Searing Blade Cultist', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11322', '11322', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100018 WHERE (`entry` = 11322);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11322) AND (`map` = 389);
-- Mythic Searing Blade Enforcer
DELETE FROM `creature_template` WHERE entry = 9100019;
INSERT INTO `creature_template` VALUES (9100019, '0', '0', '0', '0', '0', '11430', '11432', '11431', '11433', 'Mythic Searing Blade Enforcer', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11323', '11323', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100019 WHERE (`entry` = 11323);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11323) AND (`map` = 389);
-- Mythic Searing Blade Warlock
DELETE FROM `creature_template` WHERE entry = 9100020;
INSERT INTO `creature_template` VALUES (9100020, '0', '0', '0', '0', '0', '11438', '11440', '11439', '11441', 'Mythic Searing Blade Warlock', NULL, NULL, '0', '60', '60', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '11324', '11324', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.5', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100020 WHERE (`entry` = 11324);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11324) AND (`map` = 389);
-- Mythic Bazzalan
DELETE FROM `creature_template` WHERE entry = 9100021;
INSERT INTO `creature_template` VALUES (9100021, '0', '0', '0', '0', '0', '2007', '0', '0', '0', 'Mythic Bazzalan', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.48', '1.0', '1.0', '2.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100021 WHERE (`entry` = 11519);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11519) AND (`map` = 389);
-- Mythic Jergosh the Invoker
DELETE FROM `creature_template` WHERE entry = 9100022;
INSERT INTO `creature_template` VALUES (9100022, '0', '0', '0', '0', '0', '11429', '0', '0', '0', 'Mythic Jergosh the Invoker', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11518', '0', '0', '0', '0', '0', '', '1', '1.0', '8.39', '2.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100022 WHERE (`entry` = 11518);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11518) AND (`map` = 389);
-- Mythic Oggleflint
DELETE FROM `creature_template` WHERE entry = 9100023;
INSERT INTO `creature_template` VALUES (9100023, '0', '0', '0', '0', '0', '11611', '0', '0', '0', 'Mythic Oggleflint', 'Ragefire Chieftain', NULL, '0', '63', '63', '0', '59', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.1', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.14', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100023 WHERE (`entry` = 11517);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11517) AND (`map` = 389);
-- Mythic Taragaman the Hungerer
DELETE FROM `creature_template` WHERE entry = 9100024;
INSERT INTO `creature_template` VALUES (9100024, '0', '0', '0', '0', '0', '7970', '0', '0', '0', 'Mythic Taragaman the Hungerer', NULL, NULL, '0', '63', '63', '0', '554', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '11520', '0', '0', '0', '0', '0', '', '1', '1.0', '7.87', 
'1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100024 WHERE (`entry` = 11520);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11520) AND (`map` = 389);
-- Mythic Zelemar the Wrathful
DELETE FROM `creature_template` WHERE entry = 9100025;
INSERT INTO `creature_template` VALUES (9100025, '0', '0', '0', '0', '0', '1912', '0', '0', '0', 'Mythic Zelemar the Wrathful', NULL, NULL, '0', '63', '63', '0', '954', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.36', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100025 WHERE (`entry` = 17830);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 17830) AND (`map` = 389);
-- Mythic Maur Grimtotem
DELETE FROM `creature_template` WHERE entry = 9100026;
INSERT INTO `creature_template` VALUES (9100026, '0', '0', '0', '0', '0', '11755', '0', '0', '0', 'Mythic Maur Grimtotem', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.09', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.42', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100026 WHERE (`entry` = 11834);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 11834) AND (`map` = 389);
-- Mythic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9100027;
INSERT INTO `creature_template` VALUES (9100027, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Mythic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '2.84', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100027 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996) AND (`map` = 389);