-- ============================================================================
-- SKILL RACE CLASS INFO - WEAPON SKILL AVAILABILITY
-- ============================================================================
-- This file controls which weapon skills are LEARNABLE by CLASS.
-- All races (raceMask=4095) can learn if their class allows it.
-- Must be applied BEFORE starting_weapon_skills.sql
--
-- AUTO-GENERATED from Race and Class Masks.xlsx (Weapon Class Mask sheet)
-- DO NOT EDIT MANUALLY - Changes will be overwritten
-- ============================================================================

-- Delete existing weapon skill entries
DELETE FROM `skillraceclassinfo` WHERE `SkillLineDbcRecord` IN (43, 44, 45, 46, 54, 55, 136, 160, 162, 172, 173, 176, 226, 228, 229, 433, 473);

-- Swords (skill 43) - classMask 431
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1000, 43, 4095, 431, 128, 0, 0, 0);

-- Axes (skill 44) - classMask 103
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1001, 44, 4095, 103, 128, 0, 0, 0);

-- Bows (skill 45) - classMask 13
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1002, 45, 4095, 13, 128, 0, 0, 0);

-- Guns (skill 46) - classMask 13
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1003, 46, 4095, 13, 128, 0, 0, 0);

-- Maces (skill 54) - classMask 123
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1004, 54, 4095, 123, 128, 0, 0, 0);

-- Two-Handed Swords (skill 55) - classMask 39
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1005, 55, 4095, 39, 128, 0, 0, 0);

-- Staves (skill 136) - classMask 469
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1006, 136, 4095, 469, 128, 0, 0, 0);

-- Two-Handed Maces (skill 160) - classMask 99
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1007, 160, 4095, 99, 128, 0, 0, 0);

-- Unarmed (skill 162) - classMask 511
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1008, 162, 4095, 511, 128, 0, 0, 0);

-- Two-Handed Axes (skill 172) - classMask 103
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1009, 172, 4095, 103, 128, 0, 0, 0);

-- Daggers (skill 173) - classMask 477
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1010, 173, 4095, 477, 128, 0, 0, 0);

-- Thrown (skill 176) - classMask 9
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1011, 176, 4095, 9, 128, 0, 0, 0);

-- Crossbows (skill 226) - classMask 13
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1012, 226, 4095, 13, 128, 0, 0, 0);

-- Wands (skill 228) - classMask 400
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1013, 228, 4095, 400, 128, 0, 0, 0);

-- Polearms (skill 229) - classMask 39
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1014, 229, 4095, 39, 128, 0, 0, 0);

-- Shield (skill 433) - classMask 67
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1015, 433, 4095, 67, 128, 0, 0, 0);

-- Fist Weapons (skill 473) - classMask 77
INSERT INTO `skillraceclassinfo` (`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) VALUES (1016, 473, 4095, 77, 128, 0, 0, 0);
