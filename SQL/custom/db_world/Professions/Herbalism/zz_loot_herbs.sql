-- 1 - 15 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100010);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100010, 765, 0, 0, 0, 1, 1, 1, 3, 'Silverleaf'),
(100010, 785, 0, 0, 0, 1, 1, 1, 3, 'Mageroyal'),
(100010, 2447, 0, 0, 0, 1, 1, 1, 3, 'Peacebloom'),
(100010, 2449, 0, 0, 0, 1, 1, 1, 3, 'Earthroot'),
(100010, 2452, 0, 0, 0, 1, 1, 1, 3, 'Swiftthistle'),
(100010, 2450, 0, 0, 0, 1, 1, 1, 3, 'Briarthorn'),
(100010, 23331, 0, 0, 0, 1, 1, 1, 2, 'Broken Vine');

-- 16 - 25 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100011);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100011, 2452, 0, 0, 0, 1, 1, 1, 3, 'Swiftthistle'),
(100011, 2450, 0, 0, 0, 1, 1, 1, 3, 'Briarthorn'),
(100011, 2453, 0, 0, 0, 1, 1, 1, 3, 'Bruiseweed'),
(100011, 3820, 0, 0, 0, 1, 1, 1, 3, 'Stranglekelp'),
(100011, 3355, 0, 0, 0, 1, 1, 1, 3, 'Wild Steelbloom'),
(100011, 3369, 0, 0, 0, 1, 1, 1, 3, 'Grave Moss'),
(100011, 3356, 0, 0, 0, 1, 1, 1, 1, 'Kingsblood'),
(100011, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 26 - 35 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100012);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100012, 3356, 0, 0, 0, 1, 1, 1, 1, 'Kingsblood'),
(100012, 3357, 0, 0, 0, 1, 1, 1, 1, 'Liferoot'),
(100012, 3818, 0, 0, 0, 1, 1, 1, 1, 'Fadeleaf'),
(100012, 3821, 0, 0, 0, 1, 1, 1, 1, 'Goldthorn'),
(100012, 3358, 0, 0, 0, 1, 1, 1, 3, 'Khadgars Whisker'),
(100012, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 36 - 45 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100013);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100013, 3821, 0, 0, 0, 1, 1, 1, 1, 'Goldthorn'),
(100013, 3358, 0, 0, 0, 1, 1, 1, 3, 'Khadgars Whisker'),
(100013, 3819, 0, 0, 0, 1, 1, 1, 1, 'Wintersbite'),
(100013, 4625, 0, 0, 0, 1, 1, 1, 1, 'Firebloom'),
(100013, 8831, 0, 0, 0, 1, 1, 1, 1, 'Purple Lotus'),
(100013, 8836, 0, 0, 0, 1, 1, 1, 1, 'Arthas Tears'),
(100013, 8838, 0, 0, 0, 1, 1, 1, 1, 'Sungrass'),
(100013, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 46 - 55 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100014);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100014, 8831, 0, 0, 0, 1, 1, 1, 1, 'Purple Lotus'),
(100014, 8836, 0, 0, 0, 1, 1, 1, 1, 'Arthas Tears'),
(100014, 8838, 0, 0, 0, 1, 1, 1, 1, 'Sungrass'),
(100014, 8839, 0, 0, 0, 1, 1, 1, 1, 'Blindweed'),
(100014, 8845, 0, 0, 0, 1, 1, 1, 1, 'Ghost Mushroom'),
(100014, 8846, 0, 0, 0, 1, 1, 1, 1, 'Gromsblood'),
(100014, 13464, 0, 0, 0, 1, 1, 1, 1, 'Golden Sansam'),
(100014, 13463, 0, 0, 0, 1, 1, 1, 1, 'Dreamfoil'),
(100014, 13465, 0, 0, 0, 1, 1, 1, 1, 'Mountain Silversage'),
(100014, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 56 - 60 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100015);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100015, 13463, 0, 20, 0, 1, 1, 1, 1, 'Dreamfoil'),
(100015, 13465, 0, 20, 0, 1, 1, 1, 1, 'Mountain Silversage'),
(100015, 13466, 0, 20, 0, 1, 1, 1, 1, 'Plaguebloom'),
(100015, 13467, 0, 20, 0, 1, 1, 1, 1, 'Icecap'),
(100015, 13468, 0, 5, 0, 1, 1, 1, 1, 'Black Lotus'),
(100015, 23331, 0, 15, 0, 1, 1, 1, 3, 'Broken Vine');