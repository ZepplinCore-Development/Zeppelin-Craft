-- =============================================================================
-- F-025: Tier 1 Flamewaker Armor Cache Implementation
--
-- Creates class-conditional satchels for T1 (Molten Core) tier items.
-- When opened, player receives their class-specific tier piece.
--
-- KEY REQUIREMENT: GroupIds in reference_loot must MATCH parent GroupId
-- =============================================================================
-- =============================================================================
-- 1. SATCHEL ITEMS (59300-59305)
-- =============================================================================
-- DisplayID 135477 = AO_Chest18 icon
DELETE FROM item_template WHERE entry BETWEEN 59300 AND 59305;

INSERT INTO `item_template` SET
    `entry` = 59300,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Helm',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59301,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Shoulder',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59302,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Chest',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59303,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Gloves',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59304,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Legs',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59305,
    `class` = 15,
    `name` = 'Flamewaker Armor Cache - Boots',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 66,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59310 AND 59370;

DELETE FROM item_loot_template WHERE Entry BETWEEN 59300 AND 59305;

DELETE FROM creature_loot_template WHERE Item BETWEEN 59300 AND 59370;

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59310 AND 59370;

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 593XY where X=slot(1-6), Y=class(0-8)
-- Refs start at 59310 to avoid overlap with satchel items (59300-59305)
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru
-- HELM refs (59310 + class-1) - GroupId matches class number
INSERT INTO `reference_loot_template` SET
    `Entry` = 59310,
    `Item` = 16866,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Helm - Warrior: Helm of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59311,
    `Item` = 16854,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Helm - Paladin: Lawbringer Helm';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59312,
    `Item` = 16846,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Helm - Hunter: Giantstalker Helmet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59313,
    `Item` = 16821,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Helm - Rogue: Nightslayer Cover';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59314,
    `Item` = 16813,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Helm - Priest: Circlet of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59315,
    `Item` = 16842,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Helm - Shaman: Earthfury Helmet';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59316,
    `Item` = 16795,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Helm - Mage: Arcanist Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59317,
    `Item` = 16808,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Helm - Warlock: Felheart Horns';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59318,
    `Item` = 16834,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Helm - Druid: Cenarion Helm';

-- SHOULDER refs (59320 + class-1)
INSERT INTO `reference_loot_template` SET
    `Entry` = 59320,
    `Item` = 16868,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Shoulder - Warrior: Pauldrons of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59321,
    `Item` = 16856,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Shoulder - Paladin: Lawbringer Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59322,
    `Item` = 16848,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Shoulder - Hunter: Giantstalker Epaulets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59323,
    `Item` = 16823,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Shoulder - Rogue: Nightslayer Shoulder Pads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59324,
    `Item` = 16816,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Shoulder - Priest: Mantle of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59325,
    `Item` = 16844,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Shoulder - Shaman: Earthfury Epaulets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59326,
    `Item` = 16797,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Shoulder - Mage: Arcanist Mantle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59327,
    `Item` = 16807,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Shoulder - Warlock: Felheart Shoulder Pads';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59328,
    `Item` = 16836,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Shoulder - Druid: Cenarion Spaulders';

-- CHEST refs (59330 + class-1) - includes robes (slot 20) for cloth
INSERT INTO `reference_loot_template` SET
    `Entry` = 59330,
    `Item` = 16865,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Chest - Warrior: Breastplate of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59331,
    `Item` = 16853,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Chest - Paladin: Lawbringer Chestguard';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59332,
    `Item` = 16845,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Chest - Hunter: Giantstalker Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59333,
    `Item` = 16820,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Chest - Rogue: Nightslayer Chestpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59334,
    `Item` = 16815,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Chest - Priest: Robes of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59335,
    `Item` = 16841,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Chest - Shaman: Earthfury Vestments';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59336,
    `Item` = 16798,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Chest - Mage: Arcanist Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59337,
    `Item` = 16809,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Chest - Warlock: Felheart Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59338,
    `Item` = 16833,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Chest - Druid: Cenarion Vestments';

-- GLOVES refs (59340 + class-1)
INSERT INTO `reference_loot_template` SET
    `Entry` = 59340,
    `Item` = 16863,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Gloves - Warrior: Gauntlets of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59341,
    `Item` = 16860,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Gloves - Paladin: Lawbringer Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59342,
    `Item` = 16852,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Gloves - Hunter: Giantstalker Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59343,
    `Item` = 16826,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Gloves - Rogue: Nightslayer Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59344,
    `Item` = 16812,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Gloves - Priest: Gloves of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59345,
    `Item` = 16839,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Gloves - Shaman: Earthfury Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59346,
    `Item` = 16801,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Gloves - Mage: Arcanist Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59347,
    `Item` = 16805,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Gloves - Warlock: Felheart Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59348,
    `Item` = 16831,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Gloves - Druid: Cenarion Gloves';

-- LEGS refs (59350 + class-1)
INSERT INTO `reference_loot_template` SET
    `Entry` = 59350,
    `Item` = 16867,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Legs - Warrior: Legplates of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59351,
    `Item` = 16855,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Legs - Paladin: Lawbringer Legplates';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59352,
    `Item` = 16847,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Legs - Hunter: Giantstalker Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59353,
    `Item` = 16822,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Legs - Rogue: Nightslayer Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59354,
    `Item` = 16814,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Legs - Priest: Pants of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59355,
    `Item` = 16843,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Legs - Shaman: Earthfury Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59356,
    `Item` = 16796,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Legs - Mage: Arcanist Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59357,
    `Item` = 16810,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Legs - Warlock: Felheart Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59358,
    `Item` = 16835,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Legs - Druid: Cenarion Leggings';

-- BOOTS refs (59360 + class-1)
INSERT INTO `reference_loot_template` SET
    `Entry` = 59360,
    `Item` = 16862,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T1 Boots - Warrior: Sabatons of Might';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59361,
    `Item` = 16859,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T1 Boots - Paladin: Lawbringer Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59362,
    `Item` = 16849,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T1 Boots - Hunter: Giantstalker Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59363,
    `Item` = 16824,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T1 Boots - Rogue: Nightslayer Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59364,
    `Item` = 16811,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T1 Boots - Priest: Boots of Prophecy';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59365,
    `Item` = 16837,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T1 Boots - Shaman: Earthfury Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59366,
    `Item` = 16800,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T1 Boots - Mage: Arcanist Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59367,
    `Item` = 16803,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T1 Boots - Warlock: Felheart Slippers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59368,
    `Item` = 16829,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T1 Boots - Druid: Cenarion Boots';

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================
-- HELM SATCHEL (59300)
INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 1,
    `Reference` = 59310,
    `GroupId` = 1,
    `Comment` = 'Helm Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 2,
    `Reference` = 59311,
    `GroupId` = 2,
    `Comment` = 'Helm Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 3,
    `Reference` = 59312,
    `GroupId` = 3,
    `Comment` = 'Helm Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 4,
    `Reference` = 59313,
    `GroupId` = 4,
    `Comment` = 'Helm Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 5,
    `Reference` = 59314,
    `GroupId` = 5,
    `Comment` = 'Helm Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 6,
    `Reference` = 59315,
    `GroupId` = 6,
    `Comment` = 'Helm Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 7,
    `Reference` = 59316,
    `GroupId` = 7,
    `Comment` = 'Helm Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 8,
    `Reference` = 59317,
    `GroupId` = 8,
    `Comment` = 'Helm Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59300,
    `Item` = 9,
    `Reference` = 59318,
    `GroupId` = 9,
    `Comment` = 'Helm Cache - Ref: Druid';

-- SHOULDER SATCHEL (59301)
INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 1,
    `Reference` = 59320,
    `GroupId` = 1,
    `Comment` = 'Shoulder Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 2,
    `Reference` = 59321,
    `GroupId` = 2,
    `Comment` = 'Shoulder Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 3,
    `Reference` = 59322,
    `GroupId` = 3,
    `Comment` = 'Shoulder Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 4,
    `Reference` = 59323,
    `GroupId` = 4,
    `Comment` = 'Shoulder Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 5,
    `Reference` = 59324,
    `GroupId` = 5,
    `Comment` = 'Shoulder Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 6,
    `Reference` = 59325,
    `GroupId` = 6,
    `Comment` = 'Shoulder Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 7,
    `Reference` = 59326,
    `GroupId` = 7,
    `Comment` = 'Shoulder Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 8,
    `Reference` = 59327,
    `GroupId` = 8,
    `Comment` = 'Shoulder Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59301,
    `Item` = 9,
    `Reference` = 59328,
    `GroupId` = 9,
    `Comment` = 'Shoulder Cache - Ref: Druid';

-- CHEST SATCHEL (59302)
INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 1,
    `Reference` = 59330,
    `GroupId` = 1,
    `Comment` = 'Chest Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 2,
    `Reference` = 59331,
    `GroupId` = 2,
    `Comment` = 'Chest Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 3,
    `Reference` = 59332,
    `GroupId` = 3,
    `Comment` = 'Chest Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 4,
    `Reference` = 59333,
    `GroupId` = 4,
    `Comment` = 'Chest Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 5,
    `Reference` = 59334,
    `GroupId` = 5,
    `Comment` = 'Chest Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 6,
    `Reference` = 59335,
    `GroupId` = 6,
    `Comment` = 'Chest Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 7,
    `Reference` = 59336,
    `GroupId` = 7,
    `Comment` = 'Chest Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 8,
    `Reference` = 59337,
    `GroupId` = 8,
    `Comment` = 'Chest Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59302,
    `Item` = 9,
    `Reference` = 59338,
    `GroupId` = 9,
    `Comment` = 'Chest Cache - Ref: Druid';

-- GLOVES SATCHEL (59303)
INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 1,
    `Reference` = 59340,
    `GroupId` = 1,
    `Comment` = 'Gloves Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 2,
    `Reference` = 59341,
    `GroupId` = 2,
    `Comment` = 'Gloves Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 3,
    `Reference` = 59342,
    `GroupId` = 3,
    `Comment` = 'Gloves Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 4,
    `Reference` = 59343,
    `GroupId` = 4,
    `Comment` = 'Gloves Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 5,
    `Reference` = 59344,
    `GroupId` = 5,
    `Comment` = 'Gloves Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 6,
    `Reference` = 59345,
    `GroupId` = 6,
    `Comment` = 'Gloves Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 7,
    `Reference` = 59346,
    `GroupId` = 7,
    `Comment` = 'Gloves Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 8,
    `Reference` = 59347,
    `GroupId` = 8,
    `Comment` = 'Gloves Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59303,
    `Item` = 9,
    `Reference` = 59348,
    `GroupId` = 9,
    `Comment` = 'Gloves Cache - Ref: Druid';

-- LEGS SATCHEL (59304)
INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 1,
    `Reference` = 59350,
    `GroupId` = 1,
    `Comment` = 'Legs Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 2,
    `Reference` = 59351,
    `GroupId` = 2,
    `Comment` = 'Legs Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 3,
    `Reference` = 59352,
    `GroupId` = 3,
    `Comment` = 'Legs Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 4,
    `Reference` = 59353,
    `GroupId` = 4,
    `Comment` = 'Legs Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 5,
    `Reference` = 59354,
    `GroupId` = 5,
    `Comment` = 'Legs Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 6,
    `Reference` = 59355,
    `GroupId` = 6,
    `Comment` = 'Legs Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 7,
    `Reference` = 59356,
    `GroupId` = 7,
    `Comment` = 'Legs Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 8,
    `Reference` = 59357,
    `GroupId` = 8,
    `Comment` = 'Legs Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59304,
    `Item` = 9,
    `Reference` = 59358,
    `GroupId` = 9,
    `Comment` = 'Legs Cache - Ref: Druid';

-- BOOTS SATCHEL (59305)
INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 1,
    `Reference` = 59360,
    `GroupId` = 1,
    `Comment` = 'Boots Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 2,
    `Reference` = 59361,
    `GroupId` = 2,
    `Comment` = 'Boots Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 3,
    `Reference` = 59362,
    `GroupId` = 3,
    `Comment` = 'Boots Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 4,
    `Reference` = 59363,
    `GroupId` = 4,
    `Comment` = 'Boots Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 5,
    `Reference` = 59364,
    `GroupId` = 5,
    `Comment` = 'Boots Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 6,
    `Reference` = 59365,
    `GroupId` = 6,
    `Comment` = 'Boots Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 7,
    `Reference` = 59366,
    `GroupId` = 7,
    `Comment` = 'Boots Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 8,
    `Reference` = 59367,
    `GroupId` = 8,
    `Comment` = 'Boots Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59305,
    `Item` = 9,
    `Reference` = 59368,
    `GroupId` = 9,
    `Comment` = 'Boots Cache - Ref: Druid';

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
-- HELM conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59310,
    `SourceEntry` = 16866,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Helm - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59311,
    `SourceEntry` = 16854,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Helm - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59312,
    `SourceEntry` = 16846,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Helm - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59313,
    `SourceEntry` = 16821,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Helm - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59314,
    `SourceEntry` = 16813,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Helm - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59315,
    `SourceEntry` = 16842,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Helm - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59316,
    `SourceEntry` = 16795,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Helm - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59317,
    `SourceEntry` = 16808,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Helm - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59318,
    `SourceEntry` = 16834,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Helm - Druid';

-- SHOULDER conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59320,
    `SourceEntry` = 16868,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Shoulder - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59321,
    `SourceEntry` = 16856,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Shoulder - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59322,
    `SourceEntry` = 16848,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Shoulder - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59323,
    `SourceEntry` = 16823,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Shoulder - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59324,
    `SourceEntry` = 16816,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Shoulder - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59325,
    `SourceEntry` = 16844,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Shoulder - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59326,
    `SourceEntry` = 16797,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Shoulder - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59327,
    `SourceEntry` = 16807,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Shoulder - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59328,
    `SourceEntry` = 16836,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Shoulder - Druid';

-- CHEST conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59330,
    `SourceEntry` = 16865,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Chest - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59331,
    `SourceEntry` = 16853,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Chest - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59332,
    `SourceEntry` = 16845,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Chest - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59333,
    `SourceEntry` = 16820,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Chest - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59334,
    `SourceEntry` = 16815,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Chest - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59335,
    `SourceEntry` = 16841,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Chest - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59336,
    `SourceEntry` = 16798,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Chest - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59337,
    `SourceEntry` = 16809,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Chest - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59338,
    `SourceEntry` = 16833,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Chest - Druid';

-- GLOVES conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59340,
    `SourceEntry` = 16863,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Gloves - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59341,
    `SourceEntry` = 16860,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Gloves - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59342,
    `SourceEntry` = 16852,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Gloves - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59343,
    `SourceEntry` = 16826,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Gloves - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59344,
    `SourceEntry` = 16812,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Gloves - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59345,
    `SourceEntry` = 16839,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Gloves - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59346,
    `SourceEntry` = 16801,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Gloves - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59347,
    `SourceEntry` = 16805,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Gloves - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59348,
    `SourceEntry` = 16831,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Gloves - Druid';

-- LEGS conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59350,
    `SourceEntry` = 16867,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Legs - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59351,
    `SourceEntry` = 16855,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Legs - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59352,
    `SourceEntry` = 16847,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Legs - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59353,
    `SourceEntry` = 16822,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Legs - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59354,
    `SourceEntry` = 16814,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Legs - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59355,
    `SourceEntry` = 16843,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Legs - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59356,
    `SourceEntry` = 16796,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Legs - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59357,
    `SourceEntry` = 16810,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Legs - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59358,
    `SourceEntry` = 16835,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Legs - Druid';

-- BOOTS conditions
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59360,
    `SourceEntry` = 16862,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T1 Boots - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59361,
    `SourceEntry` = 16859,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T1 Boots - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59362,
    `SourceEntry` = 16849,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T1 Boots - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59363,
    `SourceEntry` = 16824,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T1 Boots - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59364,
    `SourceEntry` = 16811,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T1 Boots - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59365,
    `SourceEntry` = 16837,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T1 Boots - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59366,
    `SourceEntry` = 16800,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T1 Boots - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59367,
    `SourceEntry` = 16803,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T1 Boots - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59368,
    `SourceEntry` = 16829,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T1 Boots - Druid';

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace T1 tier refs with satchel drops
-- Keep other loot (epics, mats, bindings) unchanged
-- GARR (12057) - Helm satchel
-- Current T1 refs: 30352, 30353 (all 9 helms)
DELETE FROM creature_loot_template WHERE Entry = 12057 AND Reference IN (30352, 30353);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12057,
    `Item` = 59300,
    `MaxCount` = 2,
    `Comment` = 'Garr - Flamewaker Armor Cache - Helm (F-025)';

-- BARON GEDDON (12056) - Shoulder satchel (partial: Druid, Shaman, Paladin, Mage, Lock)
-- Current T1 refs: 30349, 30350
DELETE FROM creature_loot_template WHERE Entry = 12056 AND Reference IN (30349, 30350);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12056,
    `Item` = 59301,
    `Comment` = 'Baron Geddon - Flamewaker Armor Cache - Shoulder (F-025)';

-- SULFURON HARBINGER (12098) - Shoulder satchel (partial: Warrior, Rogue, Priest, Hunter)
-- Current T1 refs: 30355, 30356
DELETE FROM creature_loot_template WHERE Entry = 12098 AND Reference IN (30355, 30356);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12098,
    `Item` = 59301,
    `Comment` = 'Sulfuron Harbinger - Flamewaker Armor Cache - Shoulder (F-025)';

-- GOLEMAGG (11988) - Chest satchel
-- Current T1 refs: 30343, 30344 (all 9 chests)
DELETE FROM creature_loot_template WHERE Entry = 11988 AND Reference IN (30343, 30344);

INSERT INTO `creature_loot_template` SET
    `Entry` = 11988,
    `Item` = 59302,
    `MaxCount` = 2,
    `Comment` = 'Golemagg - Flamewaker Armor Cache - Chest (F-025)';

-- MAGMADAR (11982) - Legs satchel
-- Current T1 refs: 30338, 30339 (all 9 legs)
DELETE FROM creature_loot_template WHERE Entry = 11982 AND Reference IN (30338, 30339);

INSERT INTO `creature_loot_template` SET
    `Entry` = 11982,
    `Item` = 59304,
    `MaxCount` = 2,
    `Comment` = 'Magmadar - Flamewaker Armor Cache - Legs (F-025)';

-- LUCIFRON (12118) - Gloves + Boots satchels
-- Current T1 refs: 30357 (gloves: War, Lock), 30488 (boots: Mage, Druid, Shaman, Paladin)
DELETE FROM creature_loot_template WHERE Entry = 12118 AND Reference IN (30357, 30488);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12118,
    `Item` = 59303,
    `Comment` = 'Lucifron - Flamewaker Armor Cache - Gloves (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 12118,
    `Item` = 59305,
    `Comment` = 'Lucifron - Flamewaker Armor Cache - Boots (F-025)';

-- GEHENNAS (12259) - Gloves + Boots satchels
-- Current T1 refs: 30365 (boots: War, Hunter), 30366 (gloves: Priest, Rogue, Shaman, Paladin)
DELETE FROM creature_loot_template WHERE Entry = 12259 AND Reference IN (30365, 30366);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12259,
    `Item` = 59303,
    `Comment` = 'Gehennas - Flamewaker Armor Cache - Gloves (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 12259,
    `Item` = 59305,
    `Comment` = 'Gehennas - Flamewaker Armor Cache - Boots (F-025)';

-- SHAZZRAH (12264) - Gloves + Boots satchels
-- Current T1 refs: 30367 (boots: Priest, Rogue, Lock + epics), 30368 (gloves: Mage, Druid, Hunter)
-- Note: 30367 also contains non-tier epics - we need to keep those dropping!
-- Create a new ref for non-tier Shazzrah epics (59370 - outside satchel ref range)
DELETE FROM reference_loot_template WHERE Entry = 59370;

INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment)
SELECT 59370, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, CONCAT('Shazzrah Epic - ', Comment)
FROM reference_loot_template
WHERE Entry = 30367 AND Item NOT IN (16811, 16803, 16824);

DELETE FROM creature_loot_template WHERE Entry = 12264 AND Reference IN (30367, 30368);

INSERT INTO `creature_loot_template` SET
    `Entry` = 12264,
    `Item` = 59303,
    `Comment` = 'Shazzrah - Flamewaker Armor Cache - Gloves (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 12264,
    `Item` = 59305,
    `Comment` = 'Shazzrah - Flamewaker Armor Cache - Boots (F-025)';

INSERT INTO `creature_loot_template` SET
    `Entry` = 12264,
    `Item` = 59370,
    `Reference` = 59370,
    `Comment` = 'Shazzrah - Non-tier Epics (F-025)';
