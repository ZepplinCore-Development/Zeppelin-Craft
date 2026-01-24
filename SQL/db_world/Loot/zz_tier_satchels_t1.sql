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
INSERT INTO item_template (
    entry, class, subclass, name, displayid, Quality, Flags, BuyPrice, SellPrice,
    InventoryType, ItemLevel, RequiredLevel, bonding, Material, MaxCount,
    stackable, ContainerSlots, dmg_min1, dmg_max1, armor, delay, MaxDurability
) VALUES
(59300, 15, 0, 'Flamewaker Armor Cache - Helm',     135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59301, 15, 0, 'Flamewaker Armor Cache - Shoulder', 135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59302, 15, 0, 'Flamewaker Armor Cache - Chest',    135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59303, 15, 0, 'Flamewaker Armor Cache - Gloves',   135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59304, 15, 0, 'Flamewaker Armor Cache - Legs',     135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59305, 15, 0, 'Flamewaker Armor Cache - Boots',    135477, 4, 4, 0, 0, 0, 66, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0);

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59310 AND 59370;
DELETE FROM item_loot_template WHERE Entry BETWEEN 59300 AND 59305;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59310 AND 59370;

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 593XY where X=slot(1-6), Y=class(0-8)
-- Refs start at 59310 to avoid overlap with satchel items (59300-59305)
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru

-- HELM refs (59310 + class-1) - GroupId matches class number
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59310, 16866, 0, 0, 0, 1, 1, 1, 1, 'T1 Helm - Warrior: Helm of Might'),
(59311, 16854, 0, 0, 0, 1, 2, 1, 1, 'T1 Helm - Paladin: Lawbringer Helm'),
(59312, 16846, 0, 0, 0, 1, 3, 1, 1, 'T1 Helm - Hunter: Giantstalker Helmet'),
(59313, 16821, 0, 0, 0, 1, 4, 1, 1, 'T1 Helm - Rogue: Nightslayer Cover'),
(59314, 16813, 0, 0, 0, 1, 5, 1, 1, 'T1 Helm - Priest: Circlet of Prophecy'),
(59315, 16842, 0, 0, 0, 1, 6, 1, 1, 'T1 Helm - Shaman: Earthfury Helmet'),
(59316, 16795, 0, 0, 0, 1, 7, 1, 1, 'T1 Helm - Mage: Arcanist Crown'),
(59317, 16808, 0, 0, 0, 1, 8, 1, 1, 'T1 Helm - Warlock: Felheart Horns'),
(59318, 16834, 0, 0, 0, 1, 9, 1, 1, 'T1 Helm - Druid: Cenarion Helm');

-- SHOULDER refs (59320 + class-1)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59320, 16868, 0, 0, 0, 1, 1, 1, 1, 'T1 Shoulder - Warrior: Pauldrons of Might'),
(59321, 16856, 0, 0, 0, 1, 2, 1, 1, 'T1 Shoulder - Paladin: Lawbringer Spaulders'),
(59322, 16848, 0, 0, 0, 1, 3, 1, 1, 'T1 Shoulder - Hunter: Giantstalker Epaulets'),
(59323, 16823, 0, 0, 0, 1, 4, 1, 1, 'T1 Shoulder - Rogue: Nightslayer Shoulder Pads'),
(59324, 16816, 0, 0, 0, 1, 5, 1, 1, 'T1 Shoulder - Priest: Mantle of Prophecy'),
(59325, 16844, 0, 0, 0, 1, 6, 1, 1, 'T1 Shoulder - Shaman: Earthfury Epaulets'),
(59326, 16797, 0, 0, 0, 1, 7, 1, 1, 'T1 Shoulder - Mage: Arcanist Mantle'),
(59327, 16807, 0, 0, 0, 1, 8, 1, 1, 'T1 Shoulder - Warlock: Felheart Shoulder Pads'),
(59328, 16836, 0, 0, 0, 1, 9, 1, 1, 'T1 Shoulder - Druid: Cenarion Spaulders');

-- CHEST refs (59330 + class-1) - includes robes (slot 20) for cloth
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59330, 16865, 0, 0, 0, 1, 1, 1, 1, 'T1 Chest - Warrior: Breastplate of Might'),
(59331, 16853, 0, 0, 0, 1, 2, 1, 1, 'T1 Chest - Paladin: Lawbringer Chestguard'),
(59332, 16845, 0, 0, 0, 1, 3, 1, 1, 'T1 Chest - Hunter: Giantstalker Breastplate'),
(59333, 16820, 0, 0, 0, 1, 4, 1, 1, 'T1 Chest - Rogue: Nightslayer Chestpiece'),
(59334, 16815, 0, 0, 0, 1, 5, 1, 1, 'T1 Chest - Priest: Robes of Prophecy'),
(59335, 16841, 0, 0, 0, 1, 6, 1, 1, 'T1 Chest - Shaman: Earthfury Vestments'),
(59336, 16798, 0, 0, 0, 1, 7, 1, 1, 'T1 Chest - Mage: Arcanist Robes'),
(59337, 16809, 0, 0, 0, 1, 8, 1, 1, 'T1 Chest - Warlock: Felheart Robes'),
(59338, 16833, 0, 0, 0, 1, 9, 1, 1, 'T1 Chest - Druid: Cenarion Vestments');

-- GLOVES refs (59340 + class-1)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59340, 16863, 0, 0, 0, 1, 1, 1, 1, 'T1 Gloves - Warrior: Gauntlets of Might'),
(59341, 16860, 0, 0, 0, 1, 2, 1, 1, 'T1 Gloves - Paladin: Lawbringer Gauntlets'),
(59342, 16852, 0, 0, 0, 1, 3, 1, 1, 'T1 Gloves - Hunter: Giantstalker Gloves'),
(59343, 16826, 0, 0, 0, 1, 4, 1, 1, 'T1 Gloves - Rogue: Nightslayer Gloves'),
(59344, 16812, 0, 0, 0, 1, 5, 1, 1, 'T1 Gloves - Priest: Gloves of Prophecy'),
(59345, 16839, 0, 0, 0, 1, 6, 1, 1, 'T1 Gloves - Shaman: Earthfury Gauntlets'),
(59346, 16801, 0, 0, 0, 1, 7, 1, 1, 'T1 Gloves - Mage: Arcanist Gloves'),
(59347, 16805, 0, 0, 0, 1, 8, 1, 1, 'T1 Gloves - Warlock: Felheart Gloves'),
(59348, 16831, 0, 0, 0, 1, 9, 1, 1, 'T1 Gloves - Druid: Cenarion Gloves');

-- LEGS refs (59350 + class-1)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59350, 16867, 0, 0, 0, 1, 1, 1, 1, 'T1 Legs - Warrior: Legplates of Might'),
(59351, 16855, 0, 0, 0, 1, 2, 1, 1, 'T1 Legs - Paladin: Lawbringer Legplates'),
(59352, 16847, 0, 0, 0, 1, 3, 1, 1, 'T1 Legs - Hunter: Giantstalker Leggings'),
(59353, 16822, 0, 0, 0, 1, 4, 1, 1, 'T1 Legs - Rogue: Nightslayer Pants'),
(59354, 16814, 0, 0, 0, 1, 5, 1, 1, 'T1 Legs - Priest: Pants of Prophecy'),
(59355, 16843, 0, 0, 0, 1, 6, 1, 1, 'T1 Legs - Shaman: Earthfury Legguards'),
(59356, 16796, 0, 0, 0, 1, 7, 1, 1, 'T1 Legs - Mage: Arcanist Leggings'),
(59357, 16810, 0, 0, 0, 1, 8, 1, 1, 'T1 Legs - Warlock: Felheart Pants'),
(59358, 16835, 0, 0, 0, 1, 9, 1, 1, 'T1 Legs - Druid: Cenarion Leggings');

-- BOOTS refs (59360 + class-1)
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59360, 16862, 0, 0, 0, 1, 1, 1, 1, 'T1 Boots - Warrior: Sabatons of Might'),
(59361, 16859, 0, 0, 0, 1, 2, 1, 1, 'T1 Boots - Paladin: Lawbringer Boots'),
(59362, 16849, 0, 0, 0, 1, 3, 1, 1, 'T1 Boots - Hunter: Giantstalker Boots'),
(59363, 16824, 0, 0, 0, 1, 4, 1, 1, 'T1 Boots - Rogue: Nightslayer Boots'),
(59364, 16811, 0, 0, 0, 1, 5, 1, 1, 'T1 Boots - Priest: Boots of Prophecy'),
(59365, 16837, 0, 0, 0, 1, 6, 1, 1, 'T1 Boots - Shaman: Earthfury Boots'),
(59366, 16800, 0, 0, 0, 1, 7, 1, 1, 'T1 Boots - Mage: Arcanist Boots'),
(59367, 16803, 0, 0, 0, 1, 8, 1, 1, 'T1 Boots - Warlock: Felheart Slippers'),
(59368, 16829, 0, 0, 0, 1, 9, 1, 1, 'T1 Boots - Druid: Cenarion Boots');

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================

-- HELM SATCHEL (59300)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59300, 1, 59310, 100, 0, 1, 1, 1, 1, 'Helm Cache - Ref: Warrior'),
(59300, 2, 59311, 100, 0, 1, 2, 1, 1, 'Helm Cache - Ref: Paladin'),
(59300, 3, 59312, 100, 0, 1, 3, 1, 1, 'Helm Cache - Ref: Hunter'),
(59300, 4, 59313, 100, 0, 1, 4, 1, 1, 'Helm Cache - Ref: Rogue'),
(59300, 5, 59314, 100, 0, 1, 5, 1, 1, 'Helm Cache - Ref: Priest'),
(59300, 6, 59315, 100, 0, 1, 6, 1, 1, 'Helm Cache - Ref: Shaman'),
(59300, 7, 59316, 100, 0, 1, 7, 1, 1, 'Helm Cache - Ref: Mage'),
(59300, 8, 59317, 100, 0, 1, 8, 1, 1, 'Helm Cache - Ref: Warlock'),
(59300, 9, 59318, 100, 0, 1, 9, 1, 1, 'Helm Cache - Ref: Druid');

-- SHOULDER SATCHEL (59301)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59301, 1, 59320, 100, 0, 1, 1, 1, 1, 'Shoulder Cache - Ref: Warrior'),
(59301, 2, 59321, 100, 0, 1, 2, 1, 1, 'Shoulder Cache - Ref: Paladin'),
(59301, 3, 59322, 100, 0, 1, 3, 1, 1, 'Shoulder Cache - Ref: Hunter'),
(59301, 4, 59323, 100, 0, 1, 4, 1, 1, 'Shoulder Cache - Ref: Rogue'),
(59301, 5, 59324, 100, 0, 1, 5, 1, 1, 'Shoulder Cache - Ref: Priest'),
(59301, 6, 59325, 100, 0, 1, 6, 1, 1, 'Shoulder Cache - Ref: Shaman'),
(59301, 7, 59326, 100, 0, 1, 7, 1, 1, 'Shoulder Cache - Ref: Mage'),
(59301, 8, 59327, 100, 0, 1, 8, 1, 1, 'Shoulder Cache - Ref: Warlock'),
(59301, 9, 59328, 100, 0, 1, 9, 1, 1, 'Shoulder Cache - Ref: Druid');

-- CHEST SATCHEL (59302)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59302, 1, 59330, 100, 0, 1, 1, 1, 1, 'Chest Cache - Ref: Warrior'),
(59302, 2, 59331, 100, 0, 1, 2, 1, 1, 'Chest Cache - Ref: Paladin'),
(59302, 3, 59332, 100, 0, 1, 3, 1, 1, 'Chest Cache - Ref: Hunter'),
(59302, 4, 59333, 100, 0, 1, 4, 1, 1, 'Chest Cache - Ref: Rogue'),
(59302, 5, 59334, 100, 0, 1, 5, 1, 1, 'Chest Cache - Ref: Priest'),
(59302, 6, 59335, 100, 0, 1, 6, 1, 1, 'Chest Cache - Ref: Shaman'),
(59302, 7, 59336, 100, 0, 1, 7, 1, 1, 'Chest Cache - Ref: Mage'),
(59302, 8, 59337, 100, 0, 1, 8, 1, 1, 'Chest Cache - Ref: Warlock'),
(59302, 9, 59338, 100, 0, 1, 9, 1, 1, 'Chest Cache - Ref: Druid');

-- GLOVES SATCHEL (59303)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59303, 1, 59340, 100, 0, 1, 1, 1, 1, 'Gloves Cache - Ref: Warrior'),
(59303, 2, 59341, 100, 0, 1, 2, 1, 1, 'Gloves Cache - Ref: Paladin'),
(59303, 3, 59342, 100, 0, 1, 3, 1, 1, 'Gloves Cache - Ref: Hunter'),
(59303, 4, 59343, 100, 0, 1, 4, 1, 1, 'Gloves Cache - Ref: Rogue'),
(59303, 5, 59344, 100, 0, 1, 5, 1, 1, 'Gloves Cache - Ref: Priest'),
(59303, 6, 59345, 100, 0, 1, 6, 1, 1, 'Gloves Cache - Ref: Shaman'),
(59303, 7, 59346, 100, 0, 1, 7, 1, 1, 'Gloves Cache - Ref: Mage'),
(59303, 8, 59347, 100, 0, 1, 8, 1, 1, 'Gloves Cache - Ref: Warlock'),
(59303, 9, 59348, 100, 0, 1, 9, 1, 1, 'Gloves Cache - Ref: Druid');

-- LEGS SATCHEL (59304)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59304, 1, 59350, 100, 0, 1, 1, 1, 1, 'Legs Cache - Ref: Warrior'),
(59304, 2, 59351, 100, 0, 1, 2, 1, 1, 'Legs Cache - Ref: Paladin'),
(59304, 3, 59352, 100, 0, 1, 3, 1, 1, 'Legs Cache - Ref: Hunter'),
(59304, 4, 59353, 100, 0, 1, 4, 1, 1, 'Legs Cache - Ref: Rogue'),
(59304, 5, 59354, 100, 0, 1, 5, 1, 1, 'Legs Cache - Ref: Priest'),
(59304, 6, 59355, 100, 0, 1, 6, 1, 1, 'Legs Cache - Ref: Shaman'),
(59304, 7, 59356, 100, 0, 1, 7, 1, 1, 'Legs Cache - Ref: Mage'),
(59304, 8, 59357, 100, 0, 1, 8, 1, 1, 'Legs Cache - Ref: Warlock'),
(59304, 9, 59358, 100, 0, 1, 9, 1, 1, 'Legs Cache - Ref: Druid');

-- BOOTS SATCHEL (59305)
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59305, 1, 59360, 100, 0, 1, 1, 1, 1, 'Boots Cache - Ref: Warrior'),
(59305, 2, 59361, 100, 0, 1, 2, 1, 1, 'Boots Cache - Ref: Paladin'),
(59305, 3, 59362, 100, 0, 1, 3, 1, 1, 'Boots Cache - Ref: Hunter'),
(59305, 4, 59363, 100, 0, 1, 4, 1, 1, 'Boots Cache - Ref: Rogue'),
(59305, 5, 59364, 100, 0, 1, 5, 1, 1, 'Boots Cache - Ref: Priest'),
(59305, 6, 59365, 100, 0, 1, 6, 1, 1, 'Boots Cache - Ref: Shaman'),
(59305, 7, 59366, 100, 0, 1, 7, 1, 1, 'Boots Cache - Ref: Mage'),
(59305, 8, 59367, 100, 0, 1, 8, 1, 1, 'Boots Cache - Ref: Warlock'),
(59305, 9, 59368, 100, 0, 1, 9, 1, 1, 'Boots Cache - Ref: Druid');

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024

-- HELM conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59310, 16866, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Helm - Warrior'),
(10, 59311, 16854, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Helm - Paladin'),
(10, 59312, 16846, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Helm - Hunter'),
(10, 59313, 16821, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Helm - Rogue'),
(10, 59314, 16813, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Helm - Priest'),
(10, 59315, 16842, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Helm - Shaman'),
(10, 59316, 16795, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Helm - Mage'),
(10, 59317, 16808, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Helm - Warlock'),
(10, 59318, 16834, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Helm - Druid');

-- SHOULDER conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59320, 16868, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Shoulder - Warrior'),
(10, 59321, 16856, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Shoulder - Paladin'),
(10, 59322, 16848, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Shoulder - Hunter'),
(10, 59323, 16823, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Shoulder - Rogue'),
(10, 59324, 16816, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Shoulder - Priest'),
(10, 59325, 16844, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Shoulder - Shaman'),
(10, 59326, 16797, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Shoulder - Mage'),
(10, 59327, 16807, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Shoulder - Warlock'),
(10, 59328, 16836, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Shoulder - Druid');

-- CHEST conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59330, 16865, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Chest - Warrior'),
(10, 59331, 16853, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Chest - Paladin'),
(10, 59332, 16845, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Chest - Hunter'),
(10, 59333, 16820, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Chest - Rogue'),
(10, 59334, 16815, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Chest - Priest'),
(10, 59335, 16841, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Chest - Shaman'),
(10, 59336, 16798, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Chest - Mage'),
(10, 59337, 16809, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Chest - Warlock'),
(10, 59338, 16833, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Chest - Druid');

-- GLOVES conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59340, 16863, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Gloves - Warrior'),
(10, 59341, 16860, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Gloves - Paladin'),
(10, 59342, 16852, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Gloves - Hunter'),
(10, 59343, 16826, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Gloves - Rogue'),
(10, 59344, 16812, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Gloves - Priest'),
(10, 59345, 16839, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Gloves - Shaman'),
(10, 59346, 16801, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Gloves - Mage'),
(10, 59347, 16805, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Gloves - Warlock'),
(10, 59348, 16831, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Gloves - Druid');

-- LEGS conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59350, 16867, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Legs - Warrior'),
(10, 59351, 16855, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Legs - Paladin'),
(10, 59352, 16847, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Legs - Hunter'),
(10, 59353, 16822, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Legs - Rogue'),
(10, 59354, 16814, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Legs - Priest'),
(10, 59355, 16843, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Legs - Shaman'),
(10, 59356, 16796, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Legs - Mage'),
(10, 59357, 16810, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Legs - Warlock'),
(10, 59358, 16835, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Legs - Druid');

-- BOOTS conditions
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59360, 16862, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T1 Boots - Warrior'),
(10, 59361, 16859, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T1 Boots - Paladin'),
(10, 59362, 16849, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T1 Boots - Hunter'),
(10, 59363, 16824, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T1 Boots - Rogue'),
(10, 59364, 16811, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T1 Boots - Priest'),
(10, 59365, 16837, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T1 Boots - Shaman'),
(10, 59366, 16800, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T1 Boots - Mage'),
(10, 59367, 16803, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T1 Boots - Warlock'),
(10, 59368, 16829, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T1 Boots - Druid');

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace T1 tier refs with satchel drops
-- Keep other loot (epics, mats, bindings) unchanged

-- GARR (12057) - Helm satchel
-- Current T1 refs: 30352, 30353 (all 9 helms)
DELETE FROM creature_loot_template WHERE Entry = 12057 AND Reference IN (30352, 30353);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12057, 59300, 0, 100, 0, 1, 0, 1, 2, 'Garr - Flamewaker Armor Cache - Helm (F-025)');

-- BARON GEDDON (12056) - Shoulder satchel (partial: Druid, Shaman, Paladin, Mage, Lock)
-- Current T1 refs: 30349, 30350
DELETE FROM creature_loot_template WHERE Entry = 12056 AND Reference IN (30349, 30350);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12056, 59301, 0, 100, 0, 1, 0, 1, 1, 'Baron Geddon - Flamewaker Armor Cache - Shoulder (F-025)');

-- SULFURON HARBINGER (12098) - Shoulder satchel (partial: Warrior, Rogue, Priest, Hunter)
-- Current T1 refs: 30355, 30356
DELETE FROM creature_loot_template WHERE Entry = 12098 AND Reference IN (30355, 30356);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12098, 59301, 0, 100, 0, 1, 0, 1, 1, 'Sulfuron Harbinger - Flamewaker Armor Cache - Shoulder (F-025)');

-- GOLEMAGG (11988) - Chest satchel
-- Current T1 refs: 30343, 30344 (all 9 chests)
DELETE FROM creature_loot_template WHERE Entry = 11988 AND Reference IN (30343, 30344);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11988, 59302, 0, 100, 0, 1, 0, 1, 2, 'Golemagg - Flamewaker Armor Cache - Chest (F-025)');

-- MAGMADAR (11982) - Legs satchel
-- Current T1 refs: 30338, 30339 (all 9 legs)
DELETE FROM creature_loot_template WHERE Entry = 11982 AND Reference IN (30338, 30339);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11982, 59304, 0, 100, 0, 1, 0, 1, 2, 'Magmadar - Flamewaker Armor Cache - Legs (F-025)');

-- LUCIFRON (12118) - Gloves + Boots satchels
-- Current T1 refs: 30357 (gloves: War, Lock), 30488 (boots: Mage, Druid, Shaman, Paladin)
DELETE FROM creature_loot_template WHERE Entry = 12118 AND Reference IN (30357, 30488);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12118, 59303, 0, 100, 0, 1, 0, 1, 1, 'Lucifron - Flamewaker Armor Cache - Gloves (F-025)'),
(12118, 59305, 0, 100, 0, 1, 0, 1, 1, 'Lucifron - Flamewaker Armor Cache - Boots (F-025)');

-- GEHENNAS (12259) - Gloves + Boots satchels
-- Current T1 refs: 30365 (boots: War, Hunter), 30366 (gloves: Priest, Rogue, Shaman, Paladin)
DELETE FROM creature_loot_template WHERE Entry = 12259 AND Reference IN (30365, 30366);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12259, 59303, 0, 100, 0, 1, 0, 1, 1, 'Gehennas - Flamewaker Armor Cache - Gloves (F-025)'),
(12259, 59305, 0, 100, 0, 1, 0, 1, 1, 'Gehennas - Flamewaker Armor Cache - Boots (F-025)');

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
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12264, 59303, 0, 100, 0, 1, 0, 1, 1, 'Shazzrah - Flamewaker Armor Cache - Gloves (F-025)'),
(12264, 59305, 0, 100, 0, 1, 0, 1, 1, 'Shazzrah - Flamewaker Armor Cache - Boots (F-025)'),
(12264, 59370, 59370, 100, 0, 1, 0, 1, 1, 'Shazzrah - Non-tier Epics (F-025)');
