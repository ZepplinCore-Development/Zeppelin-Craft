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

DELETE FROM `creature_loot_template` WHERE (`Entry` = 1717 AND (`Item` = 901104 OR `Item` = 901105 OR `Item` = 901106));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1717, 901104, 0, 0, 0, 1, 2, 1, 1, 'Hamhock - Ogre Bracelets'),
(1717, 901105, 0, 0, 0, 1, 2, 1, 1, 'Hamhock - Ogre Bowl'),
(1717, 901106, 0, 0, 0, 1, 2, 1, 1, 'Hamhock - Ogre Mantle');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 1717;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 1717);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1717, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 4000, 7000, 0, 0, 11, 15305, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Hamhock - In Combat - Cast Chain Lightning'),
(1717, 0, 1, 0, 0, 0, 100, 1, 5000, 5000, 0, 0, 0, 0, 11, 6742, 32, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hamhock - In Combat - Cast Bloodlust'),
(1717, 0, 2, 0, 16, 0, 100, 0, 6742, 30, 10000, 10000, 0, 0, 11, 6742, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Hamhock - Friendly Missing Buff - Cast Bloodlust'),
(1717, 0, 3, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Hamhock - On Aggro - Say Line 0');
