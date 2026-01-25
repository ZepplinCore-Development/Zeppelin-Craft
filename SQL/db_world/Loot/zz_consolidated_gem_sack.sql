-- =============================================================================
-- Consolidated Gem Sack (I-061)
-- Replaces 5 separate colored gem sacks with one that contains all signature gems
-- =============================================================================

-- Item: Nefarian's Massive Sack (58309)
-- Replaces: Blue Sack (17962), Gray Sack (17964), Green Sack (17963),
--           Red Sack (17969), Yellow Sack (17965)

DELETE FROM item_template WHERE entry = 58309;
INSERT INTO item_template (entry, class, subclass, name, displayid, Quality, Flags, BuyPrice, SellPrice, InventoryType, ItemLevel, RequiredLevel, maxcount, stackable, Material, description) VALUES
(58309, 15, 0, 'Nefarian''s Massive Sack', 1623, 3, 4, 0, 0, 0, 60, 0, 1, 1, 0, 'Contains a selection of rare gems from the dragon hoard.');

-- Item loot: Contains all 5 signature gems guaranteed, plus common gems
DELETE FROM item_loot_template WHERE Entry = 58309;
INSERT INTO item_loot_template (Entry, Item, Chance, GroupId, MinCount, MaxCount, Comment) VALUES
-- Signature gems (guaranteed)
(58309, 12361, 100, 0, 1, 1, 'Blue Sapphire'),
(58309, 12800, 100, 0, 1, 1, 'Azerothian Diamond'),
(58309, 12364, 100, 0, 1, 1, 'Huge Emerald'),
(58309, 12799, 100, 0, 1, 1, 'Large Opal'),
(58309, 12363, 100, 0, 1, 1, 'Arcane Crystal'),
-- Common gems (variable)
(58309, 7909, 50, 0, 1, 2, 'Aquamarine'),
(58309, 7910, 50, 0, 1, 2, 'Star Ruby'),
(58309, 1529, 40, 0, 1, 2, 'Jade'),
(58309, 3864, 40, 0, 1, 2, 'Citrine'),
(58309, 7971, 25, 0, 1, 1, 'Black Pearl'),
(58309, 13926, 10, 0, 1, 1, 'Golden Pearl');

-- Update reference loot table 30173 to use consolidated sack instead of 5 separate
-- This affects: Nefarian, Chromaggus, and any other boss using this reference
-- Using Chance=100 GroupId=0 since it's a single guaranteed item (not a pool)
DELETE FROM reference_loot_template WHERE Entry = 30173;
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, MinCount, MaxCount, Comment) VALUES
(30173, 58309, 100, 0, 1, 1, 'Nefarian''s Massive Sack (consolidated)');
