-- =====================================================
-- F-005 Phase 5: Riding Crop Progression System
-- =====================================================
-- Leatherworking-crafted tools that provide mount speed bonuses
-- 5-tier progression from Apprentice (20+) to Master (70+)
-- Passive effect when in inventory
-- =====================================================

-- =====================================================
-- RIDING CROP ITEMS (Final Products)
-- =====================================================

-- Tier 1: Apprentice Riding Crop (+5% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100010;
INSERT INTO `item_template` SET
    `entry` = 100010,
    `class` = 7,
    `subclass` = 0,
    `name` = 'Apprentice Riding Crop',
    `displayid` = 5597,
    `Quality` = 1,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 35,
    `RequiredLevel` = 20,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 150,
    `maxcount` = 1,
    `spellid_1` = 100010,
    `spelltrigger_1` = 6,
    `description` = 'Increases mount speed by 5% while in your inventory.',
    `bonding` = 1;

-- Tier 2: Journeyman Riding Crop (+10% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100011;
INSERT INTO `item_template` SET
    `entry` = 100011,
    `class` = 7,
    `subclass` = 0,
    `name` = 'Journeyman Riding Crop',
    `displayid` = 5597,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 50,
    `RequiredLevel` = 40,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 225,
    `maxcount` = 1,
    `spellid_1` = 100011,
    `spelltrigger_1` = 6,
    `description` = 'Increases mount speed by 10% while in your inventory.',
    `bonding` = 1;

-- Tier 3: Expert Riding Crop (+15% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100012;
INSERT INTO `item_template` SET
    `entry` = 100012,
    `class` = 7,
    `subclass` = 0,
    `name` = 'Expert Riding Crop',
    `displayid` = 5597,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 200000,
    `SellPrice` = 50000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 60,
    `RequiredLevel` = 50,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 300,
    `maxcount` = 1,
    `spellid_1` = 100012,
    `spelltrigger_1` = 6,
    `description` = 'Increases mount speed by 15% while in your inventory.',
    `bonding` = 1;

-- Tier 4: Artisan Riding Crop (+20% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100013;
INSERT INTO `item_template` SET
    `entry` = 100013,
    `class` = 7,
    `subclass` = 0,
    `name` = 'Artisan Riding Crop',
    `displayid` = 5597,
    `Quality` = 3,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 400000,
    `SellPrice` = 100000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 70,
    `RequiredLevel` = 60,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 375,
    `maxcount` = 1,
    `spellid_1` = 100013,
    `spelltrigger_1` = 6,
    `description` = 'Increases mount speed by 20% while in your inventory.',
    `bonding` = 1;

-- Tier 5: Master Riding Crop (+25% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100014;
INSERT INTO `item_template` SET
    `entry` = 100014,
    `class` = 7,
    `subclass` = 0,
    `name` = 'Master Riding Crop',
    `displayid` = 5597,
    `Quality` = 3,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 800000,
    `SellPrice` = 200000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 80,
    `RequiredLevel` = 70,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 450,
    `maxcount` = 1,
    `spellid_1` = 100014,
    `spelltrigger_1` = 6,
    `description` = 'Increases mount speed by 25% while in your inventory.',
    `bonding` = 1;

-- =====================================================
-- PATTERN ITEMS (Teach Crafting Recipes)
-- =====================================================

-- Pattern: Apprentice Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100015;
INSERT INTO `item_template` SET
    `entry` = 100015,
    `class` = 9,
    `subclass` = 7,
    `name` = 'Pattern: Apprentice Riding Crop',
    `displayid` = 13478,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 35,
    `RequiredLevel` = 0,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 150,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 100020,
    `spelltrigger_2` = 6,
    `bonding` = 0,
    `description` = 'Teaches you how to craft Apprentice Riding Crop.',
    `PageText` = 0,
    `LanguageID` = 0,
    `PageMaterial` = 0,
    `startquest` = 0,
    `lockid` = 0,
    `Material` = 4,
    `sheath` = 0,
    `RandomProperty` = 0,
    `RandomSuffix` = 0,
    `maxcount` = 1;

-- Pattern: Journeyman Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100016;
INSERT INTO `item_template` SET
    `entry` = 100016,
    `class` = 9,
    `subclass` = 7,
    `name` = 'Pattern: Journeyman Riding Crop',
    `displayid` = 13478,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 20000,
    `SellPrice` = 5000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 50,
    `RequiredLevel` = 0,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 225,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 100021,
    `spelltrigger_2` = 6,
    `bonding` = 0,
    `description` = 'Teaches you how to craft Journeyman Riding Crop.',
    `PageText` = 0,
    `LanguageID` = 0,
    `PageMaterial` = 0,
    `startquest` = 0,
    `lockid` = 0,
    `Material` = 4,
    `sheath` = 0,
    `RandomProperty` = 0,
    `RandomSuffix` = 0,
    `maxcount` = 1;

-- Pattern: Expert Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100017;
INSERT INTO `item_template` SET
    `entry` = 100017,
    `class` = 9,
    `subclass` = 7,
    `name` = 'Pattern: Expert Riding Crop',
    `displayid` = 13478,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 40000,
    `SellPrice` = 10000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 60,
    `RequiredLevel` = 0,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 300,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 100022,
    `spelltrigger_2` = 6,
    `bonding` = 0,
    `description` = 'Teaches you how to craft Expert Riding Crop.',
    `PageText` = 0,
    `LanguageID` = 0,
    `PageMaterial` = 0,
    `startquest` = 0,
    `lockid` = 0,
    `Material` = 4,
    `sheath` = 0,
    `RandomProperty` = 0,
    `RandomSuffix` = 0,
    `maxcount` = 1;

-- Pattern: Artisan Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100018;
INSERT INTO `item_template` SET
    `entry` = 100018,
    `class` = 9,
    `subclass` = 7,
    `name` = 'Pattern: Artisan Riding Crop',
    `displayid` = 13478,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 80000,
    `SellPrice` = 20000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 70,
    `RequiredLevel` = 0,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 375,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 100023,
    `spelltrigger_2` = 6,
    `bonding` = 0,
    `description` = 'Teaches you how to craft Artisan Riding Crop.',
    `PageText` = 0,
    `LanguageID` = 0,
    `PageMaterial` = 0,
    `startquest` = 0,
    `lockid` = 0,
    `Material` = 4,
    `sheath` = 0,
    `RandomProperty` = 0,
    `RandomSuffix` = 0,
    `maxcount` = 1;

-- Pattern: Master Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100019;
INSERT INTO `item_template` SET
    `entry` = 100019,
    `class` = 9,
    `subclass` = 7,
    `name` = 'Pattern: Master Riding Crop',
    `displayid` = 13478,
    `Quality` = 2,
    `Flags` = 64,
    `BuyCount` = 1,
    `BuyPrice` = 160000,
    `SellPrice` = 40000,
    `InventoryType` = 0,
    `AllowableClass` = -1,
    `AllowableRace` = -1,
    `ItemLevel` = 80,
    `RequiredLevel` = 0,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 450,
    `spellid_1` = 483,
    `spelltrigger_1` = 0,
    `spellid_2` = 100024,
    `spelltrigger_2` = 6,
    `bonding` = 0,
    `description` = 'Teaches you how to craft Master Riding Crop.',
    `PageText` = 0,
    `LanguageID` = 0,
    `PageMaterial` = 0,
    `startquest` = 0,
    `lockid` = 0,
    `Material` = 4,
    `sheath` = 0,
    `RandomProperty` = 0,
    `RandomSuffix` = 0,
    `maxcount` = 1;

-- =====================================================
-- RECIPE DISTRIBUTION
-- =====================================================

-- Tier 1-2: Sold by Leatherworking Vendors
-- Deneb Walker (2805) - Stormwind Leatherworking Supplies
DELETE FROM `npc_vendor` WHERE `entry` = 2805 AND `item` IN (100015, 100016);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
    (2805, 100015, 0, 0, 0),
    (2805, 100016, 0, 0, 0);

-- Tier 3: Expert Pattern - Drop from UBRS bosses
DELETE FROM `creature_loot_template` WHERE `Item` = 100017;
INSERT INTO `creature_loot_template` SET
    `Entry` = 10363,
    `Item` = 100017,
    `Chance` = 5.0,
    `QuestRequired` = 0,
    `LootMode` = 1,
    `GroupId` = 0,
    `MinCount` = 1,
    `MaxCount` = 1,
    `Comment` = 'General Drakkisath - Pattern: Expert Riding Crop';

-- Tier 4: Artisan Pattern - Drop from MC/BWL bosses
DELETE FROM `creature_loot_template` WHERE `Item` = 100018;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (11583, 100018, 8.0, 0, 1, 0, 1, 1, 'Nefarian - Pattern: Artisan Riding Crop'),
    (11502, 100018, 8.0, 0, 1, 0, 1, 1, 'Ragnaros - Pattern: Artisan Riding Crop');

-- Tier 5: Master Pattern - Drop from Naxxramas
DELETE FROM `creature_loot_template` WHERE `Item` = 100019;
INSERT INTO `creature_loot_template` SET
    `Entry` = 15990,
    `Item` = 100019,
    `Chance` = 10.0,
    `QuestRequired` = 0,
    `LootMode` = 1,
    `GroupId` = 0,
    `MinCount` = 1,
    `MaxCount` = 1,
    `Comment` = 'Kel''Thuzad - Pattern: Master Riding Crop';

-- =====================================================
-- NOTE: Crafting spells and passive aura spells are
-- defined in DBC database (Scripts/Patch Builder/Updates/update_spell.sql)
-- =====================================================
-- Passive Aura Spells: 100010-100014 (Aura 211 - MOD_MOUNTED_SPEED_ALWAYS)
-- Crafting Spells: 100020-100024 (Effect 24 - CREATE_ITEM with reagents)
-- =====================================================
