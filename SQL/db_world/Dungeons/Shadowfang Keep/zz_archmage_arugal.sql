-- Change Void bolt to normal difficulty only
UPDATE `smart_scripts` SET `event_flags` = 2 WHERE (`entryorguid` = 4275 AND `action_param1` = 7588);

-- Add Heroic Void bolt to the rotation
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 4275 AND `action_param1` = 91007);
INSERT INTO `smart_scripts` SET
    `entryorguid` = 4275,
    `id` = 11,
    `event_flags` = 4,
    `event_param2` = 500,
    `event_param3` = 3000,
    `event_param4` = 3500,
    `action_type` = 11,
    `action_param1` = 91007,
    `action_param2` = 64,
    `target_type` = 2,
    `comment` = 'Archmage Arugal - In Combat - Cast Void Bolt (Heroic)';