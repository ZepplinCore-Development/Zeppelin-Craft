-- =============================================================================
-- F-025: Tier 0 Dungeon Set Armor Cache Implementation
--
-- Creates class-conditional satchels for T0 (Dungeon Set 1) tier items.
-- When opened, player receives their class-specific tier piece.
--
-- Bosses:
--   Darkmaster Gandling (1853) - Scholomance - Helm
--   General Drakkisath (10363) - UBRS - Chest
--   Baron Rivendare (10440) - Stratholme UD - Legs
--
-- KEY REQUIREMENT: GroupIds in reference_loot must MATCH parent GroupId
-- =============================================================================
-- =============================================================================
-- 1. SATCHEL ITEMS (59000-59002)
-- =============================================================================
-- DisplayIDs from F-025 research:
--   135453 = AO_Chest07 (Gandling)
--   135477 = AO_Chest18 (Drakkisath)
--   134455 = AO_ArchChest (Rivendare)
DELETE FROM item_template WHERE entry BETWEEN 59000 AND 59002;

INSERT INTO `item_template` SET
    `entry` = 59000,
    `class` = 15,
    `name` = '"Gandlings Armor Cache - Helm"',
    `displayid` = 135453,
    `Quality` = 3,
    `Flags` = 4,
    `ItemLevel` = 58,
    `RequiredLevel` = 55,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59001,
    `class` = 15,
    `name` = '"Drakkisaths Armor Cache - Chest"',
    `displayid` = 135477,
    `Quality` = 3,
    `Flags` = 4,
    `ItemLevel` = 58,
    `RequiredLevel` = 55,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

INSERT INTO `item_template` SET
    `entry` = 59002,
    `class` = 15,
    `name` = '"Rivendares Armor Cache - Legs"',
    `displayid` = 134455,
    `Quality` = 3,
    `Flags` = 4,
    `ItemLevel` = 58,
    `RequiredLevel` = 55,
    `bonding` = 1,
    `MaxCount` = '1',
    `delay` = 0;

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59010 AND 59038;

DELETE FROM item_loot_template WHERE Entry BETWEEN 59000 AND 59002;

DELETE FROM creature_loot_template WHERE Item BETWEEN 59000 AND 59038;

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59010 AND 59038;

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 590XY where X=slot(1=helm,2=chest,3=legs), Y=class(0-8)
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru
-- HELM refs (59010-59018) - Gandling drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59010,
    `Item` = 16731,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T0 Helm - Warrior: Helm of Valor';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59011,
    `Item` = 16727,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T0 Helm - Paladin: Lightforge Helm';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59012,
    `Item` = 16677,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T0 Helm - Hunter: Beaststalker Cap';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59013,
    `Item` = 16707,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T0 Helm - Rogue: Shadowcraft Cap';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59014,
    `Item` = 16693,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T0 Helm - Priest: Devout Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59015,
    `Item` = 16667,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T0 Helm - Shaman: Coif of Elements';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59016,
    `Item` = 16686,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T0 Helm - Mage: Magister Crown';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59017,
    `Item` = 16698,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T0 Helm - Warlock: Dreadmist Mask';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59018,
    `Item` = 16720,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T0 Helm - Druid: Wildheart Cowl';

-- CHEST refs (59020-59028) - Drakkisath drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59020,
    `Item` = 16730,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T0 Chest - Warrior: Breastplate of Valor';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59021,
    `Item` = 16726,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T0 Chest - Paladin: Lightforge Breastplate';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59022,
    `Item` = 16674,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T0 Chest - Hunter: Beaststalker Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59023,
    `Item` = 16721,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T0 Chest - Rogue: Shadowcraft Tunic';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59024,
    `Item` = 16690,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T0 Chest - Priest: Devout Robe';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59025,
    `Item` = 16666,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T0 Chest - Shaman: Vest of Elements';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59026,
    `Item` = 16688,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T0 Chest - Mage: Magister Robes';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59027,
    `Item` = 16700,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T0 Chest - Warlock: Dreadmist Robe';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59028,
    `Item` = 16706,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T0 Chest - Druid: Wildheart Vest';

-- LEGS refs (59030-59038) - Rivendare drops
INSERT INTO `reference_loot_template` SET
    `Entry` = 59030,
    `Item` = 16732,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = 'T0 Legs - Warrior: Legplates of Valor';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59031,
    `Item` = 16728,
    `Chance` = 0.0,
    `GroupId` = 2,
    `Comment` = 'T0 Legs - Paladin: Lightforge Legplates';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59032,
    `Item` = 16678,
    `Chance` = 0.0,
    `GroupId` = 3,
    `Comment` = 'T0 Legs - Hunter: Beaststalker Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59033,
    `Item` = 16709,
    `Chance` = 0.0,
    `GroupId` = 4,
    `Comment` = 'T0 Legs - Rogue: Shadowcraft Pants';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59034,
    `Item` = 16694,
    `Chance` = 0.0,
    `GroupId` = 5,
    `Comment` = 'T0 Legs - Priest: Devout Skirt';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59035,
    `Item` = 16668,
    `Chance` = 0.0,
    `GroupId` = 6,
    `Comment` = 'T0 Legs - Shaman: Kilt of Elements';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59036,
    `Item` = 16687,
    `Chance` = 0.0,
    `GroupId` = 7,
    `Comment` = 'T0 Legs - Mage: Magister Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59037,
    `Item` = 16699,
    `Chance` = 0.0,
    `GroupId` = 8,
    `Comment` = 'T0 Legs - Warlock: Dreadmist Leggings';

INSERT INTO `reference_loot_template` SET
    `Entry` = 59038,
    `Item` = 16719,
    `Chance` = 0.0,
    `GroupId` = 9,
    `Comment` = 'T0 Legs - Druid: Wildheart Kilt';

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================
-- HELM SATCHEL (59000) - Gandling
INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 1,
    `Reference` = 59010,
    `GroupId` = 1,
    `Comment` = 'Gandling Helm Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 2,
    `Reference` = 59011,
    `GroupId` = 2,
    `Comment` = 'Gandling Helm Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 3,
    `Reference` = 59012,
    `GroupId` = 3,
    `Comment` = 'Gandling Helm Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 4,
    `Reference` = 59013,
    `GroupId` = 4,
    `Comment` = 'Gandling Helm Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 5,
    `Reference` = 59014,
    `GroupId` = 5,
    `Comment` = 'Gandling Helm Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 6,
    `Reference` = 59015,
    `GroupId` = 6,
    `Comment` = 'Gandling Helm Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 7,
    `Reference` = 59016,
    `GroupId` = 7,
    `Comment` = 'Gandling Helm Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 8,
    `Reference` = 59017,
    `GroupId` = 8,
    `Comment` = 'Gandling Helm Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59000,
    `Item` = 9,
    `Reference` = 59018,
    `GroupId` = 9,
    `Comment` = 'Gandling Helm Cache - Ref: Druid';

-- CHEST SATCHEL (59001) - Drakkisath
INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 1,
    `Reference` = 59020,
    `GroupId` = 1,
    `Comment` = 'Drakkisath Chest Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 2,
    `Reference` = 59021,
    `GroupId` = 2,
    `Comment` = 'Drakkisath Chest Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 3,
    `Reference` = 59022,
    `GroupId` = 3,
    `Comment` = 'Drakkisath Chest Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 4,
    `Reference` = 59023,
    `GroupId` = 4,
    `Comment` = 'Drakkisath Chest Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 5,
    `Reference` = 59024,
    `GroupId` = 5,
    `Comment` = 'Drakkisath Chest Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 6,
    `Reference` = 59025,
    `GroupId` = 6,
    `Comment` = 'Drakkisath Chest Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 7,
    `Reference` = 59026,
    `GroupId` = 7,
    `Comment` = 'Drakkisath Chest Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 8,
    `Reference` = 59027,
    `GroupId` = 8,
    `Comment` = 'Drakkisath Chest Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59001,
    `Item` = 9,
    `Reference` = 59028,
    `GroupId` = 9,
    `Comment` = 'Drakkisath Chest Cache - Ref: Druid';

-- LEGS SATCHEL (59002) - Rivendare
INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 1,
    `Reference` = 59030,
    `GroupId` = 1,
    `Comment` = 'Rivendare Legs Cache - Ref: Warrior';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 2,
    `Reference` = 59031,
    `GroupId` = 2,
    `Comment` = 'Rivendare Legs Cache - Ref: Paladin';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 3,
    `Reference` = 59032,
    `GroupId` = 3,
    `Comment` = 'Rivendare Legs Cache - Ref: Hunter';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 4,
    `Reference` = 59033,
    `GroupId` = 4,
    `Comment` = 'Rivendare Legs Cache - Ref: Rogue';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 5,
    `Reference` = 59034,
    `GroupId` = 5,
    `Comment` = 'Rivendare Legs Cache - Ref: Priest';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 6,
    `Reference` = 59035,
    `GroupId` = 6,
    `Comment` = 'Rivendare Legs Cache - Ref: Shaman';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 7,
    `Reference` = 59036,
    `GroupId` = 7,
    `Comment` = 'Rivendare Legs Cache - Ref: Mage';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 8,
    `Reference` = 59037,
    `GroupId` = 8,
    `Comment` = 'Rivendare Legs Cache - Ref: Warlock';

INSERT INTO `item_loot_template` SET
    `Entry` = 59002,
    `Item` = 9,
    `Reference` = 59038,
    `GroupId` = 9,
    `Comment` = 'Rivendare Legs Cache - Ref: Druid';

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024
-- HELM conditions (Gandling)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59010,
    `SourceEntry` = 16731,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T0 Helm - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59011,
    `SourceEntry` = 16727,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T0 Helm - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59012,
    `SourceEntry` = 16677,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T0 Helm - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59013,
    `SourceEntry` = 16707,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T0 Helm - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59014,
    `SourceEntry` = 16693,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T0 Helm - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59015,
    `SourceEntry` = 16667,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T0 Helm - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59016,
    `SourceEntry` = 16686,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T0 Helm - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59017,
    `SourceEntry` = 16698,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T0 Helm - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59018,
    `SourceEntry` = 16720,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T0 Helm - Druid';

-- CHEST conditions (Drakkisath)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59020,
    `SourceEntry` = 16730,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T0 Chest - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59021,
    `SourceEntry` = 16726,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T0 Chest - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59022,
    `SourceEntry` = 16674,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T0 Chest - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59023,
    `SourceEntry` = 16721,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T0 Chest - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59024,
    `SourceEntry` = 16690,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T0 Chest - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59025,
    `SourceEntry` = 16666,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T0 Chest - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59026,
    `SourceEntry` = 16688,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T0 Chest - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59027,
    `SourceEntry` = 16700,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T0 Chest - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59028,
    `SourceEntry` = 16706,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T0 Chest - Druid';

-- LEGS conditions (Rivendare)
INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59030,
    `SourceEntry` = 16732,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1,
    `Comment` = 'T0 Legs - Warrior';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59031,
    `SourceEntry` = 16728,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 2,
    `Comment` = 'T0 Legs - Paladin';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59032,
    `SourceEntry` = 16678,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 4,
    `Comment` = 'T0 Legs - Hunter';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59033,
    `SourceEntry` = 16709,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 8,
    `Comment` = 'T0 Legs - Rogue';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59034,
    `SourceEntry` = 16694,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 16,
    `Comment` = 'T0 Legs - Priest';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59035,
    `SourceEntry` = 16668,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 64,
    `Comment` = 'T0 Legs - Shaman';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59036,
    `SourceEntry` = 16687,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 128,
    `Comment` = 'T0 Legs - Mage';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59037,
    `SourceEntry` = 16699,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 256,
    `Comment` = 'T0 Legs - Warlock';

INSERT INTO `conditions` SET
    `SourceTypeOrReferenceId` = 10,
    `SourceGroup` = 59038,
    `SourceEntry` = 16719,
    `ConditionTypeOrReference` = 15,
    `ConditionValue1` = 1024,
    `Comment` = 'T0 Legs - Druid';

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace direct T0 tier drops with satchel drops
-- Keep other loot (epics, recipes, quest items) unchanged
-- DARKMASTER GANDLING (1853) - Helm satchel
-- Remove 9 direct helm drops from GroupId 1
DELETE FROM creature_loot_template WHERE Entry = 1853 AND Item IN (16667, 16677, 16686, 16693, 16698, 16707, 16720, 16727, 16731);

INSERT INTO `creature_loot_template` SET
    `Entry` = 1853,
    `Item` = 59000,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = '"Darkmaster Gandling - Gandlings Armor Cache - Helm (F-025)"';

-- GENERAL DRAKKISATH (10363) - Chest satchel
-- Remove 9 direct chest drops from GroupId 1
-- Keep reference 35025 for non-tier epics (already in GroupId 1 with MinCount=2)
DELETE FROM creature_loot_template WHERE Entry = 10363 AND Item IN (16666, 16674, 16688, 16690, 16700, 16706, 16721, 16726, 16730);

INSERT INTO `creature_loot_template` SET
    `Entry` = 10363,
    `Item` = 59001,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = '"General Drakkisath - Drakkisaths Armor Cache - Chest (F-025)"';

-- BARON RIVENDARE (10440) - Legs satchel
-- Remove 9 direct legs drops from GroupId 1
-- Keep reference 35028 for non-tier epics (already in GroupId 1 with MinCount=2)
DELETE FROM creature_loot_template WHERE Entry = 10440 AND Item IN (16668, 16678, 16687, 16694, 16699, 16709, 16719, 16728, 16732);

INSERT INTO `creature_loot_template` SET
    `Entry` = 10440,
    `Item` = 59002,
    `Chance` = 0.0,
    `GroupId` = 1,
    `Comment` = '"Baron Rivendare - Rivendares Armor Cache - Legs (F-025)"';
