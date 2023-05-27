-- LEVEL 1 - 15 LOOT TABLE
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100030);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100030, 4361, 0, 20, 0, 1, 1, 1, 2, 'Copper Tube'),
(100030, 4359, 0, 20, 0, 1, 1, 1, 3, 'Handful of Copper Bolts'),
(100030, 4363, 0, 20, 0, 1, 1, 1, 2, 'Copper Modulator'),
(100030, 2840, 0, 20, 0, 1, 1, 1, 3, 'Copper Bar'),
(100030, 4357, 0, 20, 0, 1, 1, 1, 4, 'Rough Blasting Powder');

-- LEVEL 16 - 25 LOOT TABLE
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100031);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100031, 4387, 0, 20, 0, 1, 0, 1, 1, 'Iron Strut'),
(100031, 4389, 0, 20, 0, 1, 0, 1, 1, 'Gyrochronatom'),
(100031, 4382, 0, 20, 0, 1, 0, 1, 1, 'Bronze Framework'),
(100031, 4363, 0, 20, 0, 1, 0, 1, 1, 'Copper Modulator'),
(100031, 4371, 0, 20, 0, 1, 0, 1, 1, 'Bronze Tube'),
(100031, 2841, 0, 50, 0, 1, 1, 1, 3, 'Bronze Bar'),
(100031, 4364, 0, 50, 0, 1, 1, 1, 3, 'Coarse Blasting Powder');

-- LEVEL 26 - 35 LOOT TABLE
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100032);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100032, 4387, 0, 20, 0, 1, 0, 1, 1, 'Iron Strut'),
(100032, 4389, 0, 20, 0, 1, 0, 1, 1, 'Gyrochronatom'),
(100032, 4382, 0, 20, 0, 1, 0, 1, 1, 'Bronze Framework'),
(100032, 4363, 0, 20, 0, 1, 0, 1, 1, 'Copper Modulator'),
(100032, 4371, 0, 20, 0, 1, 0, 1, 1, 'Bronze Tube'),
(100032, 2841, 0, 50, 0, 1, 1, 1, 3, 'Bronze Bar'),
(100032, 4364, 0, 50, 0, 1, 1, 1, 3, 'Coarse Blasting Powder');
