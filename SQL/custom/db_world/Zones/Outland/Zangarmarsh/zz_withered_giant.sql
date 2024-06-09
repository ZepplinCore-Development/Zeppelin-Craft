-- Increased drop chance  of the scout report from 5% to 15%.
DELETE FROM `creature_loot_template` WHERE (`Entry` = 18124) AND (`Item` IN (24373));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18124, 24373, 0, 15, 1, 1, 0, 1, 1, 'Withered Giant - Scout Jyoba''s Report');
