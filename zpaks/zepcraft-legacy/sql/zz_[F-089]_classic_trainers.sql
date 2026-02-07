-- Farii JC Trainer
    DELETE FROM `creature` WHERE (`id1` =  19778);

-- Exodar
    INSERT INTO `creature` SET
    `id1` = 19778,
    `map` = 530,
    `position_x` = -3781.55,
    `position_y` = -11541.8,
    `position_z` = -134.744,
    `orientation` = 1.93941,
    `curhealth` = 811,
    `curmana` = 852,
    `VerifiedBuild` = '0',
    `Comment` = NULL;

-- Stormwind
    INSERT INTO `creature` SET
    `id1` = 19778,
    `position_x` = -8714.31,
    `position_y` = 620.134,
    `position_z` = 100.927,
    `orientation` = 0.0639622,
    `spawntimesecs` = 300,
    `curhealth` = 811,
    `curmana` = 852,
    `VerifiedBuild` = NULL,
    `Comment` = NULL;

-- ========================================
-- STORMWIND GUARD GOSSIP - Jewelcrafting
-- ========================================
-- Adds Jewelcrafting option to Stormwind guard profession submenu
-- directing players to Farii (19778) in the Dwarven District.

-- POI for Farii (Jewelcrafting Trainer) at her Stormwind spawn
DELETE FROM `points_of_interest` WHERE `ID` = 1010;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(1010, -8714.31, 620.134, 7, 99, 0, 'Stormwind Jewelcrafting Trainer');

-- NPC text for guard directions
DELETE FROM `npc_text` WHERE `ID` = 3045;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(3045, 'If you are looking to learn the art of jewelcrafting, seek out Farii. She can be found in the Dwarven District, near the forge.');

-- Gossip menu for the JC submenu
DELETE FROM `gossip_menu` WHERE `MenuID` = 2363;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(2363, 3045);

-- Add "Jewelcrafting" option to Stormwind profession trainer submenu (MenuID 421)
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 421 AND `OptionID` = 13;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(421, 13, 0, 'Jewelcrafting', 1, 1, 2363, 1010);
