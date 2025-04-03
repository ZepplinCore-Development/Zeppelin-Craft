DELETE FROM `creature_loot_template` WHERE (`Entry` = 12264);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(12264, 7068, 0, 30, 0, 1, 0, 1, 6, NULL),
(12264, 7077, 0, 30, 0, 1, 0, 1, 3, NULL),
(12264, 7078, 0, 40, 0, 1, 0, 1, 2, NULL),
(12264, 17332, 0, 100, 1, 1, 0, 1, 1, NULL),
(12264, 20951, 0, 1, 1, 1, 0, 1, 1, NULL),
(12264, 30001, 30001, 10, 0, 1, 0, 1, 1, NULL),
(12264, 30367, 30367, 100, 0, 1, 0, 1, 1, NULL),
(12264, 30368, 30368, 100, 0, 1, 0, 1, 1, NULL),
(12264, 57100, 0, 100, 0, 1, 1, 1, 1, 'Formula: Mystic Resonator');
