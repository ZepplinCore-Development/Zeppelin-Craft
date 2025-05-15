-- Add New Items
DELETE FROM `item_template` WHERE (`entry` = 901104);
INSERT INTO `item_template` SET
    `entry` = 901104,
    `class` = 4,
    `subclass` = 1,
    `name` = 'Ogre Bracelets',
    `displayid` = 28656,
    `Quality` = 3,
    `BuyPrice` = 6081,
    `SellPrice` = 1216,
    `InventoryType` = 9,
    `ItemLevel` = 27,
    `RequiredLevel` = 22,
    `StatsCount` = 2,
    `stat_type1` = 5,
    `stat_value1` = 7,
    `stat_type2` = 7,
    `stat_value2` = 3,
    `armor` = 20,
    `delay` = 0,
    `bonding` = 1,
    `Material` = 7,
    `MaxDurability` = 30,
    `RequiredDisenchantSkill` = 75,
    `DisenchantID` = 43,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901105);
INSERT INTO `item_template` SET
    `entry` = 901105,
    `class` = 4,
    `subclass` = 6,
    `name` = 'Ogre Bowl',
    `displayid` = 6274,
    `Quality` = 3,
    `BuyPrice` = 10337,
    `SellPrice` = 2067,
    `InventoryType` = 14,
    `ItemLevel` = 25,
    `RequiredLevel` = 20,
    `StatsCount` = 2,
    `stat_type1` = 6,
    `stat_value1` = 4,
    `stat_type2` = 5,
    `stat_value2` = 5,
    `armor` = 566,
    `delay` = 0,
    `bonding` = 1,
    `description` = 'Do not ask what he kept in here',
    `Material` = 1,
    `sheath` = 4,
    `block` = 11,
    `MaxDurability` = 90,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 41,
    `VerifiedBuild` = '12340';

DELETE FROM `item_template` WHERE (`entry` = 901106);
INSERT INTO `item_template` SET
    `entry` = 901106,
    `class` = 4,
    `subclass` = 1,
    `name` = 'Ogre Mantle',
    `displayid` = 4904,
    `Quality` = 3,
    `BuyPrice` = 6855,
    `SellPrice` = 1371,
    `InventoryType` = 3,
    `ItemLevel` = 28,
    `RequiredLevel` = 22,
    `stat_type1` = 5,
    `stat_value1` = 10,
    `stat_type2` = 6,
    `stat_value2` = 4,
    `armor` = 32,
    `delay` = 0,
    `bonding` = 1,
    `Material` = 7,
    `MaxDurability` = 45,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = '12340';

-- Update Loot Table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 1717 AND (`Item` = 901104 OR `Item` = 901105 OR `Item` = 901106));

INSERT INTO `creature_loot_template` SET
    `Entry` = 1717,
    `Item` = 901104,
    `Chance` = 0,
    `GroupId` = 2,
    `Comment` = 'Hamhock - Ogre Bracelets';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1717,
    `Item` = 901105,
    `Chance` = 0,
    `GroupId` = 2,
    `Comment` = 'Hamhock - Ogre Bowl';

INSERT INTO `creature_loot_template` SET
    `Entry` = 1717,
    `Item` = 901106,
    `Chance` = 0,
    `GroupId` = 2,
    `Comment` = 'Hamhock - Ogre Mantle';

-- Replace chain lightning spell id (was 421) for level scaling damage
UPDATE `smart_scripts` SET `action_param1` = 15305 WHERE (`action_param1` = 421 AND `entryorguid` = 1717);

