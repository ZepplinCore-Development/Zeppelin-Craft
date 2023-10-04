-- 1 - 15 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100040);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100040, 765, 0, 0, 0, 1, 1, 1, 3, 'Silverleaf'),
(100040, 785, 0, 0, 0, 1, 1, 1, 3, 'Mageroyal'),
(100040, 2447, 0, 0, 0, 1, 1, 1, 3, 'Peacebloom'),
(100040, 2449, 0, 0, 0, 1, 1, 1, 3, 'Earthroot'),
(100040, 2452, 0, 0, 0, 1, 1, 1, 3, 'Swiftthistle'),
(100040, 2450, 0, 0, 0, 1, 1, 1, 3, 'Briarthorn'),
(100040, 23331, 0, 0, 0, 1, 1, 1, 2, 'Broken Vine');

-- 16 - 25 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100041);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100041, 2452, 0, 0, 0, 1, 1, 1, 3, 'Swiftthistle'),
(100041, 2450, 0, 0, 0, 1, 1, 1, 3, 'Briarthorn'),
(100041, 2453, 0, 0, 0, 1, 1, 1, 3, 'Bruiseweed'),
(100041, 3820, 0, 0, 0, 1, 1, 1, 3, 'Stranglekelp'),
(100041, 3355, 0, 0, 0, 1, 1, 1, 3, 'Wild Steelbloom'),
(100041, 3369, 0, 0, 0, 1, 1, 1, 3, 'Grave Moss'),
(100041, 3356, 0, 0, 0, 1, 1, 1, 1, 'Kingsblood'),
(100041, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 26 - 35 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100042);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100042, 3356, 0, 0, 0, 1, 1, 1, 1, 'Kingsblood'),
(100042, 3357, 0, 0, 0, 1, 1, 1, 1, 'Liferoot'),
(100042, 3818, 0, 0, 0, 1, 1, 1, 1, 'Fadeleaf'),
(100042, 3821, 0, 0, 0, 1, 1, 1, 1, 'Goldthorn'),
(100042, 3358, 0, 0, 0, 1, 1, 1, 3, 'Khadgars Whisker'),
(100042, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 36 - 45 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100043);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100043, 3821, 0, 0, 0, 1, 1, 1, 1, 'Goldthorn'),
(100043, 3358, 0, 0, 0, 1, 1, 1, 3, 'Khadgars Whisker'),
(100043, 3819, 0, 0, 0, 1, 1, 1, 1, 'Wintersbite'),
(100043, 4625, 0, 0, 0, 1, 1, 1, 1, 'Firebloom'),
(100043, 8831, 0, 0, 0, 1, 1, 1, 1, 'Purple Lotus'),
(100043, 8836, 0, 0, 0, 1, 1, 1, 1, 'Arthas Tears'),
(100043, 8838, 0, 0, 0, 1, 1, 1, 1, 'Sungrass'),
(100043, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 46 - 55 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100044);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100044, 8831, 0, 0, 0, 1, 1, 1, 1, 'Purple Lotus'),
(100044, 8836, 0, 0, 0, 1, 1, 1, 1, 'Arthas Tears'),
(100044, 8838, 0, 0, 0, 1, 1, 1, 1, 'Sungrass'),
(100044, 8839, 0, 0, 0, 1, 1, 1, 1, 'Blindweed'),
(100044, 8845, 0, 0, 0, 1, 1, 1, 1, 'Ghost Mushroom'),
(100044, 8846, 0, 0, 0, 1, 1, 1, 1, 'Gromsblood'),
(100044, 13464, 0, 0, 0, 1, 1, 1, 1, 'Golden Sansam'),
(100044, 13463, 0, 0, 0, 1, 1, 1, 1, 'Dreamfoil'),
(100044, 13465, 0, 0, 0, 1, 1, 1, 1, 'Mountain Silversage'),
(100044, 23331, 0, 0, 0, 1, 1, 1, 3, 'Broken Vine');

-- 56 - 60 Herbalism Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100045);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100045, 13463, 0, 20, 0, 1, 1, 1, 1, 'Dreamfoil'),
(100045, 13465, 0, 20, 0, 1, 1, 1, 1, 'Mountain Silversage'),
(100045, 13466, 0, 20, 0, 1, 1, 1, 1, 'Plaguebloom'),
(100045, 13467, 0, 20, 0, 1, 1, 1, 1, 'Icecap'),
(100045, 13468, 0, 5, 0, 1, 1, 1, 1, 'Black Lotus'),
(100045, 23331, 0, 15, 0, 1, 1, 1, 3, 'Broken Vine');