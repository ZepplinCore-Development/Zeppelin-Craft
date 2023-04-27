DELETE FROM `creature_loot_template` WHERE (`Entry` = 17606) AND (`Item` IN (23873));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(17606, 23873, 0, 10, 1, 1, 0, 1, 1, 'Sunhawk Reclaimer - Galaen\'s Amulet');

