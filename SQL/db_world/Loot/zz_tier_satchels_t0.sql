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
INSERT INTO item_template (
    entry, class, subclass, name, displayid, Quality, Flags, BuyPrice, SellPrice,
    InventoryType, ItemLevel, RequiredLevel, bonding, Material, MaxCount,
    stackable, ContainerSlots, dmg_min1, dmg_max1, armor, delay, MaxDurability
) VALUES
(59000, 15, 0, "Gandling's Armor Cache - Helm",     135453, 3, 4, 0, 0, 0, 58, 55, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59001, 15, 0, "Drakkisath's Armor Cache - Chest",  135477, 3, 4, 0, 0, 0, 58, 55, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59002, 15, 0, "Rivendare's Armor Cache - Legs",    134455, 3, 4, 0, 0, 0, 58, 55, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0);

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59010 AND 59038;
DELETE FROM item_loot_template WHERE Entry BETWEEN 59000 AND 59002;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59010 AND 59038;

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 590XY where X=slot(1=helm,2=chest,3=legs), Y=class(0-8)
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru

-- HELM refs (59010-59018) - Gandling drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59010, 16731, 0, 0, 0, 1, 1, 1, 1, 'T0 Helm - Warrior: Helm of Valor'),
(59011, 16727, 0, 0, 0, 1, 2, 1, 1, 'T0 Helm - Paladin: Lightforge Helm'),
(59012, 16677, 0, 0, 0, 1, 3, 1, 1, 'T0 Helm - Hunter: Beaststalker Cap'),
(59013, 16707, 0, 0, 0, 1, 4, 1, 1, 'T0 Helm - Rogue: Shadowcraft Cap'),
(59014, 16693, 0, 0, 0, 1, 5, 1, 1, 'T0 Helm - Priest: Devout Crown'),
(59015, 16667, 0, 0, 0, 1, 6, 1, 1, 'T0 Helm - Shaman: Coif of Elements'),
(59016, 16686, 0, 0, 0, 1, 7, 1, 1, 'T0 Helm - Mage: Magister Crown'),
(59017, 16698, 0, 0, 0, 1, 8, 1, 1, 'T0 Helm - Warlock: Dreadmist Mask'),
(59018, 16720, 0, 0, 0, 1, 9, 1, 1, 'T0 Helm - Druid: Wildheart Cowl');

-- CHEST refs (59020-59028) - Drakkisath drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59020, 16730, 0, 0, 0, 1, 1, 1, 1, 'T0 Chest - Warrior: Breastplate of Valor'),
(59021, 16726, 0, 0, 0, 1, 2, 1, 1, 'T0 Chest - Paladin: Lightforge Breastplate'),
(59022, 16674, 0, 0, 0, 1, 3, 1, 1, 'T0 Chest - Hunter: Beaststalker Tunic'),
(59023, 16721, 0, 0, 0, 1, 4, 1, 1, 'T0 Chest - Rogue: Shadowcraft Tunic'),
(59024, 16690, 0, 0, 0, 1, 5, 1, 1, 'T0 Chest - Priest: Devout Robe'),
(59025, 16666, 0, 0, 0, 1, 6, 1, 1, 'T0 Chest - Shaman: Vest of Elements'),
(59026, 16688, 0, 0, 0, 1, 7, 1, 1, 'T0 Chest - Mage: Magister Robes'),
(59027, 16700, 0, 0, 0, 1, 8, 1, 1, 'T0 Chest - Warlock: Dreadmist Robe'),
(59028, 16706, 0, 0, 0, 1, 9, 1, 1, 'T0 Chest - Druid: Wildheart Vest');

-- LEGS refs (59030-59038) - Rivendare drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59030, 16732, 0, 0, 0, 1, 1, 1, 1, 'T0 Legs - Warrior: Legplates of Valor'),
(59031, 16728, 0, 0, 0, 1, 2, 1, 1, 'T0 Legs - Paladin: Lightforge Legplates'),
(59032, 16678, 0, 0, 0, 1, 3, 1, 1, 'T0 Legs - Hunter: Beaststalker Pants'),
(59033, 16709, 0, 0, 0, 1, 4, 1, 1, 'T0 Legs - Rogue: Shadowcraft Pants'),
(59034, 16694, 0, 0, 0, 1, 5, 1, 1, 'T0 Legs - Priest: Devout Skirt'),
(59035, 16668, 0, 0, 0, 1, 6, 1, 1, 'T0 Legs - Shaman: Kilt of Elements'),
(59036, 16687, 0, 0, 0, 1, 7, 1, 1, 'T0 Legs - Mage: Magister Leggings'),
(59037, 16699, 0, 0, 0, 1, 8, 1, 1, 'T0 Legs - Warlock: Dreadmist Leggings'),
(59038, 16719, 0, 0, 0, 1, 9, 1, 1, 'T0 Legs - Druid: Wildheart Kilt');

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================

-- HELM SATCHEL (59000) - Gandling
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59000, 1, 59010, 100, 0, 1, 1, 1, 1, 'Gandling Helm Cache - Ref: Warrior'),
(59000, 2, 59011, 100, 0, 1, 2, 1, 1, 'Gandling Helm Cache - Ref: Paladin'),
(59000, 3, 59012, 100, 0, 1, 3, 1, 1, 'Gandling Helm Cache - Ref: Hunter'),
(59000, 4, 59013, 100, 0, 1, 4, 1, 1, 'Gandling Helm Cache - Ref: Rogue'),
(59000, 5, 59014, 100, 0, 1, 5, 1, 1, 'Gandling Helm Cache - Ref: Priest'),
(59000, 6, 59015, 100, 0, 1, 6, 1, 1, 'Gandling Helm Cache - Ref: Shaman'),
(59000, 7, 59016, 100, 0, 1, 7, 1, 1, 'Gandling Helm Cache - Ref: Mage'),
(59000, 8, 59017, 100, 0, 1, 8, 1, 1, 'Gandling Helm Cache - Ref: Warlock'),
(59000, 9, 59018, 100, 0, 1, 9, 1, 1, 'Gandling Helm Cache - Ref: Druid');

-- CHEST SATCHEL (59001) - Drakkisath
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59001, 1, 59020, 100, 0, 1, 1, 1, 1, 'Drakkisath Chest Cache - Ref: Warrior'),
(59001, 2, 59021, 100, 0, 1, 2, 1, 1, 'Drakkisath Chest Cache - Ref: Paladin'),
(59001, 3, 59022, 100, 0, 1, 3, 1, 1, 'Drakkisath Chest Cache - Ref: Hunter'),
(59001, 4, 59023, 100, 0, 1, 4, 1, 1, 'Drakkisath Chest Cache - Ref: Rogue'),
(59001, 5, 59024, 100, 0, 1, 5, 1, 1, 'Drakkisath Chest Cache - Ref: Priest'),
(59001, 6, 59025, 100, 0, 1, 6, 1, 1, 'Drakkisath Chest Cache - Ref: Shaman'),
(59001, 7, 59026, 100, 0, 1, 7, 1, 1, 'Drakkisath Chest Cache - Ref: Mage'),
(59001, 8, 59027, 100, 0, 1, 8, 1, 1, 'Drakkisath Chest Cache - Ref: Warlock'),
(59001, 9, 59028, 100, 0, 1, 9, 1, 1, 'Drakkisath Chest Cache - Ref: Druid');

-- LEGS SATCHEL (59002) - Rivendare
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59002, 1, 59030, 100, 0, 1, 1, 1, 1, 'Rivendare Legs Cache - Ref: Warrior'),
(59002, 2, 59031, 100, 0, 1, 2, 1, 1, 'Rivendare Legs Cache - Ref: Paladin'),
(59002, 3, 59032, 100, 0, 1, 3, 1, 1, 'Rivendare Legs Cache - Ref: Hunter'),
(59002, 4, 59033, 100, 0, 1, 4, 1, 1, 'Rivendare Legs Cache - Ref: Rogue'),
(59002, 5, 59034, 100, 0, 1, 5, 1, 1, 'Rivendare Legs Cache - Ref: Priest'),
(59002, 6, 59035, 100, 0, 1, 6, 1, 1, 'Rivendare Legs Cache - Ref: Shaman'),
(59002, 7, 59036, 100, 0, 1, 7, 1, 1, 'Rivendare Legs Cache - Ref: Mage'),
(59002, 8, 59037, 100, 0, 1, 8, 1, 1, 'Rivendare Legs Cache - Ref: Warlock'),
(59002, 9, 59038, 100, 0, 1, 9, 1, 1, 'Rivendare Legs Cache - Ref: Druid');

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024

-- HELM conditions (Gandling)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59010, 16731, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T0 Helm - Warrior'),
(10, 59011, 16727, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T0 Helm - Paladin'),
(10, 59012, 16677, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T0 Helm - Hunter'),
(10, 59013, 16707, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T0 Helm - Rogue'),
(10, 59014, 16693, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T0 Helm - Priest'),
(10, 59015, 16667, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T0 Helm - Shaman'),
(10, 59016, 16686, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T0 Helm - Mage'),
(10, 59017, 16698, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T0 Helm - Warlock'),
(10, 59018, 16720, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T0 Helm - Druid');

-- CHEST conditions (Drakkisath)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59020, 16730, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T0 Chest - Warrior'),
(10, 59021, 16726, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T0 Chest - Paladin'),
(10, 59022, 16674, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T0 Chest - Hunter'),
(10, 59023, 16721, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T0 Chest - Rogue'),
(10, 59024, 16690, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T0 Chest - Priest'),
(10, 59025, 16666, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T0 Chest - Shaman'),
(10, 59026, 16688, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T0 Chest - Mage'),
(10, 59027, 16700, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T0 Chest - Warlock'),
(10, 59028, 16706, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T0 Chest - Druid');

-- LEGS conditions (Rivendare)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59030, 16732, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T0 Legs - Warrior'),
(10, 59031, 16728, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T0 Legs - Paladin'),
(10, 59032, 16678, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T0 Legs - Hunter'),
(10, 59033, 16709, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T0 Legs - Rogue'),
(10, 59034, 16694, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T0 Legs - Priest'),
(10, 59035, 16668, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T0 Legs - Shaman'),
(10, 59036, 16687, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T0 Legs - Mage'),
(10, 59037, 16699, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T0 Legs - Warlock'),
(10, 59038, 16719, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T0 Legs - Druid');

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace direct T0 tier drops with satchel drops
-- Keep other loot (epics, recipes, quest items) unchanged

-- DARKMASTER GANDLING (1853) - Helm satchel
-- Remove 9 direct helm drops from GroupId 1
DELETE FROM creature_loot_template WHERE Entry = 1853 AND Item IN (16667, 16677, 16686, 16693, 16698, 16707, 16720, 16727, 16731);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(1853, 59000, 0, 0, 0, 1, 1, 1, 1, "Darkmaster Gandling - Gandling's Armor Cache - Helm (F-025)");

-- GENERAL DRAKKISATH (10363) - Chest satchel
-- Remove 9 direct chest drops from GroupId 1
-- Keep reference 35025 for non-tier epics (already in GroupId 1 with MinCount=2)
DELETE FROM creature_loot_template WHERE Entry = 10363 AND Item IN (16666, 16674, 16688, 16690, 16700, 16706, 16721, 16726, 16730);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(10363, 59001, 0, 0, 0, 1, 1, 1, 1, "General Drakkisath - Drakkisath's Armor Cache - Chest (F-025)");

-- BARON RIVENDARE (10440) - Legs satchel
-- Remove 9 direct legs drops from GroupId 1
-- Keep reference 35028 for non-tier epics (already in GroupId 1 with MinCount=2)
DELETE FROM creature_loot_template WHERE Entry = 10440 AND Item IN (16668, 16678, 16687, 16694, 16699, 16709, 16719, 16728, 16732);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(10440, 59002, 0, 0, 0, 1, 1, 1, 1, "Baron Rivendare - Rivendare's Armor Cache - Legs (F-025)");
