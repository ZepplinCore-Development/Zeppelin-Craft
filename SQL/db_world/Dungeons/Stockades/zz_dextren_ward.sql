-- New Item Templates
DELETE FROM `item_template` WHERE (`entry` = 901107);
INSERT INTO `item_template` SET
    `entry` = 901107,
    `class` = 2,
    `subclass` = 5,
    `name` = 'Grave Digging Shovel',
    `displayid` = 7495,
    `Quality` = 3,
    `BuyPrice` = 9613,
    `SellPrice` = 6232,
    `InventoryType` = 17,
    `ItemLevel` = 28,
    `RequiredLevel` = 22,
    `stat_type1` = 4,
    `stat_value1` = 12,
    `stat_type2` = 7,
    `stat_value2` = 4,
    `dmg_min1` = 36,
    `dmg_max1` = 70,
    `delay` = 2300,
    `bonding` = 1,
    `Material` = 2,
    `sheath` = 1,
    `MaxDurability` = 55,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 42,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901108);
INSERT INTO `item_template` SET
    `entry` = 901108,
    `class` = 2,
    `subclass` = 19,
    `name` = 'Coffin Splinter',
    `displayid` = 28633,
    `Quality` = 3,
    `BuyPrice` = 14958,
    `SellPrice` = 2991,
    `InventoryType` = 26,
    `ItemLevel` = 28,
    `RequiredLevel` = 22,
    `StatsCount` = 0,
    `dmg_min1` = 34,
    `dmg_max1` = 64,
    `dmg_type1` = 3,
    `delay` = 1700,
    `RangedModRange` = 100,
    `bonding` = 1,
    `Material` = 2,
    `MaxDurability` = 60,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 42,
    `VerifiedBuild` = '12340';

-- Update Loot Table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 1663 AND (`Item` = 901107 OR `Item` = 901108));

INSERT INTO `creature_loot_template` SET
    `Entry` = 1663,
    `Item` = 901107,
    `Chance` = 0,
    `GroupId` = 3,
    `Comment` = 'Dextren Ward - Grave Robber Shovel';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1663,
    `Item` = 901108,
    `Chance` = 0,
    `GroupId` = 3,
    `Comment` = 'Dextren Ward - Coffin Splinter';



