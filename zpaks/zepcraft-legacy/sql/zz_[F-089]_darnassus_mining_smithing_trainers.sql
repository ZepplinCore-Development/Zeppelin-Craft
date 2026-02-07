-- ========================================
-- Darnassus Mining & Smithing Trainers
-- ========================================
-- Adds proper mining and blacksmithing trainers to Darnassus
-- Mining: New NPC (Dellorah Moonsight)
-- Smithing: Upgrade Mathiel (6142) to trainer
--
-- TODO (F-089 known issues):
-- 1. Mathiel offers talent unlearn dialog (acting like a class trainer)
-- 2. Mathiel teaches WotLK-era recipes - should be capped to Classic?
-- 3. Borin Irondelve teaches WotLK-era recipes - same question
-- 4. Borin has no base mining supply stock (picks, flux, coal, etc.)
--    Regular mining suppliers sell: 2880 Weak Flux, 2901 Basic Mining Pick,
--    3466 Strong Flux, 3857 Coal, 20815 Jeweler's Kit, 20824 Simple Grinder

-- ========================================
-- MATHIEL - Upgrade to Blacksmithing Trainer
-- ========================================
-- Existing NPC (6142) upgraded to also function as blacksmith trainer

UPDATE `creature_template`
SET `subname` = 'Blacksmithing Trainer',
    `npcflag` = 83 -- Gossip + Questgiver + Trainer (1 + 2 + 16 + 64)
WHERE `entry` = 6142;

-- Assign blacksmithing trainer template to Mathiel (59 = full trainer, 0-440 skill)
DELETE FROM `creature_default_trainer` WHERE `CreatureId` = 6142;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES (6142, 59);

-- ========================================
-- BORIN IRONDELVE - New Mining Trainer
-- ========================================
-- New NPC created for Darnassus mining training
-- Uses Fendrig Redbeard's model (displayid 24289)
-- Based on Kurdram Stonehammer's trainer settings
-- Using NPC ID 70 (repurposed unused NPC slot)

-- Create new mining trainer NPC
DELETE FROM `creature_template` WHERE `entry` = 70;
INSERT INTO `creature_template`
SET `entry` = 70,
    `name` = 'Borin Irondelve',
    `subname` = 'Mining Trainer',
    `gossip_menu_id` = 7690, -- Mining trainer gossip
    `minlevel` = 35,
    `maxlevel` = 35,
    `faction` = 80, -- Darnassus
    `npcflag` = 83, -- Gossip + Questgiver + Trainer (1 + 2 + 16 + 64)
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `type_flags` = 134217728, -- FORCE_GOSSIP
    `HoverHeight` = 1,
    `HealthModifier` = 1.1,
    `DamageModifier` = 1.05,
    `flags_extra` = 2; -- Civilian/No aggro

-- Assign model to NPC (Fendrig Redbeard's dwarf male model)
DELETE FROM `creature_template_model` WHERE `CreatureID` = 70;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(70, 0, 24289, 1, 1); -- Fendrig Redbeard model

-- Spawn the new mining trainer in Darnassus
DELETE FROM `creature` WHERE `id1` = 70;
INSERT INTO `creature` (`id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(70, 1, 9923.672, 2311.778, 1330.7888, 2.5290294, 300);

-- Assign mining trainer template to Borin Irondelve (78 = full trainer, 0-450 skill)
DELETE FROM `creature_default_trainer` WHERE `CreatureId` = 70;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES (70, 78);

-- ========================================
-- GUARD GOSSIP INTEGRATION
-- ========================================
-- Add POI entries and gossip menu options for guards to direct players

-- POI for Mathiel (Blacksmithing Trainer)
DELETE FROM `points_of_interest` WHERE `ID` = 111;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(111, 9918.03, 2308.6, 7, 99, 0, 'Darnassus Blacksmithing Trainer');

-- POI for Borin Irondelve (Mining Trainer)
DELETE FROM `points_of_interest` WHERE `ID` = 112;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(112, 9923.672, 2311.778, 7, 99, 0, 'Darnassus Mining Trainer');

-- Create NPC text entries for profession directions
DELETE FROM `npc_text` WHERE `ID` IN (3041, 3043);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(3041, 'Mathiel is a skilled blacksmith who can teach you the ways of shaping metal into arms and armor. You will find him at the Craftsmen''s Terrace in northern Darnassus, near the mining trainer.'),
(3043, 'If you seek to learn the art of mining, I would direct you to Borin Irondelve, a talented dwarf who has made Darnassus his home. You can find him at the Craftsmen''s Terrace in northern Darnassus.');

-- Create gossip menu entries for blacksmithing and mining submenus
DELETE FROM `gossip_menu` WHERE `MenuID` IN (2359, 2360);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(2359, 3041), -- Blacksmithing
(2360, 3043); -- Mining

-- Add gossip menu options to profession trainer submenu (MenuID 2351)
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 2351 AND `OptionID` IN (10, 11);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(2351, 10, 0, 'Blacksmithing', 1, 1, 2359, 111),
(2351, 11, 0, 'Mining', 1, 1, 2360, 112);
