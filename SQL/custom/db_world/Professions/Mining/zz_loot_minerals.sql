-- 1 - 15 Mining Loot

DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100017);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100017, 774, 0, 10, 0, 1, 2, 1, 1, ''),
(100017, 818, 0, 10, 0, 1, 2, 1, 1, ''),
(100017, 1210, 0, 10, 0, 1, 2, 1, 1, ''),
(100017, 2770, 0, 50, 0, 1, 2, 1, 3, ''),
(100017, 2771, 0, 20, 0, 1, 2, 1, 3, ''),
(100017, 2835, 0, 50, 0, 1, 1, 1, 3, ''),
(100017, 2836, 0, 30, 0, 1, 1, 1, 3, ''),
(100017, 5741, 0, 20, 0, 1, 1, 1, 2, '');

-- 16 - 25 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100020);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100020, 1206, 0, 10, 0, 1, 2, 1, 1, ''),
(100020, 1210, 0, 10, 0, 1, 2, 1, 1, ''),
(100020, 1705, 0, 10, 0, 1, 2, 1, 1, ''),
(100020, 2770, 0, 40, 0, 1, 2, 1, 3, ''),
(100020, 2771, 0, 20, 0, 1, 2, 1, 3, ''),
(100020, 2775, 0, 10, 0, 1, 2, 1, 1, ''),
(100020, 2836, 0, 50, 0, 1, 1, 1, 3, ''),
(100020, 3857, 0, 20, 0, 1, 1, 1, 2, ''),
(100020, 5741, 0, 20, 0, 1, 1, 1, 3, ''),
(100020, 7067, 0, 10, 0, 1, 1, 1, 2, '');

DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100024);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100024, 4553, 0, 0, 0, 1, 0, 1, 1, ''),
(100024, 7067, 0, 0, 0, 1, 0, 1, 1, ''),
(100024, 2838, 0, 0, 0, 1, 0, 1, 1, ''),
(100024, 1705, 0, 0, 0, 1, 1, 1, 1, ''),
(100024, 1206, 0, 0, 0, 1, 1, 1, 1, ''),
(100024, 2772, 0, 0, 0, 1, 1, 1, 1, ''),
(100024, 3864, 0, 0, 0, 1, 1, 1, 1, '');

