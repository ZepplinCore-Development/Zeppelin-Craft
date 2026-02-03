DELETE FROM `reference_loot_template` WHERE (`Entry` = 11104) AND (`Item` IN (12238));
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11104, 12238, 0, 28, 0, 1, 1, 1, 1, '');
