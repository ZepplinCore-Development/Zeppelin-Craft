DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 21762) AND (`Item` IN (0));
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(21762, 0, 12003, 100, 0, 1, 0, 1, 1, '');
