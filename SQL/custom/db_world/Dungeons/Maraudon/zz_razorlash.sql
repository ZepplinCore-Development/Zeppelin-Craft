-- New abilities for Razorlash
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 12258) AND `action_param1` IN (91048, 91047);

INSERT INTO `smart_scripts` SET
    `entryorguid` = 12258,
    `id` = 1,
    `event_param1` = 10000,
    `event_param2` = 12000,
    `event_param3` = 18000,
    `event_param4` = 22000,
    `action_type` = 11,
    `action_param1` = 91048,
    `target_type` = 1,
    `comment` = 'Razorlash - In Combat - Cast Rejuvenation';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 12258,
    `id` = 2,
    `event_param1` = 5000,
    `event_param2` = 6000,
    `event_param3` = 20000,
    `event_param4` = 24000,
    `action_type` = 11,
    `action_param1` = 91047,
    `target_type` = 1,
    `comment` = 'Razorlash - In Combat - Cast Razor Thorns';
