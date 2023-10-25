DELETE FROM `creature_loot_template` WHERE (`Entry` = 428) AND (`Item` IN (1080));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(428, 1080, 0, 50, 0, 1, 0, 1, 1, 'Dire Condor - Tough Condor Meat');
