-- Outland Reputation Tabards - Complete Implementation
-- All 21 Outland faction tabards with 25% reputation bonuses
--
-- Compliance migration (I-186, May 2026): renumbered custom tabards 902001-902005 → 58330-58334 (Misc reservation row 58300-58399).
-- Idempotent cleanup of stale rows below — NO-OP after first apply.

DELETE FROM `item_template` WHERE `entry` BETWEEN 902001 AND 902005;
DELETE FROM `npc_vendor` WHERE `item` BETWEEN 902001 AND 902005;

--
-- This file contains:
--   1. Updates to 16 existing tabards
--   2. Creation of 5 custom tabards for factions without existing tabards
--   3. Vendor assignments for custom tabards
--
-- Configuration:
--   - ItemLevel = 1 (no artificial inflation)
--   - RequiredLevel = 0 (no level gate)
--   - Bonding = 1 (Bind on Pickup, prevents AH sales)
--   - 25% reputation increase (EffectBasePoints1 = 24 in spell)
--   - All tabards require Honored reputation to buy/wear (RequiredReputationRank = 5)
--
-- DBC Spells:
--   - Dungeon tabards: spells 91132-91137
--   - Zone tabards: spells 91178-91181, 91168-91171
--   - Raid tabards: spell 91172
--   - Custom tabards: spells 91173-91177
--   - All spell data generated via Patch Builder (update_spell.sql)

-- ==============================================================================
-- PART 1: EXISTING TABARD UPDATES (16 tabards)
-- ==============================================================================

-- OUTLAND

    -- DUNGEONS
        -- Thrallmar Tabard (faction 947)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 947,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91132,
                `spelltrigger_1` = 1
            WHERE (`entry` = 24004);
        -- Honor Hold (faction 946)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 946,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91133,
                `spelltrigger_1` = 1
            WHERE (`entry` = 23999);
        -- Cenarion Expedition (faction 942)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 942,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91134,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31804);
        -- Lower City (faction 1011)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 1011,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91135,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31778);
        -- Keepers of Time (faction 989)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 989,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91136,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31777);
        -- The Sha'tar (faction 935)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 935,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91137,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31781);

    -- RAIDS
        -- Shattered Sun Offensive (faction 1077)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 1077,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91172,
                `spelltrigger_1` = 1
            WHERE (`entry` = 35221);

    -- ZONES
        -- Kurenai (faction 978)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 978,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91178,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31774);
        -- The Mag'har (faction 941)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 941,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91179,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31773);
        -- Ogri'la (faction 1038)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 1038,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91180,
                `spelltrigger_1` = 1
            WHERE (`entry` = 32828);
        -- The Aldor (faction 932)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 932,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91181,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31779);
        -- The Scryers (faction 934)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 934,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91168,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31780);
        -- Sha'tari Skyguard (faction 1031)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 1031,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91169,
                `spelltrigger_1` = 1
            WHERE (`entry` = 32445);
        -- Sporeggar (faction 970)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 970,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91170,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31775);
        -- The Consortium (faction 933)
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `RequiredReputationFaction` = 933,
                `RequiredReputationRank` = 5,
                `spellid_1` = 91171,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31776);

-- ==============================================================================
-- PART 2: CUSTOM TABARD CREATION (5 tabards)
-- ==============================================================================
-- These tabards use existing models from other tabards that fit the faction theme

-- Delete any existing custom tabard entries first
DELETE FROM `item_template` WHERE `entry` IN (58330, 58331, 58332, 58333, 58334);

-- Netherwing Tabard (uses Purple Trophy Tabard of the Illidari model - displayid 43950)
-- Sold by: Drake Dealer Hurlunk (23489)
INSERT INTO `item_template` SET
    `entry` = 58330,
    `class` = 4,
    `name` = 'Netherwing Tabard',
    `displayid` = 43950,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 19,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `bonding` = 1,
    `RequiredReputationFaction` = 1015,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91173,
    `spelltrigger_1` = 1;

-- Violet Eye Tabard (uses Tabard of the Kirin Tor model - displayid 54176)
-- Sold by: Apprentice Darius (18255)
INSERT INTO `item_template` SET
    `entry` = 58331,
    `class` = 4,
    `name` = 'Violet Eye Tabard',
    `displayid` = 54176,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 19,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `bonding` = 1,
    `RequiredReputationFaction` = 967,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91174,
    `spelltrigger_1` = 1;

-- Tranquillien Tabard (uses Cataclysm Tranquillien Tabard model - displayid 35929)
-- Sold by: Provisioner Vredigar (16528)
INSERT INTO `item_template` SET
    `entry` = 58332,
    `class` = 4,
    `name` = 'Tranquillien Tabard',
    `displayid` = 35929,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 19,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `bonding` = 1,
    `RequiredReputationFaction` = 922,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91175,
    `spelltrigger_1` = 1;

-- Ashtongue Deathsworn Tabard (uses Green Trophy Tabard of the Illidari model - displayid 43794)
-- Sold by: Okuno (23159)
INSERT INTO `item_template` SET
    `entry` = 58333,
    `class` = 4,
    `name` = 'Ashtongue Deathsworn Tabard',
    `displayid` = 43794,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 19,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `bonding` = 1,
    `RequiredReputationFaction` = 1012,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91176,
    `spelltrigger_1` = 1;

-- Scale of the Sands Tabard (uses Keepers of Time Tabard model - displayid 44437)
-- Sold by: Indormi (23437)
INSERT INTO `item_template` SET
    `entry` = 58334,
    `class` = 4,
    `name` = 'Scale of the Sands Tabard',
    `displayid` = 44437,
    `Quality` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 19,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `bonding` = 1,
    `RequiredReputationFaction` = 990,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91177,
    `spelltrigger_1` = 1;

-- ==============================================================================
-- PART 3: VENDOR ASSIGNMENTS (5 custom tabards)
-- ==============================================================================
-- Add custom reputation tabards to appropriate faction vendors

-- Delete any existing vendor entries first
DELETE FROM `npc_vendor` WHERE `item` IN (58330, 58331, 58332, 58333, 58334);

-- Drake Dealer Hurlunk (23489) - Netherwing vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23489,
    `item` = 58330;

-- Indormi (23437) - The Scale of the Sands vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23437,
    `item` = 58334;

-- Okuno (23159) - Ashtongue Deathsworn vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23159,
    `item` = 58333;

-- Apprentice Darius (18255) - The Violet Eye vendor
INSERT INTO `npc_vendor` SET
    `entry` = 18255,
    `item` = 58331;

-- Provisioner Vredigar (16528) - Tranquillien vendor
INSERT INTO `npc_vendor` SET
    `entry` = 16528,
    `item` = 58332;

-- ==============================================================================
-- PART 4: STANDARDIZE CITY TABARD VENDORS
-- ==============================================================================
-- Update all tabard vendor subnames to "Tabard Vendor" for consistency

UPDATE `creature_template` SET `subname` = 'Tabard Vendor' WHERE `entry` IN (
    5049,   -- Lyesa Steelbrow (Ironforge)
    5191,   -- Shalumon (Darnassus)
    16766,  -- Issca (Exodar)
    5193,   -- Rebecca Laughlin (Stormwind)
    5190,   -- Merill Pleasance (Undercity)
    16610,  -- Kredis (Silvermoon)
    5188,   -- Garyl (Orgrimmar)
    5189    -- Thrumn (Thunder Bluff)
);

-- ==============================================================================
-- PART 5: UPGRADE GUILD-ONLY VENDORS TO FULL SERVICE
-- ==============================================================================
-- Add all Outland tabards to city vendors that currently only sell Guild tabards
-- This brings Stormwind, Orgrimmar, and Thunder Bluff up to par with other cities

-- Delete existing Outland tabard entries for these 3 vendors to allow re-running
DELETE FROM `npc_vendor` WHERE `entry` IN (5193, 5188, 5189) AND `item` IN (
    -- Neutral Outland
    31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221,
    -- Alliance Outland
    23999, 31774,
    -- Horde Outland
    24004, 31773,
    -- PvP tabards
    15196, 15197, 15198, 15199, 19031, 19032, 19505, 19506
);

-- Rebecca Laughlin (5193) - Stormwind (Alliance)
-- Add neutral Outland tabards
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    (5193, 31775),  -- Sporeggar Tabard
    (5193, 31776),  -- Consortium Tabard
    (5193, 31777),  -- Keepers of Time Tabard
    (5193, 31778),  -- Lower City Tabard
    (5193, 31779),  -- Aldor Tabard
    (5193, 31780),  -- Scryers Tabard
    (5193, 31781),  -- Sha'tar Tabard
    (5193, 31804),  -- Cenarion Expedition Tabard
    (5193, 32445),  -- Skyguard Tabard
    (5193, 32828),  -- Ogri'la Tabard
    (5193, 35221),  -- Tabard of the Shattered Sun
    -- Alliance Outland tabards
    (5193, 23999),  -- Honor Hold Tabard
    (5193, 31774),  -- Kurenai Tabard
    -- Alliance PvP tabards
    (5193, 15196),  -- Private's Tabard
    (5193, 15198),  -- Knight's Colors
    (5193, 19032),  -- Stormpike Battle Tabard
    (5193, 19506);  -- Silverwing Battle Tabard

-- Garyl (5188) - Orgrimmar (Horde)
-- Add neutral Outland tabards
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    (5188, 31775),  -- Sporeggar Tabard
    (5188, 31776),  -- Consortium Tabard
    (5188, 31777),  -- Keepers of Time Tabard
    (5188, 31778),  -- Lower City Tabard
    (5188, 31779),  -- Aldor Tabard
    (5188, 31780),  -- Scryers Tabard
    (5188, 31781),  -- Sha'tar Tabard
    (5188, 31804),  -- Cenarion Expedition Tabard
    (5188, 32445),  -- Skyguard Tabard
    (5188, 32828),  -- Ogri'la Tabard
    (5188, 35221),  -- Tabard of the Shattered Sun
    -- Horde Outland tabards
    (5188, 24004),  -- Thrallmar Tabard
    (5188, 31773),  -- Mag'har Tabard
    -- Horde PvP tabards
    (5188, 15197),  -- Scout's Tabard
    (5188, 15199),  -- Stone Guard's Herald
    (5188, 19031),  -- Frostwolf Battle Tabard
    (5188, 19505);  -- Warsong Battle Tabard

-- Thrumn (5189) - Thunder Bluff (Horde)
-- Add neutral Outland tabards
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    (5189, 31775),  -- Sporeggar Tabard
    (5189, 31776),  -- Consortium Tabard
    (5189, 31777),  -- Keepers of Time Tabard
    (5189, 31778),  -- Lower City Tabard
    (5189, 31779),  -- Aldor Tabard
    (5189, 31780),  -- Scryers Tabard
    (5189, 31781),  -- Sha'tar Tabard
    (5189, 31804),  -- Cenarion Expedition Tabard
    (5189, 32445),  -- Skyguard Tabard
    (5189, 32828),  -- Ogri'la Tabard
    (5189, 35221),  -- Tabard of the Shattered Sun
    -- Horde Outland tabards
    (5189, 24004),  -- Thrallmar Tabard
    (5189, 31773),  -- Mag'har Tabard
    -- Horde PvP tabards
    (5189, 15197),  -- Scout's Tabard
    (5189, 15199),  -- Stone Guard's Herald
    (5189, 19031),  -- Frostwolf Battle Tabard
    (5189, 19505);  -- Warsong Battle Tabard

-- ==============================================================================
-- PART 6: ADD CUSTOM OUTLAND TABARDS TO CITY VENDORS
-- ==============================================================================
-- Add the 5 custom tabards (58330-58334) to all city vendors for convenience
-- Note: Tranquillien (58332) is Horde-only faction

-- Delete existing custom tabard entries for city vendors to allow re-running
DELETE FROM `npc_vendor` WHERE `entry` IN (5049, 5191, 16766, 5193, 5190, 16610, 5188, 5189)
    AND `item` IN (58330, 58331, 58332, 58333, 58334);

-- Alliance City Vendors (4 custom tabards - excluding Tranquillien)
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    -- Lyesa Steelbrow (5049) - Ironforge
    (5049, 58330),  -- Netherwing Tabard
    (5049, 58331),  -- Violet Eye Tabard
    (5049, 58333),  -- Ashtongue Deathsworn Tabard
    (5049, 58334),  -- Scale of the Sands Tabard
    -- Shalumon (5191) - Darnassus
    (5191, 58330),  -- Netherwing Tabard
    (5191, 58331),  -- Violet Eye Tabard
    (5191, 58333),  -- Ashtongue Deathsworn Tabard
    (5191, 58334),  -- Scale of the Sands Tabard
    -- Issca (16766) - Exodar
    (16766, 58330), -- Netherwing Tabard
    (16766, 58331), -- Violet Eye Tabard
    (16766, 58333), -- Ashtongue Deathsworn Tabard
    (16766, 58334), -- Scale of the Sands Tabard
    -- Rebecca Laughlin (5193) - Stormwind
    (5193, 58330),  -- Netherwing Tabard
    (5193, 58331),  -- Violet Eye Tabard
    (5193, 58333),  -- Ashtongue Deathsworn Tabard
    (5193, 58334);  -- Scale of the Sands Tabard

-- Horde City Vendors (all 5 custom tabards including Tranquillien)
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    -- Merill Pleasance (5190) - Undercity
    (5190, 58330),  -- Netherwing Tabard
    (5190, 58331),  -- Violet Eye Tabard
    (5190, 58332),  -- Tranquillien Tabard
    (5190, 58333),  -- Ashtongue Deathsworn Tabard
    (5190, 58334),  -- Scale of the Sands Tabard
    -- Kredis (16610) - Silvermoon
    (16610, 58330), -- Netherwing Tabard
    (16610, 58331), -- Violet Eye Tabard
    (16610, 58332), -- Tranquillien Tabard
    (16610, 58333), -- Ashtongue Deathsworn Tabard
    (16610, 58334), -- Scale of the Sands Tabard
    -- Garyl (5188) - Orgrimmar
    (5188, 58330),  -- Netherwing Tabard
    (5188, 58331),  -- Violet Eye Tabard
    (5188, 58332),  -- Tranquillien Tabard
    (5188, 58333),  -- Ashtongue Deathsworn Tabard
    (5188, 58334),  -- Scale of the Sands Tabard
    -- Thrumn (5189) - Thunder Bluff
    (5189, 58330),  -- Netherwing Tabard
    (5189, 58331),  -- Violet Eye Tabard
    (5189, 58332),  -- Tranquillien Tabard
    (5189, 58333),  -- Ashtongue Deathsworn Tabard
    (5189, 58334);  -- Scale of the Sands Tabard

-- ==============================================================================
-- PART 7: ADD CITY TABARDS TO CITY VENDORS
-- ==============================================================================
-- Add city faction tabards to all city vendors
-- NOTE: These tabards do not yet have 25% rep bonus spells (Phase 5A TODO)
-- They will function as cosmetic items until spells are created

-- Delete existing city tabard entries for city vendors to allow re-running
DELETE FROM `npc_vendor` WHERE `entry` IN (5049, 5191, 16766, 5193, 5190, 16610, 5188, 5189)
    AND `item` IN (45574, 45577, 45578, 45579, 45580, 45581, 45582, 45583, 45584, 45585);

-- Alliance City Tabards (5 tabards to 4 vendors)
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    -- Lyesa Steelbrow (5049) - Ironforge
    (5049, 45574),   -- Stormwind Tabard
    (5049, 45577),   -- Ironforge Tabard
    (5049, 45578),   -- Gnomeregan Tabard
    (5049, 45579),   -- Darnassus Tabard
    (5049, 45580),   -- Exodar Tabard
    -- Shalumon (5191) - Darnassus
    (5191, 45574),   -- Stormwind Tabard
    (5191, 45577),   -- Ironforge Tabard
    (5191, 45578),   -- Gnomeregan Tabard
    (5191, 45579),   -- Darnassus Tabard
    (5191, 45580),   -- Exodar Tabard
    -- Issca (16766) - Exodar
    (16766, 45574),  -- Stormwind Tabard
    (16766, 45577),  -- Ironforge Tabard
    (16766, 45578),  -- Gnomeregan Tabard
    (16766, 45579),  -- Darnassus Tabard
    (16766, 45580),  -- Exodar Tabard
    -- Rebecca Laughlin (5193) - Stormwind
    (5193, 45574),   -- Stormwind Tabard
    (5193, 45577),   -- Ironforge Tabard
    (5193, 45578),   -- Gnomeregan Tabard
    (5193, 45579),   -- Darnassus Tabard
    (5193, 45580);   -- Exodar Tabard

-- Horde City Tabards (5 tabards to 4 vendors)
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    -- Merill Pleasance (5190) - Undercity
    (5190, 45581),   -- Orgrimmar Tabard
    (5190, 45582),   -- Sen'jin Tabard
    (5190, 45583),   -- Undercity Tabard
    (5190, 45584),   -- Thunder Bluff Tabard
    (5190, 45585),   -- Silvermoon City Tabard
    -- Kredis (16610) - Silvermoon
    (16610, 45581),  -- Orgrimmar Tabard
    (16610, 45582),  -- Sen'jin Tabard
    (16610, 45583),  -- Undercity Tabard
    (16610, 45584),  -- Thunder Bluff Tabard
    (16610, 45585),  -- Silvermoon City Tabard
    -- Garyl (5188) - Orgrimmar
    (5188, 45581),   -- Orgrimmar Tabard
    (5188, 45582),   -- Sen'jin Tabard
    (5188, 45583),   -- Undercity Tabard
    (5188, 45584),   -- Thunder Bluff Tabard
    (5188, 45585),   -- Silvermoon City Tabard
    -- Thrumn (5189) - Thunder Bluff
    (5189, 45581),   -- Orgrimmar Tabard
    (5189, 45582),   -- Sen'jin Tabard
    (5189, 45583),   -- Undercity Tabard
    (5189, 45584),   -- Thunder Bluff Tabard
    (5189, 45585);   -- Silvermoon City Tabard

-- ==============================================================================
-- PART 8: CITY TABARDS - ADD 25% REP BONUS SPELLS (PHASE 5A)
-- ==============================================================================
-- Add reputation bonus spells to city faction tabards
-- Honored reputation requirement to purchase/wear (same as Outland tabards)

-- Alliance City Tabards
UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 72,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91204,
    `spelltrigger_1` = 1
WHERE `entry` = 45574; -- Stormwind Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 47,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91205,
    `spelltrigger_1` = 1
WHERE `entry` = 45577; -- Ironforge Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 54,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91206,
    `spelltrigger_1` = 1
WHERE `entry` = 45578; -- Gnomeregan Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 69,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91207,
    `spelltrigger_1` = 1
WHERE `entry` = 45579; -- Darnassus Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 930,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91208,
    `spelltrigger_1` = 1
WHERE `entry` = 45580; -- Exodar Tabard

-- Horde City Tabards
UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 76,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91209,
    `spelltrigger_1` = 1
WHERE `entry` = 45581; -- Orgrimmar Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 530,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91210,
    `spelltrigger_1` = 1
WHERE `entry` = 45582; -- Sen'jin Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 68,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91211,
    `spelltrigger_1` = 1
WHERE `entry` = 45583; -- Undercity Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 81,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91212,
    `spelltrigger_1` = 1
WHERE `entry` = 45584; -- Thunder Bluff Tabard

UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 9500,
    `SellPrice` = 2375,
    `bonding` = 1,
    `RequiredReputationFaction` = 911,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91213,
    `spelltrigger_1` = 1
WHERE `entry` = 45585; -- Silvermoon City Tabard

-- ==============================================================================
-- PART 9: CLASSIC NEUTRAL FACTION TABARDS (PHASE 5B)
-- ==============================================================================

-- Tabard of the Argent Dawn (entry 22999, faction 529) - Spell 91300
-- Existing item already sold by Argent Quartermaster (16786)
-- Add 25% rep bonus spell, standardize to F-019 config
UPDATE `item_template` SET
    `ItemLevel` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `bonding` = 1,
    `RequiredReputationFaction` = 529,
    `RequiredReputationRank` = 5,
    `spellid_1` = 91300,
    `spelltrigger_1` = 1
WHERE `entry` = 22999; -- Tabard of the Argent Dawn

-- Add tabard to Argent Dawn quartermasters that don't already have it
-- (16786 already sells it)
DELETE FROM `npc_vendor` WHERE `entry` IN (10856, 10857, 11536) AND `item` = 22999;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    (10856, 22999),  -- Argent Quartermaster Hasana (Bulwark, Tirisfal - Horde side)
    (10857, 22999),  -- Argent Quartermaster Lightspark (Chillwind Camp, WPL - Alliance side)
    (11536, 22999);  -- Quartermaster Miranda Breechlock (Light's Hope Chapel, EPL - Neutral)

-- Add Tabard of the Argent Dawn to city tabard vendors (neutral faction, both factions)
DELETE FROM `npc_vendor` WHERE `entry` IN (5049, 5191, 16766, 5193, 5190, 16610, 5188, 5189)
    AND `item` = 22999;

INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
    -- Alliance City Vendors
    (5049, 22999),   -- Lyesa Steelbrow (Ironforge)
    (5191, 22999),   -- Shalumon (Darnassus)
    (16766, 22999),  -- Issca (Exodar)
    (5193, 22999),   -- Rebecca Laughlin (Stormwind)
    -- Horde City Vendors
    (5190, 22999),   -- Merill Pleasance (Undercity)
    (16610, 22999),  -- Kredis (Silvermoon)
    (5188, 22999),   -- Garyl (Orgrimmar)
    (5189, 22999);   -- Thrumn (Thunder Bluff)
