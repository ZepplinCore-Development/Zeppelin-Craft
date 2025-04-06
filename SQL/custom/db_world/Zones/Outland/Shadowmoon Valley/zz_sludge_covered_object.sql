-- Make the Sludge-covered Object always contain something, remove the escape plans
DELETE FROM `item_loot_template` WHERE `Entry` = 32724;

INSERT INTO `item_loot_template` SET
    `Entry` = 32724,
    `Item` = 32464,
    `Chance` = 30.0,
    `GroupId` = 1,
    `MaxCount` = 5,
    `Comment` = 'Sludge-covered Object - Nethercite Ore';

INSERT INTO `item_loot_template` SET
    `Entry` = 32724,
    `Item` = 32468,
    `Chance` = 30.0,
    `GroupId` = 1,
    `MaxCount` = 5,
    `Comment` = 'Sludge-covered Object - Netherdust Pollen';

INSERT INTO `item_loot_template` SET
    `Entry` = 32724,
    `Item` = 32470,
    `Chance` = 30.0,
    `GroupId` = 1,
    `MaxCount` = 5,
    `Comment` = 'Sludge-covered Object - Nethermine Flayer Hide';

INSERT INTO `item_loot_template` SET
    `Entry` = 32724,
    `Item` = 32506,
    `Chance` = 10.0,
    `GroupId` = 1,
    `Comment` = 'Sludge-covered Object - Netherwing Egg';

-- Reduce Sludge-covered Object drop chance from 50% to 20%
DELETE FROM `creature_loot_template` WHERE (`Entry` = 23286 AND `Item` = 32724);
INSERT INTO `creature_loot_template` SET
    `Entry` = 23286,
    `Item` = 32724,
    `Chance` = 20,
    `Comment` = 'Black Blood of Draenor - Sludge-covered Object';


-- Move the escape plans to the Murkblood Foreman.
DELETE FROM `creature_loot_template` WHERE (`Entry` = 23305 AND `Item` = 32726);
INSERT INTO `creature_loot_template` SET
    `Entry` = 23305,
    `Item` = 32726,
    `Chance` = 50,
    `GroupId` = 2,
    `Comment` = 'Crazed Murkblood Foreman - Murkblood Escape Plans';

-- Move conditions over to the Murkblood Foreman.
UPDATE `conditions` SET `SourceGroup` = 23305 WHERE (`SourceTypeOrReferenceId` = 1) AND (`SourceGroup` = 23286) AND (`SourceEntry` = 32726);
UPDATE `conditions` SET `SourceGroup` = 23305 WHERE (`SourceTypeOrReferenceId` = 1) AND (`SourceGroup` = 32724) AND (`SourceEntry` = 32726);
