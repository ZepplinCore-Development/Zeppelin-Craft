-- Heroic Battle Boar Horror
DELETE FROM `creature_template` WHERE entry = 9100900;
INSERT INTO `creature_template` VALUES (9100900, '0', '0', '0', '0', '0', '6122', '0', '0', '0', 'Heroic Battle Boar Horror', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7334', '0', '7334', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100900 WHERE (`entry` = 7334);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7334);
-- Heroic Belnistrasz
DELETE FROM `creature_template` WHERE entry = 9100901;
INSERT INTO `creature_template` VALUES (9100901, '0', '0', '0', '0', '0', '7851', '0', '0', '0', 'Heroic Belnistrasz', NULL, NULL, '0', '60', '60', '0', '35', '2', '2.08', '0.742857', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.1', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.2', '1.0', '0', 
'0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100901 WHERE (`entry` = 8516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8516);
-- Heroic Boneflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9100902;
INSERT INTO `creature_template` VALUES (9100902, '0', '0', '0', '0', '0', '1065', '0', '0', '0', 'Heroic Boneflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.5', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7347', '7347', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.8', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100902 WHERE (`entry` = 7347);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7347);
-- Heroic Deaths Head Geomancer
DELETE FROM `creature_template` WHERE entry = 9100903;
INSERT INTO `creature_template` VALUES (9100903, '0', '0', '0', '0', '0', '6100', '0', '0', '0', 'Heroic Deaths Head Geomancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7335', '7335', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', 
'1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100903 WHERE (`entry` = 7335);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7335);
-- Heroic Deaths Head Necromancer
DELETE FROM `creature_template` WHERE entry = 9100904;
INSERT INTO `creature_template` VALUES (9100904, '0', '0', '0', '0', '0', '11381', '0', '0', '0', 'Heroic Deaths Head Necromancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7337', '7337', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100904 WHERE (`entry` = 7337);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7337);
-- Heroic Freezing Spirit
DELETE FROM `creature_template` WHERE entry = 9100905;
INSERT INTO `creature_template` VALUES (9100905, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Freezing Spirit', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2800', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7353', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.8', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100905 WHERE (`entry` = 7353);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7353);
-- Heroic Frost Spectre
DELETE FROM `creature_template` WHERE entry = 9100906;
INSERT INTO `creature_template` VALUES (9100906, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Frost Spectre', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.55', '2000', '1760', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100906 WHERE (`entry` = 8585);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8585);
-- Heroic Frozen Soul
DELETE FROM `creature_template` WHERE entry = 9100907;
INSERT INTO `creature_template` VALUES (9100907, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Heroic Frozen Soul', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.9', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7352', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100907 WHERE (`entry` = 7352);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7352);
-- Heroic Henry Stern
DELETE FROM `creature_template` WHERE entry = 9100908;
INSERT INTO `creature_template` VALUES (9100908, '0', '0', '0', '0', '0', '8029', '0', '0', '0', 'Heroic Henry Stern', NULL, NULL, '1443', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.05', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100908 WHERE (`entry` = 8696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8696);
-- Heroic Sahrhee
DELETE FROM `creature_template` WHERE entry = 9100909;
INSERT INTO `creature_template` VALUES (9100909, '0', '0', '0', '0', '0', '11573', '0', '0', '0', 'Heroic Sahrhee', NULL, NULL, '1490', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.05', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100909 WHERE (`entry` = 8767);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8767);
-- Heroic Skeletal Frostweaver
DELETE FROM `creature_template` WHERE entry = 9100910;
INSERT INTO `creature_template` VALUES (9100910, '0', '0', '0', '0', '0', '9783', '0', '0', '0', 'Heroic Skeletal Frostweaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.95', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7341', '7341', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.85', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100910 WHERE (`entry` = 7341);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7341);
-- Heroic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9100911;
INSERT INTO `creature_template` VALUES (9100911, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Heroic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '0.45', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.25', '1.0', '0.35', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100911 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477);
-- Heroic Skeletal Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9100912;
INSERT INTO `creature_template` VALUES (9100912, '0', '0', '0', '0', '0', '9786', '0', '0', '0', 'Heroic Skeletal Shadowcaster', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.55', '2000', '1749', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7340', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.0', '1.0', '0.95', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100912 WHERE (`entry` = 7340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7340);
-- Heroic Skeletal Summoner
DELETE FROM `creature_template` WHERE entry = 9100913;
INSERT INTO `creature_template` VALUES (9100913, '0', '0', '0', '0', '0', '1245', '0', '0', '0', 'Heroic Skeletal Summoner', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '4.8', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7342', '7342', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.8', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100913 WHERE (`entry` = 7342);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7342);
-- Heroic Splinterbone Captain
DELETE FROM `creature_template` WHERE entry = 9100914;
INSERT INTO `creature_template` VALUES (9100914, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Heroic Splinterbone Captain', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.8', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7345', '7345', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.75', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100914 WHERE (`entry` = 7345);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7345);
-- Heroic Splinterbone Centurion
DELETE FROM `creature_template` WHERE entry = 9100915;
INSERT INTO `creature_template` VALUES (9100915, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Heroic Splinterbone Centurion', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.35', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7346', '7346', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', 
'0.8', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100915 WHERE (`entry` = 7346);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7346);
-- Heroic Splinterbone Skeleton
DELETE FROM `creature_template` WHERE entry = 9100916;
INSERT INTO `creature_template` VALUES (9100916, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Heroic Splinterbone Skeleton', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '0.25', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100916 WHERE (`entry` = 7343);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7343);
-- Heroic Splinterbone Warrior
DELETE FROM `creature_template` WHERE entry = 9100917;
INSERT INTO `creature_template` VALUES (9100917, '0', '0', '0', '0', '0', '5231', '0', '0', '0', 'Heroic Splinterbone Warrior', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.35', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7344', '7344', '0', '0', '0', '0', '0', '', '1', '1.0', '1.15', '1.0', '1.25', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100917 WHERE (`entry` = 7344);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7344);
-- Heroic Thorn Eater Ghoul
DELETE FROM `creature_template` WHERE entry = 9100918;
INSERT INTO `creature_template` VALUES (9100918, '0', '0', '0', '0', '0', '1065', '0', '0', '0', 'Heroic Thorn Eater Ghoul', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.65', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7348', '7348', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.9', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100918 WHERE (`entry` = 7348);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7348);
-- Heroic Tomb Fiend
DELETE FROM `creature_template` WHERE entry = 9100919;
INSERT INTO `creature_template` VALUES (9100919, '0', '0', '0', '0', '0', '6842', '0', '0', '0', 'Heroic Tomb Fiend', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.55', '2000', '1815', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7349', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '1.1', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100919 WHERE (`entry` = 7349);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7349);
-- Heroic Tomb Reaver
DELETE FROM `creature_template` WHERE entry = 9100920;
INSERT INTO `creature_template` VALUES (9100920, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Heroic Tomb Reaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.45', '2000', '1494', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7351', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '0.95', '1.0', '0', 
'0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100920 WHERE (`entry` = 7351);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7351);
-- Heroic Withered Battle Boar
DELETE FROM `creature_template` WHERE entry = 9100921;
INSERT INTO `creature_template` VALUES (9100921, '0', '0', '0', '0', '0', '6121', '0', '0', '0', 'Heroic Withered Battle Boar', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '1.0', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7333', '0', '7333', '0', '0', '0', '0', '', '1', '1.0', '1.1', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100921 WHERE (`entry` = 7333);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7333);
-- Heroic Withered Quilguard
DELETE FROM `creature_template` WHERE entry = 9100922;
INSERT INTO `creature_template` VALUES (9100922, '0', '0', '0', '0', '0', '11383', '0', '0', '0', 'Heroic Withered Quilguard', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7329', '7329', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100922 WHERE (`entry` = 7329);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7329);
-- Heroic Withered Reaver
DELETE FROM `creature_template` WHERE entry = 9100923;
INSERT INTO `creature_template` VALUES (9100923, '0', '0', '0', '0', '0', '11384', '0', '0', '0', 'Heroic Withered Reaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.85', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7328', '7328', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100923 WHERE (`entry` = 7328);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7328);
-- Heroic Withered Spearhide
DELETE FROM `creature_template` WHERE entry = 9100924;
INSERT INTO `creature_template` VALUES (9100924, '0', '0', '0', '0', '0', '11385', '0', '0', '0', 'Heroic Withered Spearhide', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7332', '7332', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100924 WHERE (`entry` = 7332);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7332);
-- Heroic Withered Warrior
DELETE FROM `creature_template` WHERE entry = 9100925;
INSERT INTO `creature_template` VALUES (9100925, '0', '0', '0', '0', '0', '11386', '0', '0', '0', 'Heroic Withered Warrior', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '3.95', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7327', '7327', '0', '0', '0', '0', '0', '', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100925 WHERE (`entry` = 7327);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7327);
-- Heroic Amnennar the Coldbringer
DELETE FROM `creature_template` WHERE entry = 9100926;
INSERT INTO `creature_template` VALUES (9100926, '0', '0', '0', '0', '0', '7971', '0', '0', '0', 'Heroic Amnennar the Coldbringer', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '5.05', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '7358', '0', '0', '0', '0', '0', '', '1', '1.0', '6.05', '8.0', '1.05', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100926 WHERE (`entry` = 7358);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7358);
-- Heroic Glutton
DELETE FROM `creature_template` WHERE entry = 9100927;
INSERT INTO `creature_template` VALUES (9100927, '0', '0', '0', '0', '0', '7864', '0', '0', '0', 'Heroic Glutton', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '8567', '0', '0', '0', '0', '0', '', '1', '1.0', '6.23', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100927 WHERE (`entry` = 8567);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8567);
-- Heroic Lady Faltheress
DELETE FROM `creature_template` WHERE entry = 9100928;
INSERT INTO `creature_template` VALUES (9100928, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Heroic Lady Faltheress', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '4.96', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.16', '4.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100928 WHERE (`entry` = 14686);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14686);
-- Heroic Mordresh Fire Eye
DELETE FROM `creature_template` WHERE entry = 9100929;
INSERT INTO `creature_template` VALUES (9100929, '0', '0', '0', '0', '0', '8055', '0', '0', '0', 'Heroic Mordresh Fire Eye', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '5.06', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '7357', '0', '0', '0', '0', '0', '', '1', '1.0', '6.22', '3.0', '0.9', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100929 WHERE (`entry` = 7357);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7357);
-- Heroic Plaguemaw the Rotting
DELETE FROM `creature_template` WHERE entry = 9100930;
INSERT INTO `creature_template` VALUES (9100930, '0', '0', '0', '0', '0', '6124', '0', '0', '0', 'Heroic Plaguemaw the Rotting', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '1448', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '6.49', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100930 WHERE (`entry` = 7356);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7356);
-- Heroic Ragglesnout
DELETE FROM `creature_template` WHERE entry = 9100931;
INSERT INTO `creature_template` VALUES (9100931, '0', '0', '0', '0', '0', '11382', '0', '0', '0', 'Heroic Ragglesnout', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '4.96', '2000', '1300', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '5.8', '1.0', '0.85', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100931 WHERE (`entry` = 7354);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7354);
-- Heroic Tutenkash
DELETE FROM `creature_template` WHERE entry = 9100932;
INSERT INTO `creature_template` VALUES (9100932, '0', '0', '0', '0', '0', '7845', '0', '0', '0', 'Heroic Tutenkash', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '5.01', '2000', '1457', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100400', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '6.39', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100932 WHERE (`entry` = 7355);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7355);
-- Mythic Battle Boar Horror
DELETE FROM `creature_template` WHERE entry = 9100933;
INSERT INTO `creature_template` VALUES (9100933, '0', '0', '0', '0', '0', '6122', '0', '0', '0', 'Mythic Battle Boar Horror', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.09', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7334', '0', '7334', '0', '0', '0', '0', '', '1', '1.0', '4.24', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100933 WHERE (`entry` = 7334);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7334);
-- Mythic Belnistrasz
DELETE FROM `creature_template` WHERE entry = 9100934;
INSERT INTO `creature_template` VALUES (9100934, '0', '0', '0', '0', '0', '7851', '0', '0', '0', 'Mythic Belnistrasz', NULL, NULL, '0', '60', '60', '0', '35', '2', '2.08', '0.742857', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '4096', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.23', '1.0', '1.2', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100934 WHERE (`entry` = 8516);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8516);
-- Mythic Boneflayer Ghoul
DELETE FROM `creature_template` WHERE entry = 9100935;
INSERT INTO `creature_template` VALUES (9100935, '0', '0', '0', '0', '0', '1065', '0', '0', '0', 'Mythic Boneflayer Ghoul', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7347', '7347', '0', '0', '0', '0', '0', '', '1', '1.0', '3.84', '1.0', '0.8', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100935 WHERE (`entry` = 7347);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7347);
-- Mythic Deaths Head Geomancer
DELETE FROM `creature_template` WHERE entry = 9100936;
INSERT INTO `creature_template` VALUES (9100936, '0', '0', '0', '0', '0', '6100', '0', '0', '0', 'Mythic Deaths Head Geomancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.01', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7335', '7335', '0', '0', '0', '0', '0', '', '1', '1.0', '4.15', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100936 WHERE (`entry` = 7335);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7335);
-- Mythic Deaths Head Necromancer
DELETE FROM `creature_template` WHERE entry = 9100937;
INSERT INTO `creature_template` VALUES (9100937, '0', '0', '0', '0', '0', '11381', '0', '0', '0', 'Mythic Deaths Head Necromancer', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '3.0', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '7337', '7337', '0', '0', '0', '0', '0', '', '1', '1.0', '4.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100937 WHERE (`entry` = 7337);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7337);
-- Mythic Freezing Spirit
DELETE FROM `creature_template` WHERE entry = 9100938;
INSERT INTO `creature_template` VALUES (9100938, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Freezing Spirit', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2800', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7353', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.3', '1.0', '0.8', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100938 WHERE (`entry` = 7353);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7353);
-- Mythic Frost Spectre
DELETE FROM `creature_template` WHERE entry = 9100939;
INSERT INTO `creature_template` VALUES (9100939, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Frost Spectre', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.04', '2000', '1760', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.32', '1.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100939 WHERE (`entry` = 8585);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8585);
-- Mythic Frozen Soul
DELETE FROM `creature_template` WHERE entry = 9100940;
INSERT INTO `creature_template` VALUES (9100940, '0', '0', '0', '0', '0', '146', '0', '0', '0', 'Mythic Frozen Soul', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.11111', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.97', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7352', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '3.9', '1.0', '0.85', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100940 WHERE (`entry` = 7352);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7352);
-- Mythic Henry Stern
DELETE FROM `creature_template` WHERE entry = 9100941;
INSERT INTO `creature_template` VALUES (9100941, '0', '0', '0', '0', '0', '8029', '0', '0', '0', 'Mythic Henry Stern', NULL, NULL, '1443', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.06', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.12', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100941 WHERE (`entry` = 8696);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8696);
-- Mythic Sahrhee
DELETE FROM `creature_template` WHERE entry = 9100942;
INSERT INTO `creature_template` VALUES (9100942, '0', '0', '0', '0', '0', '11573', '0', '0', '0', 'Mythic Sahrhee', NULL, NULL, '1490', '60', '60', '0', '35', '1', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.07', '2000', '2000', '1.0', '1.0', '1', '512', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.17', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '2', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100942 WHERE (`entry` = 8767);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8767);
-- Mythic Skeletal Frostweaver
DELETE FROM `creature_template` WHERE entry = 9100943;
INSERT INTO `creature_template` VALUES (9100943, '0', '0', '0', '0', '0', '9783', '0', '0', '0', 'Mythic Skeletal Frostweaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.02', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7341', '7341', '0', '0', '0', '0', '0', '', '1', '1.0', '4.36', '1.0', '0.85', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100943 WHERE (`entry` = 7341);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7341);
-- Mythic Skeletal Servant
DELETE FROM `creature_template` WHERE entry = 9100944;
INSERT INTO `creature_template` VALUES (9100944, '0', '0', '0', '0', '0', '7846', '0', '0', '0', 'Mythic Skeletal Servant', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.95', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.3', '1.0', '0.35', '0.5', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100944 WHERE (`entry` = 8477);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8477);
-- Mythic Skeletal Shadowcaster
DELETE FROM `creature_template` WHERE entry = 9100945;
INSERT INTO `creature_template` VALUES (9100945, '0', '0', '0', '0', '0', '9786', '0', '0', '0', 'Mythic Skeletal Shadowcaster', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '1749', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7340', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.38', '1.0', '0.95', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100945 WHERE (`entry` = 7340);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7340);
-- Mythic Skeletal Summoner
DELETE FROM `creature_template` WHERE entry = 9100946;
INSERT INTO `creature_template` VALUES (9100946, '0', '0', '0', '0', '0', '1245', '0', '0', '0', 'Mythic Skeletal Summoner', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7342', '7342', '0', '0', '0', '0', '0', '', '1', '1.0', '3.98', '1.0', '0.8', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100946 WHERE (`entry` = 7342);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7342);
-- Mythic Splinterbone Captain
DELETE FROM `creature_template` WHERE entry = 9100947;
INSERT INTO `creature_template` VALUES (9100947, '0', '0', '0', '0', '0', '7847', '0', '0', '0', 'Mythic Splinterbone Captain', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '3.07', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7345', '7345', '0', '0', '0', '0', '0', '', '1', '1.0', '4.18', '1.0', '0.75', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100947 WHERE (`entry` = 7345);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7345);
-- Mythic Splinterbone Centurion
DELETE FROM `creature_template` WHERE entry = 9100948;
INSERT INTO `creature_template` VALUES (9100948, '0', '0', '0', '0', '0', '7848', '0', '0', '0', 'Mythic Splinterbone Centurion', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7346', '7346', '0', '0', '0', '0', '0', '', '1', '1.0', '4.25', '1.0', 
'0.8', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100948 WHERE (`entry` = 7346);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7346);
-- Mythic Splinterbone Skeleton
DELETE FROM `creature_template` WHERE entry = 9100949;
INSERT INTO `creature_template` VALUES (9100949, '0', '0', '0', '0', '0', '7550', '0', '0', '0', 'Mythic Splinterbone Skeleton', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.08', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.16', '1.0', '1.0', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100949 WHERE (`entry` = 7343);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7343);
-- Mythic Splinterbone Warrior
DELETE FROM `creature_template` WHERE entry = 9100950;
INSERT INTO `creature_template` VALUES (9100950, '0', '0', '0', '0', '0', '5231', '0', '0', '0', 'Mythic Splinterbone Warrior', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.888888', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.9', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7344', '7344', '0', '0', '0', '0', '0', '', '1', '1.0', '4.28', '1.0', '1.25', '1.0', '0', '0', '1', '8602131', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100950 WHERE (`entry` = 7344);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7344);
-- Mythic Thorn Eater Ghoul
DELETE FROM `creature_template` WHERE entry = 9100951;
INSERT INTO `creature_template` VALUES (9100951, '0', '0', '0', '0', '0', '1065', '0', '0', '0', 'Mythic Thorn Eater Ghoul', NULL, NULL, '0', '60', '60', '0', '152', '0', '0.777776', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7348', '7348', '0', '0', '0', '0', '0', '', '1', '1.0', '4.13', '1.0', '0.9', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100951 WHERE (`entry` = 7348);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7348);
-- Mythic Tomb Fiend
DELETE FROM `creature_template` WHERE entry = 9100952;
INSERT INTO `creature_template` VALUES (9100952, '0', '0', '0', '0', '0', '6842', '0', '0', '0', 'Mythic Tomb Fiend', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '2.92', '2000', '1815', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7349', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.37', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100952 WHERE (`entry` = 7349);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7349);
-- Mythic Tomb Reaver
DELETE FROM `creature_template` WHERE entry = 9100953;
INSERT INTO `creature_template` VALUES (9100953, '0', '0', '0', '0', '0', '3004', '0', '0', '0', 'Mythic Tomb Reaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2000', '1494', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7351', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '4.01', '1.0', '0.95', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100953 WHERE (`entry` = 7351);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7351);
-- Mythic Withered Battle Boar
DELETE FROM `creature_template` WHERE entry = 9100954;
INSERT INTO `creature_template` VALUES (9100954, '0', '0', '0', '0', '0', '6121', '0', '0', '0', 'Mythic Withered Battle Boar', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '18.0', '1.0', '0', '0', '3.01', '2000', '2000', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7333', '0', '7333', '0', '0', '0', '0', '', '1', '1.0', '4.17', '1.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100954 WHERE (`entry` = 7333);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7333);
-- Mythic Withered Quilguard
DELETE FROM `creature_template` WHERE entry = 9100955;
INSERT INTO `creature_template` VALUES (9100955, '0', '0', '0', '0', '0', '11383', '0', '0', '0', 'Mythic Withered Quilguard', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.98', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7329', '7329', '0', '0', '0', '0', '0', '', '1', '1.0', '4.41', '1.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100955 WHERE (`entry` = 7329);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7329);
-- Mythic Withered Reaver
DELETE FROM `creature_template` WHERE entry = 9100956;
INSERT INTO `creature_template` VALUES (9100956, '0', '0', '0', '0', '0', '11384', '0', '0', '0', 'Mythic Withered Reaver', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.93', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7328', '7328', '0', '0', '0', '0', '0', '', '1', '1.0', '4.48', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100956 WHERE (`entry` = 7328);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7328);
-- Mythic Withered Spearhide
DELETE FROM `creature_template` WHERE entry = 9100957;
INSERT INTO `creature_template` VALUES (9100957, '0', '0', '0', '0', '0', '11385', '0', '0', '0', 'Mythic Withered Spearhide', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.99', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7332', '7332', '0', '0', '0', '0', '0', '', '1', '1.0', '4.02', '1.0', '1.0', 
'1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100957 WHERE (`entry` = 7332);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7332);
-- Mythic Withered Warrior
DELETE FROM `creature_template` WHERE entry = 9100958;
INSERT INTO `creature_template` VALUES (9100958, '0', '0', '0', '0', '0', '11386', '0', '0', '0', 'Mythic Withered Warrior', NULL, NULL, '0', '60', '60', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '2.91', '2000', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '7327', '7327', '0', '0', '0', '0', '0', '', '1', '1.0', '4.35', '1.0', '1.0', '1.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100958 WHERE (`entry` = 7327);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7327);
-- Mythic Amnennar the Coldbringer
DELETE FROM `creature_template` WHERE entry = 9100959;
INSERT INTO `creature_template` VALUES (9100959, '0', '0', '0', '0', '0', '7971', '0', '0', '0', 'Mythic Amnennar the Coldbringer', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', 
'1.0', '20.0', '1.0', '1', '0', '7.03', '2000', '2000', '1.0', '1.0', '2', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '7358', '0', '0', '0', '0', '0', '', '1', '1.0', '8.29', '8.0', '1.05', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100959 WHERE (`entry` = 7358);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7358);
-- Mythic Glutton
DELETE FROM `creature_template` WHERE entry = 9100960;
INSERT INTO `creature_template` VALUES (9100960, '0', '0', '0', '0', '0', '7864', '0', '0', '0', 'Mythic Glutton', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.0', '2800', '2000', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '8567', '0', '0', '0', '0', '0', '', '1', '1.0', '8.26', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100960 WHERE (`entry` = 8567);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 8567);
-- Mythic Lady Faltheress
DELETE FROM `creature_template` WHERE entry = 9100961;
INSERT INTO `creature_template` VALUES (9100961, '0', '0', '0', '0', '0', '10698', '0', '0', '0', 'Mythic Lady Faltheress', NULL, NULL, '0', '63', '63', '0', '21', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '5', '7.09', '2000', '2000', '1.0', '1.0', '2', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.32', '4.0', '1.0', '1.0', '0', '0', '1', '8405008', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100961 WHERE (`entry` = 14686);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 14686);
-- Mythic Mordresh Fire Eye
DELETE FROM `creature_template` WHERE entry = 9100962;
INSERT INTO `creature_template` VALUES (9100962, '0', '0', '0', '0', '0', '8055', '0', '0', '0', 'Mythic Mordresh Fire Eye', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', 
'20.0', '1.0', '1', '0', '6.99', '2000', '2000', '1.0', '1.0', '8', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '7357', '0', '0', '0', '0', '0', '', '1', '1.0', '8.06', '3.0', '0.9', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100962 WHERE (`entry` = 7357);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7357);
-- Mythic Plaguemaw the Rotting
DELETE FROM `creature_template` WHERE entry = 9100963;
INSERT INTO `creature_template` VALUES (9100963, '0', '0', '0', '0', '0', '6124', '0', '0', '0', 'Mythic Plaguemaw the Rotting', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '7.01', '2000', '1448', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '0', '1.0', '8.37', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100963 WHERE (`entry` = 7356);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7356);
-- Mythic Ragglesnout
DELETE FROM `creature_template` WHERE entry = 9100964;
INSERT INTO `creature_template` VALUES (9100964, '0', '0', '0', '0', '0', '11382', '0', '0', '0', 'Mythic Ragglesnout', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '6.95', '2000', '1300', '1.0', '1.0', '8', '0', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.94', '1.0', '0.85', '2.0', 
'0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100964 WHERE (`entry` = 7354);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7354);
-- Mythic Tutenkash
DELETE FROM `creature_template` WHERE entry = 9100965;
INSERT INTO `creature_template` VALUES (9100965, '0', '0', '0', '0', '0', '7845', '0', '0', '0', 'Mythic Tutenkash', NULL, NULL, '0', '63', '63', '0', '152', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', 
'1.0', '1', '0', '6.99', '2000', '1457', '1.0', '1.0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '6', '0', '9100500', '0', '0', '0', '0', '0', '0', '', '1', '1.0', '7.92', '1.0', '0.8', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_2` = 9100965 WHERE (`entry` = 7355);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 7355);