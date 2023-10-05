-- Defias Prisoner
DELETE FROM `creature_template` WHERE (`entry` = 9100000);
INSERT INTO `creature_template` VALUES (9100000, '9100000', '0', '0', '0', '0', '2148', '0', '0', '0', 'Defias Prisoner', NULL, NULL, '0', '60', '60', '0', '290', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1706', '1706', '0', '0', '0', '64', '323', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100000 WHERE (`entry` = 1706);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1706);
-- Defias Captive
DELETE FROM `creature_template` WHERE (`entry` = 9100001);
INSERT INTO `creature_template` VALUES (9100001, '9100001', '0', '0', '0', '0', '2144', '0', '0', '0', 'Defias Captive', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1707', '1707', '0', '0', '0', '60', '325', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100001 WHERE (`entry` = 1707);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1707);
-- Defias Inmate
DELETE FROM `creature_template` WHERE (`entry` = 9100002);
INSERT INTO `creature_template` VALUES (9100002, '9100002', '0', '0', '0', '0', '2146', '0', '0', '0', 'Defias Inmate', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1708', '1708', '0', '0', '0', '64', '369', 'SmartAI', '1', '1.0', '3.0', '1.0', 
'1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100002 WHERE (`entry` = 1708);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1708);
-- Defias Convict
DELETE FROM `creature_template` WHERE (`entry` = 9100003);
INSERT INTO `creature_template` VALUES (9100003, '9100003', '0', '0', '0', '0', '2145', '0', '0', '0', 'Defias Convict', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1711', '1711', '0', '0', '0', '74', '348', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100003 WHERE (`entry` = 1711);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1711);
-- Targorr the Dread
DELETE FROM `creature_template` WHERE (`entry` = 9100004);
INSERT INTO `creature_template` VALUES (9100004, '9100004', '0', '0', '0', '0', '517', '0', '0', '0', 'Targorr the Dread', NULL, NULL, '0', '60', '60', '0', '41', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '1.7', '2000', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1696', '1696', '0', '0', '0', '123', '266', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '2.0', '0', '0', '1', '8388624', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100004 WHERE (`entry` = 1696);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1696);
-- Defias Insurgent
DELETE FROM `creature_template` WHERE (`entry` = 9100005);
INSERT INTO `creature_template` VALUES (9100005, '9100005', '0', '0', '0', '0', '2147', '0', '0', '0', 'Defias Insurgent', NULL, NULL, '0', '60', '60', '0', '17', '0', '1.0', '1.14286', '1.0', '1.0', '20.0', '1.0', '1', '0', '2.21', '2600', '2000', '1.0', '1.0', '1', '32832', '2048', '0', '0', '0', '0', '0', '0', '7', '0', '1715', '1715', '0', '0', '0', '69', '402', 'SmartAI', '1', '1.0', '3.0', '1.0', '1.0', '1.0', '0', '0', '1', '0', '0', '0', '', '12340');
UPDATE `creature_template` SET `difficulty_entry_1` = 9100005 WHERE (`entry` = 1715);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1715);
-- Dextren Ward
DELETE FROM `creature_template` WHERE (`entry` = 9100006);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9100006, 9100006, 0, 0, 0, 0, 2149, 0, 0, 0, 'Dextren Ward', NULL, NULL, 0, 63, 63, 0, 41, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 4, 2400, 2000, 1, 1, 1, 32832, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 1663, 1663, 0, 0, 0, 135, 181, 'SmartAI', 1, 1, 4, 1, 1, 2, 0, 0, 1, 8388624, 0, 0, '', 12340);
UPDATE `creature_template` SET `difficulty_entry_1` = 9100006 WHERE (`entry` = 1663);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1663);
-- Bruegal Ironknuckle
DELETE FROM `creature_template` WHERE (`entry` = 9100007);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9100007, 9100007, 0, 0, 0, 0, 2142, 0, 0, 0, 'Bruegal Ironknuckle', NULL, NULL, 0, 63, 63, 0, 17, 0, 1, 1.14286, 1, 1, 20, 1, 2, 0, 4, 2000, 2000, 1, 1, 1, 32832, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 1720, 0, 0, 0, 0, 210, 279, 'SmartAI', 1, 1, 4, 1, 1, 2, 0, 0, 1, 8388624, 0, 0, '', 12340);
UPDATE `creature_template` SET `difficulty_entry_1` = 9100007 WHERE (`entry` = 1720);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1720);
-- Kam Deepfury
DELETE FROM `creature_template` WHERE (`entry` = 9100008);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9100008, 9100008, 0, 0, 0, 0, 825, 0, 0, 0, 'Kam Deepfury', NULL, NULL, 0, 63, 63, 0, 41, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 4, 2000, 2000, 1, 1, 1, 32832, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 1666, 1666, 0, 0, 0, 31, 205, 'SmartAI', 1, 1, 4, 1, 1, 2, 0, 0, 1, 8388624, 0, 0, '', 12340);
UPDATE `creature_template` SET `difficulty_entry_1` = 9100008 WHERE (`entry` = 1666);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1666);
-- Hamhock
DELETE FROM `creature_template` WHERE (`entry` = 9100009);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9100009, 9100009, 0, 0, 0, 0, 3250, 0, 0, 0, 'Hamhock', NULL, NULL, 0, 63, 63, 0, 17, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 4, 2000, 2000, 1, 1, 2, 64, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 1717, 1717, 0, 0, 0, 147, 286, 'SmartAI', 1, 1, 4, 1, 1, 2, 0, 0, 1, 8388624, 0, 0, '', 12340);
UPDATE `creature_template` SET `difficulty_entry_1` = 9100009 WHERE (`entry` = 1717);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1717);
-- Bazil Thredd
DELETE FROM `creature_template` WHERE (`entry` = 9100010);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9100010, 9100010, 0, 0, 0, 0, 1621, 0, 0, 0, 'Bazil Thredd', NULL, NULL, 0, 63, 63, 0, 17, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 4, 2000, 2000, 1, 1, 1, 32832, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 1716, 1716, 0, 0, 0, 170, 368, 'SmartAI', 1, 1, 4, 1, 1.5, 2, 0, 0, 1, 8388624, 0, 0, '', 12340);
UPDATE `creature_template` SET `difficulty_entry_1` = 9100010 WHERE (`entry` = 1716);
UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = 1716);