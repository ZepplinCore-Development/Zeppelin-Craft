-- 1 - 15 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100016);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100016, 765, 0, 20, 0, 1, 1, 1, 3, 'Silverleaf'),
(100016, 785, 0, 20, 0, 1, 1, 1, 3, 'Mageroyal'),
(100016, 2447, 0, 20, 0, 1, 1, 1, 3, 'Peacebloom'),
(100016, 2449, 0, 20, 0, 1, 1, 1, 3, 'Earthroot'),
(100016, 23331, 0, 20, 0, 1, 1, 1, 2, 'Broken Vine');
-- 16 - 25 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100019);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100019, 2452, 0, 20, 0, 1, 1, 1, 3, 'Swiftthistle'),
(100019, 2450, 0, 20, 0, 1, 1, 1, 3, 'Briarthorn'),
(100019, 2453, 0, 20, 0, 1, 1, 1, 3, 'Bruiseweed'),
(100019, 785, 0, 20, 0, 1, 1, 1, 3, 'Mageroyal'),
(100019, 23331, 0, 20, 0, 1, 1, 1, 3, 'Broken Vine');
-- 26 - 35 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100022);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100022, 3818, 0, 0, 0, 1, 1, 1, 1, 'Fadeleaf'),
(100022, 2453, 0, 0, 0, 1, 1, 1, 1, 'Bruiseweed'),
(100022, 3357, 0, 0, 0, 1, 1, 1, 1, 'Liferoot'),
(100022, 23331, 0, 0, 0, 1, 1, 1, 1, 'Broken Vine'),
(100022, 3356, 0, 0, 0, 1, 1, 1, 1, 'Kingsblood');
