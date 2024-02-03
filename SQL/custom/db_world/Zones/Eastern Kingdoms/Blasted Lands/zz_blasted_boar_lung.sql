-- Blasted Boar Lung
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8392);

-- Ashmane Boar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5992) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5992, 0, 8392, 0);

-- Ashmane Boar Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5992) AND (`Item` IN (8392));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5992, 8392, 0, 100, 0, 1, 0, 1, 1, 'Ashmane Boar - Blasted Boar Lung');

-- Helboar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5993) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5993, 0, 8392, 0);

-- Helboar Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5993) AND (`Item` IN (8392));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5993, 8392, 0, 100, 0, 1, 0, 1, 1, 'Helboar - Blasted Boar Lung');

-- Grunter Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8303) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8303, 0, 8392, 0);

-- Grunter Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8303) AND (`Item` IN (8392));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(8303, 8392, 0, 100, 0, 1, 0, 1, 1, 'Grunter - Blasted Boar Lung');
