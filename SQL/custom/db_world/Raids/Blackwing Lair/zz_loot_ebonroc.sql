DELETE FROM `creature_loot_template` WHERE (`Entry` = 14601);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(14601, 30342, 30342, 100, 0, 1, 0, 1, 1, NULL),
(14601, 30395, 30395, 100, 0, 1, 0, 1, 1, NULL),
(14601, 900000, 900000, 100, 0, 1, 0, 1, 1, NULL);

DELETE FROM `skinning_loot_template` WHERE (`Entry` = 14601);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(14601, 57801, 0, 100, 0, 1, 1, 2, 4, 'Ebonroc - Ancient Dragonscale');
