-- Scorpok Pincer
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8393);

-- Scorpok Stinger Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5988) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5988, 0, 8393, 0);

-- Scorpok Stinger Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5988) AND (`Item` IN (8393));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5988, 8393, 0, 100, 1, 1, 0, 1, 1, 'Scorpok Stinger - Scorpok Pincer');

-- Clack the Reaver Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8301) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8301, 0, 8393, 0);

-- Clack the Reaver Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8301) AND (`Item` IN (8393));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(8301, 8393, 0, 100, 1, 1, 0, 1, 1, 'Scorpok Stinger - Scorpok Pincer');

