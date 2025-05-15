-- New Item Templates
DELETE FROM `item_template` WHERE (`entry` = 901109);
INSERT INTO `item_template` SET
    `entry` = 901109,
    `class` = 4,
    `subclass` = 2,
    `name` = 'Thredded Belt',
    `displayid` = 17114,
    `Quality` = 3,
    `BuyPrice` = 5690,
    `SellPrice` = 3700,
    `InventoryType` = 6,
    `ItemLevel` = 27,
    `RequiredLevel` = 22,
    `StatsCount` = 2,
    `stat_type1` = 3,
    `stat_value1` = 10,
    `stat_type2` = 7,
    `stat_value2` = 4,
    `armor` = 55,
    `delay` = 0,
    `bonding` = 1,
    `Material` = 8,
    `MaxDurability` = 20,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901110);
INSERT INTO `item_template` SET
    `entry` = 901110,
    `class` = 2,
    `subclass` = 18,
    `name` = 'Needle Thredder',
    `displayid` = 11247,
    `Quality` = 3,
    `BuyPrice` = 12733,
    `SellPrice` = 2546,
    `InventoryType` = 26,
    `ItemLevel` = 27,
    `RequiredLevel` = 22,
    `stat_type1` = 3,
    `stat_value1` = 2,
    `dmg_min1` = 34,
    `dmg_max1` = 56,
    `delay` = 3200,
    `ammo_type` = 2,
    `RangedModRange` = 100,
    `bonding` = 1,
    `Material` = 2,
    `MaxDurability` = 60,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 24,
    `VerifiedBuild` = '12340';

-- Update Loot Table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 1716 AND (`Item` = 901109 OR `Item` = 901110));

INSERT INTO `creature_loot_template` SET
    `Entry` = 1716,
    `Item` = 901109,
    `Chance` = 0,
    `GroupId` = 2,
    `Comment` = 'Bazil Thredd - Thredded Belt';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1716,
    `Item` = 901110,
    `Chance` = 0,
    `GroupId` = 2,
    `Comment` = 'Bazil Thredd - Needle Thredder';

