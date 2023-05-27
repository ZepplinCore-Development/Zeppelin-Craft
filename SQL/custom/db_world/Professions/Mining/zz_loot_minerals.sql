-- 1 - 15 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100020);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100020, 774, 0, 10, 0, 1, 2, 1, 1, 'Malachite'),
(100020, 818, 0, 10, 0, 1, 2, 1, 1, 'Tigerseye'),
(100020, 1210, 0, 10, 0, 1, 2, 1, 1, 'Shadowgem'),
(100020, 2770, 0, 50, 0, 1, 2, 1, 3, 'Copper Ore'),
(100020, 2771, 0, 20, 0, 1, 2, 1, 3, 'Tin Ore'),
(100020, 2835, 0, 50, 0, 1, 1, 1, 3, 'Rough Stone'),
(100020, 2836, 0, 30, 0, 1, 1, 1, 3, 'Coarse Stone'),
(100020, 5741, 0, 20, 0, 1, 1, 1, 2, 'Rock Chip');

-- 16 - 25 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100021);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100021, 1206, 0, 10, 0, 1, 2, 1, 1, 'Moss Agate'),
(100021, 1210, 0, 10, 0, 1, 2, 1, 1, 'Shadowgem'),
(100021, 1705, 0, 10, 0, 1, 2, 1, 1, 'Lesser Moonstone'),
(100021, 2770, 0, 40, 0, 1, 2, 1, 3, 'Copper Ore'),
(100021, 2771, 0, 20, 0, 1, 2, 1, 3, 'Tin Ore'),
(100021, 2775, 0, 10, 0, 1, 2, 1, 1, 'Silver Ore'),
(100021, 2836, 0, 50, 0, 1, 1, 1, 3, 'Coarse Stone'),
(100021, 3857, 0, 20, 0, 1, 1, 1, 2, 'Coal'),
(100021, 5741, 0, 20, 0, 1, 1, 1, 3, 'Rock Chip'),
(100021, 7067, 0, 10, 0, 1, 1, 1, 2, 'Elemental Earth');

-- 26 - 35 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100022);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100022, 4553, 0, 0, 0, 1, 1, 1, 1, 'Jagged Piece of Stone'),
(100022, 7067, 0, 0, 0, 1, 1, 1, 1, 'Elemental Earth'),
(100022, 2838, 0, 0, 0, 1, 1, 1, 1, 'Heavy Stone'),
(100022, 1705, 0, 0, 0, 1, 1, 1, 1, 'Lesser Moonstone'),
(100022, 1206, 0, 0, 0, 1, 1, 1, 1, 'Moss Agate'),
(100022, 2772, 0, 0, 0, 1, 1, 1, 1, 'Iron Ore'),
(100022, 3864, 0, 0, 0, 1, 1, 1, 1, 'Citrine');

