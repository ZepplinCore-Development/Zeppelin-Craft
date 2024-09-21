-- Make the object always contain something

DELETE FROM `item_loot_template` WHERE (`Entry` = 32724) AND (`Item` IN (32464, 32468, 32470, 32506, 32726));
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(32724, 32464, 0, 0, 0, 1, 0, 1, 5, 'Sludge-covered Object - Nethercite Ore'),
(32724, 32468, 0, 0, 0, 1, 0, 1, 5, 'Sludge-covered Object - Netherdust Pollen'),
(32724, 32470, 0, 0, 0, 1, 0, 1, 5, 'Sludge-covered Object - Nethermine Flayer Hide'),
(32724, 32506, 0, 0, 0, 1, 0, 1, 1, 'Sludge-covered Object - Netherwing Egg'),
(32724, 32726, 0, 0, 0, 1, 0, 1, 1, 'Sludge-covered Object - Murkblood Escape Plans');

-- stack to 20 for QOL
UPDATE `item_template` SET `stackable` = 20 WHERE (`entry` = 32724);