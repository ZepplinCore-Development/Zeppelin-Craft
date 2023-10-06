-- Defias Prisoner
DELETE FROM `creature_template` WHERE entry = 9100400;
INSERT INTO `creature_template` VALUES (9100400, '9100400', '0', '0', '0', '0', '2148', '0', '0', '0', 'Defias Prisoner', NULL, NULL, '0', '60', '60', '0', '290', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1706', '1706', '0', '0', '0', '64', '323', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100400 WHERE (`entry` = 1706);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1706);
-- Defias Captive
DELETE FROM `creature_template` WHERE entry = 9100401;
INSERT INTO `creature_template` VALUES (9100401, '9100401', '0', '0', '0', '0', '2144', '0', '0', '0', 'Defias Captive', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1707', '1707', '0', '0', '0', '60', '325', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100401 WHERE (`entry` = 1707);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1707);
-- Defias Inmate
DELETE FROM `creature_template` WHERE entry = 9100402;
INSERT INTO `creature_template` VALUES (9100402, '9100402', '0', '0', '0', '0', '2146', '0', '0', '0', 'Defias Inmate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1708', '1708', '0', '0', '0', '64', '369', 'SmartAI', '1', '1.0', '3.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100402 WHERE (`entry` = 1708);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1708);
-- Defias Convict
DELETE FROM `creature_template` WHERE entry = 9100403;
INSERT INTO `creature_template` VALUES (9100403, '9100403', '0', '0', '0', '0', '2145', '0', '0', '0', 'Defias Convict', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1711', '1711', '0', '0', '0', '74', '348', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100403 WHERE (`entry` = 1711);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1711);
-- Defias Insurgent
DELETE FROM `creature_template` WHERE entry = 9100404;
INSERT INTO `creature_template` VALUES (9100404, '9100404', '0', '0', '0', '0', '2147', '0', '0', '0', 'Defias Insurgent', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.21', '2600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1715', '1715', '0', '0', '0', '69', '402', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100404 WHERE (`entry` = 1715);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1715);
-- Targorr the Dread
DELETE FROM `creature_template` WHERE entry = 9100405;
INSERT INTO `creature_template` VALUES (9100405, '9100405', '0', '0', '0', '0', '517', '0', '0', '0', 'Targorr the Dread', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '4.0', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1696', '1696', '0', '0', '0', '123', '4.3', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100405 WHERE (`entry` = 1696);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1696);
-- Dextren Ward
DELETE FROM `creature_template` WHERE entry = 9100406;
INSERT INTO `creature_template` VALUES (9100406, '9100406', '0', '0', '0', '0', '2149', '0', '0', '0', 'Dextren Ward', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '4.01', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1663', '1663', '0', '0', '0', '135', '4.34', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100406 WHERE (`entry` = 1663);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1663);
-- Bruegal Ironknuckle
DELETE FROM `creature_template` WHERE entry = 9100407;
INSERT INTO `creature_template` VALUES (9100407, '9100407', '0', '0', '0', '0', '2142', '0', '0', '0', 'Bruegal Ironknuckle', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '2.4', '4.06', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1720', '0', '0', '0', '0', '210', '4.32', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100407 WHERE (`entry` = 1720);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1720);
-- Kam Deepfury
DELETE FROM `creature_template` WHERE entry = 9100408;
INSERT INTO `creature_template` VALUES (9100408, '9100408', '0', '0', '0', '0', '825', '0', '0', '0', 'Kam Deepfury', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '4.02', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1666', '1666', '0', '0', '0', '31', '4.4', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100408 WHERE (`entry` = 1666);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1666);
-- Hamhock
DELETE FROM `creature_template` WHERE entry = 9100409;
INSERT INTO `creature_template` VALUES (9100409, '9100409', '0', '0', '0', '0', '3250', '0', '0', '0', 'Hamhock', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.5', '4.04', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1717', '1717', '0', '0', '0', '147', '4.06', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', 
'2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100409 WHERE (`entry` = 1717);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1717);
-- Bazil Thredd
DELETE FROM `creature_template` WHERE entry = 9100410;
INSERT INTO `creature_template` VALUES (9100410, '9100410', '0', '0', '0', '0', '1621', '0', '0', '0', 'Bazil Thredd', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.4', '4.07', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1716', '1716', '0', '0', '0', '170', '4.06', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100410 WHERE (`entry` = 1716);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1716);