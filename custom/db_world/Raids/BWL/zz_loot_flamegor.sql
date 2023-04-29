DELETE FROM `creature_loot_template` WHERE (`Entry` = 11981);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11981, 30337, 30337, 100, 0, 1, 0, 1, 1, NULL),
(11981, 30342, 30342, 100, 0, 1, 0, 1, 1, NULL),
(11981, 900000, 900000, 100, 0, 1, 0, 1, 1, NULL);
