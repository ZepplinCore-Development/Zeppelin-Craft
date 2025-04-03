-- Kam's Walking Stick -> Walking Stick of Kam
-- Rebalanced the item to be more suitable for hunters to claim
-- AGI as a side stat is worthless for casters.
UPDATE `item_template` SET
    `name` = 'Walking Stick of Kam',
    `Quality` = 3,
    `InventoryType` = 17,
    `stat_type1` = 3,
    `stat_value1` = 8,
    `stat_type2` = 5,
    `stat_value2` = 4
WHERE (`entry` = 2280);

-- Add New Items
DELETE FROM `item_template` WHERE (`entry` = 901102);
INSERT INTO `item_template` SET
    `entry` = 901102,
    `class` = 2,
    `subclass` = 4,
    `name` = 'Tim Kam Slam',
    `displayid` = 8567,
    `Quality` = 3,
    `BuyPrice` = 16383,
    `SellPrice` = 3276,
    `InventoryType` = 13,
    `ItemLevel` = 25,
    `RequiredLevel` = 20,
    `StatsCount` = 2,
    `stat_type1` = 4,
    `stat_value1` = 4,
    `stat_type2` = 7,
    `stat_value2` = 4,
    `dmg_min1` = 29,
    `dmg_max1` = 54,
    `delay` = 2400,
    `bonding` = 1,
    `Material` = 2,
    `sheath` = 3,
    `MaxDurability` = 75,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 41,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901103);
INSERT INTO `item_template` SET
    `entry` = 901103,
    `class` = 4,
    `subclass` = 3,
    `name` = 'Deepfury Mantle',
    `displayid` = 28444,
    `Quality` = 3,
    `BuyPrice` = 11563,
    `SellPrice` = 2312,
    `InventoryType` = 3,
    `ItemLevel` = 26,
    `RequiredLevel` = 22,
    `StatsCount` = 2,
    `stat_type1` = 7,
    `stat_value1` = 4,
    `stat_type2` = 4,
    `stat_value2` = 9,
    `armor` = 160,
    `delay` = 0,
    `bonding` = 1,
    `Material` = 5,
    `MaxDurability` = 70,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 42,
    `VerifiedBuild` = '12340';

-- Update loot tables   
DELETE FROM `creature_loot_template` WHERE (`Entry` = 1666) AND `Item` IN (2280, 901102, 901103);

INSERT INTO `creature_loot_template` SET
    `Entry` = 1666,
    `Item` = 2280,
    `Chance` = 0,
    `GroupId` = 5,
    `Comment` = 'Kam Deepfury - Walking Stick of Kam';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1666,
    `Item` = 901102,
    `Chance` = 0,
    `GroupId` = 5,
    `Comment` = 'Kam Deepfury - Tim Kam Slam';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1666,
    `Item` = 901103,
    `Chance` = 0,
    `GroupId` = 5,
    `Comment` = 'Kam Deepfury - Deepfury Mantle';
