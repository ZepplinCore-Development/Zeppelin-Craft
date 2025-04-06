DELETE FROM `creature_loot_template` WHERE (`Entry` = 17306) AND (`Item` IN (57207));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(17306, 57207, 0, 100, 0, 1, 0, 1, 1, 'Schematic: Fel Iron Arrows');
