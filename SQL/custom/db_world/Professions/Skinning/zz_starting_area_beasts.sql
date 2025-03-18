-- Starting creature skinning table
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 299);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(299, 2934, 0, 100, 0, 1, 0, 1, 3, '');

-- Young Wolf
UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 299;

-- Timber Wolf
UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 69;

-- Ragged Young Wolf
UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 705;

-- Young Thistle Boar
UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1984;