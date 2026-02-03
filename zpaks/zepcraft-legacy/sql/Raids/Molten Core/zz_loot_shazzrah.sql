-- Added Formula: Mystic Resonator to the loot table for Shazzrah
DELETE FROM `creature_loot_template` WHERE `Item` = 57100;
INSERT INTO `creature_loot_template` (Entry, Item, Chance, GroupId, Comment) VALUES
(12264, 57100, 5, 1, 'Formula: Mystic Resonator');
