-- Basilisk Brain
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = 8394);

-- Redstone Basilisk Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5990) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5990, 0, 8394, 0);

-- Redstone Basilisk Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5990) AND (`Item` IN (8394));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5990, 8394, 0, 100, 1, 1, 0, 1, 1, 'Redstone Basilisk - Basilisk Brain');

-- Redstone Crystalhide Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5991) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(5991, 0, 8394, 0);

-- Redstone Crystalhide Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5991) AND (`Item` IN (8394));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(5991, 8394, 0, 100, 1, 1, 0, 1, 1, 'Redstone Crystalhide - Basilisk Brain');

-- Deatheye Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8302) AND (`Idx` IN (0));
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(8302, 0, 8394, 0);

-- Deatheye Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8302) AND (`Item` IN (8394));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(8302, 8394, 0, 100, 1, 1, 0, 1, 1, 'Deatheye - Basilisk Brain');