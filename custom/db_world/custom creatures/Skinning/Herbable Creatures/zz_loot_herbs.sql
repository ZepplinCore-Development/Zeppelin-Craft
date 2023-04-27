-- 1 - 15 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100016);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100016, 765, 0, 20, 0, 1, 1, 1, 3, ''),
(100016, 785, 0, 20, 0, 1, 1, 1, 3, ''),
(100016, 2447, 0, 20, 0, 1, 1, 1, 3, ''),
(100016, 2449, 0, 20, 0, 1, 1, 1, 3, ''),
(100016, 23331, 0, 20, 0, 1, 1, 1, 2, '');
-- 16 - 25 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100019);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100019, 2452, 0, 20, 0, 1, 1, 1, 3, ''),
(100019, 2450, 0, 20, 0, 1, 1, 1, 3, ''),
(100019, 2453, 0, 20, 0, 1, 1, 1, 3, ''),
(100019, 785, 0, 20, 0, 1, 1, 1, 3, ''),
(100019, 23331, 0, 20, 0, 1, 1, 1, 3, '');

