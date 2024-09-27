-- Make the Sludge-covered Object always contain something, remove the escape plans
DELETE FROM `item_loot_template` WHERE (`Entry` = 32724);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(32724, 32464, 0, 0, 0, 1, 1, 1, 5, 'Sludge-covered Object - Nethercite Ore'),
(32724, 32468, 0, 0, 0, 1, 1, 1, 5, 'Sludge-covered Object - Netherdust Pollen'),
(32724, 32470, 0, 0, 0, 1, 1, 1, 5, 'Sludge-covered Object - Nethermine Flayer Hide'),
(32724, 32506, 0, 0, 0, 1, 1, 1, 1, 'Sludge-covered Object - Netherwing Egg');

-- reduce Sludge-covered Object drop chance from 50% to 20%
DELETE FROM `creature_loot_template` WHERE (`Entry` = 23286) AND (`Item` IN (32724));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(23286, 32724, 0, 20, 0, 1, 0, 1, 1, 'Black Blood of Draenor - Sludge-covered Object');

-- Move the escape plans to the Murkblood Foreman.
DELETE FROM `creature_loot_template` WHERE (`Entry` = 23305) AND (`Item` IN (32726));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(23305, 32726, 0, 50, 0, 1, 2, 1, 1, 'Crazed Murkblood Foreman - Murkblood Escape Plans');
