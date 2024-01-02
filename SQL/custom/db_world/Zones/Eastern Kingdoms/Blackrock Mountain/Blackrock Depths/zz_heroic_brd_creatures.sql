-- Heroic Anvilrage Captain
DELETE FROM `creature_template` WHERE entry = 9101400;
INSERT INTO `creature_template` VALUES (9101400, '0', '0', '0', '0', '0', '8749', '0', '0', '0', 'Heroic Anvilrage Captain', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8903', '8903', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101400 WHERE (`entry` = 8903);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8903);
-- Heroic Anvilrage Footman
DELETE FROM `creature_template` WHERE entry = 9101401;
INSERT INTO `creature_template` VALUES (9101401, '0', '0', '0', '0', '0', '8718', '0', '0', '0', 'Heroic Anvilrage Footman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.1', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8892', '8892', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101401 WHERE (`entry` = 8892);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8892);
-- Heroic Anvilrage Guardsman
DELETE FROM `creature_template` WHERE entry = 9101402;
INSERT INTO `creature_template` VALUES (9101402, '0', '0', '0', '0', '0', '8750', '0', '0', '0', 'Heroic Anvilrage Guardsman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8891', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101402 WHERE (`entry` = 8891);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8891);
-- Heroic Anvilrage Marshal
DELETE FROM `creature_template` WHERE entry = 9101403;
INSERT INTO `creature_template` VALUES (9101403, '0', '0', '0', '0', '0', '8751', '0', '0', '0', 'Heroic Anvilrage Marshal', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '8.15', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8898', '8898', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101403 WHERE (`entry` = 8898);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8898);
-- Heroic Anvilrage Medic
DELETE FROM `creature_template` WHERE entry = 9101404;
INSERT INTO `creature_template` VALUES (9101404, '0', '0', '0', '0', '0', '8752', '0', '0', '0', 'Heroic Anvilrage Medic', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.4', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8894', '8894', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101404 WHERE (`entry` = 8894);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8894);
-- Heroic Anvilrage Officer
DELETE FROM `creature_template` WHERE entry = 9101405;
INSERT INTO `creature_template` VALUES (9101405, '0', '0', '0', '0', '0', '8753', '0', '0', '0', 'Heroic Anvilrage Officer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.3', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8895', '8895', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101405 WHERE (`entry` = 8895);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8895);
-- Heroic Anvilrage Overseer
DELETE FROM `creature_template` WHERE entry = 9101406;
INSERT INTO `creature_template` VALUES (9101406, '0', '0', '0', '0', '0', '8754', '0', '0', '0', 'Heroic Anvilrage Overseer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.32', '1600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8889', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101406 WHERE (`entry` = 8889);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8889);
-- Heroic Anvilrage Reservist
DELETE FROM `creature_template` WHERE entry = 9101407;
INSERT INTO `creature_template` VALUES (9101407, '0', '0', '0', '0', '0', '8755', '9288', '9289', '9290', 'Heroic Anvilrage Reservist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101407 WHERE (`entry` = 8901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8901);
-- Heroic Anvilrage Soldier
DELETE FROM `creature_template` WHERE entry = 9101408;
INSERT INTO `creature_template` VALUES (9101408, '0', '0', '0', '0', '0', '8757', '0', '0', '0', 'Heroic Anvilrage Soldier', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '10.05', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8893', '8893', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101408 WHERE (`entry` = 8893);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8893);
-- Heroic Anvilrage Warden
DELETE FROM `creature_template` WHERE entry = 9101409;
INSERT INTO `creature_template` VALUES (9101409, '0', '0', '0', '0', '0', '8758', '0', '0', '0', 'Heroic Anvilrage Warden', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8890', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101409 WHERE (`entry` = 8890);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8890);
-- Heroic Arcanite Dragonling
DELETE FROM `creature_template` WHERE entry = 9101410;
INSERT INTO `creature_template` VALUES (9101410, '0', '0', '0', '0', '0', '12489', '0', '0', '0', 'Heroic Arcanite Dragonling', NULL, NULL, '0', '60', '60', '0', '50', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.1', '0.5', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101410 WHERE (`entry` = 12473);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12473);
-- Heroic Arena Spectator
DELETE FROM `creature_template` WHERE entry = 9101411;
INSERT INTO `creature_template` VALUES (9101411, '0', '0', '0', '0', '0', '9069', '9070', '9071', '9072', 'Heroic Arena Spectator', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.25', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8916', '8916', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101411 WHERE (`entry` = 8916);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8916);
-- Heroic Blackbreath Crony
DELETE FROM `creature_template` WHERE entry = 9101412;
INSERT INTO `creature_template` VALUES (9101412, '0', '0', '0', '0', '0', '8661', '8662', '8663', '0', 'Heroic Blackbreath Crony', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9541', '9541', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101412 WHERE (`entry` = 9541);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9541);
-- Heroic Blazing Fireguard
DELETE FROM `creature_template` WHERE entry = 9101413;
INSERT INTO `creature_template` VALUES (9101413, '0', '0', '0', '0', '0', '1070', '0', '0', '0', 'Heroic Blazing Fireguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '2.3', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8910', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101413 WHERE (`entry` = 8910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8910);
-- Heroic Bloodhound
DELETE FROM `creature_template` WHERE entry = 9101414;
INSERT INTO `creature_template` VALUES (9101414, '0', '0', '0', '0', '0', '8180', '0', '0', '0', 'Heroic Bloodhound', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8921', '0', '8921', '0', '0', '0', '0', '', '1', '1.0', '1.25', '1.0', '1.0', '1.0', 
'0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101414 WHERE (`entry` = 8921);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8921);
-- Heroic Bloodhound Mastiff
DELETE FROM `creature_template` WHERE entry = 9101415;
INSERT INTO `creature_template` VALUES (9101415, '0', '0', '0', '0', '0', '8181', '0', '0', '0', 'Heroic Bloodhound Mastiff', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.8', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8922', '0', '8922', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101415 WHERE (`entry` = 8922);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8922);
-- Heroic Borer Beetle
DELETE FROM `creature_template` WHERE entry = 9101416;
INSERT INTO `creature_template` VALUES (9101416, '0', '0', '0', '0', '0', '7470', '9354', '9028', '9029', 'Heroic Borer Beetle', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8932', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '0.65', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101416 WHERE (`entry` = 8932);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8932);
-- Heroic Burning Spirit
DELETE FROM `creature_template` WHERE entry = 9101417;
INSERT INTO `creature_template` VALUES (9101417, '0', '0', '0', '0', '0', '4607', '0', '0', '0', 'Heroic Burning Spirit', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '0.857143', '1.0', '1.0', '18.0', '1.0', '0', '2', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.05', '1.0', '1.0', '1.0', '0', '100', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101417 WHERE (`entry` = 9178);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9178);
-- Heroic Burrowing Thundersnout
DELETE FROM `creature_template` WHERE entry = 9101418;
INSERT INTO `creature_template` VALUES (9101418, '0', '0', '0', '0', '0', '8184', '9033', '3005', '2194', 'Heroic Burrowing Thundersnout', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.4', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8928', '0', '8928', '0', '0', '0', '0', '', '1', '1.0', '2.5', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101418 WHERE (`entry` = 8928);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8928);
-- Heroic Cave Creeper
DELETE FROM `creature_template` WHERE entry = 9101419;
INSERT INTO `creature_template` VALUES (9101419, '0', '0', '0', '0', '0', '8014', '909', '821', '520', 'Heroic Cave Creeper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '8933', '0', '0', '5907', '0', '0', '0', '', '1', '1.0', '2.5', '1.0', '0.5', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101419 WHERE (`entry` = 8933);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8933);
-- Heroic Commander Gorshak
DELETE FROM `creature_template` WHERE entry = 9101420;
INSERT INTO `creature_template` VALUES (9101420, '0', '0', '0', '0', '0', '8703', '0', '0', '0', 'Heroic Commander Gorshak', 'Kargath Expeditionary Force', NULL, '0', '60', '60', '0', '113', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.25', '2000', '2000', '1.0', '1.0', '1', '576', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101420 WHERE (`entry` = 9020);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9020);
-- Heroic Crest Killer
DELETE FROM `creature_template` WHERE entry = 9101421;
INSERT INTO `creature_template` VALUES (9101421, '0', '0', '0', '0', '0', '9053', '0', '0', '0', 'Heroic Crest Killer', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9680', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101421 WHERE (`entry` = 9680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9680);
-- Heroic Dark Guard
DELETE FROM `creature_template` WHERE entry = 9101422;
INSERT INTO `creature_template` VALUES (9101422, '0', '0', '0', '0', '0', '8597', '0', '0', '0', 'Heroic Dark Guard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9445', '9445', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101422 WHERE (`entry` = 9445);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9445);
-- Heroic Dark Screecher
DELETE FROM `creature_template` WHERE entry = 9101423;
INSERT INTO `creature_template` VALUES (9101423, '0', '0', '0', '0', '0', '1955', '1954', '0', '0', 'Heroic Dark Screecher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.85', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '8927', '0', '8927', '5793', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101423 WHERE (`entry` = 8927);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8927);
-- Heroic Deep Stinger
DELETE FROM `creature_template` WHERE entry = 9101424;
INSERT INTO `creature_template` VALUES (9101424, '0', '0', '0', '0', '0', '7347', '3247', '2489', '0', 'Heroic Deep Stinger', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.85', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '8926', '0', '8926', '5874', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101424 WHERE (`entry` = 8926);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8926);
-- Heroic Doomforge Arcanasmith
DELETE FROM `creature_template` WHERE entry = 9101425;
INSERT INTO `creature_template` VALUES (9101425, '0', '0', '0', '0', '0', '8812', '8813', '8814', '8815', 'Heroic Doomforge Arcanasmith', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '1.7', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8900', '8900', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101425 WHERE (`entry` = 8900);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8900);
-- Heroic Doomforge Craftsman
DELETE FROM `creature_template` WHERE entry = 9101426;
INSERT INTO `creature_template` VALUES (9101426, '0', '0', '0', '0', '0', '8803', '8804', '8805', '8806', 'Heroic Doomforge Craftsman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.6', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8897', '8897', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101426 WHERE (`entry` = 8897);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8897);
-- Heroic Doomforge Dragoon
DELETE FROM `creature_template` WHERE entry = 9101427;
INSERT INTO `creature_template` VALUES (9101427, '0', '0', '0', '0', '0', '8820', '8821', '8822', '8823', 'Heroic Doomforge Dragoon', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8899', '8899', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101427 WHERE (`entry` = 8899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8899);
-- Heroic Dredge Worm
DELETE FROM `creature_template` WHERE entry = 9101428;
INSERT INTO `creature_template` VALUES (9101428, '0', '0', '0', '0', '0', '8182', '9030', '9031', '9032', 'Heroic Dredge Worm', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.5', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '8925', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '1.8', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101428 WHERE (`entry` = 8925);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8925);
-- Heroic Dughal Stormwing
DELETE FROM `creature_template` WHERE entry = 9101429;
INSERT INTO `creature_template` VALUES (9101429, '0', '0', '0', '0', '0', '8709', '0', '0', '0', 'Heroic Dughal Stormwing', NULL, NULL, '0', '60', '60', '0', '534', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101429 WHERE (`entry` = 9022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9022);
-- Heroic Elder Morndeep
DELETE FROM `creature_template` WHERE entry = 9101430;
INSERT INTO `creature_template` VALUES (9101430, '0', '0', '0', '0', '0', '15622', '0', '0', '0', 'Heroic Elder Morndeep', NULL, NULL, '21033', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.3', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.2', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101430 WHERE (`entry` = 15549);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15549);
-- Heroic Explosive Sheep
DELETE FROM `creature_template` WHERE entry = 9101431;
INSERT INTO `creature_template` VALUES (9101431, '0', '0', '0', '0', '0', '3886', '0', '0', '0', 'Heroic Explosive Sheep', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '0.571429', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '1.05', '1.0', '1.0', '1.0', '0', '80', '1', '902267455', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101431 WHERE (`entry` = 2675);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2675);
-- Heroic Fireguard
DELETE FROM `creature_template` WHERE entry = 9101432;
INSERT INTO `creature_template` VALUES (9101432, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Heroic Fireguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '2.4', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8909', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', 
'0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101432 WHERE (`entry` = 8909);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8909);
-- Heroic Fireguard Destroyer
DELETE FROM `creature_template` WHERE entry = 9101433;
INSERT INTO `creature_template` VALUES (9101433, '0', '0', '0', '0', '0', '5488', '0', '0', '0', 'Heroic Fireguard Destroyer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '2.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8911', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '0.85', 
'1.0', '0', '0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101433 WHERE (`entry` = 8911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8911);
-- Heroic Gnashjaw
DELETE FROM `creature_template` WHERE entry = 9101434;
INSERT INTO `creature_template` VALUES (9101434, '0', '0', '0', '0', '0', '12966', '0', '0', '0', 'Heroic Gnashjaw', 'Malgen Longspear''s Pet', NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.42857', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '1.85', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '16095', '0', '0', '0', '0', '', '0', '1.0', '1.0', '1.0', '1.1', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101434 WHERE (`entry` = 16095);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16095);
-- Heroic Grim Patron
DELETE FROM `creature_template` WHERE entry = 9101435;
INSERT INTO `creature_template` VALUES (9101435, '0', '0', '0', '0', '0', '8673', '8674', '8675', '8676', 'Heroic Grim Patron', NULL, NULL, '1962', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.55', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9545', '9545', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101435 WHERE (`entry` = 9545);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9545);
-- Heroic Guzzling Patron
DELETE FROM `creature_template` WHERE entry = 9101436;
INSERT INTO `creature_template` VALUES (9101436, '0', '0', '0', '0', '0', '8678', '8679', '8680', '0', 'Heroic Guzzling Patron', NULL, NULL, '1963', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.8', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9547', '9547', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101436 WHERE (`entry` = 9547);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9547);
-- Heroic Hammered Patron
DELETE FROM `creature_template` WHERE entry = 9101437;
INSERT INTO `creature_template` VALUES (9101437, '0', '0', '0', '0', '0', '8681', '8682', '8683', '8684', 'Heroic Hammered Patron', NULL, NULL, '1966', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9554', '9554', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', 
'2.0', '0.85', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101437 WHERE (`entry` = 9554);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9554);
-- Heroic High Justice Grimstone
DELETE FROM `creature_template` WHERE entry = 9101438;
INSERT INTO `creature_template` VALUES (9101438, '0', '0', '0', '0', '0', '9329', '0', '0', '0', 'Heroic High Justice Grimstone', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.5', '2.0', '1.0', '2.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101438 WHERE (`entry` = 10096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10096);
-- Heroic Jaz
DELETE FROM `creature_template` WHERE entry = 9101439;
INSERT INTO `creature_template` VALUES (9101439, '0', '0', '0', '0', '0', '9049', '0', '0', '0', 'Heroic Jaz', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.05', '1600', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9681', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101439 WHERE (`entry` = 9681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9681);
-- Heroic Kharan Mighthammer
DELETE FROM `creature_template` WHERE entry = 9101440;
INSERT INTO `creature_template` VALUES (9101440, '0', '0', '0', '0', '0', '8708', '0', '0', '0', 'Heroic Kharan Mighthammer', NULL, NULL, '1822', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101440 WHERE (`entry` = 9021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9021);
-- Heroic Korv
DELETE FROM `creature_template` WHERE entry = 9101441;
INSERT INTO `creature_template` VALUES (9101441, '0', '0', '0', '0', '0', '15976', '0', '0', '0', 'Heroic Korv', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.5', '2.24', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101441 WHERE (`entry` = 16053);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16053);
-- Heroic Lefty
DELETE FROM `creature_template` WHERE entry = 9101442;
INSERT INTO `creature_template` VALUES (9101442, '0', '0', '0', '0', '0', '15972', '0', '0', '0', 'Heroic Lefty', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.4', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.625', '1.0', '1.1', '1.0', '0', '0', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101442 WHERE (`entry` = 16049);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16049);
-- Heroic Lokhtos Darkbargainer
DELETE FROM `creature_template` WHERE entry = 9101443;
INSERT INTO `creature_template` VALUES (9101443, '0', '0', '0', '0', '0', '14666', '0', '0', '0', 'Heroic Lokhtos Darkbargainer', 'The Thorium Brotherhood', NULL, '4781', '60', '60', '0', '1475', '131', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.6', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', '1.0', '2.4', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101443 WHERE (`entry` = 12944);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12944);
-- Heroic Malgen Longspear
DELETE FROM `creature_template` WHERE entry = 9101444;
INSERT INTO `creature_template` VALUES (9101444, '0', '0', '0', '0', '0', '15975', '0', '0', '0', 'Heroic Malgen Longspear', NULL, NULL, '0', '60', '60', '0', '54', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.5', '2.24', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101444 WHERE (`entry` = 16052);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16052);
-- Heroic Marshal Windsor
DELETE FROM `creature_template` WHERE entry = 9101445;
INSERT INTO `creature_template` VALUES (9101445, '0', '0', '0', '0', '0', '8707', '0', '0', '0', 'Heroic Marshal Windsor', NULL, NULL, '0', '60', '60', '0', '534', '2', '1.0', '0.857143', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.0', '2.0', '0.85', '1.0', '0', '100', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101445 WHERE (`entry` = 9023);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9023);
-- Heroic Mistress Nagmara
DELETE FROM `creature_template` WHERE entry = 9101446;
INSERT INTO `creature_template` VALUES (9101446, '0', '0', '0', '0', '0', '2834', '0', '0', '0', 'Heroic Mistress Nagmara', NULL, NULL, '2076', '60', '60', '0', '35', '3', '0.72', '0.857143', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.25', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '101', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101446 WHERE (`entry` = 9500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9500);
-- Heroic Molten War Golem
DELETE FROM `creature_template` WHERE entry = 9101447;
INSERT INTO `creature_template` VALUES (9101447, '0', '0', '0', '0', '0', '8179', '0', '0', '0', 'Heroic Molten War Golem', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '2', '2.45', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8908', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '5.5', '2.0', '1.25', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101447 WHERE (`entry` = 8908);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8908);
-- Heroic Ograbisi
DELETE FROM `creature_template` WHERE entry = 9101448;
INSERT INTO `creature_template` VALUES (9101448, '0', '0', '0', '0', '0', '11553', '0', '0', '0', 'Heroic Ograbisi', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9677', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '1.0', '1.4', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101448 WHERE (`entry` = 9677);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9677);
-- Heroic Private Rocknot
DELETE FROM `creature_template` WHERE entry = 9101449;
INSERT INTO `creature_template` VALUES (9101449, '0', '0', '0', '0', '0', '8654', '0', '0', '0', 'Heroic Private Rocknot', NULL, NULL, '12128', '60', '60', '0', '35', '3', '0.8', '0.714286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '0.85', '1.0', '0', '90', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101449 WHERE (`entry` = 9503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9503);
-- Heroic Ragereaver Golem
DELETE FROM `creature_template` WHERE entry = 9101450;
INSERT INTO `creature_template` VALUES (9101450, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Heroic Ragereaver Golem', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.65', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8906', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101450 WHERE (`entry` = 8906);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8906);
-- Heroic Rezznik
DELETE FROM `creature_template` WHERE entry = 9101451;
INSERT INTO `creature_template` VALUES (9101451, '0', '0', '0', '0', '0', '15977', '0', '0', '0', 'Heroic Rezznik', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.625', '1.72', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101451 WHERE (`entry` = 16054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16054);
-- Heroic Ribblys Crony
DELETE FROM `creature_template` WHERE entry = 9101452;
INSERT INTO `creature_template` VALUES (9101452, '0', '0', '0', '0', '0', '9233', '9234', '9235', '9236', 'Heroic Ribblys Crony', NULL, NULL, '1966', '60', '60', '0', '735', '1', '1.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.75', '2000', '2000', '1.0', '1.0', '1', '576', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10043', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '0.6', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101452 WHERE (`entry` = 10043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10043);
-- Heroic Rotfang
DELETE FROM `creature_template` WHERE entry = 9101453;
INSERT INTO `creature_template` VALUES (9101453, '0', '0', '0', '0', '0', '16017', '0', '0', '0', 'Heroic Rotfang', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '3.4', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.625', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101453 WHERE (`entry` = 16050);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16050);
-- Heroic Shadowforge Citizen
DELETE FROM `creature_template` WHERE entry = 9101454;
INSERT INTO `creature_template` VALUES (9101454, '0', '0', '0', '0', '0', '8798', '8799', '8800', '8801', 'Heroic Shadowforge Citizen', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.65', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8902', '8902', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', 
'1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101454 WHERE (`entry` = 8902);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8902);
-- Heroic Shadowforge Flame Keeper
DELETE FROM `creature_template` WHERE entry = 9101455;
INSERT INTO `creature_template` VALUES (9101455, '0', '0', '0', '0', '0', '9309', '0', '0', '0', 'Heroic Shadowforge Flame Keeper', NULL, NULL, '0', '60', '60', '0', '14', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9956', '9956', '0', '0', '0', '0', '0', '', '1', '1.0', '0.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101455 WHERE (`entry` = 9956);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9956);
-- Heroic Shadowforge Peasant
DELETE FROM `creature_template` WHERE entry = 9101456;
INSERT INTO `creature_template` VALUES (9101456, '0', '0', '0', '0', '0', '8793', '8794', '8795', '8796', 'Heroic Shadowforge Peasant', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.55', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8896', '8896', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', 
'1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101456 WHERE (`entry` = 8896);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8896);
-- Heroic Shadowforge Senator
DELETE FROM `creature_template` WHERE entry = 9101457;
INSERT INTO `creature_template` VALUES (9101457, '0', '0', '0', '0', '0', '8825', '8826', '8827', '8828', 'Heroic Shadowforge Senator', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.7', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8904', '8904', '0', '0', '0', '0', '0', '', '1', '1.0', '1.35', 
'1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101457 WHERE (`entry` = 8904);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8904);
-- Heroic Shill Dinger
DELETE FROM `creature_template` WHERE entry = 9101458;
INSERT INTO `creature_template` VALUES (9101458, '0', '0', '0', '0', '0', '9051', '0', '0', '0', 'Heroic Shill Dinger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9678', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.0', '5.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101458 WHERE (`entry` = 9678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9678);
-- Heroic Slave
DELETE FROM `creature_template` WHERE entry = 9101459;
INSERT INTO `creature_template` VALUES (9101459, '0', '0', '0', '0', '0', '9330', '9331', '9332', '9333', 'Heroic Slave', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.3', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101459 WHERE (`entry` = 10116);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10116);
-- Heroic Snokh Blackspine
DELETE FROM `creature_template` WHERE entry = 9101460;
INSERT INTO `creature_template` VALUES (9101460, '0', '0', '0', '0', '0', '15974', '0', '0', '0', 'Heroic Snokh Blackspine', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.7', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '2.625', '1.33', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101460 WHERE (`entry` = 16051);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16051);
-- Heroic Spawn of BaelGar
DELETE FROM `creature_template` WHERE entry = 9101461;
INSERT INTO `creature_template` VALUES (9101461, '0', '0', '0', '0', '0', '8573', '0', '0', '0', 'Heroic Spawn of BaelGar', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.42857', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '1.35', '2000', '1672', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.25', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101461 WHERE (`entry` = 9436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9436);
-- Heroic Tobias Seecher
DELETE FROM `creature_template` WHERE entry = 9101462;
INSERT INTO `creature_template` VALUES (9101462, '0', '0', '0', '0', '0', '9054', '0', '0', '0', 'Heroic Tobias Seecher', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.2', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101462 WHERE (`entry` = 9679);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9679);
-- Heroic Tortured Slave
DELETE FROM `creature_template` WHERE entry = 9101463;
INSERT INTO `creature_template` VALUES (9101463, '0', '0', '0', '0', '0', '7550', '9334', '9335', '0', 'Heroic Tortured Slave', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.3', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101463 WHERE (`entry` = 10117);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10117);
-- Heroic Twilight Bodyguard
DELETE FROM `creature_template` WHERE entry = 9101464;
INSERT INTO `creature_template` VALUES (9101464, '0', '0', '0', '0', '0', '9346', '9347', '8773', '9349', 'Heroic Twilight Bodyguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8914', '8914', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101464 WHERE (`entry` = 8914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8914);
-- Heroic Twilight Emissary
DELETE FROM `creature_template` WHERE entry = 9101465;
INSERT INTO `creature_template` VALUES (9101465, '0', '0', '0', '0', '0', '8772', '8774', '8776', '8777', 'Heroic Twilight Emissary', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.2', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8913', '8913', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101465 WHERE (`entry` = 8913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8913);
-- Heroic Twilights Hammer Ambassador
DELETE FROM `creature_template` WHERE entry = 9101466;
INSERT INTO `creature_template` VALUES (9101466, '0', '0', '0', '0', '0', '8778', '8779', '8780', '9025', 'Heroic Twilights Hammer Ambassador', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8915', '8915', '0', '0', '0', '0', '0', '', '1', '1.0', '1.3', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101466 WHERE (`entry` = 8915);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8915);
-- Heroic Twilights Hammer Executioner
DELETE FROM `creature_template` WHERE entry = 9101467;
INSERT INTO `creature_template` VALUES (9101467, '0', '0', '0', '0', '0', '8706', '0', '0', '0', 'Heroic Twilights Hammer Executioner', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.55', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9398', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', 
'0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101467 WHERE (`entry` = 9398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9398);
-- Heroic Twilights Hammer Torturer
DELETE FROM `creature_template` WHERE entry = 9101468;
INSERT INTO `creature_template` VALUES (9101468, '0', '0', '0', '0', '0', '8790', '9350', '9351', '8792', 'Heroic Twilights Hammer Torturer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.25', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8912', '8912', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101468 WHERE (`entry` = 8912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8912);
-- Heroic Vajashni
DELETE FROM `creature_template` WHERE entry = 9101469;
INSERT INTO `creature_template` VALUES (9101469, '0', '0', '0', '0', '0', '15979', '0', '0', '0', 'Heroic Vajashni', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.7', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.5', '1.33', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101469 WHERE (`entry` = 16055);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16055);
-- Heroic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9101470;
INSERT INTO `creature_template` VALUES (9101470, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Heroic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.2', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.8', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101470 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996);
-- Heroic Volida
DELETE FROM `creature_template` WHERE entry = 9101471;
INSERT INTO `creature_template` VALUES (9101471, '0', '0', '0', '0', '0', '15980', '0', '0', '0', 'Heroic Volida', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.7', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.5', '1.33', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101471 WHERE (`entry` = 16058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16058);
-- Heroic Warbringer Construct
DELETE FROM `creature_template` WHERE entry = 9101472;
INSERT INTO `creature_template` VALUES (9101472, '0', '0', '0', '0', '0', '8289', '0', '0', '0', 'Heroic Warbringer Construct', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.7', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8905', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '0.95', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101472 WHERE (`entry` = 8905);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8905);
-- Heroic Weapon Technician
DELETE FROM `creature_template` WHERE entry = 9101473;
INSERT INTO `creature_template` VALUES (9101473, '0', '0', '0', '0', '0', '8894', '8895', '8896', '8897', 'Heroic Weapon Technician', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8920', '8920', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101473 WHERE (`entry` = 8920);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8920);
-- Heroic Wrath Hammer Construct
DELETE FROM `creature_template` WHERE entry = 9101474;
INSERT INTO `creature_template` VALUES (9101474, '0', '0', '0', '0', '0', '8178', '0', '0', '0', 'Heroic Wrath Hammer Construct', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.55', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '8907', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '3.0', '2.0', '1.0', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101474 WHERE (`entry` = 8907);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8907);
-- Heroic Ambassador Flamelash
DELETE FROM `creature_template` WHERE entry = 9101475;
INSERT INTO `creature_template` VALUES (9101475, '0', '0', '0', '0', '0', '8329', '0', '0', '0', 'Heroic Ambassador Flamelash', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.9', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.45', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101475 WHERE (`entry` = 9156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9156);
-- Heroic Angerrel
DELETE FROM `creature_template` WHERE entry = 9101476;
INSERT INTO `creature_template` VALUES (9101476, '0', '0', '0', '0', '0', '8686', '0', '0', '0', 'Heroic Angerrel', NULL, NULL, '1943', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101476 WHERE (`entry` = 9035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9035);
-- Heroic Anubshiah
DELETE FROM `creature_template` WHERE entry = 9101477;
INSERT INTO `creature_template` VALUES (9101477, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Heroic Anubshiah', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '1800', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.06', '5.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101477 WHERE (`entry` = 9031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9031);
-- Heroic BaelGar
DELETE FROM `creature_template` WHERE entry = 9101478;
INSERT INTO `creature_template` VALUES (9101478, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Heroic BaelGar', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '6.04', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101478 WHERE (`entry` = 9016);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9016);
-- Heroic Dark Keeper Bethek
DELETE FROM `creature_template` WHERE entry = 9101479;
INSERT INTO `creature_template` VALUES (9101479, '0', '0', '0', '0', '0', '8592', '0', '0', '0', 'Heroic Dark Keeper Bethek', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '1183', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.23', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101479 WHERE (`entry` = 9438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9438);
-- Heroic Dark Keeper Ofgut
DELETE FROM `creature_template` WHERE entry = 9101480;
INSERT INTO `creature_template` VALUES (9101480, '0', '0', '0', '0', '0', '8595', '0', '0', '0', 'Heroic Dark Keeper Ofgut', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '1183', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.24', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101480 WHERE (`entry` = 9442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9442);
-- Heroic Dark Keeper Pelver
DELETE FROM `creature_template` WHERE entry = 9101481;
INSERT INTO `creature_template` VALUES (9101481, '0', '0', '0', '0', '0', '8596', '0', '0', '0', 'Heroic Dark Keeper Pelver', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9443', '0', '0', '0', '0', '0', '', '1', '1.0', '6.11', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101481 WHERE (`entry` = 9443);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9443);
-- Heroic Dark Keeper Uggel
DELETE FROM `creature_template` WHERE entry = 9101482;
INSERT INTO `creature_template` VALUES (9101482, '0', '0', '0', '0', '0', '8593', '0', '0', '0', 'Heroic Dark Keeper Uggel', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '1175', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101482 WHERE (`entry` = 9439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9439);
-- Heroic Dark Keeper Vorfalk
DELETE FROM `creature_template` WHERE entry = 9101483;
INSERT INTO `creature_template` VALUES (9101483, '0', '0', '0', '0', '0', '8591', '0', '0', '0', 'Heroic Dark Keeper Vorfalk', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.18', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101483 WHERE (`entry` = 9437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9437);
-- Heroic Dark Keeper Zimrel
DELETE FROM `creature_template` WHERE entry = 9101484;
INSERT INTO `creature_template` VALUES (9101484, '0', '0', '0', '0', '0', '8594', '0', '0', '0', 'Heroic Dark Keeper Zimrel', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.89', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101484 WHERE (`entry` = 9441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9441);
-- Heroic Doomrel
DELETE FROM `creature_template` WHERE entry = 9101485;
INSERT INTO `creature_template` VALUES (9101485, '0', '0', '0', '0', '0', '8687', '0', '0', '0', 'Heroic Doomrel', NULL, NULL, '1947', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.05', '8.0', '1.2', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101485 WHERE (`entry` = 9039);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9039);
-- Heroic Doperel
DELETE FROM `creature_template` WHERE entry = 9101486;
INSERT INTO `creature_template` VALUES (9101486, '0', '0', '0', '0', '0', '8688', '0', '0', '0', 'Heroic Doperel', NULL, NULL, '1948', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.97', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.21', '2.0', '0.5', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101486 WHERE (`entry` = 9040);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9040);
-- Heroic Emperor Dagran Thaurissan
DELETE FROM `creature_template` WHERE entry = 9101487;
INSERT INTO `creature_template` VALUES (9101487, '0', '0', '0', '0', '0', '8807', '0', '0', '0', 'Heroic Emperor Dagran Thaurissan', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9019', '0', '0', '0', '0', '0', '', '1', '1.0', '6.06', '2.0', '0.95', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101487 WHERE (`entry` = 9019);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9019);
-- Heroic Eviscerator
DELETE FROM `creature_template` WHERE entry = 9101488;
INSERT INTO `creature_template` VALUES (9101488, '0', '0', '0', '0', '0', '523', '0', '0', '0', 'Heroic Eviscerator', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '9029', '0', '0', '0', '0', '', '1', '1.0', '5.99', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101488 WHERE (`entry` = 9029);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9029);
-- Heroic Fineous Darkvire
DELETE FROM `creature_template` WHERE entry = 9101489;
INSERT INTO `creature_template` VALUES (9101489, '0', '0', '0', '0', '0', '8704', '0', '0', '0', 'Heroic Fineous Darkvire', 'Chief Architect', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9056', '0', '0', '0', '0', '0', '', '1', '1.0', '6.31', '5.0', '1.05', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101489 WHERE (`entry` = 9056);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9056);
-- Heroic General Angerforge
DELETE FROM `creature_template` WHERE entry = 9101490;
INSERT INTO `creature_template` VALUES (9101490, '0', '0', '0', '0', '0', '8756', '0', '0', '0', 'Heroic General Angerforge', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9033', '0', '0', '0', '0', '0', '', '1', '1.0', '6.45', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101490 WHERE (`entry` = 9033);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9033);
-- Heroic Gloomrel
DELETE FROM `creature_template` WHERE entry = 9101491;
INSERT INTO `creature_template` VALUES (9101491, '0', '0', '0', '0', '0', '8689', '0', '0', '0', 'Heroic Gloomrel', NULL, NULL, '1945', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.0', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101491 WHERE (`entry` = 9037);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9037);
-- Heroic Golem Lord Argelmach
DELETE FROM `creature_template` WHERE entry = 9101492;
INSERT INTO `creature_template` VALUES (9101492, '0', '0', '0', '0', '0', '8759', '0', '0', '0', 'Heroic Golem Lord Argelmach', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.04', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '8983', '0', '0', '0', '0', '0', '', '1', '1.0', '6.03', '8.0', 
'1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101492 WHERE (`entry` = 8983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8983);
-- Heroic Gorosh the Dervish
DELETE FROM `creature_template` WHERE entry = 9101493;
INSERT INTO `creature_template` VALUES (9101493, '0', '0', '0', '0', '0', '8760', '0', '0', '0', 'Heroic Gorosh the Dervish', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.5', '2.0', '0.75', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101493 WHERE (`entry` = 9027);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9027);
-- Heroic Grizzle
DELETE FROM `creature_template` WHERE entry = 9101494;
INSERT INTO `creature_template` VALUES (9101494, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Heroic Grizzle', NULL, NULL, '0', '63', '63', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.32', '2.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101494 WHERE (`entry` = 9028);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9028);
-- Heroic Haterel
DELETE FROM `creature_template` WHERE entry = 9101495;
INSERT INTO `creature_template` VALUES (9101495, '0', '0', '0', '0', '0', '8690', '0', '0', '0', 'Heroic Haterel', NULL, NULL, '1941', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.4', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101495 WHERE (`entry` = 9034);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9034);
-- Heroic Hedrum the Creeper
DELETE FROM `creature_template` WHERE entry = 9101496;
INSERT INTO `creature_template` VALUES (9101496, '0', '0', '0', '0', '0', '8271', '0', '0', '0', 'Heroic Hedrum the Creeper', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100400', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '6.41', '2.0', '0.65', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101496 WHERE (`entry` = 9032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9032);
-- Heroic High Interrogator Gerstahn
DELETE FROM `creature_template` WHERE entry = 9101497;
INSERT INTO `creature_template` VALUES (9101497, '0', '0', '0', '0', '0', '8761', '0', '0', '0', 'Heroic High Interrogator Gerstahn', 'Twilight''s Hammer Interrogator', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.03', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9018', '0', '0', '0', '0', '0', '', '1', '1.0', '6.06', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101497 WHERE (`entry` = 9018);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9018);
-- Heroic Houndmaster Grebmar
DELETE FROM `creature_template` WHERE entry = 9101498;
INSERT INTO `creature_template` VALUES (9101498, '0', '0', '0', '0', '0', '9212', '0', '0', '0', 'Heroic Houndmaster Grebmar', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.28', '2.0', '1.25', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101498 WHERE (`entry` = 9319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9319);
-- Heroic Hurley Blackbreath
DELETE FROM `creature_template` WHERE entry = 9101499;
INSERT INTO `creature_template` VALUES (9101499, '0', '0', '0', '0', '0', '8658', '0', '0', '0', 'Heroic Hurley Blackbreath', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9537', '0', '0', '0', '0', '0', '', '1', '1.0', '6.11', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101499 WHERE (`entry` = 9537);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9537);
-- Heroic Lord Incendius
DELETE FROM `creature_template` WHERE entry = 9101500;
INSERT INTO `creature_template` VALUES (9101500, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Heroic Lord Incendius', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '5.06', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.83', '5.0', '1.0', '2.0', '0', '0', '1', '613122011', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101500 WHERE (`entry` = 9017);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9017);
-- Heroic Lord Roccor
DELETE FROM `creature_template` WHERE entry = 9101501;
INSERT INTO `creature_template` VALUES (9101501, '0', '0', '0', '0', '0', '5781', '0', '0', '0', 'Heroic Lord Roccor', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.03', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '6.16', '2.0', '1.5', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101501 WHERE (`entry` = 9025);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9025);
-- Heroic Magmus
DELETE FROM `creature_template` WHERE entry = 9101502;
INSERT INTO `creature_template` VALUES (9101502, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Heroic Magmus', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.91', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100400', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '5.87', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101502 WHERE (`entry` = 9938);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9938);
-- Heroic Okthor the Breaker
DELETE FROM `creature_template` WHERE entry = 9101503;
INSERT INTO `creature_template` VALUES (9101503, '0', '0', '0', '0', '0', '11538', '0', '0', '0', 'Heroic Okthor the Breaker', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.02', '8.0', '0.8', '1.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101503 WHERE (`entry` = 9030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9030);
-- Heroic Panzor the Invincible
DELETE FROM `creature_template` WHERE entry = 9101504;
INSERT INTO `creature_template` VALUES (9101504, '0', '0', '0', '0', '0', '8270', '0', '0', '0', 'Heroic Panzor the Invincible', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.95', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100400', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '5.82', '2.0', '1.45', '1.0', '0', '0', '1', '612466259', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101504 WHERE (`entry` = 8923);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8923);
-- Heroic Phalanx
DELETE FROM `creature_template` WHERE entry = 9101505;
INSERT INTO `creature_template` VALUES (9101505, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Heroic Phalanx', NULL, NULL, '2283', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100400', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '5.91', '2.0', '1.0', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101505 WHERE (`entry` = 9502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9502);
-- Heroic Plugger Spazzring
DELETE FROM `creature_template` WHERE entry = 9101506;
INSERT INTO `creature_template` VALUES (9101506, '0', '0', '0', '0', '0', '8652', '0', '0', '0', 'Heroic Plugger Spazzring', NULL, NULL, '0', '63', '63', '0', '674', '130', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.01', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9499', '0', '0', '0', '0', '0', '', '1', '1.0', '5.99', '8.0', '1.25', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101506 WHERE (`entry` = 9499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9499);
-- Heroic Princess Moira Bronzebeard
DELETE FROM `creature_template` WHERE entry = 9101507;
INSERT INTO `creature_template` VALUES (9101507, '0', '0', '0', '0', '0', '8705', '0', '0', '0', 'Heroic Princess Moira Bronzebeard', 'Princess of Ironforge', NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.94', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', 
'1.0', '6.18', '3.0', '1.0', '2.0', '0', '0', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101507 WHERE (`entry` = 8929);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8929);
-- Heroic Pyromancer Loregrain
DELETE FROM `creature_template` WHERE entry = 9101508;
INSERT INTO `creature_template` VALUES (9101508, '0', '0', '0', '0', '0', '8762', '0', '0', '0', 'Heroic Pyromancer Loregrain', NULL, NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.07', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9024', '0', '0', '0', '0', '0', '', '1', '1.0', '6.03', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101508 WHERE (`entry` = 9024);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9024);
-- Heroic Ribbly Screwspigot
DELETE FROM `creature_template` WHERE entry = 9101509;
INSERT INTO `creature_template` VALUES (9101509, '0', '0', '0', '0', '0', '8667', '0', '0', '0', 'Heroic Ribbly Screwspigot', NULL, NULL, '1970', '63', '63', '0', '735', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.09', '2000', '2000', '1.0', '1.0', '1', '33344', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.44', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101509 WHERE (`entry` = 9543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9543);
-- Heroic Seethrel
DELETE FROM `creature_template` WHERE entry = 9101510;
INSERT INTO `creature_template` VALUES (9101510, '0', '0', '0', '0', '0', '8691', '0', '0', '0', 'Heroic Seethrel', NULL, NULL, '1946', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.98', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.96', '5.0', '1.3', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101510 WHERE (`entry` = 9038);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9038);
-- Heroic Theldren
DELETE FROM `creature_template` WHERE entry = 9101511;
INSERT INTO `creature_template` VALUES (9101511, '0', '0', '0', '0', '0', '15981', '0', '0', '0', 'Heroic Theldren', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.92', '3800', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.08', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101511 WHERE (`entry` = 16059);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16059);
-- Heroic Verek
DELETE FROM `creature_template` WHERE entry = 9101512;
INSERT INTO `creature_template` VALUES (9101512, '0', '0', '0', '0', '0', '9019', '0', '0', '0', 'Heroic Verek', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '5.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100400', '0', '9042', '0', '0', '0', '0', '', '1', '1.0', '6.42', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101512 WHERE (`entry` = 9042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9042);
-- Heroic Vilerel
DELETE FROM `creature_template` WHERE entry = 9101513;
INSERT INTO `creature_template` VALUES (9101513, '0', '0', '0', '0', '0', '8692', '0', '0', '0', 'Heroic Vilerel', NULL, NULL, '1944', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.93', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.96', '6.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101513 WHERE (`entry` = 9036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9036);
-- Heroic Warder Stilgiss
DELETE FROM `creature_template` WHERE entry = 9101514;
INSERT INTO `creature_template` VALUES (9101514, '0', '0', '0', '0', '0', '9089', '0', '0', '0', 'Heroic Warder Stilgiss', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '4.94', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '9041', '0', '0', '0', '0', '0', '', '1', '1.0', '6.15', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101514 WHERE (`entry` = 9041);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9041);
-- Heroic Watchman Doomgrip
DELETE FROM `creature_template` WHERE entry = 9101515;
INSERT INTO `creature_template` VALUES (9101515, '0', '0', '0', '0', '0', '8655', '0', '0', '0', 'Heroic Watchman Doomgrip', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '5.08', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.31', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9101515 WHERE (`entry` = 9476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9476);
-- Mythic Anvilrage Captain
DELETE FROM `creature_template` WHERE entry = 9101516;
INSERT INTO `creature_template` VALUES (9101516, '0', '0', '0', '0', '0', '8749', '0', '0', '0', 'Mythic Anvilrage Captain', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8903', '8903', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101516 WHERE (`entry` = 8903);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8903);
-- Mythic Anvilrage Footman
DELETE FROM `creature_template` WHERE entry = 9101517;
INSERT INTO `creature_template` VALUES (9101517, '0', '0', '0', '0', '0', '8718', '0', '0', '0', 'Mythic Anvilrage Footman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8892', '8892', '0', '0', '0', '0', '0', '', '1', '1.0', '4.5', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101517 WHERE (`entry` = 8892);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8892);
-- Mythic Anvilrage Guardsman
DELETE FROM `creature_template` WHERE entry = 9101518;
INSERT INTO `creature_template` VALUES (9101518, '0', '0', '0', '0', '0', '8750', '0', '0', '0', 'Mythic Anvilrage Guardsman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8891', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '2.0', '1.25', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101518 WHERE (`entry` = 8891);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8891);
-- Mythic Anvilrage Marshal
DELETE FROM `creature_template` WHERE entry = 9101519;
INSERT INTO `creature_template` VALUES (9101519, '0', '0', '0', '0', '0', '8751', '0', '0', '0', 'Mythic Anvilrage Marshal', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8898', '8898', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101519 WHERE (`entry` = 8898);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8898);
-- Mythic Anvilrage Medic
DELETE FROM `creature_template` WHERE entry = 9101520;
INSERT INTO `creature_template` VALUES (9101520, '0', '0', '0', '0', '0', '8752', '0', '0', '0', 'Mythic Anvilrage Medic', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8894', '8894', '0', '0', '0', '0', '0', '', '1', '1.0', '3.85', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101520 WHERE (`entry` = 8894);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8894);
-- Mythic Anvilrage Officer
DELETE FROM `creature_template` WHERE entry = 9101521;
INSERT INTO `creature_template` VALUES (9101521, '0', '0', '0', '0', '0', '8753', '0', '0', '0', 'Mythic Anvilrage Officer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8895', '8895', '0', '0', '0', '0', '0', '', '1', '1.0', '4.03', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101521 WHERE (`entry` = 8895);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8895);
-- Mythic Anvilrage Overseer
DELETE FROM `creature_template` WHERE entry = 9101522;
INSERT INTO `creature_template` VALUES (9101522, '0', '0', '0', '0', '0', '8754', '0', '0', '0', 'Mythic Anvilrage Overseer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '1600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8889', '0', '0', '0', '0', '0', '', '1', '1.0', '3.82', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101522 WHERE (`entry` = 8889);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8889);
-- Mythic Anvilrage Reservist
DELETE FROM `creature_template` WHERE entry = 9101523;
INSERT INTO `creature_template` VALUES (9101523, '0', '0', '0', '0', '0', '8755', '9288', '9289', '9290', 'Mythic Anvilrage Reservist', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.25', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101523 WHERE (`entry` = 8901);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8901);
-- Mythic Anvilrage Soldier
DELETE FROM `creature_template` WHERE entry = 9101524;
INSERT INTO `creature_template` VALUES (9101524, '0', '0', '0', '0', '0', '8757', '0', '0', '0', 'Mythic Anvilrage Soldier', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8893', '8893', '0', '0', '0', '0', '0', '', '1', '1.0', '3.86', '2.0', '1.05', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101524 WHERE (`entry` = 8893);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8893);
-- Mythic Anvilrage Warden
DELETE FROM `creature_template` WHERE entry = 9101525;
INSERT INTO `creature_template` VALUES (9101525, '0', '0', '0', '0', '0', '8758', '0', '0', '0', 'Mythic Anvilrage Warden', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8891', '8890', '0', '0', '0', '0', '0', '', '1', '1.0', '4.17', '2.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101525 WHERE (`entry` = 8890);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8890);
-- Mythic Arcanite Dragonling
DELETE FROM `creature_template` WHERE entry = 9101526;
INSERT INTO `creature_template` VALUES (9101526, '0', '0', '0', '0', '0', '12489', '0', '0', '0', 'Mythic Arcanite Dragonling', NULL, NULL, '0', '60', '60', '0', '50', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.96', '1.0', '1.1', '0.5', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101526 WHERE (`entry` = 12473);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12473);
-- Mythic Arena Spectator
DELETE FROM `creature_template` WHERE entry = 9101527;
INSERT INTO `creature_template` VALUES (9101527, '0', '0', '0', '0', '0', '9069', '9070', '9071', '9072', 'Mythic Arena Spectator', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8916', '8916', '0', '0', '0', '0', '0', '', '1', '1.0', '4.39', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101527 WHERE (`entry` = 8916);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8916);
-- Mythic Blackbreath Crony
DELETE FROM `creature_template` WHERE entry = 9101528;
INSERT INTO `creature_template` VALUES (9101528, '0', '0', '0', '0', '0', '8661', '8662', '8663', '0', 'Mythic Blackbreath Crony', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9541', '9541', '0', '0', '0', '0', '0', '', '1', '1.0', '3.86', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101528 WHERE (`entry` = 9541);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9541);
-- Mythic Blazing Fireguard
DELETE FROM `creature_template` WHERE entry = 9101529;
INSERT INTO `creature_template` VALUES (9101529, '0', '0', '0', '0', '0', '1070', '0', '0', '0', 'Mythic Blazing Fireguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '2.95', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8910', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.84', '2.0', '1.0', '1.0', '0', '0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101529 WHERE (`entry` = 8910);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8910);
-- Mythic Bloodhound
DELETE FROM `creature_template` WHERE entry = 9101530;
INSERT INTO `creature_template` VALUES (9101530, '0', '0', '0', '0', '0', '8180', '0', '0', '0', 'Mythic Bloodhound', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.42857', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8921', '0', '8921', '0', '0', '0', '0', '', '1', '1.0', '3.96', '1.0', '1.0', '1.0', 
'0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101530 WHERE (`entry` = 8921);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8921);
-- Mythic Bloodhound Mastiff
DELETE FROM `creature_template` WHERE entry = 9101531;
INSERT INTO `creature_template` VALUES (9101531, '0', '0', '0', '0', '0', '8181', '0', '0', '0', 'Mythic Bloodhound Mastiff', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '8922', '0', '8922', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101531 WHERE (`entry` = 8922);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8922);
-- Mythic Borer Beetle
DELETE FROM `creature_template` WHERE entry = 9101532;
INSERT INTO `creature_template` VALUES (9101532, '0', '0', '0', '0', '0', '7470', '9354', '9028', '9029', 'Mythic Borer Beetle', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8932', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '4.01', '1.0', '0.65', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101532 WHERE (`entry` = 8932);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8932);
-- Mythic Burning Spirit
DELETE FROM `creature_template` WHERE entry = 9101533;
INSERT INTO `creature_template` VALUES (9101533, '0', '0', '0', '0', '0', '4607', '0', '0', '0', 'Mythic Burning Spirit', NULL, NULL, '0', '60', '60', '0', '7', '0', '1.0', '0.857143', '1.0', '1.0', '18.0', '1.0', '0', '2', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.95', '1.0', '1.0', '1.0', '0', '100', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101533 WHERE (`entry` = 9178);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9178);
-- Mythic Burrowing Thundersnout
DELETE FROM `creature_template` WHERE entry = 9101534;
INSERT INTO `creature_template` VALUES (9101534, '0', '0', '0', '0', '0', '8184', '9033', '3005', '2194', 'Mythic Burrowing Thundersnout', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.93', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '8928', '0', '8928', '0', '0', '0', '0', '', '1', '1.0', '4.09', 
'1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101534 WHERE (`entry` = 8928);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8928);
-- Mythic Cave Creeper
DELETE FROM `creature_template` WHERE entry = 9101535;
INSERT INTO `creature_template` VALUES (9101535, '0', '0', '0', '0', '0', '8014', '909', '821', '520', 'Mythic Cave Creeper', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '3', '0', '0', '0', '0', '1', '1', '8933', '0', '0', '5907', '0', '0', '0', '', '1', '1.0', '3.93', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101535 WHERE (`entry` = 8933);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8933);
-- Mythic Commander Gorshak
DELETE FROM `creature_template` WHERE entry = 9101536;
INSERT INTO `creature_template` VALUES (9101536, '0', '0', '0', '0', '0', '8703', '0', '0', '0', 'Mythic Commander Gorshak', 'Kargath Expeditionary Force', NULL, '0', '60', '60', '0', '113', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '576', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.98', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101536 WHERE (`entry` = 9020);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9020);
-- Mythic Crest Killer
DELETE FROM `creature_template` WHERE entry = 9101537;
INSERT INTO `creature_template` VALUES (9101537, '0', '0', '0', '0', '0', '9053', '0', '0', '0', 'Mythic Crest Killer', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9680', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101537 WHERE (`entry` = 9680);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9680);
-- Mythic Dark Guard
DELETE FROM `creature_template` WHERE entry = 9101538;
INSERT INTO `creature_template` VALUES (9101538, '0', '0', '0', '0', '0', '8597', '0', '0', '0', 'Mythic Dark Guard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9445', '9445', '0', '0', '0', '0', '0', '', '1', '1.0', '4.11', '2.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101538 WHERE (`entry` = 9445);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9445);
-- Mythic Dark Screecher
DELETE FROM `creature_template` WHERE entry = 9101539;
INSERT INTO `creature_template` VALUES (9101539, '0', '0', '0', '0', '0', '1955', '1954', '0', '0', 'Mythic Dark Screecher', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.03', '2000', '1650', '1.0', '1.0', '1', '0', '2048', '0', '24', '0', '0', '0', '0', '1', '1', '8927', '0', '8927', '5793', '0', '0', '0', '', '1', '1.0', '3.83', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101539 WHERE (`entry` = 8927);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8927);
-- Mythic Deep Stinger
DELETE FROM `creature_template` WHERE entry = 9101540;
INSERT INTO `creature_template` VALUES (9101540, '0', '0', '0', '0', '0', '7347', '3247', '2489', '0', 'Mythic Deep Stinger', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '20', '0', '0', '0', '0', '1', '1', '8926', '0', '8926', '5874', '0', '0', '0', '', '1', '1.0', '4.12', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101540 WHERE (`entry` = 8926);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8926);
-- Mythic Doomforge Arcanasmith
DELETE FROM `creature_template` WHERE entry = 9101541;
INSERT INTO `creature_template` VALUES (9101541, '0', '0', '0', '0', '0', '8812', '8813', '8814', '8815', 'Mythic Doomforge Arcanasmith', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8900', '8900', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101541 WHERE (`entry` = 8900);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8900);
-- Mythic Doomforge Craftsman
DELETE FROM `creature_template` WHERE entry = 9101542;
INSERT INTO `creature_template` VALUES (9101542, '0', '0', '0', '0', '0', '8803', '8804', '8805', '8806', 'Mythic Doomforge Craftsman', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8897', '8897', '0', '0', '0', '0', '0', '', '1', '1.0', '3.83', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101542 WHERE (`entry` = 8897);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8897);
-- Mythic Doomforge Dragoon
DELETE FROM `creature_template` WHERE entry = 9101543;
INSERT INTO `creature_template` VALUES (9101543, '0', '0', '0', '0', '0', '8820', '8821', '8822', '8823', 'Mythic Doomforge Dragoon', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8899', '8899', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101543 WHERE (`entry` = 8899);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8899);
-- Mythic Dredge Worm
DELETE FROM `creature_template` WHERE entry = 9101544;
INSERT INTO `creature_template` VALUES (9101544, '0', '0', '0', '0', '0', '8182', '9030', '9031', '9032', 'Mythic Dredge Worm', NULL, NULL, '0', '60', '60', '0', '16', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '42', '0', '0', '0', '0', '1', '65537', '8925', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '4.41', '1.0', '0.5', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101544 WHERE (`entry` = 8925);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8925);
-- Mythic Dughal Stormwing
DELETE FROM `creature_template` WHERE entry = 9101545;
INSERT INTO `creature_template` VALUES (9101545, '0', '0', '0', '0', '0', '8709', '0', '0', '0', 'Mythic Dughal Stormwing', NULL, NULL, '0', '60', '60', '0', '534', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101545 WHERE (`entry` = 9022);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9022);
-- Mythic Elder Morndeep
DELETE FROM `creature_template` WHERE entry = 9101546;
INSERT INTO `creature_template` VALUES (9101546, '0', '0', '0', '0', '0', '15622', '0', '0', '0', 'Mythic Elder Morndeep', NULL, NULL, '21033', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.0', '1.0', '1.85', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101546 WHERE (`entry` = 15549);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 15549);
-- Mythic Explosive Sheep
DELETE FROM `creature_template` WHERE entry = 9101547;
INSERT INTO `creature_template` VALUES (9101547, '0', '0', '0', '0', '0', '3886', '0', '0', '0', 'Mythic Explosive Sheep', NULL, NULL, '0', '60', '60', '0', '14', '0', '1.0', '0.571429', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '2.92', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '3.89', '1.0', '1.0', '1.0', 
'0', '80', '1', '902267455', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101547 WHERE (`entry` = 2675);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 2675);
-- Mythic Fireguard
DELETE FROM `creature_template` WHERE entry = 9101548;
INSERT INTO `creature_template` VALUES (9101548, '0', '0', '0', '0', '0', '2172', '0', '0', '0', 'Mythic Fireguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '2.92', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8909', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.2', '2.0', '1.0', '1.0', '0', '0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101548 WHERE (`entry` = 8909);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8909);
-- Mythic Fireguard Destroyer
DELETE FROM `creature_template` WHERE entry = 9101549;
INSERT INTO `creature_template` VALUES (9101549, '0', '0', '0', '0', '0', '5488', '0', '0', '0', 'Mythic Fireguard Destroyer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '8911', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.46', '2.0', '0.85', '1.0', '0', '0', '1', '25094', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101549 WHERE (`entry` = 8911);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8911);
-- Mythic Gnashjaw
DELETE FROM `creature_template` WHERE entry = 9101550;
INSERT INTO `creature_template` VALUES (9101550, '0', '0', '0', '0', '0', '12966', '0', '0', '0', 'Mythic Gnashjaw', 'Malgen Longspear''s Pet', NULL, '0', '60', '60', '0', '45', '0', '1.0', '1.42857', 
'1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '1500', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '16095', '0', '0', '0', '0', '', '0', '1.0', '3.91', '1.0', '1.1', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101550 WHERE (`entry` = 16095);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16095);
-- Mythic Grim Patron
DELETE FROM `creature_template` WHERE entry = 9101551;
INSERT INTO `creature_template` VALUES (9101551, '0', '0', '0', '0', '0', '8673', '8674', '8675', '8676', 'Mythic Grim Patron', NULL, NULL, '1962', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9545', '9545', '0', '0', '0', '0', '0', '', '1', '1.0', '3.81', '1.0', '1.0', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101551 WHERE (`entry` = 9545);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9545);
-- Mythic Guzzling Patron
DELETE FROM `creature_template` WHERE entry = 9101552;
INSERT INTO `creature_template` VALUES (9101552, '0', '0', '0', '0', '0', '8678', '8679', '8680', '0', 'Mythic Guzzling Patron', NULL, NULL, '1963', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9547', '9547', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101552 WHERE (`entry` = 9547);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9547);
-- Mythic Hammered Patron
DELETE FROM `creature_template` WHERE entry = 9101553;
INSERT INTO `creature_template` VALUES (9101553, '0', '0', '0', '0', '0', '8681', '8682', '8683', '8684', 'Mythic Hammered Patron', NULL, NULL, '1966', '60', '60', '0', '674', '1', '1.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9554', '9554', '0', '0', '0', '0', '0', '', '1', '1.0', '4.38', '2.0', '0.85', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101553 WHERE (`entry` = 9554);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9554);
-- Mythic High Justice Grimstone
DELETE FROM `creature_template` WHERE entry = 9101554;
INSERT INTO `creature_template` VALUES (9101554, '0', '0', '0', '0', '0', '9329', '0', '0', '0', 'Mythic High Justice Grimstone', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.31', '2.0', '1.0', '2.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101554 WHERE (`entry` = 10096);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10096);
-- Mythic Jaz
DELETE FROM `creature_template` WHERE entry = 9101555;
INSERT INTO `creature_template` VALUES (9101555, '0', '0', '0', '0', '0', '9049', '0', '0', '0', 'Mythic Jaz', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '1600', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9681', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101555 WHERE (`entry` = 9681);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9681);
-- Mythic Kharan Mighthammer
DELETE FROM `creature_template` WHERE entry = 9101556;
INSERT INTO `creature_template` VALUES (9101556, '0', '0', '0', '0', '0', '8708', '0', '0', '0', 'Mythic Kharan Mighthammer', NULL, NULL, '1822', '60', '60', '0', '35', '3', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.33', '2.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101556 WHERE (`entry` = 9021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9021);
-- Mythic Korv
DELETE FROM `creature_template` WHERE entry = 9101557;
INSERT INTO `creature_template` VALUES (9101557, '0', '0', '0', '0', '0', '15976', '0', '0', '0', 'Mythic Korv', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.38', '2.24', '1.1', '1.0', '0', '0', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101557 WHERE (`entry` = 16053);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16053);
-- Mythic Lefty
DELETE FROM `creature_template` WHERE entry = 9101558;
INSERT INTO `creature_template` VALUES (9101558, '0', '0', '0', '0', '0', '15972', '0', '0', '0', 'Mythic Lefty', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.44', '1.0', '1.1', '1.0', '0', '0', 
'1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101558 WHERE (`entry` = 16049);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16049);
-- Mythic Lokhtos Darkbargainer
DELETE FROM `creature_template` WHERE entry = 9101559;
INSERT INTO `creature_template` VALUES (9101559, '0', '0', '0', '0', '0', '14666', '0', '0', '0', 'Mythic Lokhtos Darkbargainer', 'The Thorium Brotherhood', NULL, '4781', '60', '60', '0', '1475', '131', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', 
'1.0', '4.19', '1.0', '2.4', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101559 WHERE (`entry` = 12944);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 12944);
-- Mythic Malgen Longspear
DELETE FROM `creature_template` WHERE entry = 9101560;
INSERT INTO `creature_template` VALUES (9101560, '0', '0', '0', '0', '0', '15975', '0', '0', '0', 'Mythic Malgen Longspear', NULL, NULL, '0', '60', '60', '0', '54', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.01', '2.24', '1.1', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101560 WHERE (`entry` = 16052);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16052);
-- Mythic Marshal Windsor
DELETE FROM `creature_template` WHERE entry = 9101561;
INSERT INTO `creature_template` VALUES (9101561, '0', '0', '0', '0', '0', '8707', '0', '0', '0', 'Mythic Marshal Windsor', NULL, NULL, '0', '60', '60', '0', '534', '2', '1.0', '0.857143', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.1', '2000', '2000', '1.0', '1.0', '1', '320', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.97', '2.0', '0.85', '1.0', '0', '100', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101561 WHERE (`entry` = 9023);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9023);
-- Mythic Mistress Nagmara
DELETE FROM `creature_template` WHERE entry = 9101562;
INSERT INTO `creature_template` VALUES (9101562, '0', '0', '0', '0', '0', '2834', '0', '0', '0', 'Mythic Mistress Nagmara', NULL, NULL, '2076', '60', '60', '0', '35', '3', '0.72', '0.857143', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '101', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101562 WHERE (`entry` = 9500);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9500);
-- Mythic Molten War Golem
DELETE FROM `creature_template` WHERE entry = 9101563;
INSERT INTO `creature_template` VALUES (9101563, '0', '0', '0', '0', '0', '8179', '0', '0', '0', 'Mythic Molten War Golem', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '2', '2.99', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8908', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '4.24', '2.0', '1.25', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101563 WHERE (`entry` = 8908);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8908);
-- Mythic Ograbisi
DELETE FROM `creature_template` WHERE entry = 9101564;
INSERT INTO `creature_template` VALUES (9101564, '0', '0', '0', '0', '0', '11553', '0', '0', '0', 'Mythic Ograbisi', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9677', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.4', '1.0', '1.4', '1.0', '0', '51', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101564 WHERE (`entry` = 9677);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9677);
-- Mythic Private Rocknot
DELETE FROM `creature_template` WHERE entry = 9101565;
INSERT INTO `creature_template` VALUES (9101565, '0', '0', '0', '0', '0', '8654', '0', '0', '0', 'Mythic Private Rocknot', NULL, NULL, '12128', '60', '60', '0', '35', '3', '0.8', '0.714286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.96', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.44', '1.0', '0.85', '1.0', '0', '90', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101565 WHERE (`entry` = 9503);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9503);
-- Mythic Ragereaver Golem
DELETE FROM `creature_template` WHERE entry = 9101566;
INSERT INTO `creature_template` VALUES (9101566, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Mythic Ragereaver Golem', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.05', '1600', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8906', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '3.89', '2.0', '0.95', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101566 WHERE (`entry` = 8906);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8906);
-- Mythic Rezznik
DELETE FROM `creature_template` WHERE entry = 9101567;
INSERT INTO `creature_template` VALUES (9101567, '0', '0', '0', '0', '0', '15977', '0', '0', '0', 'Mythic Rezznik', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.39', '1.72', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101567 WHERE (`entry` = 16054);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16054);
-- Mythic Ribblys Crony
DELETE FROM `creature_template` WHERE entry = 9101568;
INSERT INTO `creature_template` VALUES (9101568, '0', '0', '0', '0', '0', '9233', '9234', '9235', '9236', 'Mythic Ribblys Crony', NULL, NULL, '1966', '60', '60', '0', '735', '1', '1.2', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '576', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '10043', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '2.0', '0.6', '1.0', '0', '48', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101568 WHERE (`entry` = 10043);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10043);
-- Mythic Rotfang
DELETE FROM `creature_template` WHERE entry = 9101569;
INSERT INTO `creature_template` VALUES (9101569, '0', '0', '0', '0', '0', '16017', '0', '0', '0', 'Mythic Rotfang', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.46', '1.0', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101569 WHERE (`entry` = 16050);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16050);
-- Mythic Shadowforge Citizen
DELETE FROM `creature_template` WHERE entry = 9101570;
INSERT INTO `creature_template` VALUES (9101570, '0', '0', '0', '0', '0', '8798', '8799', '8800', '8801', 'Mythic Shadowforge Citizen', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8902', '8902', '0', '0', '0', '0', '0', '', '1', '1.0', '3.91', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101570 WHERE (`entry` = 8902);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8902);
-- Mythic Shadowforge Flame Keeper
DELETE FROM `creature_template` WHERE entry = 9101571;
INSERT INTO `creature_template` VALUES (9101571, '0', '0', '0', '0', '0', '9309', '0', '0', '0', 'Mythic Shadowforge Flame Keeper', NULL, NULL, '0', '60', '60', '0', '14', '2', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9956', '9956', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101571 WHERE (`entry` = 9956);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9956);
-- Mythic Shadowforge Peasant
DELETE FROM `creature_template` WHERE entry = 9101572;
INSERT INTO `creature_template` VALUES (9101572, '0', '0', '0', '0', '0', '8793', '8794', '8795', '8796', 'Mythic Shadowforge Peasant', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '2', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8896', '8896', '0', '0', '0', '0', '0', '', '1', '1.0', '4.34', '1.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101572 WHERE (`entry` = 8896);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8896);
-- Mythic Shadowforge Senator
DELETE FROM `creature_template` WHERE entry = 9101573;
INSERT INTO `creature_template` VALUES (9101573, '0', '0', '0', '0', '0', '8825', '8826', '8827', '8828', 'Mythic Shadowforge Senator', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '8', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8904', '8904', '0', '0', '0', '0', '0', '', '1', '1.0', '4.06', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101573 WHERE (`entry` = 8904);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8904);
-- Mythic Shill Dinger
DELETE FROM `creature_template` WHERE entry = 9101574;
INSERT INTO `creature_template` VALUES (9101574, '0', '0', '0', '0', '0', '9051', '0', '0', '0', 'Mythic Shill Dinger', NULL, NULL, '0', '60', '60', '0', '35', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9678', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.84', '5.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101574 WHERE (`entry` = 9678);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9678);
-- Mythic Slave
DELETE FROM `creature_template` WHERE entry = 9101575;
INSERT INTO `creature_template` VALUES (9101575, '0', '0', '0', '0', '0', '9330', '9331', '9332', '9333', 'Mythic Slave', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.05', '1.0', '1.0', '1.0', 
'0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101575 WHERE (`entry` = 10116);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10116);
-- Mythic Snokh Blackspine
DELETE FROM `creature_template` WHERE entry = 9101576;
INSERT INTO `creature_template` VALUES (9101576, '0', '0', '0', '0', '0', '15974', '0', '0', '0', 'Mythic Snokh Blackspine', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.42', '1.33', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101576 WHERE (`entry` = 16051);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16051);
-- Mythic Spawn of BaelGar
DELETE FROM `creature_template` WHERE entry = 9101577;
INSERT INTO `creature_template` VALUES (9101577, '0', '0', '0', '0', '0', '8573', '0', '0', '0', 'Mythic Spawn of BaelGar', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.42857', '1.0', '1.0', 
'18.0', '1.0', '0', '0', '3.0', '2000', '1672', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '1.0', '1.0', '1.0', '0', '144', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101577 WHERE (`entry` = 9436);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9436);
-- Mythic Tobias Seecher
DELETE FROM `creature_template` WHERE entry = 9101578;
INSERT INTO `creature_template` VALUES (9101578, '0', '0', '0', '0', '0', '9054', '0', '0', '0', 'Mythic Tobias Seecher', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '1.0', '0.85', '1.0', 
'0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101578 WHERE (`entry` = 9679);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9679);
-- Mythic Tortured Slave
DELETE FROM `creature_template` WHERE entry = 9101579;
INSERT INTO `creature_template` VALUES (9101579, '0', '0', '0', '0', '0', '7550', '9334', '9335', '0', 'Mythic Tortured Slave', NULL, NULL, '0', '60', '60', '0', '35', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.94', '2000', '2000', '1.0', '1.0', '1', '768', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.86', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101579 WHERE (`entry` = 10117);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 10117);
-- Mythic Twilight Bodyguard
DELETE FROM `creature_template` WHERE entry = 9101580;
INSERT INTO `creature_template` VALUES (9101580, '0', '0', '0', '0', '0', '9346', '9347', '8773', '9349', 'Mythic Twilight Bodyguard', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8914', '8914', '0', '0', '0', '0', '0', '', '1', '1.0', '4.1', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101580 WHERE (`entry` = 8914);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8914);
-- Mythic Twilight Emissary
DELETE FROM `creature_template` WHERE entry = 9101581;
INSERT INTO `creature_template` VALUES (9101581, '0', '0', '0', '0', '0', '8772', '8774', '8776', '8777', 'Mythic Twilight Emissary', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.09', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8913', '8913', '0', '0', '0', '0', '0', '', '1', '1.0', '4.31', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101581 WHERE (`entry` = 8913);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8913);
-- Mythic Twilights Hammer Ambassador
DELETE FROM `creature_template` WHERE entry = 9101582;
INSERT INTO `creature_template` VALUES (9101582, '0', '0', '0', '0', '0', '8778', '8779', '8780', '9025', 'Mythic Twilights Hammer Ambassador', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8915', '8915', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101582 WHERE (`entry` = 8915);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8915);
-- Mythic Twilights Hammer Executioner
DELETE FROM `creature_template` WHERE entry = 9101583;
INSERT INTO `creature_template` VALUES (9101583, '0', '0', '0', '0', '0', '8706', '0', '0', '0', 'Mythic Twilights Hammer Executioner', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9398', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.41', '2.0', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101583 WHERE (`entry` = 9398);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9398);
-- Mythic Twilights Hammer Torturer
DELETE FROM `creature_template` WHERE entry = 9101584;
INSERT INTO `creature_template` VALUES (9101584, '0', '0', '0', '0', '0', '8790', '9350', '9351', '8792', 'Mythic Twilights Hammer Torturer', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.96', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8912', '8912', '0', '0', '0', '0', '0', '', '1', '1.0', '4.24', '2.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101584 WHERE (`entry` = 8912);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8912);
-- Mythic Vajashni
DELETE FROM `creature_template` WHERE entry = 9101585;
INSERT INTO `creature_template` VALUES (9101585, '0', '0', '0', '0', '0', '15979', '0', '0', '0', 'Mythic Vajashni', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.44', '1.33', '1.1', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101585 WHERE (`entry` = 16055);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16055);
-- Mythic Voidwalker Minion
DELETE FROM `creature_template` WHERE entry = 9101586;
INSERT INTO `creature_template` VALUES (9101586, '0', '0', '0', '0', '0', '1132', '0', '0', '0', 'Mythic Voidwalker Minion', '', NULL, '0', '60', '60', '0', '90', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.27', '1.0', '1.0', '1.0', '0', '121', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101586 WHERE (`entry` = 8996);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8996);
-- Mythic Volida
DELETE FROM `creature_template` WHERE entry = 9101587;
INSERT INTO `creature_template` VALUES (9101587, '0', '0', '0', '0', '0', '15980', '0', '0', '0', 'Mythic Volida', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '4.03', '1.33', '0.95', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101587 WHERE (`entry` = 16058);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16058);
-- Mythic Warbringer Construct
DELETE FROM `creature_template` WHERE entry = 9101588;
INSERT INTO `creature_template` VALUES (9101588, '0', '0', '0', '0', '0', '8289', '0', '0', '0', 'Mythic Warbringer Construct', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '8905', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '4.19', '2.0', '0.95', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101588 WHERE (`entry` = 8905);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8905);
-- Mythic Weapon Technician
DELETE FROM `creature_template` WHERE entry = 9101589;
INSERT INTO `creature_template` VALUES (9101589, '0', '0', '0', '0', '0', '8894', '8895', '8896', '8897', 'Mythic Weapon Technician', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '32768', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '8920', '8920', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '1.0', '0.8', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101589 WHERE (`entry` = 8920);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8920);
-- Mythic Wrath Hammer Construct
DELETE FROM `creature_template` WHERE entry = 9101590;
INSERT INTO `creature_template` VALUES (9101590, '0', '0', '0', '0', '0', '8178', '0', '0', '0', 'Mythic Wrath Hammer Construct', NULL, NULL, '0', '60', '60', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.04', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '9', '32768', '8907', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '4.12', '2.0', '1.0', '1.0', '0', '0', '1', '16384', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101590 WHERE (`entry` = 8907);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8907);
-- Mythic Ambassador Flamelash
DELETE FROM `creature_template` WHERE entry = 9101591;
INSERT INTO `creature_template` VALUES (9101591, '0', '0', '0', '0', '0', '8329', '0', '0', '0', 'Mythic Ambassador Flamelash', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.22', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101591 WHERE (`entry` = 9156);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9156);
-- Mythic Angerrel
DELETE FROM `creature_template` WHERE entry = 9101592;
INSERT INTO `creature_template` VALUES (9101592, '0', '0', '0', '0', '0', '8686', '0', '0', '0', 'Mythic Angerrel', NULL, NULL, '1943', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.44', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101592 WHERE (`entry` = 9035);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9035);
-- Mythic Anubshiah
DELETE FROM `creature_template` WHERE entry = 9101593;
INSERT INTO `creature_template` VALUES (9101593, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Mythic Anubshiah', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '1800', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.13', '5.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101593 WHERE (`entry` = 9031);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9031);
-- Mythic BaelGar
DELETE FROM `creature_template` WHERE entry = 9101594;
INSERT INTO `creature_template` VALUES (9101594, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Mythic BaelGar', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.08', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '8.31', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101594 WHERE (`entry` = 9016);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9016);
-- Mythic Dark Keeper Bethek
DELETE FROM `creature_template` WHERE entry = 9101595;
INSERT INTO `creature_template` VALUES (9101595, '0', '0', '0', '0', '0', '8592', '0', '0', '0', 'Mythic Dark Keeper Bethek', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '1183', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.48', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101595 WHERE (`entry` = 9438);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9438);
-- Mythic Dark Keeper Ofgut
DELETE FROM `creature_template` WHERE entry = 9101596;
INSERT INTO `creature_template` VALUES (9101596, '0', '0', '0', '0', '0', '8595', '0', '0', '0', 'Mythic Dark Keeper Ofgut', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '1183', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.16', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101596 WHERE (`entry` = 9442);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9442);
-- Mythic Dark Keeper Pelver
DELETE FROM `creature_template` WHERE entry = 9101597;
INSERT INTO `creature_template` VALUES (9101597, '0', '0', '0', '0', '0', '8596', '0', '0', '0', 'Mythic Dark Keeper Pelver', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.06', '2000', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9443', '0', '0', '0', '0', '0', '', '1', '1.0', '8.37', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101597 WHERE (`entry` = 9443);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9443);
-- Mythic Dark Keeper Uggel
DELETE FROM `creature_template` WHERE entry = 9101598;
INSERT INTO `creature_template` VALUES (9101598, '0', '0', '0', '0', '0', '8593', '0', '0', '0', 'Mythic Dark Keeper Uggel', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '1175', '1292', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.28', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101598 WHERE (`entry` = 9439);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9439);
-- Mythic Dark Keeper Vorfalk
DELETE FROM `creature_template` WHERE entry = 9101599;
INSERT INTO `creature_template` VALUES (9101599, '0', '0', '0', '0', '0', '8591', '0', '0', '0', 'Mythic Dark Keeper Vorfalk', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.01', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101599 WHERE (`entry` = 9437);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9437);
-- Mythic Dark Keeper Zimrel
DELETE FROM `creature_template` WHERE entry = 9101600;
INSERT INTO `creature_template` VALUES (9101600, '0', '0', '0', '0', '0', '8594', '0', '0', '0', 'Mythic Dark Keeper Zimrel', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '1301', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.13', '2.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101600 WHERE (`entry` = 9441);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9441);
-- Mythic Doomrel
DELETE FROM `creature_template` WHERE entry = 9101601;
INSERT INTO `creature_template` VALUES (9101601, '0', '0', '0', '0', '0', '8687', '0', '0', '0', 'Mythic Doomrel', NULL, NULL, '1947', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.9', '8.0', '1.2', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101601 WHERE (`entry` = 9039);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9039);
-- Mythic Doperel
DELETE FROM `creature_template` WHERE entry = 9101602;
INSERT INTO `creature_template` VALUES (9101602, '0', '0', '0', '0', '0', '8688', '0', '0', '0', 'Mythic Doperel', NULL, NULL, '1948', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.11', '2.0', '0.5', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101602 WHERE (`entry` = 9040);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9040);
-- Mythic Emperor Dagran Thaurissan
DELETE FROM `creature_template` WHERE entry = 9101603;
INSERT INTO `creature_template` VALUES (9101603, '0', '0', '0', '0', '0', '8807', '0', '0', '0', 'Mythic Emperor Dagran Thaurissan', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9019', '0', '0', '0', '0', '0', '', '1', '1.0', '8.38', '2.0', '0.95', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101603 WHERE (`entry` = 9019);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9019);
-- Mythic Eviscerator
DELETE FROM `creature_template` WHERE entry = 9101604;
INSERT INTO `creature_template` VALUES (9101604, '0', '0', '0', '0', '0', '523', '0', '0', '0', 'Mythic Eviscerator', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '1300', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '9029', '0', '0', '0', '0', '', '1', '1.0', '8.35', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101604 WHERE (`entry` = 9029);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9029);
-- Mythic Fineous Darkvire
DELETE FROM `creature_template` WHERE entry = 9101605;
INSERT INTO `creature_template` VALUES (9101605, '0', '0', '0', '0', '0', '8704', '0', '0', '0', 'Mythic Fineous Darkvire', 'Chief Architect', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9056', '0', '0', '0', '0', '0', '', '1', '1.0', '8.44', '5.0', '1.05', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101605 WHERE (`entry` = 9056);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9056);
-- Mythic General Angerforge
DELETE FROM `creature_template` WHERE entry = 9101606;
INSERT INTO `creature_template` VALUES (9101606, '0', '0', '0', '0', '0', '8756', '0', '0', '0', 'Mythic General Angerforge', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.99', '1800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9033', '0', '0', '0', '0', '0', '', '1', '1.0', '8.21', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101606 WHERE (`entry` = 9033);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9033);
-- Mythic Gloomrel
DELETE FROM `creature_template` WHERE entry = 9101607;
INSERT INTO `creature_template` VALUES (9101607, '0', '0', '0', '0', '0', '8689', '0', '0', '0', 'Mythic Gloomrel', NULL, NULL, '1945', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2800', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.0', '2.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101607 WHERE (`entry` = 9037);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9037);
-- Mythic Golem Lord Argelmach
DELETE FROM `creature_template` WHERE entry = 9101608;
INSERT INTO `creature_template` VALUES (9101608, '0', '0', '0', '0', '0', '8759', '0', '0', '0', 'Mythic Golem Lord Argelmach', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '8983', '0', '0', '0', '0', '0', '', '1', '1.0', '7.96', '8.0', 
'1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101608 WHERE (`entry` = 8983);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8983);
-- Mythic Gorosh the Dervish
DELETE FROM `creature_template` WHERE entry = 9101609;
INSERT INTO `creature_template` VALUES (9101609, '0', '0', '0', '0', '0', '8760', '0', '0', '0', 'Mythic Gorosh the Dervish', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.92', '1800', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.09', '2.0', '0.75', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101609 WHERE (`entry` = 9027);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9027);
-- Mythic Grizzle
DELETE FROM `creature_template` WHERE entry = 9101610;
INSERT INTO `creature_template` VALUES (9101610, '0', '0', '0', '0', '0', '7873', '0', '0', '0', 'Mythic Grizzle', NULL, NULL, '0', '63', '63', '0', '14', '0', '0.666668', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.97', '2.0', '0.8', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101610 WHERE (`entry` = 9028);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9028);
-- Mythic Haterel
DELETE FROM `creature_template` WHERE entry = 9101611;
INSERT INTO `creature_template` VALUES (9101611, '0', '0', '0', '0', '0', '8690', '0', '0', '0', 'Mythic Haterel', NULL, NULL, '1941', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.99', '5.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101611 WHERE (`entry` = 9034);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9034);
-- Mythic Hedrum the Creeper
DELETE FROM `creature_template` WHERE entry = 9101612;
INSERT INTO `creature_template` VALUES (9101612, '0', '0', '0', '0', '0', '8271', '0', '0', '0', 'Mythic Hedrum the Creeper', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2400', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '1', '0', '9100500', '0', '100003', '0', '0', '0', '0', '', '1', '1.0', '7.83', '2.0', '0.65', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101612 WHERE (`entry` = 9032);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9032);
-- Mythic High Interrogator Gerstahn
DELETE FROM `creature_template` WHERE entry = 9101613;
INSERT INTO `creature_template` VALUES (9101613, '0', '0', '0', '0', '0', '8761', '0', '0', '0', 'Mythic High Interrogator Gerstahn', 'Twilight''s Hammer Interrogator', NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.9', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9018', '0', '0', '0', '0', '0', '', '1', '1.0', '8.15', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101613 WHERE (`entry` = 9018);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9018);
-- Mythic Houndmaster Grebmar
DELETE FROM `creature_template` WHERE entry = 9101614;
INSERT INTO `creature_template` VALUES (9101614, '0', '0', '0', '0', '0', '9212', '0', '0', '0', 'Mythic Houndmaster Grebmar', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.93', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.95', '2.0', '1.25', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101614 WHERE (`entry` = 9319);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9319);
-- Mythic Hurley Blackbreath
DELETE FROM `creature_template` WHERE entry = 9101615;
INSERT INTO `creature_template` VALUES (9101615, '0', '0', '0', '0', '0', '8658', '0', '0', '0', 'Mythic Hurley Blackbreath', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9537', '0', '0', '0', '0', '0', '', '1', '1.0', '8.22', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101615 WHERE (`entry` = 9537);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9537);
-- Mythic Lord Incendius
DELETE FROM `creature_template` WHERE entry = 9101616;
INSERT INTO `creature_template` VALUES (9101616, '0', '0', '0', '0', '0', '1204', '0', '0', '0', 'Mythic Lord Incendius', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '2', '7.01', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.49', '5.0', '1.0', '2.0', '0', '0', '1', '613122011', '4', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101616 WHERE (`entry` = 9017);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9017);
-- Mythic Lord Roccor
DELETE FROM `creature_template` WHERE entry = 9101617;
INSERT INTO `creature_template` VALUES (9101617, '0', '0', '0', '0', '0', '5781', '0', '0', '0', 'Mythic Lord Roccor', NULL, NULL, '0', '63', '63', '0', '91', '0', '1.55556', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.05', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '7.92', '2.0', '1.5', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101617 WHERE (`entry` = 9025);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9025);
-- Mythic Magmus
DELETE FROM `creature_template` WHERE entry = 9101618;
INSERT INTO `creature_template` VALUES (9101618, '0', '0', '0', '0', '0', '12162', '0', '0', '0', 'Mythic Magmus', NULL, NULL, '0', '63', '63', '0', '54', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2400', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '5', '512', '9100500', '0', '100024', '0', '0', '0', '0', '', '1', '1.0', '8.24', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101618 WHERE (`entry` = 9938);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9938);
-- Mythic Okthor the Breaker
DELETE FROM `creature_template` WHERE entry = 9101619;
INSERT INTO `creature_template` VALUES (9101619, '0', '0', '0', '0', '0', '11538', '0', '0', '0', 'Mythic Okthor the Breaker', NULL, NULL, '0', '63', '63', '0', '14', '0', '1.6', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.03', '8.0', '0.8', '1.0', '0', '51', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101619 WHERE (`entry` = 9030);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9030);
-- Mythic Panzor the Invincible
DELETE FROM `creature_template` WHERE entry = 9101620;
INSERT INTO `creature_template` VALUES (9101620, '0', '0', '0', '0', '0', '8270', '0', '0', '0', 'Mythic Panzor the Invincible', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.09', '2000', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100500', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '8.26', '2.0', '1.45', '1.0', '0', '0', '1', '612466259', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101620 WHERE (`entry` = 8923);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8923);
-- Mythic Phalanx
DELETE FROM `creature_template` WHERE entry = 9101621;
INSERT INTO `creature_template` VALUES (9101621, '0', '0', '0', '0', '0', '8177', '0', '0', '0', 'Mythic Phalanx', NULL, NULL, '2283', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.07', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '4', '32768', '9100500', '0', '100033', '0', '0', '0', '0', '', '1', '1.0', '8.26', '2.0', '1.0', '2.0', '0', '0', '1', '613119963', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101621 WHERE (`entry` = 9502);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9502);
-- Mythic Plugger Spazzring
DELETE FROM `creature_template` WHERE entry = 9101622;
INSERT INTO `creature_template` VALUES (9101622, '0', '0', '0', '0', '0', '8652', '0', '0', '0', 'Mythic Plugger Spazzring', NULL, NULL, '0', '63', '63', '0', '674', '130', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.96', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9499', '0', '0', '0', '0', '0', '', '1', '1.0', '8.45', '8.0', '1.25', '2.0', '0', '0', '1', '646660059', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101622 WHERE (`entry` = 9499);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9499);
-- Mythic Princess Moira Bronzebeard
DELETE FROM `creature_template` WHERE entry = 9101623;
INSERT INTO `creature_template` VALUES (9101623, '0', '0', '0', '0', '0', '8705', '0', '0', '0', 'Mythic Princess Moira Bronzebeard', 'Princess of Ironforge', NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.02', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', 
'1.0', '8.42', '3.0', '1.0', '2.0', '0', '0', '1', '613103579', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101623 WHERE (`entry` = 8929);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8929);
-- Mythic Pyromancer Loregrain
DELETE FROM `creature_template` WHERE entry = 9101624;
INSERT INTO `creature_template` VALUES (9101624, '0', '0', '0', '0', '0', '8762', '0', '0', '0', 'Mythic Pyromancer Loregrain', NULL, NULL, '0', '63', '63', '0', '54', '2', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '7.1', '2000', '2000', '1.0', '1.0', '8', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9024', '0', '0', '0', '0', '0', '', '1', '1.0', '8.29', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101624 WHERE (`entry` = 9024);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9024);
-- Mythic Ribbly Screwspigot
DELETE FROM `creature_template` WHERE entry = 9101625;
INSERT INTO `creature_template` VALUES (9101625, '0', '0', '0', '0', '0', '8667', '0', '0', '0', 'Mythic Ribbly Screwspigot', NULL, NULL, '1970', '63', '63', '0', '735', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.91', '2000', '2000', '1.0', '1.0', '1', '33344', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.85', '1.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101625 WHERE (`entry` = 9543);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9543);
-- Mythic Seethrel
DELETE FROM `creature_template` WHERE entry = 9101626;
INSERT INTO `creature_template` VALUES (9101626, '0', '0', '0', '0', '0', '8691', '0', '0', '0', 'Mythic Seethrel', NULL, NULL, '1946', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.04', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.33', '5.0', '1.3', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101626 WHERE (`entry` = 9038);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9038);
-- Mythic Theldren
DELETE FROM `creature_template` WHERE entry = 9101627;
INSERT INTO `creature_template` VALUES (9101627, '0', '0', '0', '0', '0', '15981', '0', '0', '0', 'Mythic Theldren', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '3800', '1301', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.81', '1.0', '1.1', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101627 WHERE (`entry` = 16059);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 16059);
-- Mythic Verek
DELETE FROM `creature_template` WHERE entry = 9101628;
INSERT INTO `creature_template` VALUES (9101628, '0', '0', '0', '0', '0', '9019', '0', '0', '0', 'Mythic Verek', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.97', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '3', '0', '9100500', '0', '9042', '0', '0', '0', '0', '', '1', '1.0', '8.33', '2.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101628 WHERE (`entry` = 9042);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9042);
-- Mythic Vilerel
DELETE FROM `creature_template` WHERE entry = 9101629;
INSERT INTO `creature_template` VALUES (9101629, '0', '0', '0', '0', '0', '8692', '0', '0', '0', 'Mythic Vilerel', NULL, NULL, '1944', '63', '63', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.09', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.32', '6.0', '1.0', '1.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101629 WHERE (`entry` = 9036);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9036);
-- Mythic Warder Stilgiss
DELETE FROM `creature_template` WHERE entry = 9101630;
INSERT INTO `creature_template` VALUES (9101630, '0', '0', '0', '0', '0', '9089', '0', '0', '0', 'Mythic Warder Stilgiss', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '2', '0', '6.95', '2000', '2000', '1.0', '1.0', '2', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '9041', '0', '0', '0', '0', '0', '', '1', '1.0', '7.97', '5.0', '1.0', '2.0', '0', '0', '1', '613105627', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101630 WHERE (`entry` = 9041);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9041);
-- Mythic Watchman Doomgrip
DELETE FROM `creature_template` WHERE entry = 9101631;
INSERT INTO `creature_template` VALUES (9101631, '0', '0', '0', '0', '0', '8655', '0', '0', '0', 'Mythic Watchman Doomgrip', NULL, NULL, '0', '63', '63', '0', '54', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.94', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '8.36', '2.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9101631 WHERE (`entry` = 9476);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 9476);