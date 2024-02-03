-- Snickerfang Jowl
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8391);

-- Snickerfang Hyena Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5985) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5985, 0, 8391, 0);

-- Snickerfang Hyena Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5985) AND (`Item` IN (8391));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5985, 8391, 0, 100, 0, 1, 0, 1, 1, 'Snickerfang Hyena - Snickerfang Jowl');

-- Ravage Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8300) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8300, 0, 8391, 0);

-- Ravage Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8300) AND (`Item` IN (8391));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(8300, 8391, 0, 100, 0, 1, 0, 1, 1, 'Snickerfang Hyena - Snickerfang Jowl');

-- Starving Snickerfang Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5984) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5984, 0, 8391, 0);

-- Starving Snickerfang Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5984) AND (`Item` IN (8391));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5984, 8391, 0, 100, 0, 1, 0, 1, 1, 'Starving Snickerfang - Snickerfang Jowl');