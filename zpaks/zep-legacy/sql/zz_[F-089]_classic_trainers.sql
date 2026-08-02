-- ========================================
-- F-089: Classic City Jewelcrafting Trainers
-- ========================================
-- Farii (19778) remains in Exodar (stock location).
-- Faris (72) is a new NPC for Stormwind, based on Farii's template.
-- Nessera (76) is a JC supply vendor for Stormwind, cloned from Inessera (19065).

-- ========================================
-- FARII - Exodar (stock spawn restore)
-- ========================================
DELETE FROM `creature` WHERE `id` = 19778;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`, `curmana`)
VALUES (19778, 530, -3781.55, -11541.8, -134.744, 1.93941, 120, 811, 852);

-- ========================================
-- FARIS - Stormwind Jewelcrafting Trainer
-- ========================================
-- New NPC (entry 72) based on Farii's template, placed in Dwarven District.

DELETE FROM `creature_template` WHERE `entry` = 72;
INSERT INTO `creature_template`
SET `entry` = 72,
    `name` = 'Faris',
    `subname` = 'Jewelcrafting Trainer',
    `gossip_menu_id` = 8382, -- Same JC trainer gossip as Farii
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 11, -- Stormwind
    `npcflag` = 81, -- Gossip + Trainer + Profession (1 + 16 + 64)
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 2, -- Mana user (same as Farii)
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `type_flags` = 134217728, -- FORCE_GOSSIP
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

-- Use Farii's model (Draenei female, displayid 19195)
DELETE FROM `creature_template_model` WHERE `CreatureID` = 72;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(72, 0, 19195, 1, 1);

-- Assign same JC trainer template as Farii (113 = base JC trainer, 0-290 skill)
DELETE FROM `creature_default_trainer` WHERE `CreatureId` = 72;
INSERT INTO `creature_default_trainer` (`CreatureId`, `TrainerId`) VALUES (72, 113);

-- Spawn Faris in Stormwind Dwarven District
DELETE FROM `creature` WHERE `id` = 72;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(72, 0, -8714.3, 620.1, 100.9, 0.06, 300);

-- ========================================
-- NESSERA - Stormwind Jewelcrafting Supplies
-- ========================================
-- New NPC (entry 76) cloned from Inessera (19065, Exodar JC supplies vendor).
-- Placed next to Faris (JC trainer) in the Dwarven District.

DELETE FROM `creature_template` WHERE `entry` = 76;
INSERT INTO `creature_template`
SET `entry` = 76,
    `name` = 'Nessera',
    `subname` = 'Jewelcrafting Supplies',
    `gossip_menu_id` = 0,
    `minlevel` = 30,
    `maxlevel` = 30,
    `faction` = 11, -- Stormwind
    `npcflag` = 128, -- Vendor
    `speed_walk` = 1,
    `speed_run` = 1.14286,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 512,
    `unit_flags2` = 2048,
    `type` = 7, -- Humanoid
    `HoverHeight` = 1,
    `HealthModifier` = 1,
    `ManaModifier` = 1,
    `DamageModifier` = 1,
    `flags_extra` = 2; -- Civilian/No aggro

-- Use Inessera's model (Draenei female, displayid 18499)
DELETE FROM `creature_template_model` WHERE `CreatureID` = 76;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(76, 0, 18499, 1, 1);

-- Clone Inessera's vendor inventory (JC supplies + gems)
DELETE FROM `npc_vendor` WHERE `entry` = 76;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(76, 0, 20815, 0, 0, 0), -- Jeweler's Kit
(76, 0, 20824, 0, 0, 0), -- Simple Grinder
(76, 0, 28458, 0, 0, 0), -- Bold Tourmaline
(76, 0, 28459, 0, 0, 0), -- Delicate Tourmaline
(76, 0, 28460, 0, 0, 0), -- Teardrop Tourmaline
(76, 0, 28461, 0, 0, 0), -- Runed Tourmaline
(76, 0, 28462, 0, 0, 0), -- Bright Tourmaline
(76, 0, 28463, 0, 0, 0), -- Solid Zircon
(76, 0, 28464, 0, 0, 0), -- Sparkling Zircon
(76, 0, 28465, 0, 0, 0), -- Lustrous Zircon
(76, 0, 28466, 0, 0, 0), -- Brilliant Amber
(76, 0, 28467, 0, 0, 0), -- Smooth Amber
(76, 0, 28468, 0, 0, 0), -- Rigid Amber
(76, 0, 28469, 0, 0, 0), -- Gleaming Amber
(76, 0, 28470, 0, 0, 0); -- Thick Amber

-- Spawn Nessera next to Faris in Stormwind Dwarven District
DELETE FROM `creature` WHERE `id` = 76;
INSERT INTO `creature` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(76, 0, -8714.3, 624.7, 101, 0.06, 300);

-- ========================================
-- STORMWIND GUARD GOSSIP - Jewelcrafting
-- ========================================
-- Directs players to Faris in the Dwarven District.

-- POI for Faris (Jewelcrafting Trainer) at her Stormwind spawn
DELETE FROM `points_of_interest` WHERE `ID` = 1010;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(1010, -8714.31, 620.134, 7, 99, 0, 'Stormwind Jewelcrafting Trainer');

-- NPC text for guard directions
DELETE FROM `npc_text` WHERE `ID` = 3045;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(3045, 'If you are looking to learn the art of jewelcrafting, seek out Faris. She can be found in the Trade District, near the canal.');

-- Gossip menu for the JC submenu
DELETE FROM `gossip_menu` WHERE `MenuID` = 2363;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(2363, 3045);

-- Add "Jewelcrafting" option to Stormwind profession trainer submenu (MenuID 421)
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 421 AND `OptionID` = 13;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(421, 13, 0, 'Jewelcrafting', 1, 1, 2363, 1010);
