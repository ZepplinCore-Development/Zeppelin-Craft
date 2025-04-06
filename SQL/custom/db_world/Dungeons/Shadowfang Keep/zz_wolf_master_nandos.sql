-- Replace all the summons for Lupine Delusions.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3927;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3927 AND `action_type` = 11;

INSERT INTO `smart_scripts` SET
    `entryorguid` = 3927,
    `event_param1` = 5000,
    `event_param2` = 5000,
    `event_param3` = 75000,
    `event_param4` = 75000,
    `action_type` = 11,
    `action_param1` = 7132,
    `target_type` = 1,
    `comment` = 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 3927,
    `id` = 1,
    `event_param1` = 30000,
    `event_param2` = 30000,
    `event_param3` = 75000,
    `event_param4` = 75000,
    `action_type` = 11,
    `action_param1` = 7132,
    `target_type` = 1,
    `comment` = 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 3927,
    `id` = 2,
    `event_param1` = 55000,
    `event_param2` = 55000,
    `event_param3` = 75000,
    `event_param4` = 75000,
    `action_type` = 11,
    `action_param1` = 7132,
    `target_type` = 1,
    `comment` = 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion';
