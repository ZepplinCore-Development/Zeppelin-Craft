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
    `class` = 5,
    `subclass` = 1,
    `name` = 'Apprentice Riding Crop',
    `displayid` = 200010,
    `Quality` = 6,
    `BuyPrice` = 50000,
    `SellPrice` = 12500,
    `ItemLevel` = 35,
    `maxcount` = 1,
    `spellid_1` = 100010,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- Tier 2: Journeyman Riding Crop (+10% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100011;

INSERT INTO `item_template` SET
    `entry` = 100011,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Journeyman Riding Crop',
    `displayid` = 200011,
    `Quality` = 6,
    `BuyPrice` = 100000,
    `SellPrice` = 25000,
    `ItemLevel` = 50,
    `maxcount` = 1,
    `spellid_1` = 100011,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- Tier 3: Expert Riding Crop (+15% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100012;

INSERT INTO `item_template` SET
    `entry` = 100012,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Expert Riding Crop',
    `displayid` = 200012,
    `Quality` = 6,
    `BuyPrice` = 200000,
    `SellPrice` = 50000,
    `ItemLevel` = 60,
    `maxcount` = 1,
    `spellid_1` = 100012,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- Tier 4: Artisan Riding Crop (+20% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100013;

INSERT INTO `item_template` SET
    `entry` = 100013,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Artisan Riding Crop',
    `displayid` = 200013,
    `Quality` = 6,
    `BuyPrice` = 400000,
    `SellPrice` = 100000,
    `ItemLevel` = 70,
    `maxcount` = 1,
    `spellid_1` = 100013,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- Tier 5: Master Riding Crop (+25% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100014;

INSERT INTO `item_template` SET
    `entry` = 100014,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Master Riding Crop',
    `displayid` = 200014,
    `Quality` = 6,
    `BuyPrice` = 800000,
    `SellPrice` = 200000,
    `ItemLevel` = 80,
    `maxcount` = 1,
    `spellid_1` = 100014,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- =====================================================
-- PATTERN ITEMS (Teach Crafting Recipes)
-- =====================================================

-- Pattern: Apprentice Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100015;

INSERT INTO `item_template` SET
    `entry` = 100015,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Apprentice Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 10000,
    `SellPrice` = 2500,
    `ItemLevel` = 35,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 75,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100020,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Apprentice Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- Pattern: Journeyman Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100016;

INSERT INTO `item_template` SET
    `entry` = 100016,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Journeyman Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 20000,
    `SellPrice` = 5000,
    `ItemLevel` = 50,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 150,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100021,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Journeyman Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- Pattern: Expert Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100017;

INSERT INTO `item_template` SET
    `entry` = 100017,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Expert Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 40000,
    `SellPrice` = 10000,
    `ItemLevel` = 60,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 225,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100022,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Expert Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- Pattern: Artisan Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100018;

INSERT INTO `item_template` SET
    `entry` = 100018,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Artisan Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 80000,
    `SellPrice` = 20000,
    `ItemLevel` = 70,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 300,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100023,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Artisan Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- Pattern: Master Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100019;

INSERT INTO `item_template` SET
    `entry` = 100019,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Master Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 160000,
    `SellPrice` = 40000,
    `ItemLevel` = 80,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 375,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100024,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Master Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- Tier 6: Grand Master Riding Crop (+24% mount speed)
DELETE FROM `item_template` WHERE `entry` = 100020;

INSERT INTO `item_template` SET
    `entry` = 100020,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Grand Master Riding Crop',
    `displayid` = 200015,
    `Quality` = 6,
    `BuyPrice` = 1600000,
    `SellPrice` = 400000,
    `ItemLevel` = 80,
    `maxcount` = 1,
    `spellid_1` = 100015,
    `spelltrigger_1` = 5,
    `bonding` = 1,
    `TotemCategory` = 210;



-- Pattern: Grand Master Riding Crop
DELETE FROM `item_template` WHERE `entry` = 100021;

INSERT INTO `item_template` SET
    `entry` = 100021,
    `class` = 9,
    `subclass` = 1,
    `name` = 'Pattern: Grand Master Riding Crop',
    `displayid` = 1102,
    `Quality` = 2,
    `Flags` = 64,
    `BuyPrice` = 320000,
    `SellPrice` = 80000,
    `ItemLevel` = 80,
    `RequiredSkill` = 165,
    `RequiredSkillRank` = 450,
    `spellid_1` = 483,
    `spellcharges_1` = -1,
    `spellid_2` = 100025,
    `spelltrigger_2` = 6,
    `description` = 'Teaches you how to craft Grand Master Riding Crop.',
    `Material` = 4,
    `maxcount` = 1;



-- =====================================================
-- RECIPE DISTRIBUTION
-- =====================================================

-- Tier 1-2: Sold by Leatherworking Supply Vendors (all capitals)
DELETE FROM `npc_vendor` WHERE `item` IN (100015, 100016);

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
-- Stormwind - Jillian Tanner (5565)
(5565, 0, 100015, 0, 0, 0),
(5565, 0, 100016, 0, 0, 0),
-- Ironforge - Bombus Finespindle (5128)
(5128, 0, 100015, 0, 0, 0),
(5128, 0, 100016, 0, 0, 0),
-- Darnassus - Saenorion (4225)
(4225, 0, 100015, 0, 0, 0),
(4225, 0, 100016, 0, 0, 0),
-- Exodar - Haferet (16748)
(16748, 0, 100015, 0, 0, 0),
(16748, 0, 100016, 0, 0, 0),
-- Orgrimmar - Tamar (3366)
(3366, 0, 100015, 0, 0, 0),
(3366, 0, 100016, 0, 0, 0),
-- Thunder Bluff - Mahu (3005)
(3005, 0, 100015, 0, 0, 0),
(3005, 0, 100016, 0, 0, 0),
-- Undercity - Joseph Moore (4589)
(4589, 0, 100015, 0, 0, 0),
(4589, 0, 100016, 0, 0, 0),
-- Silvermoon - Zaralda (16689)
(16689, 0, 100015, 0, 0, 0),
(16689, 0, 100016, 0, 0, 0),
-- Shattrath - Cro Threadstrong (19196)
(19196, 0, 100015, 0, 0, 0),
(19196, 0, 100016, 0, 0, 0),
-- Dalaran - Ranid Glowergold (28718)
(28718, 0, 100015, 0, 0, 0),
(28718, 0, 100016, 0, 0, 0);



-- Tier 3: Expert Pattern - Drop from classic dungeon bosses (10%)
DELETE FROM `creature_loot_template` WHERE `Item` = 100017;

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(7604,  100017, 10.0, 'Sergeant Bly (Zul''Farrak) - Pattern: Expert Riding Crop'),
(7228,  100017, 10.0, 'Ironaya (Uldaman) - Pattern: Expert Riding Crop'),
(3977,  100017, 10.0, 'High Inquisitor Whitemane (SM Cathedral) - Pattern: Expert Riding Crop');



-- Tier 4: Artisan Pattern - Drop from level 60 dungeon bosses (10%), DM North guards (5%)
DELETE FROM `creature_loot_template` WHERE `Item` = 100018;

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `Comment`) VALUES
(10363, 100018, 10.0, 'General Drakkisath (UBRS) - Pattern: Artisan Riding Crop'),
(10440, 100018, 10.0, 'Baron Rivendare (Stratholme) - Pattern: Artisan Riding Crop'),
(9568,  100018, 10.0, 'Overlord Wyrmthalak (LBRS) - Pattern: Artisan Riding Crop'),
(14321, 100018,  5.0, 'Guard Fengus (DM North) - Pattern: Artisan Riding Crop'),
(14323, 100018,  5.0, 'Guard Slip''kik (DM North) - Pattern: Artisan Riding Crop'),
(14326, 100018,  5.0, 'Guard Mol''dar (DM North) - Pattern: Artisan Riding Crop');



-- Tier 5: Master Pattern - Drop from TBC dungeon boss (10%)
DELETE FROM `creature_loot_template` WHERE `Item` = 100019;

INSERT INTO `creature_loot_template` SET
    `Entry` = 17941,
    `Item` = 100019,
    `Chance` = 10.0,
    `Comment` = 'Mennu the Betrayer (Slave Pens) - Pattern: Master Riding Crop';



-- Tier 6: Grand Master Pattern - Drop from WotLK dungeon boss (10%)
DELETE FROM `creature_loot_template` WHERE `Item` = 100021;

INSERT INTO `creature_loot_template` SET
    `Entry` = 26693,
    `Item` = 100021,
    `Chance` = 10.0,
    `Comment` = 'Skadi the Ruthless (Utgarde Pinnacle) - Pattern: Grand Master Riding Crop';



-- =====================================================
-- SPELL GROUP + RANKS (Prevent Stacking)
-- =====================================================
-- EXCLUSIVE (1) + spell_ranks: core patch allows higher rank to replace lower.
-- =====================================================

DELETE FROM `spell_group` WHERE `id` = 1121;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1121;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 100010;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` SET `id` = 1121, `spell_id` = 100010; -- Apprentice (+5%, first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1121, 1, 'Riding Crops - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(100010, 100010, 1),
(100010, 100011, 2),
(100010, 100012, 3),
(100010, 100013, 4),
(100010, 100014, 5),
(100010, 100015, 6);

-- =====================================================
-- NOTE: Crafting spells and passive aura spells are
-- defined in DBC database (Scripts/Patch Builder/Updates/update_spell.sql)
-- =====================================================
-- Passive Aura Spells: 100010-100014 (Aura 211 - MOD_MOUNTED_SPEED_ALWAYS)
-- Crafting Spells: 100020-100024 (Effect 24 - CREATE_ITEM with reagents)
-- =====================================================
