-- Vulture Gizzard
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8396);

-- Spiteflayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8299) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8299, 0, 8396, 0);

-- Spiteflayer Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8299) AND (`Item` IN (8396));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(8299, 8396, 0, 100, 0, 1, 0, 1, 1, 'Spiteflayer - Vulture Gizzard');

-- Black Slayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5982) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5982, 0, 8396, 0);

-- Black Slayer Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5982) AND (`Item` IN (8396));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5982, 8396, 0, 100, 0, 1, 0, 1, 1, 'Black Slayer - Vulture Gizzard');

-- Bonepicker Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5983) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5983, 0, 8396, 0);

-- Bonepicker Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5983) AND (`Item` IN (8396));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5983, 8396, 0, 100, 0, 1, 0, 1, 1, 'Bonepicker - Vulture Gizzard');