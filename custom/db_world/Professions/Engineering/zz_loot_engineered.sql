-- LEVEL 1 - 15 LOOT TABLE
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100018) AND (`Item` IN (4361, 4359, 4363, 2840, 4357));
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100018, 4361, 0, 20, 0, 1, 1, 1, 2, ''),
(100018, 4359, 0, 20, 0, 1, 1, 1, 3, ''),
(100018, 4363, 0, 20, 0, 1, 1, 1, 2, ''),
(100018, 2840, 0, 20, 0, 1, 1, 1, 3, ''),
(100018, 4357, 0, 20, 0, 1, 1, 1, 4, '');

-- LEVEL 16 - 25 LOOT TABLE
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100021);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100021, 4387, 0, 20, 0, 1, 0, 1, 1, 'Iron Strut'),
(100021, 4389, 0, 20, 0, 1, 0, 1, 1, 'Gyrochronatom'),
(100021, 4382, 0, 20, 0, 1, 0, 1, 1, 'Bronze Framework'),
(100021, 4363, 0, 20, 0, 1, 0, 1, 1, 'Copper Modulator'),
(100021, 4371, 0, 20, 0, 1, 0, 1, 1, 'Bronze Tube'),
(100021, 2841, 0, 50, 0, 1, 1, 1, 3, 'Bronze Bar'),
(100021, 4364, 0, 50, 0, 1, 1, 1, 3, 'Coarse Blasting Powder');


