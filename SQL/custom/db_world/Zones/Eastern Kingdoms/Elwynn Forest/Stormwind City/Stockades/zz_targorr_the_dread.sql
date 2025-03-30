-- Add New Items
DELETE FROM `item_template` WHERE (`entry` = 901100);
INSERT INTO `item_template` SET
    `entry` = 901100,
    `class` = 2,
    `subclass` = 7,
    `name` = 'Dread Sword',
    `displayid` = 32077,
    `Quality` = 3,
    `BuyPrice` = 27461,
    `SellPrice` = 3492,
    `InventoryType` = 13,
    `ItemLevel` = 26,
    `RequiredLevel` = 20,
    `StatsCount` = 2,
    `dmg_min1` = 24,
    `dmg_max1` = 48,
    `delay` = 2000,
    `spellid_1` = 14106,
    `spelltrigger_1` = 2,
    `spellppmRate_1` = 1,
    `bonding` = 1,
    `Material` = 1,
    `sheath` = 3,
    `MaxDurability` = 90,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901101);
INSERT INTO `item_template` SET
    `entry` = 901101,
    `class` = 4,
    `subclass` = 2,
    `name` = 'Dread Shoulders',
    `displayid` = 11274,
    `Quality` = 3,
    `BuyPrice` = 5816,
    `SellPrice` = 1163,
    `InventoryType` = 3,
    `ItemLevel` = 26,
    `RequiredLevel` = 21,
    `stat_type1` = 38,
    `stat_value1` = 20,
    `armor` = 67,
    `delay` = 0,
    `bonding` = 1,
    `Material` = 8,
    `MaxDurability` = 50,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = '12340';

-- Update Loot Table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 1696) AND (`Item` IN (901100, 901101));
INSERT INTO `creature_loot_template` SET
    `Entry` = 1696,
    `Item` = 901100,
    `Chance` = 0,
    `GroupId` = 4,
    `Comment` = 'Targorr the Dread - Dread Sword';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1696,
    `Item` = 901101,
    `Chance` = 0,
    `GroupId` = 4,
    `Comment` = 'Targorr the Dread - Dread Shoulders';

