-- Heroic Defias Prisoner
DELETE FROM `creature_template` WHERE entry = 9100400;
INSERT INTO `creature_template` VALUES (9100400, '0', '0', '0', '0', '0', '2148', '0', '0', '0', 'Heroic Defias Prisoner', NULL, NULL, '0', '60', '60', '0', '290', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1706', '1706', '0', '0', '0', '0', '0', '', '1', '1.0', '3.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100400 WHERE (`entry` = 1706);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1706) AND (`map` = 34);
-- Heroic Defias Captive
DELETE FROM `creature_template` WHERE entry = 9100401;
INSERT INTO `creature_template` VALUES (9100401, '0', '0', '0', '0', '0', '2144', '0', '0', '0', 'Heroic Defias Captive', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.1', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1707', '1707', '0', '0', '0', '0', '0', '', '1', '1.0', '3.42', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100401 WHERE (`entry` = 1707);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1707) AND (`map` = 34);
-- Heroic Defias Inmate
DELETE FROM `creature_template` WHERE entry = 9100402;
INSERT INTO `creature_template` VALUES (9100402, '0', '0', '0', '0', '0', '2146', '0', '0', '0', 'Heroic Defias Inmate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1708', '1708', '0', '0', '0', '0', '0', '', '1', '1.0', '3.47', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100402 WHERE (`entry` = 1708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1708) AND (`map` = 34);
-- Heroic Defias Convict
DELETE FROM `creature_template` WHERE entry = 9100403;
INSERT INTO `creature_template` VALUES (9100403, '0', '0', '0', '0', '0', '2145', '0', '0', '0', 'Heroic Defias Convict', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1711', '1711', '0', '0', '0', '0', '0', '', '1', '1.0', '3.33', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100403 WHERE (`entry` = 1711);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1711) AND (`map` = 34);
-- Heroic Defias Insurgent
DELETE FROM `creature_template` WHERE entry = 9100404;
INSERT INTO `creature_template` VALUES (9100404, '0', '0', '0', '0', '0', '2147', '0', '0', '0', 'Heroic Defias Insurgent', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '1.95', '2600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1715', '1715', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100404 WHERE (`entry` = 1715);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1715) AND (`map` = 34);
-- Heroic Targorr the Dread
DELETE FROM `creature_template` WHERE entry = 9100405;
INSERT INTO `creature_template` VALUES (9100405, '0', '0', '0', '0', '0', '517', '0', '0', '0', 'Heroic Targorr the Dread', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '5.09', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1696', '0', '0', '0', '0', '0', '', '1', '1.0', '6.15', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100405 WHERE (`entry` = 1696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1696) AND (`map` = 34);
-- Heroic Dextren Ward
DELETE FROM `creature_template` WHERE entry = 9100406;
INSERT INTO `creature_template` VALUES (9100406, '0', '0', '0', '0', '0', '2149', '0', '0', '0', 'Heroic Dextren Ward', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2400', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1663', '0', '0', '0', '0', '0', '', '1', '1.0', '6.43', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100406 WHERE (`entry` = 1663);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1663) AND (`map` = 34);
-- Heroic Bruegal Ironknuckle
DELETE FROM `creature_template` WHERE entry = 9100407;
INSERT INTO `creature_template` VALUES (9100407, '0', '0', '0', '0', '0', '2142', '0', '0', '0', 'Heroic Bruegal Ironknuckle', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.1', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.04', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100407 WHERE (`entry` = 1720);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1720) AND (`map` = 34);
-- Heroic Kam Deepfury
DELETE FROM `creature_template` WHERE entry = 9100408;
INSERT INTO `creature_template` VALUES (9100408, '0', '0', '0', '0', '0', '825', '0', '0', '0', 'Heroic Kam Deepfury', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1666', '0', '0', '0', '0', '0', '', '1', '1.0', '6.29', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100408 WHERE (`entry` = 1666);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1666) AND (`map` = 34);
-- Heroic Hamhock
DELETE FROM `creature_template` WHERE entry = 9100409;
INSERT INTO `creature_template` VALUES (9100409, '0', '0', '0', '0', '0', '3250', '0', '0', '0', 'Heroic Hamhock', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1717', '0', '0', '0', '0', '0', '', '1', '1.0', '5.91', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100409 WHERE (`entry` = 1717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1717) AND (`map` = 34);
-- Heroic Bazil Thredd
DELETE FROM `creature_template` WHERE entry = 9100410;
INSERT INTO `creature_template` VALUES (9100410, '0', '0', '0', '0', '0', '1621', '0', '0', '0', 'Heroic Bazil Thredd', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '1716', '0', '0', '0', '0', '0', '', '1', '1.0', '6.13', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100410 WHERE (`entry` = 1716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1716) AND (`map` = 34);
-- Mythic Defias Prisoner
DELETE FROM `creature_template` WHERE entry = 9100411;
INSERT INTO `creature_template` VALUES (9100411, '0', '0', '0', '0', '0', '2148', '0', '0', '0', 'Mythic Defias Prisoner', NULL, NULL, '0', '60', '60', '0', '290', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1706', '1706', '0', '0', '0', '0', '0', '', '1', '1.0', '3.99', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100411 WHERE (`entry` = 1706);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1706) AND (`map` = 34);
-- Mythic Defias Captive
DELETE FROM `creature_template` WHERE entry = 9100412;
INSERT INTO `creature_template` VALUES (9100412, '0', '0', '0', '0', '0', '2144', '0', '0', '0', 'Mythic Defias Captive', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1707', '1707', '0', '0', '0', '0', '0', '', '1', '1.0', '4.05', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100412 WHERE (`entry` = 1707);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1707) AND (`map` = 34);
-- Mythic Defias Inmate
DELETE FROM `creature_template` WHERE entry = 9100413;
INSERT INTO `creature_template` VALUES (9100413, '0', '0', '0', '0', '0', '2146', '0', '0', '0', 'Mythic Defias Inmate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1708', '1708', '0', '0', '0', '0', '0', '', '1', '1.0', '3.96', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100413 WHERE (`entry` = 1708);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1708) AND (`map` = 34);
-- Mythic Defias Convict
DELETE FROM `creature_template` WHERE entry = 9100414;
INSERT INTO `creature_template` VALUES (9100414, '0', '0', '0', '0', '0', '2145', '0', '0', '0', 'Mythic Defias Convict', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1711', '1711', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100414 WHERE (`entry` = 1711);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1711) AND (`map` = 34);
-- Mythic Defias Insurgent
DELETE FROM `creature_template` WHERE entry = 9100415;
INSERT INTO `creature_template` VALUES (9100415, '0', '0', '0', '0', '0', '2147', '0', '0', '0', 'Mythic Defias Insurgent', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.95', '2600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1715', '1715', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100415 WHERE (`entry` = 1715);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1715) AND (`map` = 34);
-- Mythic Targorr the Dread
DELETE FROM `creature_template` WHERE entry = 9100416;
INSERT INTO `creature_template` VALUES (9100416, '0', '0', '0', '0', '0', '517', '0', '0', '0', 'Mythic Targorr the Dread', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1696', '0', '0', '0', '0', '0', '', '1', '1.0', '7.87', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100416 WHERE (`entry` = 1696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1696) AND (`map` = 34);
-- Mythic Dextren Ward
DELETE FROM `creature_template` WHERE entry = 9100417;
INSERT INTO `creature_template` VALUES (9100417, '0', '0', '0', '0', '0', '2149', '0', '0', '0', 'Mythic Dextren Ward', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2400', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1663', '0', '0', '0', '0', '0', '', '1', '1.0', '8.29', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100417 WHERE (`entry` = 1663);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1663) AND (`map` = 34);
-- Mythic Bruegal Ironknuckle
DELETE FROM `creature_template` WHERE entry = 9100418;
INSERT INTO `creature_template` VALUES (9100418, '0', '0', '0', '0', '0', '2142', '0', '0', '0', 'Mythic Bruegal Ironknuckle', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.01', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.24', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100418 WHERE (`entry` = 1720);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1720) AND (`map` = 34);
-- Mythic Kam Deepfury
DELETE FROM `creature_template` WHERE entry = 9100419;
INSERT INTO `creature_template` VALUES (9100419, '0', '0', '0', '0', '0', '825', '0', '0', '0', 'Mythic Kam Deepfury', NULL, NULL, '0', '63', '63', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1666', '0', '0', '0', '0', '0', '', '1', '1.0', '7.9', '1.0', '1.0', 
'2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100419 WHERE (`entry` = 1666);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1666) AND (`map` = 34);
-- Mythic Hamhock
DELETE FROM `creature_template` WHERE entry = 9100420;
INSERT INTO `creature_template` VALUES (9100420, '0', '0', '0', '0', '0', '3250', '0', '0', '0', 'Mythic Hamhock', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1717', '0', '0', '0', '0', '0', '', '1', '1.0', '7.9', '1.0', '1.0', '2.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100420 WHERE (`entry` = 1717);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1717) AND (`map` = 34);
-- Mythic Bazil Thredd
DELETE FROM `creature_template` WHERE entry = 9100421;
INSERT INTO `creature_template` VALUES (9100421, '0', '0', '0', '0', '0', '1621', '0', '0', '0', 'Mythic Bazil Thredd', NULL, NULL, '0', '63', '63', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '1716', '0', '0', '0', '0', '0', '', '1', '1.0', '8.47', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100421 WHERE (`entry` = 1716);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 1716) AND (`map` = 34);