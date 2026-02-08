-- ========================================
-- Darnassus Mining & Smithing Trainers
-- ========================================
-- Adds proper mining and blacksmithing trainers to Darnassus
-- Mining: New NPC (Dellorah Moonsight)
-- Smithing: Upgrade Mathiel (6142) to trainer
--

-- ========================================
-- MATHIEL - Upgrade to Blacksmithing Trainer
-- ========================================
-- Existing NPC (6142) upgraded to also function as blacksmith trainer
-- Requires a dedicated gossip menu (66001) instead of default menu (0),
-- because MenuID 0 includes talent unlearn/dual spec options for any trainer.

-- Create gossip menu for Mathiel
DELETE FROM `npc_text` WHERE `ID` = 66001;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(66001, 'The ancient art of shaping metal is not so different from tending the trees of Teldrassil. Both require patience and a steady hand. Shall I teach you?');

DELETE FROM `gossip_menu` WHERE `MenuID` = 66001;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES (66001, 66001);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 66001;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`)
VALUES (66001, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, '', 0);

UPDATE `creature_template`
SET `subname` = 'Blacksmithing Trainer',
    `gossip_menu_id` = 66001,
    `npcflag` = 83 -- Gossip + Questgiver + Trainer + Profession (1 + 2 + 16 + 64)
WHERE `entry` = 6142;

-- Assign blacksmithing trainer template to Mathiel (618 = Artisan, 0-300 skill)
-- Matches I-096 consolidated tier: Classic city trainers cap at Artisan
DELETE FROM `creature_default_trainer` WHERE `CreatureId` = 6142;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES (6142, 618);

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
    `npcflag` = 211, -- Gossip + Questgiver + Trainer + Profession + Vendor (1 + 2 + 16 + 64 + 128)
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

-- Assign mining trainer template to Borin Irondelve (80 = standard Mining Trainer, 0-250 skill)
-- Matches other Classic city mining trainers (Kurdram Stonehammer, Geofram Bouldertoe, etc.)
DELETE FROM `creature_default_trainer` WHERE `CreatureId` = 70;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES (70, 80);

-- Base mining supply stock (matches standard mining suppliers)
DELETE FROM `npc_vendor` WHERE `entry` = 70 AND `item` IN (2880, 2901, 3466, 3857, 20815, 20824);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(70, 0, 2901, 0, 0, 0), -- Basic Mining Pick
(70, 0, 2880, 0, 0, 0), -- Weak Flux
(70, 0, 3466, 0, 0, 0), -- Strong Flux
(70, 0, 3857, 0, 0, 0), -- Coal
(70, 0, 20815, 0, 0, 0), -- Jeweler's Kit
(70, 0, 20824, 0, 0, 0); -- Simple Grinder

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
