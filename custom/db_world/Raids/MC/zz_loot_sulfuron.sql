DELETE FROM `creature_loot_template` WHERE (`Entry` = 12098);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(12098, 7068, 0, 30, 0, 1, 0, 1, 6, NULL),
(12098, 7077, 0, 30, 0, 1, 0, 1, 3, NULL),
(12098, 7078, 0, 40, 0, 1, 0, 1, 2, NULL),
(12098, 17330, 0, 100, 1, 1, 0, 1, 1, NULL),
(12098, 20951, 0, 1, 1, 1, 0, 1, 1, NULL),
(12098, 30355, 30355, 100, 0, 1, 0, 1, 1, NULL),
(12098, 30356, 30356, 100, 0, 1, 0, 1, 1, NULL),
(12098, 2404, 0, 100, 0, 1, 0, 1, 1, 'Drums Recipe');
