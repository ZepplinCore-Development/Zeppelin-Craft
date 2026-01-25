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
INSERT INTO item_template (
    entry, class, subclass, name, displayid, Quality, Flags, BuyPrice, SellPrice,
    InventoryType, ItemLevel, RequiredLevel, bonding, Material, MaxCount,
    stackable, ContainerSlots, dmg_min1, dmg_max1, armor, delay, MaxDurability
) VALUES
(59306, 15, 0, 'Blackwing Armor Cache - Helm',     135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59307, 15, 0, 'Blackwing Armor Cache - Shoulder', 135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59308, 15, 0, 'Blackwing Armor Cache - Chest',    135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59309, 15, 0, 'Blackwing Armor Cache - Belt',     135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59310, 15, 0, "Firelord's Armor Cache - Legs",    135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59311, 15, 0, 'Blackwing Armor Cache - Boots',    135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59312, 15, 0, 'Blackwing Armor Cache - Bracers',  135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
(59313, 15, 0, 'Blackwing Armor Cache - Gloves',   135477, 4, 4, 0, 0, 0, 76, 60, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0);

-- =============================================================================
-- 2. CLEANUP OLD STRUCTURES
-- =============================================================================
DELETE FROM reference_loot_template WHERE Entry BETWEEN 59380 AND 59458;
DELETE FROM item_loot_template WHERE Entry BETWEEN 59306 AND 59313;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 59380 AND 59458;

-- =============================================================================
-- 3. REFERENCE LOOT TABLES (one per class per slot)
-- =============================================================================
-- Entry format: 59XY0-59XY8 where X=3+slot, Y=8+class_offset
-- Class order: 1=War, 2=Pal, 3=Hun, 4=Rog, 5=Pri, 6=Sha, 7=Mag, 8=Loc, 9=Dru

-- HELM refs (59380-59388) - Onyxia drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59380, 16963, 0, 0, 0, 1, 1, 1, 1, 'T2 Helm - Warrior: Helm of Wrath'),
(59381, 16955, 0, 0, 0, 1, 2, 1, 1, 'T2 Helm - Paladin: Judgement Crown'),
(59382, 16939, 0, 0, 0, 1, 3, 1, 1, 'T2 Helm - Hunter: Dragonstalker Helm'),
(59383, 16908, 0, 0, 0, 1, 4, 1, 1, 'T2 Helm - Rogue: Bloodfang Hood'),
(59384, 16921, 0, 0, 0, 1, 5, 1, 1, 'T2 Helm - Priest: Halo of Transcendence'),
(59385, 16947, 0, 0, 0, 1, 6, 1, 1, 'T2 Helm - Shaman: Helmet of Ten Storms'),
(59386, 16914, 0, 0, 0, 1, 7, 1, 1, 'T2 Helm - Mage: Netherwind Crown'),
(59387, 16929, 0, 0, 0, 1, 8, 1, 1, 'T2 Helm - Warlock: Nemesis Skullcap'),
(59388, 16900, 0, 0, 0, 1, 9, 1, 1, 'T2 Helm - Druid: Stormrage Cover');

-- SHOULDER refs (59390-59398) - Chromaggus drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59390, 16961, 0, 0, 0, 1, 1, 1, 1, 'T2 Shoulder - Warrior: Pauldrons of Wrath'),
(59391, 16953, 0, 0, 0, 1, 2, 1, 1, 'T2 Shoulder - Paladin: Judgement Spaulders'),
(59392, 16937, 0, 0, 0, 1, 3, 1, 1, 'T2 Shoulder - Hunter: Dragonstalker Spaulders'),
(59393, 16832, 0, 0, 0, 1, 4, 1, 1, 'T2 Shoulder - Rogue: Bloodfang Spaulders'),
(59394, 16924, 0, 0, 0, 1, 5, 1, 1, 'T2 Shoulder - Priest: Pauldrons of Transcendence'),
(59395, 16945, 0, 0, 0, 1, 6, 1, 1, 'T2 Shoulder - Shaman: Epaulets of Ten Storms'),
(59396, 16917, 0, 0, 0, 1, 7, 1, 1, 'T2 Shoulder - Mage: Netherwind Mantle'),
(59397, 16932, 0, 0, 0, 1, 8, 1, 1, 'T2 Shoulder - Warlock: Nemesis Spaulders'),
(59398, 16902, 0, 0, 0, 1, 9, 1, 1, 'T2 Shoulder - Druid: Stormrage Pauldrons');

-- CHEST refs (59400-59408) - Nefarian drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59400, 16966, 0, 0, 0, 1, 1, 1, 1, 'T2 Chest - Warrior: Breastplate of Wrath'),
(59401, 16958, 0, 0, 0, 1, 2, 1, 1, 'T2 Chest - Paladin: Judgement Breastplate'),
(59402, 16942, 0, 0, 0, 1, 3, 1, 1, 'T2 Chest - Hunter: Dragonstalker Breastplate'),
(59403, 16905, 0, 0, 0, 1, 4, 1, 1, 'T2 Chest - Rogue: Bloodfang Chestpiece'),
(59404, 16923, 0, 0, 0, 1, 5, 1, 1, 'T2 Chest - Priest: Robes of Transcendence'),
(59405, 16950, 0, 0, 0, 1, 6, 1, 1, 'T2 Chest - Shaman: Breastplate of Ten Storms'),
(59406, 16916, 0, 0, 0, 1, 7, 1, 1, 'T2 Chest - Mage: Netherwind Robes'),
(59407, 16931, 0, 0, 0, 1, 8, 1, 1, 'T2 Chest - Warlock: Nemesis Robes'),
(59408, 16897, 0, 0, 0, 1, 9, 1, 1, 'T2 Chest - Druid: Stormrage Chestguard');

-- BELT refs (59410-59418) - Vaelastrasz drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59410, 16960, 0, 0, 0, 1, 1, 1, 1, 'T2 Belt - Warrior: Waistband of Wrath'),
(59411, 16952, 0, 0, 0, 1, 2, 1, 1, 'T2 Belt - Paladin: Judgement Belt'),
(59412, 16936, 0, 0, 0, 1, 3, 1, 1, 'T2 Belt - Hunter: Dragonstalker Belt'),
(59413, 16910, 0, 0, 0, 1, 4, 1, 1, 'T2 Belt - Rogue: Bloodfang Belt'),
(59414, 16925, 0, 0, 0, 1, 5, 1, 1, 'T2 Belt - Priest: Belt of Transcendence'),
(59415, 16944, 0, 0, 0, 1, 6, 1, 1, 'T2 Belt - Shaman: Belt of Ten Storms'),
(59416, 16818, 0, 0, 0, 1, 7, 1, 1, 'T2 Belt - Mage: Netherwind Belt'),
(59417, 16933, 0, 0, 0, 1, 8, 1, 1, 'T2 Belt - Warlock: Nemesis Belt'),
(59418, 16903, 0, 0, 0, 1, 9, 1, 1, 'T2 Belt - Druid: Stormrage Belt');

-- LEGS refs (59420-59428) - Ragnaros drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59420, 16962, 0, 0, 0, 1, 1, 1, 1, 'T2 Legs - Warrior: Legplates of Wrath'),
(59421, 16954, 0, 0, 0, 1, 2, 1, 1, 'T2 Legs - Paladin: Judgement Legplates'),
(59422, 16938, 0, 0, 0, 1, 3, 1, 1, 'T2 Legs - Hunter: Dragonstalker Legguards'),
(59423, 16909, 0, 0, 0, 1, 4, 1, 1, 'T2 Legs - Rogue: Bloodfang Pants'),
(59424, 16922, 0, 0, 0, 1, 5, 1, 1, 'T2 Legs - Priest: Leggings of Transcendence'),
(59425, 16946, 0, 0, 0, 1, 6, 1, 1, 'T2 Legs - Shaman: Legplates of Ten Storms'),
(59426, 16915, 0, 0, 0, 1, 7, 1, 1, 'T2 Legs - Mage: Netherwind Pants'),
(59427, 16930, 0, 0, 0, 1, 8, 1, 1, 'T2 Legs - Warlock: Nemesis Leggings'),
(59428, 16901, 0, 0, 0, 1, 9, 1, 1, 'T2 Legs - Druid: Stormrage Legguards');

-- BOOTS refs (59430-59438) - Broodlord drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59430, 16965, 0, 0, 0, 1, 1, 1, 1, 'T2 Boots - Warrior: Sabatons of Wrath'),
(59431, 16957, 0, 0, 0, 1, 2, 1, 1, 'T2 Boots - Paladin: Judgement Sabatons'),
(59432, 16941, 0, 0, 0, 1, 3, 1, 1, 'T2 Boots - Hunter: Dragonstalker Greaves'),
(59433, 16906, 0, 0, 0, 1, 4, 1, 1, 'T2 Boots - Rogue: Bloodfang Boots'),
(59434, 16919, 0, 0, 0, 1, 5, 1, 1, 'T2 Boots - Priest: Boots of Transcendence'),
(59435, 16949, 0, 0, 0, 1, 6, 1, 1, 'T2 Boots - Shaman: Greaves of Ten Storms'),
(59436, 16912, 0, 0, 0, 1, 7, 1, 1, 'T2 Boots - Mage: Netherwind Boots'),
(59437, 16927, 0, 0, 0, 1, 8, 1, 1, 'T2 Boots - Warlock: Nemesis Boots'),
(59438, 16898, 0, 0, 0, 1, 9, 1, 1, 'T2 Boots - Druid: Stormrage Boots');

-- BRACERS refs (59440-59448) - Razorgore drops
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59440, 16959, 0, 0, 0, 1, 1, 1, 1, 'T2 Bracers - Warrior: Bracelets of Wrath'),
(59441, 16951, 0, 0, 0, 1, 2, 1, 1, 'T2 Bracers - Paladin: Judgement Bindings'),
(59442, 16935, 0, 0, 0, 1, 3, 1, 1, 'T2 Bracers - Hunter: Dragonstalker Bracers'),
(59443, 16911, 0, 0, 0, 1, 4, 1, 1, 'T2 Bracers - Rogue: Bloodfang Bracers'),
(59444, 16926, 0, 0, 0, 1, 5, 1, 1, 'T2 Bracers - Priest: Bindings of Transcendence'),
(59445, 16943, 0, 0, 0, 1, 6, 1, 1, 'T2 Bracers - Shaman: Bracers of Ten Storms'),
(59446, 16918, 0, 0, 0, 1, 7, 1, 1, 'T2 Bracers - Mage: Netherwind Bindings'),
(59447, 16934, 0, 0, 0, 1, 8, 1, 1, 'T2 Bracers - Warlock: Nemesis Bracers'),
(59448, 16904, 0, 0, 0, 1, 9, 1, 1, 'T2 Bracers - Druid: Stormrage Bracers');

-- GLOVES refs (59450-59458) - Firemaw/Ebonroc/Flamegor drop
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59450, 16964, 0, 0, 0, 1, 1, 1, 1, 'T2 Gloves - Warrior: Gauntlets of Wrath'),
(59451, 16956, 0, 0, 0, 1, 2, 1, 1, 'T2 Gloves - Paladin: Judgement Gauntlets'),
(59452, 16940, 0, 0, 0, 1, 3, 1, 1, 'T2 Gloves - Hunter: Dragonstalker Gauntlets'),
(59453, 16907, 0, 0, 0, 1, 4, 1, 1, 'T2 Gloves - Rogue: Bloodfang Gloves'),
(59454, 16920, 0, 0, 0, 1, 5, 1, 1, 'T2 Gloves - Priest: Handguards of Transcendence'),
(59455, 16948, 0, 0, 0, 1, 6, 1, 1, 'T2 Gloves - Shaman: Gauntlets of Ten Storms'),
(59456, 16913, 0, 0, 0, 1, 7, 1, 1, 'T2 Gloves - Mage: Netherwind Gloves'),
(59457, 16928, 0, 0, 0, 1, 8, 1, 1, 'T2 Gloves - Warlock: Nemesis Gloves'),
(59458, 16899, 0, 0, 0, 1, 9, 1, 1, 'T2 Gloves - Druid: Stormrage Handguards');

-- =============================================================================
-- 4. ITEM LOOT TABLES (satchel contents - references with matching GroupIds)
-- =============================================================================

-- HELM SATCHEL (59306) - Onyxia
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59306, 1, 59380, 100, 0, 1, 1, 1, 1, 'Blackwing Helm Cache - Ref: Warrior'),
(59306, 2, 59381, 100, 0, 1, 2, 1, 1, 'Blackwing Helm Cache - Ref: Paladin'),
(59306, 3, 59382, 100, 0, 1, 3, 1, 1, 'Blackwing Helm Cache - Ref: Hunter'),
(59306, 4, 59383, 100, 0, 1, 4, 1, 1, 'Blackwing Helm Cache - Ref: Rogue'),
(59306, 5, 59384, 100, 0, 1, 5, 1, 1, 'Blackwing Helm Cache - Ref: Priest'),
(59306, 6, 59385, 100, 0, 1, 6, 1, 1, 'Blackwing Helm Cache - Ref: Shaman'),
(59306, 7, 59386, 100, 0, 1, 7, 1, 1, 'Blackwing Helm Cache - Ref: Mage'),
(59306, 8, 59387, 100, 0, 1, 8, 1, 1, 'Blackwing Helm Cache - Ref: Warlock'),
(59306, 9, 59388, 100, 0, 1, 9, 1, 1, 'Blackwing Helm Cache - Ref: Druid');

-- SHOULDER SATCHEL (59307) - Chromaggus
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59307, 1, 59390, 100, 0, 1, 1, 1, 1, 'Blackwing Shoulder Cache - Ref: Warrior'),
(59307, 2, 59391, 100, 0, 1, 2, 1, 1, 'Blackwing Shoulder Cache - Ref: Paladin'),
(59307, 3, 59392, 100, 0, 1, 3, 1, 1, 'Blackwing Shoulder Cache - Ref: Hunter'),
(59307, 4, 59393, 100, 0, 1, 4, 1, 1, 'Blackwing Shoulder Cache - Ref: Rogue'),
(59307, 5, 59394, 100, 0, 1, 5, 1, 1, 'Blackwing Shoulder Cache - Ref: Priest'),
(59307, 6, 59395, 100, 0, 1, 6, 1, 1, 'Blackwing Shoulder Cache - Ref: Shaman'),
(59307, 7, 59396, 100, 0, 1, 7, 1, 1, 'Blackwing Shoulder Cache - Ref: Mage'),
(59307, 8, 59397, 100, 0, 1, 8, 1, 1, 'Blackwing Shoulder Cache - Ref: Warlock'),
(59307, 9, 59398, 100, 0, 1, 9, 1, 1, 'Blackwing Shoulder Cache - Ref: Druid');

-- CHEST SATCHEL (59308) - Nefarian
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59308, 1, 59400, 100, 0, 1, 1, 1, 1, 'Blackwing Chest Cache - Ref: Warrior'),
(59308, 2, 59401, 100, 0, 1, 2, 1, 1, 'Blackwing Chest Cache - Ref: Paladin'),
(59308, 3, 59402, 100, 0, 1, 3, 1, 1, 'Blackwing Chest Cache - Ref: Hunter'),
(59308, 4, 59403, 100, 0, 1, 4, 1, 1, 'Blackwing Chest Cache - Ref: Rogue'),
(59308, 5, 59404, 100, 0, 1, 5, 1, 1, 'Blackwing Chest Cache - Ref: Priest'),
(59308, 6, 59405, 100, 0, 1, 6, 1, 1, 'Blackwing Chest Cache - Ref: Shaman'),
(59308, 7, 59406, 100, 0, 1, 7, 1, 1, 'Blackwing Chest Cache - Ref: Mage'),
(59308, 8, 59407, 100, 0, 1, 8, 1, 1, 'Blackwing Chest Cache - Ref: Warlock'),
(59308, 9, 59408, 100, 0, 1, 9, 1, 1, 'Blackwing Chest Cache - Ref: Druid');

-- BELT SATCHEL (59309) - Vaelastrasz
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59309, 1, 59410, 100, 0, 1, 1, 1, 1, 'Blackwing Belt Cache - Ref: Warrior'),
(59309, 2, 59411, 100, 0, 1, 2, 1, 1, 'Blackwing Belt Cache - Ref: Paladin'),
(59309, 3, 59412, 100, 0, 1, 3, 1, 1, 'Blackwing Belt Cache - Ref: Hunter'),
(59309, 4, 59413, 100, 0, 1, 4, 1, 1, 'Blackwing Belt Cache - Ref: Rogue'),
(59309, 5, 59414, 100, 0, 1, 5, 1, 1, 'Blackwing Belt Cache - Ref: Priest'),
(59309, 6, 59415, 100, 0, 1, 6, 1, 1, 'Blackwing Belt Cache - Ref: Shaman'),
(59309, 7, 59416, 100, 0, 1, 7, 1, 1, 'Blackwing Belt Cache - Ref: Mage'),
(59309, 8, 59417, 100, 0, 1, 8, 1, 1, 'Blackwing Belt Cache - Ref: Warlock'),
(59309, 9, 59418, 100, 0, 1, 9, 1, 1, 'Blackwing Belt Cache - Ref: Druid');

-- LEGS SATCHEL (59310) - Ragnaros
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59310, 1, 59420, 100, 0, 1, 1, 1, 1, 'Firelord Legs Cache - Ref: Warrior'),
(59310, 2, 59421, 100, 0, 1, 2, 1, 1, 'Firelord Legs Cache - Ref: Paladin'),
(59310, 3, 59422, 100, 0, 1, 3, 1, 1, 'Firelord Legs Cache - Ref: Hunter'),
(59310, 4, 59423, 100, 0, 1, 4, 1, 1, 'Firelord Legs Cache - Ref: Rogue'),
(59310, 5, 59424, 100, 0, 1, 5, 1, 1, 'Firelord Legs Cache - Ref: Priest'),
(59310, 6, 59425, 100, 0, 1, 6, 1, 1, 'Firelord Legs Cache - Ref: Shaman'),
(59310, 7, 59426, 100, 0, 1, 7, 1, 1, 'Firelord Legs Cache - Ref: Mage'),
(59310, 8, 59427, 100, 0, 1, 8, 1, 1, 'Firelord Legs Cache - Ref: Warlock'),
(59310, 9, 59428, 100, 0, 1, 9, 1, 1, 'Firelord Legs Cache - Ref: Druid');

-- BOOTS SATCHEL (59311) - Broodlord
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59311, 1, 59430, 100, 0, 1, 1, 1, 1, 'Blackwing Boots Cache - Ref: Warrior'),
(59311, 2, 59431, 100, 0, 1, 2, 1, 1, 'Blackwing Boots Cache - Ref: Paladin'),
(59311, 3, 59432, 100, 0, 1, 3, 1, 1, 'Blackwing Boots Cache - Ref: Hunter'),
(59311, 4, 59433, 100, 0, 1, 4, 1, 1, 'Blackwing Boots Cache - Ref: Rogue'),
(59311, 5, 59434, 100, 0, 1, 5, 1, 1, 'Blackwing Boots Cache - Ref: Priest'),
(59311, 6, 59435, 100, 0, 1, 6, 1, 1, 'Blackwing Boots Cache - Ref: Shaman'),
(59311, 7, 59436, 100, 0, 1, 7, 1, 1, 'Blackwing Boots Cache - Ref: Mage'),
(59311, 8, 59437, 100, 0, 1, 8, 1, 1, 'Blackwing Boots Cache - Ref: Warlock'),
(59311, 9, 59438, 100, 0, 1, 9, 1, 1, 'Blackwing Boots Cache - Ref: Druid');

-- BRACERS SATCHEL (59312) - Razorgore
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59312, 1, 59440, 100, 0, 1, 1, 1, 1, 'Blackwing Bracers Cache - Ref: Warrior'),
(59312, 2, 59441, 100, 0, 1, 2, 1, 1, 'Blackwing Bracers Cache - Ref: Paladin'),
(59312, 3, 59442, 100, 0, 1, 3, 1, 1, 'Blackwing Bracers Cache - Ref: Hunter'),
(59312, 4, 59443, 100, 0, 1, 4, 1, 1, 'Blackwing Bracers Cache - Ref: Rogue'),
(59312, 5, 59444, 100, 0, 1, 5, 1, 1, 'Blackwing Bracers Cache - Ref: Priest'),
(59312, 6, 59445, 100, 0, 1, 6, 1, 1, 'Blackwing Bracers Cache - Ref: Shaman'),
(59312, 7, 59446, 100, 0, 1, 7, 1, 1, 'Blackwing Bracers Cache - Ref: Mage'),
(59312, 8, 59447, 100, 0, 1, 8, 1, 1, 'Blackwing Bracers Cache - Ref: Warlock'),
(59312, 9, 59448, 100, 0, 1, 9, 1, 1, 'Blackwing Bracers Cache - Ref: Druid');

-- GLOVES SATCHEL (59313) - Firemaw/Ebonroc/Flamegor
INSERT INTO item_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(59313, 1, 59450, 100, 0, 1, 1, 1, 1, 'Blackwing Gloves Cache - Ref: Warrior'),
(59313, 2, 59451, 100, 0, 1, 2, 1, 1, 'Blackwing Gloves Cache - Ref: Paladin'),
(59313, 3, 59452, 100, 0, 1, 3, 1, 1, 'Blackwing Gloves Cache - Ref: Hunter'),
(59313, 4, 59453, 100, 0, 1, 4, 1, 1, 'Blackwing Gloves Cache - Ref: Rogue'),
(59313, 5, 59454, 100, 0, 1, 5, 1, 1, 'Blackwing Gloves Cache - Ref: Priest'),
(59313, 6, 59455, 100, 0, 1, 6, 1, 1, 'Blackwing Gloves Cache - Ref: Shaman'),
(59313, 7, 59456, 100, 0, 1, 7, 1, 1, 'Blackwing Gloves Cache - Ref: Mage'),
(59313, 8, 59457, 100, 0, 1, 8, 1, 1, 'Blackwing Gloves Cache - Ref: Warlock'),
(59313, 9, 59458, 100, 0, 1, 9, 1, 1, 'Blackwing Gloves Cache - Ref: Druid');

-- =============================================================================
-- 5. CONDITIONS - Class masks (SourceType=10, ConditionType=15)
-- =============================================================================
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024

-- HELM conditions (Onyxia)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59380, 16963, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Helm - Warrior'),
(10, 59381, 16955, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Helm - Paladin'),
(10, 59382, 16939, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Helm - Hunter'),
(10, 59383, 16908, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Helm - Rogue'),
(10, 59384, 16921, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Helm - Priest'),
(10, 59385, 16947, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Helm - Shaman'),
(10, 59386, 16914, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Helm - Mage'),
(10, 59387, 16929, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Helm - Warlock'),
(10, 59388, 16900, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Helm - Druid');

-- SHOULDER conditions (Chromaggus)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59390, 16961, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Shoulder - Warrior'),
(10, 59391, 16953, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Shoulder - Paladin'),
(10, 59392, 16937, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Shoulder - Hunter'),
(10, 59393, 16832, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Shoulder - Rogue'),
(10, 59394, 16924, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Shoulder - Priest'),
(10, 59395, 16945, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Shoulder - Shaman'),
(10, 59396, 16917, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Shoulder - Mage'),
(10, 59397, 16932, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Shoulder - Warlock'),
(10, 59398, 16902, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Shoulder - Druid');

-- CHEST conditions (Nefarian)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59400, 16966, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Chest - Warrior'),
(10, 59401, 16958, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Chest - Paladin'),
(10, 59402, 16942, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Chest - Hunter'),
(10, 59403, 16905, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Chest - Rogue'),
(10, 59404, 16923, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Chest - Priest'),
(10, 59405, 16950, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Chest - Shaman'),
(10, 59406, 16916, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Chest - Mage'),
(10, 59407, 16931, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Chest - Warlock'),
(10, 59408, 16897, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Chest - Druid');

-- BELT conditions (Vaelastrasz)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59410, 16960, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Belt - Warrior'),
(10, 59411, 16952, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Belt - Paladin'),
(10, 59412, 16936, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Belt - Hunter'),
(10, 59413, 16910, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Belt - Rogue'),
(10, 59414, 16925, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Belt - Priest'),
(10, 59415, 16944, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Belt - Shaman'),
(10, 59416, 16818, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Belt - Mage'),
(10, 59417, 16933, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Belt - Warlock'),
(10, 59418, 16903, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Belt - Druid');

-- LEGS conditions (Ragnaros)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59420, 16962, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Legs - Warrior'),
(10, 59421, 16954, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Legs - Paladin'),
(10, 59422, 16938, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Legs - Hunter'),
(10, 59423, 16909, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Legs - Rogue'),
(10, 59424, 16922, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Legs - Priest'),
(10, 59425, 16946, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Legs - Shaman'),
(10, 59426, 16915, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Legs - Mage'),
(10, 59427, 16930, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Legs - Warlock'),
(10, 59428, 16901, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Legs - Druid');

-- BOOTS conditions (Broodlord)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59430, 16965, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Boots - Warrior'),
(10, 59431, 16957, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Boots - Paladin'),
(10, 59432, 16941, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Boots - Hunter'),
(10, 59433, 16906, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Boots - Rogue'),
(10, 59434, 16919, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Boots - Priest'),
(10, 59435, 16949, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Boots - Shaman'),
(10, 59436, 16912, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Boots - Mage'),
(10, 59437, 16927, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Boots - Warlock'),
(10, 59438, 16898, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Boots - Druid');

-- BRACERS conditions (Razorgore)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59440, 16959, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Bracers - Warrior'),
(10, 59441, 16951, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Bracers - Paladin'),
(10, 59442, 16935, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Bracers - Hunter'),
(10, 59443, 16911, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Bracers - Rogue'),
(10, 59444, 16926, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Bracers - Priest'),
(10, 59445, 16943, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Bracers - Shaman'),
(10, 59446, 16918, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Bracers - Mage'),
(10, 59447, 16934, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Bracers - Warlock'),
(10, 59448, 16904, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Bracers - Druid');

-- GLOVES conditions (Firemaw/Ebonroc/Flamegor)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
(10, 59450, 16964, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T2 Gloves - Warrior'),
(10, 59451, 16956, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T2 Gloves - Paladin'),
(10, 59452, 16940, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T2 Gloves - Hunter'),
(10, 59453, 16907, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T2 Gloves - Rogue'),
(10, 59454, 16920, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T2 Gloves - Priest'),
(10, 59455, 16948, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T2 Gloves - Shaman'),
(10, 59456, 16913, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T2 Gloves - Mage'),
(10, 59457, 16928, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T2 Gloves - Warlock'),
(10, 59458, 16899, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2 Gloves - Druid');

-- =============================================================================
-- 6. BOSS LOOT TABLE MODIFICATIONS
-- =============================================================================
-- Replace T2 tier refs with satchel drops
-- Keep other loot (epics, mats, quest items) unchanged

-- ONYXIA (301000) - Helm satchel
-- Current T2 ref: 300000 (all 9 helms), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 301000 AND Reference = 300000;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(301000, 59306, 0, 100, 0, 1, 0, 2, 2, 'Onyxia - Blackwing Armor Cache - Helm (F-025)');

-- CHROMAGGUS (14020) - Shoulder satchel
-- Current T2 ref: 30379 (all 9 shoulders), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 14020 AND Reference = 30379;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(14020, 59307, 0, 100, 0, 1, 0, 2, 2, 'Chromaggus - Blackwing Armor Cache - Shoulder (F-025)');

-- NEFARIAN (11583) - Chest satchel
-- Current T2 ref: 30486 (all 9 chests), MinCount=1, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 11583 AND Reference = 30486;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11583, 59308, 0, 100, 0, 1, 0, 1, 2, 'Nefarian - Blackwing Armor Cache - Chest (F-025)');

-- VAELASTRASZ (13020) - Belt satchel
-- Current T2 ref: 30372 (all 9 belts), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 13020 AND Reference = 30372;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(13020, 59309, 0, 100, 0, 1, 0, 2, 2, 'Vaelastrasz - Blackwing Armor Cache - Belt (F-025)');

-- RAGNAROS (11502) - Legs satchel
-- Current T2 refs: 30484 + 30547 (legs split across two refs), MinCount=1, MaxCount=1 each
DELETE FROM creature_loot_template WHERE Entry = 11502 AND Reference IN (30484, 30547);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11502, 59310, 0, 100, 0, 1, 0, 2, 2, "Ragnaros - Firelord's Armor Cache - Legs (F-025)");

-- BROODLORD LASHLAYER (12017) - Boots satchel
-- Current T2 ref: 30346 (all 9 boots), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 12017 AND Reference = 30346;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12017, 59311, 0, 100, 0, 1, 0, 2, 2, 'Broodlord Lashlayer - Blackwing Armor Cache - Boots (F-025)');

-- RAZORGORE (12435) - Bracers satchel
-- Current T2 ref: 30369 (all 9 bracers), MinCount=2, MaxCount=2
DELETE FROM creature_loot_template WHERE Entry = 12435 AND Reference = 30369;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12435, 59312, 0, 100, 0, 1, 0, 2, 2, 'Razorgore - Blackwing Armor Cache - Bracers (F-025)');

-- FIREMAW (11983) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 11983 AND Reference = 30342;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11983, 59313, 0, 100, 0, 1, 0, 1, 1, 'Firemaw - Blackwing Armor Cache - Gloves (F-025)');

-- EBONROC (14601) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 14601 AND Reference = 30342;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(14601, 59313, 0, 100, 0, 1, 0, 1, 1, 'Ebonroc - Blackwing Armor Cache - Gloves (F-025)');

-- FLAMEGOR (11981) - Gloves satchel
-- Current T2 ref: 30342 (all 9 gloves), MinCount=1, MaxCount=1
DELETE FROM creature_loot_template WHERE Entry = 11981 AND Reference = 30342;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(11981, 59313, 0, 100, 0, 1, 0, 1, 1, 'Flamegor - Blackwing Armor Cache - Gloves (F-025)');
