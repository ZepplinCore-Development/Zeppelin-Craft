-- Heroic Patchwork Golem
DELETE FROM `creature_template` WHERE entry = 9101900;
INSERT INTO `creature_template` VALUES (9101900, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Heroic Patchwork Golem', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '37.5', '2500', '3700', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '72', '351021', '0', '0', '0', '0', '3798', '4965', '', '0', 
'1.0', '28.0', '2.0', '1.15', '1.0', '0', '144', '1', '1022066674', '0', '0', '', NULL);
UPDATE `creature_template` SET `difficulty_entry_1` = 9101900 WHERE (`entry` = 351021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 351021);
-- Mythic Patchwork Golem
DELETE FROM `creature_template` WHERE entry = 9101901;
INSERT INTO `creature_template` VALUES (9101901, '0', '0', '0', '0', '0', '9760', '0', '0', '0', 'Mythic Patchwork Golem', '', NULL, '0', '60', '60', '0', '21', '0', '1.0', '1.42857', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.9', '2500', '3700', '1.0', '1.0', '1', '64', '2048', '0', '0', '0', '0', '0', '0', '6', '72', '351021', '0', '0', '0', '0', '3798', '4965', '', '0', '1.0', '3.87', '2.0', '1.15', '1.0', '0', '144', '1', '1022066674', '0', '0', '', NULL);
UPDATE `creature_template` SET `difficulty_entry_2` = 9101901 WHERE (`entry` = 351021);
UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = 351021);