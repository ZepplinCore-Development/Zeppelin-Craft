-- Pattern: Drums of Forgotten Kings drop from Nefarian
DELETE FROM `creature_loot_template` WHERE (`Entry` = 11583 AND `Item` = 2599);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11583, 2599, 0, 100, 0, 1, 0, 1, 1, 'Pattern: Drums of Forgotten Kings');

-- Ancient Dragonscale skinning from Nefarian
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11583);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11583, 57801, 0, 100, 0, 1, 1, 5, 8, 'Nefarian - Ancient Dragonscale');
