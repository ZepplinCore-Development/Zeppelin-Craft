DELETE FROM `creature_loot_template` WHERE (`Entry` = 9019) AND (`Item` IN (57206, 57502));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(9019, 57206, 0, 100, 0, 1, 0, 1, 1, 'Emperor Dagran Thaurissan - Schematic: Thorium Headed Arrows'),
(9019, 57502, 0, 100, 0, 1, 0, 1, 1, 'Emperor Dagran Thaurissan - Design: Black Diamond Dragonling');