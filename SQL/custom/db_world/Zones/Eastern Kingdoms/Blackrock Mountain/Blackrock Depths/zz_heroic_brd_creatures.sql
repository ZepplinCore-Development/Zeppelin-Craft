-- Heroic Lord Incendius
DELETE FROM `creature_template` WHERE entry = 9101400;
INSERT INTO `creature_template` VALUES (9101400, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Lord Incendius', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '5.09', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.24', '5.0', '1.0', '2.0', '0', '0', '1', '613122011', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101400 WHERE (`entry` = 9017);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9017);
-- Heroic Lord Roccor
DELETE FROM `creature_template` WHERE entry = 9101401;
INSERT INTO `creature_template` VALUES (9101401, '0', '0', '0', '0', '0', '5781', '0', '0', '0', 'Heroic Lord Roccor', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '5.98', '2.0', '1.5', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101401 WHERE (`entry` = 9025);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9025);
-- Heroic BaelGar
DELETE FROM `creature_template` WHERE entry = 9101402;
INSERT INTO `creature_template` VALUES (9101402, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Heroic BaelGar', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '6.14', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101402 WHERE (`entry` = 9016);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9016);
-- Heroic Houndmaster Grebmar
DELETE FROM `creature_template` WHERE entry = 9101403;
INSERT INTO `creature_template` VALUES (9101403, '0', '0', '0', '0', '0', '9212', '0', '0', '0', 'Heroic Houndmaster Grebmar', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '553', '727', '', '1', '1.0', '5.88', '2.0', 
'1.25', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101403 WHERE (`entry` = 9319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9319);
-- Heroic High Interrogator Gerstahn
DELETE FROM `creature_template` WHERE entry = 9101404;
INSERT INTO `creature_template` VALUES (9101404, '0', '0', '0', '0', '0', '8761', '0', '0', '0', 'Heroic High Interrogator Gerstahn', 'Twilights Hammer Interrogator', NULL, '0', '63', '63', '0', '54', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9018', '0', '0', '0', '489', '1649', '', '1', '1.0', '5.81', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101404 WHERE (`entry` = 9018);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9018);
-- Heroic High Justice Grimstone
DELETE FROM `creature_template` WHERE entry = 9101405;
INSERT INTO `creature_template` VALUES (9101405, '0', '0', '0', '0', '0', '9329', '0', '0', '0', 'Heroic High Justice Grimstone', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '116', '582', '', '1', '1.0', '5.98', '2.0', '1.0', '2.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101405 WHERE (`entry` = 10096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10096);
-- Heroic Pyromancer Loregrain
DELETE FROM `creature_template` WHERE entry = 9101406;
INSERT INTO `creature_template` VALUES (9101406, '0', '0', '0', '0', '0', '8762', '0', '0', '0', 'Heroic Pyromancer Loregrain', NULL, NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.99', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9024', '0', '0', '0', '659', '945', '', '1', '1.0', '6.49', 
'5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101406 WHERE (`entry` = 9024);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9024);
-- Heroic General Angerforge
DELETE FROM `creature_template` WHERE entry = 9101407;
INSERT INTO `creature_template` VALUES (9101407, '0', '0', '0', '0', '0', '8756', '0', '0', '0', 'Heroic General Angerforge', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9033', '0', '0', '0', '1029', '1352', '', '1', '1.0', '6.4', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101407 WHERE (`entry` = 9033);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9033);
-- Heroic Golem Lord Argelmach
DELETE FROM `creature_template` WHERE entry = 9101408;
INSERT INTO `creature_template` VALUES (9101408, '0', '0', '0', '0', '0', '8759', '0', '0', '0', 'Heroic Golem Lord Argelmach', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '8983', '0', '0', '0', '646', '935', '', '1', '1.0', '6.46', '8.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101408 WHERE (`entry` = 8983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8983);
-- Heroic Ribbly Screwspigot
DELETE FROM `creature_template` WHERE entry = 9101409;
INSERT INTO `creature_template` VALUES (9101409, '0', '0', '0', '0', '0', '8667', '0', '0', '0', 'Heroic Ribbly Screwspigot', NULL, NULL, '1970', '63', '63', '0', '735', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2000', '2000', '1.0', '1.0', '1', '33344', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '240', '535', '', '1', '1.0', '6.48', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101409 WHERE (`entry` = 9543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9543);
-- Heroic Hurley Blackbreath
DELETE FROM `creature_template` WHERE entry = 9101410;
INSERT INTO `creature_template` VALUES (9101410, '0', '0', '0', '0', '0', '8658', '0', '0', '0', 'Heroic Hurley Blackbreath', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9537', '0', '0', '0', '147', '2123', '', '1', '1.0', '6.25', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101410 WHERE (`entry` = 9537);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9537);
-- Heroic Plugger Spazzring
DELETE FROM `creature_template` WHERE entry = 9101411;
INSERT INTO `creature_template` VALUES (9101411, '0', '0', '0', '0', '0', '8652', '0', '0', '0', 'Heroic Plugger Spazzring', NULL, NULL, '0', '63', '63', '0', '674', '130', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9499', '0', '0', '0', '520', '684', '', '1', '1.0', '6.24', 
'8.0', '1.25', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101411 WHERE (`entry` = 9499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9499);
-- Heroic Phalanx
DELETE FROM `creature_template` WHERE entry = 9101412;
INSERT INTO `creature_template` VALUES (9101412, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Heroic Phalanx', NULL, NULL, '2283', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100400', '0', '100033', '0', '0', '856', '1955', '', '1', '1.0', '6.03', '2.0', '1.0', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101412 WHERE (`entry` = 9502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9502);
-- Heroic Fineous Darkvire
DELETE FROM `creature_template` WHERE entry = 9101413;
INSERT INTO `creature_template` VALUES (9101413, '0', '0', '0', '0', '0', '8704', '0', '0', '0', 'Heroic Fineous Darkvire', 'Chief Architect', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9056', '0', '0', '0', '376', '1675', '', '1', '1.0', '6.0', '5.0', '1.05', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101413 WHERE (`entry` = 9056);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9056);
-- Heroic Warder Stilgiss
DELETE FROM `creature_template` WHERE entry = 9101414;
INSERT INTO `creature_template` VALUES (9101414, '0', '0', '0', '0', '0', '9089', '0', '0', '0', 'Heroic Warder Stilgiss', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9041', '0', '0', '0', '694', '912', '', '1', '1.0', '6.15', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101414 WHERE (`entry` = 9041);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9041);
-- Heroic Verek
DELETE FROM `creature_template` WHERE entry = 9101415;
INSERT INTO `creature_template` VALUES (9101415, '0', '0', '0', '0', '0', '9019', '0', '0', '0', 'Heroic Verek', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '9042', '0', '0', '0', '0', '', '1', '1.0', '6.44', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101415 WHERE (`entry` = 9042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9042);
-- Heroic Ambassador Flamelash
DELETE FROM `creature_template` WHERE entry = 9101416;
INSERT INTO `creature_template` VALUES (9101416, '0', '0', '0', '0', '0', '8329', '0', '0', '0', 'Heroic Ambassador Flamelash', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '1284', '2000', '', '1', '1.0', '5.96', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101416 WHERE (`entry` = 9156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9156);
-- Heroic Haterel
DELETE FROM `creature_template` WHERE entry = 9101417;
INSERT INTO `creature_template` VALUES (9101417, '0', '0', '0', '0', '0', '8690', '0', '0', '0', 'Heroic Haterel', NULL, NULL, '1941', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101417 WHERE (`entry` = 9034);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9034);
-- Heroic Angerrel
DELETE FROM `creature_template` WHERE entry = 9101418;
INSERT INTO `creature_template` VALUES (9101418, '0', '0', '0', '0', '0', '8686', '0', '0', '0', 'Heroic Angerrel', NULL, NULL, '1943', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.04', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101418 WHERE (`entry` = 9035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9035);
-- Heroic Vilerel
DELETE FROM `creature_template` WHERE entry = 9101419;
INSERT INTO `creature_template` VALUES (9101419, '0', '0', '0', '0', '0', '8692', '0', '0', '0', 'Heroic Vilerel', NULL, NULL, '1944', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.21', '6.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101419 WHERE (`entry` = 9036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9036);
-- Heroic Gloomrel
DELETE FROM `creature_template` WHERE entry = 9101420;
INSERT INTO `creature_template` VALUES (9101420, '0', '0', '0', '0', '0', '8689', '0', '0', '0', 'Heroic Gloomrel', NULL, NULL, '1945', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.16', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101420 WHERE (`entry` = 9037);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9037);
-- Heroic Seethrel
DELETE FROM `creature_template` WHERE entry = 9101421;
INSERT INTO `creature_template` VALUES (9101421, '0', '0', '0', '0', '0', '8691', '0', '0', '0', 'Heroic Seethrel', NULL, NULL, '1946', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.95', '5.0', '1.3', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101421 WHERE (`entry` = 9038);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9038);
-- Heroic Doomrel
DELETE FROM `creature_template` WHERE entry = 9101422;
INSERT INTO `creature_template` VALUES (9101422, '0', '0', '0', '0', '0', '8687', '0', '0', '0', 'Heroic Doomrel', NULL, NULL, '1947', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '646', '849', '', '1', '1.0', '5.89', '8.0', '1.2', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101422 WHERE (`entry` = 9039);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9039);
-- Heroic Doperel
DELETE FROM `creature_template` WHERE entry = 9101423;
INSERT INTO `creature_template` VALUES (9101423, '0', '0', '0', '0', '0', '8688', '0', '0', '0', 'Heroic Doperel', NULL, NULL, '1948', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.45', '2.0', '0.5', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101423 WHERE (`entry` = 9040);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9040);
-- Heroic Magmus
DELETE FROM `creature_template` WHERE entry = 9101424;
INSERT INTO `creature_template` VALUES (9101424, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Heroic Magmus', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '5.86', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101424 WHERE (`entry` = 9938);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9938);
-- Heroic Princess Moira Bronzebeard
DELETE FROM `creature_template` WHERE entry = 9101425;
INSERT INTO `creature_template` VALUES (9101425, '0', '0', '0', '0', '0', '8705', '0', '0', '0', 'Heroic Princess Moira Bronzebeard', 'Princess of Ironforge', NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '733', '962', '', '1', '1.0', '6.31', '3.0', '1.0', '2.0', '0', '0', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101425 WHERE (`entry` = 8929);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8929);
-- Heroic Emperor Dagran Thaurissan
DELETE FROM `creature_template` WHERE entry = 9101426;
INSERT INTO `creature_template` VALUES (9101426, '0', '0', '0', '0', '0', '8807', '0', '0', '0', 'Heroic Emperor Dagran Thaurissan', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9019', '0', '0', '0', '1202', '1575', '', '1', '1.0', '6.11', '2.0', '0.95', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101426 WHERE (`entry` = 9019);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9019);
-- Heroic Gorosh the Dervish
DELETE FROM `creature_template` WHERE entry = 9101427;
INSERT INTO `creature_template` VALUES (9101427, '0', '0', '0', '0', '0', '8760', '0', '0', '0', 'Heroic Gorosh the Dervish', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.05', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '147', '1784', '', '1', '1.0', '6.5', '2.0', '0.75', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101427 WHERE (`entry` = 9027);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9027);
-- Heroic Grizzle
DELETE FROM `creature_template` WHERE entry = 9101428;
INSERT INTO `creature_template` VALUES (9101428, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Heroic Grizzle', NULL, NULL, '0', '63', '63', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '143', '2301', '', '1', '1.0', '5.95', '2.0', '0.8', 
'1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101428 WHERE (`entry` = 9028);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9028);
-- Heroic Eviscerator
DELETE FROM `creature_template` WHERE entry = 9101429;
INSERT INTO `creature_template` VALUES (9101429, '0', '0', '0', '0', '0', '523', '0', '0', '0', 'Heroic Eviscerator', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '9029', '0', '0', '147', '737', '', '1', '1.0', '5.94', '5.0', '1.0', 
'1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101429 WHERE (`entry` = 9029);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9029);
-- Heroic Okthor the Breaker
DELETE FROM `creature_template` WHERE entry = 9101430;
INSERT INTO `creature_template` VALUES (9101430, '0', '0', '0', '0', '0', '11538', '0', '0', '0', 'Heroic Okthor the Breaker', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '147', '737', '', '1', '1.0', '5.9', '8.0', '0.8', '1.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101430 WHERE (`entry` = 9030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9030);
-- Heroic Anubshiah
DELETE FROM `creature_template` WHERE entry = 9101431;
INSERT INTO `creature_template` VALUES (9101431, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Heroic Anubshiah', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '1800', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '138', '689', '', '1', '1.0', '5.85', '5.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101431 WHERE (`entry` = 9031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9031);
-- Heroic Hedrum the Creeper
DELETE FROM `creature_template` WHERE entry = 9101432;
INSERT INTO `creature_template` VALUES (9101432, '0', '0', '0', '0', '0', '8271', '0', '0', '0', 'Heroic Hedrum the Creeper', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '100003', '0', '0', '133', '666', '', '1', '1.0', '6.12', '2.0', '0.65', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101432 WHERE (`entry` = 9032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9032);
-- Mythic Lord Incendius
DELETE FROM `creature_template` WHERE entry = 9101433;
INSERT INTO `creature_template` VALUES (9101433, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Lord Incendius', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '7.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.86', '5.0', '1.0', '2.0', '0', '0', '1', '613122011', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101433 WHERE (`entry` = 9017);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9017);
-- Mythic Lord Roccor
DELETE FROM `creature_template` WHERE entry = 9101434;
INSERT INTO `creature_template` VALUES (9101434, '0', '0', '0', '0', '0', '5781', '0', '0', '0', 'Mythic Lord Roccor', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '7.81', '2.0', '1.5', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101434 WHERE (`entry` = 9025);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9025);
-- Mythic BaelGar
DELETE FROM `creature_template` WHERE entry = 9101435;
INSERT INTO `creature_template` VALUES (9101435, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Mythic BaelGar', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '7.96', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101435 WHERE (`entry` = 9016);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9016);
-- Mythic Houndmaster Grebmar
DELETE FROM `creature_template` WHERE entry = 9101436;
INSERT INTO `creature_template` VALUES (9101436, '0', '0', '0', '0', '0', '9212', '0', '0', '0', 'Mythic Houndmaster Grebmar', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '553', '727', '', '1', '1.0', '8.39', '2.0', 
'1.25', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101436 WHERE (`entry` = 9319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9319);
-- Mythic High Interrogator Gerstahn
DELETE FROM `creature_template` WHERE entry = 9101437;
INSERT INTO `creature_template` VALUES (9101437, '0', '0', '0', '0', '0', '8761', '0', '0', '0', 'Mythic High Interrogator Gerstahn', 'Twilights Hammer Interrogator', NULL, '0', '63', '63', '0', '54', 
'0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9018', '0', '0', '0', '489', '1649', '', '1', '1.0', '8.27', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101437 WHERE (`entry` = 9018);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9018);
-- Mythic High Justice Grimstone
DELETE FROM `creature_template` WHERE entry = 9101438;
INSERT INTO `creature_template` VALUES (9101438, '0', '0', '0', '0', '0', '9329', '0', '0', '0', 'Mythic High Justice Grimstone', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '116', '582', '', '1', '1.0', '8.32', '2.0', '1.0', '2.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101438 WHERE (`entry` = 10096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10096);
-- Mythic Pyromancer Loregrain
DELETE FROM `creature_template` WHERE entry = 9101439;
INSERT INTO `creature_template` VALUES (9101439, '0', '0', '0', '0', '0', '8762', '0', '0', '0', 'Mythic Pyromancer Loregrain', NULL, NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.98', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9024', '0', '0', '0', '659', '945', '', '1', '1.0', '8.44', 
'5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101439 WHERE (`entry` = 9024);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9024);
-- Mythic General Angerforge
DELETE FROM `creature_template` WHERE entry = 9101440;
INSERT INTO `creature_template` VALUES (9101440, '0', '0', '0', '0', '0', '8756', '0', '0', '0', 'Mythic General Angerforge', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9033', '0', '0', '0', '1029', '1352', '', '1', '1.0', '8.47', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101440 WHERE (`entry` = 9033);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9033);
-- Mythic Golem Lord Argelmach
DELETE FROM `creature_template` WHERE entry = 9101441;
INSERT INTO `creature_template` VALUES (9101441, '0', '0', '0', '0', '0', '8759', '0', '0', '0', 'Mythic Golem Lord Argelmach', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '8983', '0', '0', '0', '646', '935', '', '1', '1.0', '8.11', '8.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101441 WHERE (`entry` = 8983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8983);
-- Mythic Ribbly Screwspigot
DELETE FROM `creature_template` WHERE entry = 9101442;
INSERT INTO `creature_template` VALUES (9101442, '0', '0', '0', '0', '0', '8667', '0', '0', '0', 'Mythic Ribbly Screwspigot', NULL, NULL, '1970', '63', '63', '0', '735', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.1', '2000', '2000', '1.0', '1.0', '1', '33344', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '240', '535', '', '1', '1.0', '8.43', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101442 WHERE (`entry` = 9543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9543);
-- Mythic Hurley Blackbreath
DELETE FROM `creature_template` WHERE entry = 9101443;
INSERT INTO `creature_template` VALUES (9101443, '0', '0', '0', '0', '0', '8658', '0', '0', '0', 'Mythic Hurley Blackbreath', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9537', '0', '0', '0', '147', '2123', '', '1', '1.0', '8.48', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101443 WHERE (`entry` = 9537);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9537);
-- Mythic Plugger Spazzring
DELETE FROM `creature_template` WHERE entry = 9101444;
INSERT INTO `creature_template` VALUES (9101444, '0', '0', '0', '0', '0', '8652', '0', '0', '0', 'Mythic Plugger Spazzring', NULL, NULL, '0', '63', '63', '0', '674', '130', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9499', '0', '0', '0', '520', '684', '', '1', '1.0', '8.47', 
'8.0', '1.25', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101444 WHERE (`entry` = 9499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9499);
-- Mythic Phalanx
DELETE FROM `creature_template` WHERE entry = 9101445;
INSERT INTO `creature_template` VALUES (9101445, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Mythic Phalanx', NULL, NULL, '2283', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100500', '0', '100033', '0', '0', '856', '1955', '', '1', '1.0', '7.83', '2.0', '1.0', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101445 WHERE (`entry` = 9502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9502);
-- Mythic Fineous Darkvire
DELETE FROM `creature_template` WHERE entry = 9101446;
INSERT INTO `creature_template` VALUES (9101446, '0', '0', '0', '0', '0', '8704', '0', '0', '0', 'Mythic Fineous Darkvire', 'Chief Architect', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9056', '0', '0', '0', '376', '1675', '', '1', '1.0', '7.94', '5.0', '1.05', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101446 WHERE (`entry` = 9056);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9056);
-- Mythic Warder Stilgiss
DELETE FROM `creature_template` WHERE entry = 9101447;
INSERT INTO `creature_template` VALUES (9101447, '0', '0', '0', '0', '0', '9089', '0', '0', '0', 'Mythic Warder Stilgiss', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9041', '0', '0', '0', '694', '912', '', '1', '1.0', '8.02', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101447 WHERE (`entry` = 9041);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9041);
-- Mythic Verek
DELETE FROM `creature_template` WHERE entry = 9101448;
INSERT INTO `creature_template` VALUES (9101448, '0', '0', '0', '0', '0', '9019', '0', '0', '0', 'Mythic Verek', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.0', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '9042', '0', '0', '0', '0', '', '1', '1.0', '8.44', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101448 WHERE (`entry` = 9042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9042);
-- Mythic Ambassador Flamelash
DELETE FROM `creature_template` WHERE entry = 9101449;
INSERT INTO `creature_template` VALUES (9101449, '0', '0', '0', '0', '0', '8329', '0', '0', '0', 'Mythic Ambassador Flamelash', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '1284', '2000', '', '1', '1.0', '8.11', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101449 WHERE (`entry` = 9156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9156);
-- Mythic Haterel
DELETE FROM `creature_template` WHERE entry = 9101450;
INSERT INTO `creature_template` VALUES (9101450, '0', '0', '0', '0', '0', '8690', '0', '0', '0', 'Mythic Haterel', NULL, NULL, '1941', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.18', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101450 WHERE (`entry` = 9034);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9034);
-- Mythic Angerrel
DELETE FROM `creature_template` WHERE entry = 9101451;
INSERT INTO `creature_template` VALUES (9101451, '0', '0', '0', '0', '0', '8686', '0', '0', '0', 'Mythic Angerrel', NULL, NULL, '1943', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.25', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101451 WHERE (`entry` = 9035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9035);
-- Mythic Vilerel
DELETE FROM `creature_template` WHERE entry = 9101452;
INSERT INTO `creature_template` VALUES (9101452, '0', '0', '0', '0', '0', '8692', '0', '0', '0', 'Mythic Vilerel', NULL, NULL, '1944', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.21', '6.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101452 WHERE (`entry` = 9036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9036);
-- Mythic Gloomrel
DELETE FROM `creature_template` WHERE entry = 9101453;
INSERT INTO `creature_template` VALUES (9101453, '0', '0', '0', '0', '0', '8689', '0', '0', '0', 'Mythic Gloomrel', NULL, NULL, '1945', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.84', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101453 WHERE (`entry` = 9037);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9037);
-- Mythic Seethrel
DELETE FROM `creature_template` WHERE entry = 9101454;
INSERT INTO `creature_template` VALUES (9101454, '0', '0', '0', '0', '0', '8691', '0', '0', '0', 'Mythic Seethrel', NULL, NULL, '1946', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.82', '5.0', '1.3', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101454 WHERE (`entry` = 9038);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9038);
-- Mythic Doomrel
DELETE FROM `creature_template` WHERE entry = 9101455;
INSERT INTO `creature_template` VALUES (9101455, '0', '0', '0', '0', '0', '8687', '0', '0', '0', 'Mythic Doomrel', NULL, NULL, '1947', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '646', '849', '', '1', '1.0', '8.1', '8.0', '1.2', 
'1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101455 WHERE (`entry` = 9039);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9039);
-- Mythic Doperel
DELETE FROM `creature_template` WHERE entry = 9101456;
INSERT INTO `creature_template` VALUES (9101456, '0', '0', '0', '0', '0', '8688', '0', '0', '0', 'Mythic Doperel', NULL, NULL, '1948', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.02', '2.0', '0.5', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101456 WHERE (`entry` = 9040);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9040);
-- Mythic Magmus
DELETE FROM `creature_template` WHERE entry = 9101457;
INSERT INTO `creature_template` VALUES (9101457, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Mythic Magmus', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '8.48', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101457 WHERE (`entry` = 9938);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9938);
-- Mythic Princess Moira Bronzebeard
DELETE FROM `creature_template` WHERE entry = 9101458;
INSERT INTO `creature_template` VALUES (9101458, '0', '0', '0', '0', '0', '8705', '0', '0', '0', 'Mythic Princess Moira Bronzebeard', 'Princess of Ironforge', NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '733', '962', '', '1', '1.0', '7.82', '3.0', '1.0', '2.0', '0', '0', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101458 WHERE (`entry` = 8929);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8929);
-- Mythic Emperor Dagran Thaurissan
DELETE FROM `creature_template` WHERE entry = 9101459;
INSERT INTO `creature_template` VALUES (9101459, '0', '0', '0', '0', '0', '8807', '0', '0', '0', 'Mythic Emperor Dagran Thaurissan', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9019', '0', '0', '0', '1202', '1575', '', '1', '1.0', '8.29', '2.0', '0.95', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101459 WHERE (`entry` = 9019);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9019);
-- Mythic Gorosh the Dervish
DELETE FROM `creature_template` WHERE entry = 9101460;
INSERT INTO `creature_template` VALUES (9101460, '0', '0', '0', '0', '0', '8760', '0', '0', '0', 'Mythic Gorosh the Dervish', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '147', '1784', '', '1', '1.0', '7.85', '2.0', '0.75', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101460 WHERE (`entry` = 9027);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9027);
-- Mythic Grizzle
DELETE FROM `creature_template` WHERE entry = 9101461;
INSERT INTO `creature_template` VALUES (9101461, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Mythic Grizzle', NULL, NULL, '0', '63', '63', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '143', '2301', '', '1', '1.0', '8.12', '2.0', '0.8', 
'1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101461 WHERE (`entry` = 9028);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9028);
-- Mythic Eviscerator
DELETE FROM `creature_template` WHERE entry = 9101462;
INSERT INTO `creature_template` VALUES (9101462, '0', '0', '0', '0', '0', '523', '0', '0', '0', 'Mythic Eviscerator', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '9029', '0', '0', '147', '737', '', '1', '1.0', '7.94', '5.0', '1.0', 
'1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101462 WHERE (`entry` = 9029);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9029);
-- Mythic Okthor the Breaker
DELETE FROM `creature_template` WHERE entry = 9101463;
INSERT INTO `creature_template` VALUES (9101463, '0', '0', '0', '0', '0', '11538', '0', '0', '0', 'Mythic Okthor the Breaker', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '147', '737', '', '1', '1.0', '8.02', '8.0', '0.8', '1.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101463 WHERE (`entry` = 9030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9030);
-- Mythic Anubshiah
DELETE FROM `creature_template` WHERE entry = 9101464;
INSERT INTO `creature_template` VALUES (9101464, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Mythic Anubshiah', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '1800', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '138', '689', '', '1', '1.0', '8.17', '5.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101464 WHERE (`entry` = 9031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9031);
-- Mythic Hedrum the Creeper
DELETE FROM `creature_template` WHERE entry = 9101465;
INSERT INTO `creature_template` VALUES (9101465, '0', '0', '0', '0', '0', '8271', '0', '0', '0', 'Mythic Hedrum the Creeper', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '100003', '0', '0', '133', '666', '', '1', '1.0', '8.17', '2.0', '0.65', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101465 WHERE (`entry` = 9032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9032);