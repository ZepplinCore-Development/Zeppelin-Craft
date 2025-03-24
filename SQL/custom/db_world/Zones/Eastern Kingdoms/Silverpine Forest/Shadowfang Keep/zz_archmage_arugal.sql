UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4275;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 4275);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4275, 0, 0, 0, 38, 0, 100, 512, 1, 1, 0, 0, 0, 0, 80, 427500, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - On Data Set - Start Script'),
(4275, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - On Aggro - Say Line 1'),
(4275, 0, 2, 0, 5, 0, 100, 0, 5000, 5000, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Killed Unit - Say Line 3'),
(4275, 0, 3, 0, 0, 0, 100, 2, 0, 500, 3000, 3500, 0, 0, 11, 7588, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - In Combat - Cast Void Bolt'),
(4275, 0, 4, 0, 0, 0, 100, 0, 7000, 16000, 25000, 27500, 0, 0, 11, 7803, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - In Combat - Cast Thundershock'),
(4275, 0, 5, 6, 0, 0, 100, 0, 7000, 16000, 25000, 27500, 0, 0, 11, 7621, 0, 0, 0, 0, 0, 6, 30, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - In Combat - Cast Arugal''s Curse'),
(4275, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - Killed Unit - Say Line 2'),
(4275, 0, 7, 0, 0, 0, 100, 512, 3000, 3000, 13000, 13000, 0, 0, 125, 1, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - In Combat - Run Random Timed Event'),
(4275, 0, 8, 0, 59, 0, 100, 0, 1, 0, 0, 0, 0, 0, 11, 7136, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - On Timed Event - Cast Shadow Port'),
(4275, 0, 9, 0, 59, 0, 100, 0, 2, 0, 0, 0, 0, 0, 11, 7586, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - On Timed Event - Cast Shadow Port'),
(4275, 0, 10, 0, 59, 0, 100, 0, 3, 0, 0, 0, 0, 0, 11, 7587, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - On Timed Event - Cast Shadow Port'),
(4275, 0, 11, 0, 0, 0, 100, 4, 0, 500, 3000, 3500, 0, 0, 11, 91007, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Archmage Arugal - In Combat - Cast Void Bolt');
