-- =============================================================================
-- F-025: Tier 2 Armor Cache Implementation
--
-- Creates class-conditional satchels for T2 tier items.
-- When opened, player receives their class-specific tier piece.
--
-- Bosses:
--   Onyxia (301000) - Helm
--   Chromaggus (14020) - Shoulder
--   Nefarian (11583) - Chest
--   Vaelastrasz (13020) - Belt
--   Ragnaros (11502) - Legs
--   Broodlord Lashlayer (12017) - Boots
--   Razorgore (12435) - Bracers
--   Firemaw (11983), Ebonroc (14601), Flamegor (11981) - Gloves
--
-- KEY REQUIREMENT: GroupIds in reference_loot must MATCH parent GroupId
-- =============================================================================
-- =============================================================================
-- 1. SATCHEL ITEMS (59306-59313)
-- =============================================================================
-- DisplayID 135477 = AO_Chest18 icon (same as T1)
DELETE FROM item_template WHERE entry BETWEEN 59306 AND 59313;

INSERT INTO `item_template` SET
    `entry` = 59306,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Helm',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59307,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Shoulder',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59308,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Chest',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59309,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Belt',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59310,
    `class` = 15,
    `name` = 'Firelord''s Armor Cache - Legs',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59311,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Boots',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59312,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Bracers',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59313,
    `class` = 15,
    `name` = 'Blackwing Armor Cache - Gloves',
    `displayid` = 135477,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 76,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59380 AND 59458;

DELETE FROM item_loot_template WHERE Entry BETWEEN 59306 AND 59313;

DELETE FROM creature_loot_template WHERE Item BETWEEN 59306 AND 59313;
DELETE FROM creature_loot_template WHERE Item BETWEEN 59380 AND 59458;

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59380 AND 59458;

-- Clean up old BWL/Ony/T2 reference_loot_template entries replaced by satchels
DELETE FROM reference_loot_template WHERE Entry IN (300000, 30342, 30346, 30369, 30372, 30379, 30484, 30486, 30547);

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 59XY0-59XY8 where X=3+slot, Y=8+class_offset
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru
-- HELM refs (59380-59388) - Onyxia drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59380,
    `Item` = 16963,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Helm - Warrior: Helm of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59381,
    `Item` = 16955,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Helm - Paladin: Judgement Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59382,
    `Item` = 16939,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Helm - Hunter: Dragonstalker Helm';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59383,
    `Item` = 16908,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Helm - Rogue: Bloodfang Hood';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59384,
    `Item` = 16921,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Helm - Priest: Halo of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59385,
    `Item` = 16947,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Helm - Shaman: Helmet of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59386,
    `Item` = 16914,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Helm - Mage: Netherwind Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59387,
    `Item` = 16929,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Helm - Warlock: Nemesis Skullcap';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59388,
    `Item` = 16900,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Helm - Druid: Stormrage Cover';

-- SHOULDER refs (59390-59398) - Chromaggus drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59390,
    `Item` = 16961,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Shoulder - Warrior: Pauldrons of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59391,
    `Item` = 16953,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Shoulder - Paladin: Judgement Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59392,
    `Item` = 16937,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Shoulder - Hunter: Dragonstalker Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59393,
    `Item` = 16832,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Shoulder - Rogue: Bloodfang Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59394,
    `Item` = 16924,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Shoulder - Priest: Pauldrons of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59395,
    `Item` = 16945,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Shoulder - Shaman: Epaulets of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59396,
    `Item` = 16917,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Shoulder - Mage: Netherwind Mantle';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59397,
    `Item` = 16932,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Shoulder - Warlock: Nemesis Spaulders';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59398,
    `Item` = 16902,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Shoulder - Druid: Stormrage Pauldrons';

-- CHEST refs (59400-59408) - Nefarian drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59400,
    `Item` = 16966,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Chest - Warrior: Breastplate of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59401,
    `Item` = 16958,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Chest - Paladin: Judgement Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59402,
    `Item` = 16942,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Chest - Hunter: Dragonstalker Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59403,
    `Item` = 16905,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Chest - Rogue: Bloodfang Chestpiece';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59404,
    `Item` = 16923,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Chest - Priest: Robes of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59405,
    `Item` = 16950,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Chest - Shaman: Breastplate of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59406,
    `Item` = 16916,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Chest - Mage: Netherwind Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59407,
    `Item` = 16931,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Chest - Warlock: Nemesis Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59408,
    `Item` = 16897,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Chest - Druid: Stormrage Chestguard';

-- BELT refs (59410-59418) - Vaelastrasz drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59410,
    `Item` = 16960,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Belt - Warrior: Waistband of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59411,
    `Item` = 16952,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Belt - Paladin: Judgement Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59412,
    `Item` = 16936,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Belt - Hunter: Dragonstalker Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59413,
    `Item` = 16910,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Belt - Rogue: Bloodfang Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59414,
    `Item` = 16925,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Belt - Priest: Belt of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59415,
    `Item` = 16944,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Belt - Shaman: Belt of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59416,
    `Item` = 16818,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Belt - Mage: Netherwind Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59417,
    `Item` = 16933,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Belt - Warlock: Nemesis Belt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59418,
    `Item` = 16903,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Belt - Druid: Stormrage Belt';

-- LEGS refs (59420-59428) - Ragnaros drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59420,
    `Item` = 16962,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Legs - Warrior: Legplates of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59421,
    `Item` = 16954,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Legs - Paladin: Judgement Legplates';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59422,
    `Item` = 16938,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Legs - Hunter: Dragonstalker Legguards';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59423,
    `Item` = 16909,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Legs - Rogue: Bloodfang Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59424,
    `Item` = 16922,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Legs - Priest: Leggings of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59425,
    `Item` = 16946,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Legs - Shaman: Legplates of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59426,
    `Item` = 16915,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Legs - Mage: Netherwind Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59427,
    `Item` = 16930,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Legs - Warlock: Nemesis Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59428,
    `Item` = 16901,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Legs - Druid: Stormrage Legguards';

-- BOOTS refs (59430-59438) - Broodlord drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59430,
    `Item` = 16965,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Boots - Warrior: Sabatons of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59431,
    `Item` = 16957,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Boots - Paladin: Judgement Sabatons';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59432,
    `Item` = 16941,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Boots - Hunter: Dragonstalker Greaves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59433,
    `Item` = 16906,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Boots - Rogue: Bloodfang Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59434,
    `Item` = 16919,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Boots - Priest: Boots of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59435,
    `Item` = 16949,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Boots - Shaman: Greaves of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59436,
    `Item` = 16912,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Boots - Mage: Netherwind Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59437,
    `Item` = 16927,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Boots - Warlock: Nemesis Boots';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59438,
    `Item` = 16898,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Boots - Druid: Stormrage Boots';

-- BRACERS refs (59440-59448) - Razorgore drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59440,
    `Item` = 16959,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Bracers - Warrior: Bracelets of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59441,
    `Item` = 16951,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Bracers - Paladin: Judgement Bindings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59442,
    `Item` = 16935,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Bracers - Hunter: Dragonstalker Bracers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59443,
    `Item` = 16911,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Bracers - Rogue: Bloodfang Bracers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59444,
    `Item` = 16926,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Bracers - Priest: Bindings of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59445,
    `Item` = 16943,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Bracers - Shaman: Bracers of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59446,
    `Item` = 16918,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Bracers - Mage: Netherwind Bindings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59447,
    `Item` = 16934,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Bracers - Warlock: Nemesis Bracers';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59448,
    `Item` = 16904,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Bracers - Druid: Stormrage Bracers';

-- GLOVES refs (59450-59458) - Firemaw/Ebonroc/Flamegor drop
INSERT INTO `reference_loot_template` SET
    `Entry` = 59450,
    `Item` = 16964,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T2 Gloves - Warrior: Gauntlets of Wrath';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59451,
    `Item` = 16956,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T2 Gloves - Paladin: Judgement Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59452,
    `Item` = 16940,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T2 Gloves - Hunter: Dragonstalker Gauntlets';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59453,
    `Item` = 16907,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T2 Gloves - Rogue: Bloodfang Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59454,
    `Item` = 16920,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T2 Gloves - Priest: Handguards of Transcendence';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59455,
    `Item` = 16948,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T2 Gloves - Shaman: Gauntlets of Ten Storms';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59456,
    `Item` = 16913,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T2 Gloves - Mage: Netherwind Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59457,
    `Item` = 16928,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T2 Gloves - Warlock: Nemesis Gloves';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59458,
    `Item` = 16899,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T2 Gloves - Druid: Stormrage Handguards';

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================
-- HELM SATCHEL (59306) - Onyxia
INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 1,
    `Reference` = 59380,
    `GroupId` = 1,
    `Comment` = 'Blackwing Helm Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 2,
    `Reference` = 59381,
    `GroupId` = 2,
    `Comment` = 'Blackwing Helm Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 3,
    `Reference` = 59382,
    `GroupId` = 3,
    `Comment` = 'Blackwing Helm Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 4,
    `Reference` = 59383,
    `GroupId` = 4,
    `Comment` = 'Blackwing Helm Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 5,
    `Reference` = 59384,
    `GroupId` = 5,
    `Comment` = 'Blackwing Helm Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 6,
    `Reference` = 59385,
    `GroupId` = 6,
    `Comment` = 'Blackwing Helm Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 7,
    `Reference` = 59386,
    `GroupId` = 7,
    `Comment` = 'Blackwing Helm Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 8,
    `Reference` = 59387,
    `GroupId` = 8,
    `Comment` = 'Blackwing Helm Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59306,
    `Item` = 9,
    `Reference` = 59388,
    `GroupId` = 9,
    `Comment` = 'Blackwing Helm Cache - Ref: Druid';

-- SHOULDER SATCHEL (59307) - Chromaggus
INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 1,
    `Reference` = 59390,
    `GroupId` = 1,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 2,
    `Reference` = 59391,
    `GroupId` = 2,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 3,
    `Reference` = 59392,
    `GroupId` = 3,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 4,
    `Reference` = 59393,
    `GroupId` = 4,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 5,
    `Reference` = 59394,
    `GroupId` = 5,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 6,
    `Reference` = 59395,
    `GroupId` = 6,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 7,
    `Reference` = 59396,
    `GroupId` = 7,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 8,
    `Reference` = 59397,
    `GroupId` = 8,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59307,
    `Item` = 9,
    `Reference` = 59398,
    `GroupId` = 9,
    `Comment` = 'Blackwing Shoulder Cache - Ref: Druid';

-- CHEST SATCHEL (59308) - Nefarian
INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 1,
    `Reference` = 59400,
    `GroupId` = 1,
    `Comment` = 'Blackwing Chest Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 2,
    `Reference` = 59401,
    `GroupId` = 2,
    `Comment` = 'Blackwing Chest Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 3,
    `Reference` = 59402,
    `GroupId` = 3,
    `Comment` = 'Blackwing Chest Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 4,
    `Reference` = 59403,
    `GroupId` = 4,
    `Comment` = 'Blackwing Chest Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 5,
    `Reference` = 59404,
    `GroupId` = 5,
    `Comment` = 'Blackwing Chest Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 6,
    `Reference` = 59405,
    `GroupId` = 6,
    `Comment` = 'Blackwing Chest Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 7,
    `Reference` = 59406,
    `GroupId` = 7,
    `Comment` = 'Blackwing Chest Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 8,
    `Reference` = 59407,
    `GroupId` = 8,
    `Comment` = 'Blackwing Chest Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59308,
    `Item` = 9,
    `Reference` = 59408,
    `GroupId` = 9,
    `Comment` = 'Blackwing Chest Cache - Ref: Druid';

-- BELT SATCHEL (59309) - Vaelastrasz
INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 1,
    `Reference` = 59410,
    `GroupId` = 1,
    `Comment` = 'Blackwing Belt Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 2,
    `Reference` = 59411,
    `GroupId` = 2,
    `Comment` = 'Blackwing Belt Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 3,
    `Reference` = 59412,
    `GroupId` = 3,
    `Comment` = 'Blackwing Belt Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 4,
    `Reference` = 59413,
    `GroupId` = 4,
    `Comment` = 'Blackwing Belt Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 5,
    `Reference` = 59414,
    `GroupId` = 5,
    `Comment` = 'Blackwing Belt Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 6,
    `Reference` = 59415,
    `GroupId` = 6,
    `Comment` = 'Blackwing Belt Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 7,
    `Reference` = 59416,
    `GroupId` = 7,
    `Comment` = 'Blackwing Belt Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 8,
    `Reference` = 59417,
    `GroupId` = 8,
    `Comment` = 'Blackwing Belt Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59309,
    `Item` = 9,
    `Reference` = 59418,
    `GroupId` = 9,
    `Comment` = 'Blackwing Belt Cache - Ref: Druid';

-- LEGS SATCHEL (59310) - Ragnaros
INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 1,
    `Reference` = 59420,
    `GroupId` = 1,
    `Comment` = 'Firelord Legs Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 2,
    `Reference` = 59421,
    `GroupId` = 2,
    `Comment` = 'Firelord Legs Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 3,
    `Reference` = 59422,
    `GroupId` = 3,
    `Comment` = 'Firelord Legs Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 4,
    `Reference` = 59423,
    `GroupId` = 4,
    `Comment` = 'Firelord Legs Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 5,
    `Reference` = 59424,
    `GroupId` = 5,
    `Comment` = 'Firelord Legs Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 6,
    `Reference` = 59425,
    `GroupId` = 6,
    `Comment` = 'Firelord Legs Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 7,
    `Reference` = 59426,
    `GroupId` = 7,
    `Comment` = 'Firelord Legs Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 8,
    `Reference` = 59427,
    `GroupId` = 8,
    `Comment` = 'Firelord Legs Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59310,
    `Item` = 9,
    `Reference` = 59428,
    `GroupId` = 9,
    `Comment` = 'Firelord Legs Cache - Ref: Druid';

-- BOOTS SATCHEL (59311) - Broodlord
INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 1,
    `Reference` = 59430,
    `GroupId` = 1,
    `Comment` = 'Blackwing Boots Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 2,
    `Reference` = 59431,
    `GroupId` = 2,
    `Comment` = 'Blackwing Boots Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 3,
    `Reference` = 59432,
    `GroupId` = 3,
    `Comment` = 'Blackwing Boots Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 4,
    `Reference` = 59433,
    `GroupId` = 4,
    `Comment` = 'Blackwing Boots Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 5,
    `Reference` = 59434,
    `GroupId` = 5,
    `Comment` = 'Blackwing Boots Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 6,
    `Reference` = 59435,
    `GroupId` = 6,
    `Comment` = 'Blackwing Boots Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 7,
    `Reference` = 59436,
    `GroupId` = 7,
    `Comment` = 'Blackwing Boots Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 8,
    `Reference` = 59437,
    `GroupId` = 8,
    `Comment` = 'Blackwing Boots Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59311,
    `Item` = 9,
    `Reference` = 59438,
    `GroupId` = 9,
    `Comment` = 'Blackwing Boots Cache - Ref: Druid';

-- BRACERS SATCHEL (59312) - Razorgore
INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 1,
    `Reference` = 59440,
    `GroupId` = 1,
    `Comment` = 'Blackwing Bracers Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 2,
    `Reference` = 59441,
    `GroupId` = 2,
    `Comment` = 'Blackwing Bracers Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 3,
    `Reference` = 59442,
    `GroupId` = 3,
    `Comment` = 'Blackwing Bracers Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 4,
    `Reference` = 59443,
    `GroupId` = 4,
    `Comment` = 'Blackwing Bracers Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 5,
    `Reference` = 59444,
    `GroupId` = 5,
    `Comment` = 'Blackwing Bracers Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 6,
    `Reference` = 59445,
    `GroupId` = 6,
    `Comment` = 'Blackwing Bracers Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 7,
    `Reference` = 59446,
    `GroupId` = 7,
    `Comment` = 'Blackwing Bracers Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 8,
    `Reference` = 59447,
    `GroupId` = 8,
    `Comment` = 'Blackwing Bracers Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59312,
    `Item` = 9,
    `Reference` = 59448,
    `GroupId` = 9,
    `Comment` = 'Blackwing Bracers Cache - Ref: Druid';

-- GLOVES SATCHEL (59313) - Firemaw/Ebonroc/Flamegor
INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 1,
    `Reference` = 59450,
    `GroupId` = 1,
    `Comment` = 'Blackwing Gloves Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 2,
    `Reference` = 59451,
    `GroupId` = 2,
    `Comment` = 'Blackwing Gloves Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 3,
    `Reference` = 59452,
    `GroupId` = 3,
    `Comment` = 'Blackwing Gloves Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 4,
    `Reference` = 59453,
    `GroupId` = 4,
    `Comment` = 'Blackwing Gloves Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 5,
    `Reference` = 59454,
    `GroupId` = 5,
    `Comment` = 'Blackwing Gloves Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 6,
    `Reference` = 59455,
    `GroupId` = 6,
    `Comment` = 'Blackwing Gloves Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 7,
    `Reference` = 59456,
    `GroupId` = 7,
    `Comment` = 'Blackwing Gloves Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 8,
    `Reference` = 59457,
    `GroupId` = 8,
    `Comment` = 'Blackwing Gloves Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59313,
    `Item` = 9,
    `Reference` = 59458,
    `GroupId` = 9,
    `Comment` = 'Blackwing Gloves Cache - Ref: Druid';

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
-- HELM conditions (Onyxia)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59380,
    `SourceEntry` = 16963,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Helm - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59381,
    `SourceEntry` = 16955,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Helm - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59382,
    `SourceEntry` = 16939,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Helm - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59383,
    `SourceEntry` = 16908,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Helm - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59384,
    `SourceEntry` = 16921,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Helm - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59385,
    `SourceEntry` = 16947,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Helm - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59386,
    `SourceEntry` = 16914,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Helm - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59387,
    `SourceEntry` = 16929,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Helm - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59388,
    `SourceEntry` = 16900,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Helm - Druid';

-- SHOULDER conditions (Chromaggus)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59390,
    `SourceEntry` = 16961,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Shoulder - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59391,
    `SourceEntry` = 16953,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Shoulder - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59392,
    `SourceEntry` = 16937,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Shoulder - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59393,
    `SourceEntry` = 16832,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Shoulder - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59394,
    `SourceEntry` = 16924,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Shoulder - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59395,
    `SourceEntry` = 16945,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Shoulder - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59396,
    `SourceEntry` = 16917,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Shoulder - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59397,
    `SourceEntry` = 16932,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Shoulder - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59398,
    `SourceEntry` = 16902,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Shoulder - Druid';

-- CHEST conditions (Nefarian)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59400,
    `SourceEntry` = 16966,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Chest - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59401,
    `SourceEntry` = 16958,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Chest - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59402,
    `SourceEntry` = 16942,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Chest - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59403,
    `SourceEntry` = 16905,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Chest - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59404,
    `SourceEntry` = 16923,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Chest - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59405,
    `SourceEntry` = 16950,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Chest - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59406,
    `SourceEntry` = 16916,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Chest - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59407,
    `SourceEntry` = 16931,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Chest - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59408,
    `SourceEntry` = 16897,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Chest - Druid';

-- BELT conditions (Vaelastrasz)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59410,
    `SourceEntry` = 16960,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Belt - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59411,
    `SourceEntry` = 16952,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Belt - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59412,
    `SourceEntry` = 16936,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Belt - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59413,
    `SourceEntry` = 16910,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Belt - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59414,
    `SourceEntry` = 16925,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Belt - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59415,
    `SourceEntry` = 16944,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Belt - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59416,
    `SourceEntry` = 16818,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Belt - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59417,
    `SourceEntry` = 16933,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Belt - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59418,
    `SourceEntry` = 16903,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Belt - Druid';

-- LEGS conditions (Ragnaros)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59420,
    `SourceEntry` = 16962,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Legs - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59421,
    `SourceEntry` = 16954,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Legs - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59422,
    `SourceEntry` = 16938,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Legs - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59423,
    `SourceEntry` = 16909,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Legs - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59424,
    `SourceEntry` = 16922,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Legs - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59425,
    `SourceEntry` = 16946,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Legs - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59426,
    `SourceEntry` = 16915,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Legs - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59427,
    `SourceEntry` = 16930,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Legs - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59428,
    `SourceEntry` = 16901,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Legs - Druid';

-- BOOTS conditions (Broodlord)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59430,
    `SourceEntry` = 16965,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Boots - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59431,
    `SourceEntry` = 16957,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Boots - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59432,
    `SourceEntry` = 16941,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Boots - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59433,
    `SourceEntry` = 16906,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Boots - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59434,
    `SourceEntry` = 16919,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Boots - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59435,
    `SourceEntry` = 16949,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Boots - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59436,
    `SourceEntry` = 16912,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Boots - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59437,
    `SourceEntry` = 16927,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Boots - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59438,
    `SourceEntry` = 16898,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Boots - Druid';

-- BRACERS conditions (Razorgore)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59440,
    `SourceEntry` = 16959,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Bracers - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59441,
    `SourceEntry` = 16951,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Bracers - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59442,
    `SourceEntry` = 16935,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Bracers - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59443,
    `SourceEntry` = 16911,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Bracers - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59444,
    `SourceEntry` = 16926,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Bracers - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59445,
    `SourceEntry` = 16943,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Bracers - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59446,
    `SourceEntry` = 16918,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Bracers - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59447,
    `SourceEntry` = 16934,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Bracers - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59448,
    `SourceEntry` = 16904,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Bracers - Druid';

-- GLOVES conditions (Firemaw/Ebonroc/Flamegor)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59450,
    `SourceEntry` = 16964,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T2 Gloves - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59451,
    `SourceEntry` = 16956,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T2 Gloves - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59452,
    `SourceEntry` = 16940,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T2 Gloves - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59453,
    `SourceEntry` = 16907,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T2 Gloves - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59454,
    `SourceEntry` = 16920,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T2 Gloves - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59455,
    `SourceEntry` = 16948,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T2 Gloves - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59456,
    `SourceEntry` = 16913,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T2 Gloves - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59457,
    `SourceEntry` = 16928,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T2 Gloves - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59458,
    `SourceEntry` = 16899,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T2 Gloves - Druid';

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace T2 tier refs with satchel drops
-- Keep other loot (epics, mats, quest items) unchanged
-- ONYXIA (301000) - Helm satchel
-- Current T2 ref: 300000 (all 9 helms), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 301000 AND Reference = 300000;

INSERT INTO `creature_loot_template` SET
    `Entry` = 301000,
    `Item` = 59306,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Onyxia - Blackwing Armor Cache - Helm (F-025)';

-- CHROMAGGUS (14020) - Shoulder satchel
-- Current T2 ref: 30379 (all 9 shoulders), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 14020 AND Reference = 30379;

INSERT INTO `creature_loot_template` SET
    `Entry` = 14020,
    `Item` = 59307,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Chromaggus - Blackwing Armor Cache - Shoulder (F-025)';

-- NEFARIAN (11583) - Chest satchel
-- Current T2 ref: 30486 (all 9 chests), MinCount=1, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 11583 AND Reference = 30486;

INSERT INTO `creature_loot_template` SET
    `Entry` = 11583,
    `Item` = 59308,
    `MaxCount` = 2,
    `Comment` = 'Nefarian - Blackwing Armor Cache - Chest (F-025)';

-- VAELASTRASZ (13020) - Belt satchel
-- Current T2 ref: 30372 (all 9 belts), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 13020 AND Reference = 30372;

INSERT INTO `creature_loot_template` SET
    `Entry` = 13020,
    `Item` = 59309,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Vaelastrasz - Blackwing Armor Cache - Belt (F-025)';

-- RAGNAROS (11502) - Legs satchel
-- Current T2 refs: 30484 + 30547 (legs split across two refs), MinCount=1, MaxCount=1 each
DELETE FROM creature_loot_template WHERE Entry = 11502 AND Reference IN (30484, 30547);

INSERT INTO `creature_loot_template` SET
    `Entry` = 11502,
    `Item` = 59310,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Ragnaros - Firelord''s Armor Cache - Legs (F-025)';

-- BROODLORD LASHLAYER (12017) - Boots satchel
-- Current T2 ref: 30346 (all 9 boots), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 12017 AND Reference = 30346;

INSERT INTO `creature_loot_template` SET
    `Entry` = 12017,
    `Item` = 59311,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Broodlord Lashlayer - Blackwing Armor Cache - Boots (F-025)';

-- RAZORGORE (12435) - Bracers satchel
-- Current T2 ref: 30369 (all 9 bracers), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 12435 AND Reference = 30369;

INSERT INTO `creature_loot_template` SET
    `Entry` = 12435,
    `Item` = 59312,
    `MinCount` = 2,
    `MaxCount` = 2,
    `Comment` = 'Razorgore - Blackwing Armor Cache - Bracers (F-025)';

-- FIREMAW (11983) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 11983 AND Reference = 30342;

INSERT INTO `creature_loot_template` SET
    `Entry` = 11983,
    `Item` = 59313,
    `Comment` = 'Firemaw - Blackwing Armor Cache - Gloves (F-025)';

-- EBONROC (14601) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 14601 AND Reference = 30342;

INSERT INTO `creature_loot_template` SET
    `Entry` = 14601,
    `Item` = 59313,
    `Comment` = 'Ebonroc - Blackwing Armor Cache - Gloves (F-025)';

-- FLAMEGOR (11981) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 11981 AND Reference = 30342;

INSERT INTO `creature_loot_template` SET
    `Entry` = 11981,
    `Item` = 59313,
    `Comment` = 'Flamegor - Blackwing Armor Cache - Gloves (F-025)';
