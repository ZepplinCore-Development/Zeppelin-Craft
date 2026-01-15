-- Outland Reputation Tabards - Complete Implementation
-- All 21 Outland faction tabards with 25% reputation bonuses
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
--   - Reputation gate enforced at vendor purchase level (Honored)
--
-- DBC Spells:
--   - Existing tabards: spells 91132-91172 in update_spell.sql
--   - Custom tabards: spells 91173-91177 in custom_reputation_tabard_spells.sql

-- ==============================================================================
-- PART 1: EXISTING TABARD UPDATES (16 tabards)
-- ==============================================================================

-- OUTLAND

    -- DUNGEONS
        -- Thrallmar Tabard
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91132,
                `spelltrigger_1` = 1
            WHERE (`entry` = 24004);
        -- Honor Hold
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91133,
                `spelltrigger_1` = 1
            WHERE (`entry` = 23999);
        -- Cenarion Expedition
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91134,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31804);
        -- Lower City
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91135,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31778);
        -- Keepers of Time
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91136,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31777);
        -- The Sha'tar
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91137,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31781);

    -- RAIDS
        -- Shattered Sun Offensive
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91172,
                `spelltrigger_1` = 1
            WHERE (`entry` = 35221);

    -- ZONES
        -- Kurenai
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91164,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31774);
        -- The Mag'har
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91165,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31773);
        -- Ogri'la
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91166,
                `spelltrigger_1` = 1
            WHERE (`entry` = 32828);
        -- The Aldor
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91167,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31779);
        -- The Scryers
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91168,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31780);
        -- Sha'tari Skyguard
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91169,
                `spelltrigger_1` = 1
            WHERE (`entry` = 32445);
        -- Sporeggar
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91170,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31775);
        -- The Consortium
            UPDATE `item_template` SET
                `ItemLevel` = 1,
                `bonding` = 1,
                `spellid_1` = 91171,
                `spelltrigger_1` = 1
            WHERE (`entry` = 31776);

-- ==============================================================================
-- PART 2: CUSTOM TABARD CREATION (5 tabards)
-- ==============================================================================
-- These tabards use existing models from other tabards that fit the faction theme

-- Delete any existing custom tabard entries first
DELETE FROM `item_template` WHERE `entry` IN (902001, 902002, 902003, 902004, 902005);

-- Netherwing Tabard (uses Purple Trophy Tabard of the Illidari model - displayid 43950)
-- Sold by: Drake Dealer Hurlunk (23489)
INSERT INTO `item_template` SET
    `entry` = 902001,
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
    `description` = 'Increases reputation gained with the Netherwing by 25%.',
    `spellid_1` = 91173,
    `spelltrigger_1` = 1;

-- Violet Eye Tabard (uses Tabard of the Kirin Tor model - displayid 54176)
-- Sold by: Apprentice Darius (18255)
INSERT INTO `item_template` SET
    `entry` = 902002,
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
    `description` = 'Increases reputation gained with The Violet Eye by 25%.',
    `spellid_1` = 91174,
    `spelltrigger_1` = 1;

-- Tranquillien Tabard (uses Cataclysm Tranquillien Tabard model - displayid 35929)
-- Sold by: Provisioner Vredigar (16528)
INSERT INTO `item_template` SET
    `entry` = 902003,
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
    `description` = 'Increases reputation gained with Tranquillien by 25%.',
    `spellid_1` = 91175,
    `spelltrigger_1` = 1;

-- Ashtongue Deathsworn Tabard (uses Green Trophy Tabard of the Illidari model - displayid 43794)
-- Sold by: Okuno (23159)
INSERT INTO `item_template` SET
    `entry` = 902004,
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
    `description` = 'Increases reputation gained with the Ashtongue Deathsworn by 25%.',
    `spellid_1` = 91176,
    `spelltrigger_1` = 1;

-- Scale of the Sands Tabard (uses Keepers of Time Tabard model - displayid 44437)
-- Sold by: Indormi (23437)
INSERT INTO `item_template` SET
    `entry` = 902005,
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
    `description` = 'Increases reputation gained with The Scale of the Sands by 25%.',
    `spellid_1` = 91177,
    `spelltrigger_1` = 1;

-- ==============================================================================
-- PART 3: VENDOR ASSIGNMENTS (5 custom tabards)
-- ==============================================================================
-- Add custom reputation tabards to appropriate faction vendors

-- Delete any existing vendor entries first
DELETE FROM `npc_vendor` WHERE `item` IN (902001, 902002, 902003, 902004, 902005);

-- Drake Dealer Hurlunk (23489) - Netherwing vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23489,
    `item` = 902001;

-- Indormi (23437) - The Scale of the Sands vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23437,
    `item` = 902005;

-- Okuno (23159) - Ashtongue Deathsworn vendor
INSERT INTO `npc_vendor` SET
    `entry` = 23159,
    `item` = 902004;

-- Apprentice Darius (18255) - The Violet Eye vendor
INSERT INTO `npc_vendor` SET
    `entry` = 18255,
    `item` = 902002;

-- Provisioner Vredigar (16528) - Tranquillien vendor
INSERT INTO `npc_vendor` SET
    `entry` = 16528,
    `item` = 902003;
