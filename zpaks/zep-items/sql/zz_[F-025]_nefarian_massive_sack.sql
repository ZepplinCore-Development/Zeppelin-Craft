-- Nefarian's Massive Sack (consolidated loot container)
-- Reference loot 30173 contains the sack item 58309

DELETE FROM `reference_loot_template` WHERE (`Entry` = 30173);
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(30173, 58309, 0, 100, 0, 1, 0, 1, 1, 'Nefarian''s Massive Sack (consolidated)');

-- Add reference to Nefarian's loot table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 11583 AND `Item` = 30173);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11583, 30173, 30173, 100, 0, 1, 0, 1, 1, 'Nefarian - Massive Sack');
