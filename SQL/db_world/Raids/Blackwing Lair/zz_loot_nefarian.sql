DELETE FROM `creature_loot_template` WHERE (`Entry` = 11583);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11583, 19002, 0, 100, 0, 1, 0, 1, 1, NULL),
(11583, 19003, 0, 100, 0, 1, 0, 1, 1, NULL),
(11583, 21138, 0, 100, 1, 1, 0, 1, 1, NULL),
(11583, 21142, 0, 100, 1, 1, 0, 1, 1, NULL),
(11583, 30044, 30044, 0.05, 0, 1, 0, 1, 1, NULL),
(11583, 30089, 30089, 1, 0, 1, 5, 1, 1, NULL),
(11583, 30105, 30105, 0.05, 0, 1, 0, 1, 1, NULL),
(11583, 30171, 30171, 0.05, 0, 1, 0, 1, 1, NULL),
(11583, 30172, 30172, 100, 0, 1, 0, 1, 1, NULL),
(11583, 30173, 30173, 100, 0, 1, 0, 1, 1, NULL),
(11583, 30330, 30330, 0.05, 0, 1, 0, 1, 1, NULL),
(11583, 30486, 30486, 100, 0, 1, 0, 1, 2, NULL),
(11583, 30487, 30487, 100, 0, 1, 0, 1, 1, NULL),
(11583, 30551, 30551, 100, 0, 1, 0, 1, 1, NULL),
(11583, 2599, 0, 100, 0, 1, 0, 1, 1, 'Pattern: Drums of Forgotton Kings');

DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11583);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(11583, 57801, 0, 100, 0, 1, 1, 5, 8, 'Nefarian - Ancient Dragonscale');

