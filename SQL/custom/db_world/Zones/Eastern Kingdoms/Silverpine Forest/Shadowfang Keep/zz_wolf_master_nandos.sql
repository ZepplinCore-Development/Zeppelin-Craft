UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3927;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 3927);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3927, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 75000, 75000, 0, 0, 11, 7132, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion'),
(3927, 0, 1, 0, 0, 0, 100, 0, 30000, 30000, 75000, 75000, 0, 0, 11, 7132, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion'),
(3927, 0, 2, 0, 0, 0, 100, 0, 55000, 55000, 75000, 75000, 0, 0, 11, 7132, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - In Combat - Cast Call Lupine Delusion'),
(3927, 0, 3, 4, 6, 0, 100, 512, 0, 0, 0, 0, 0, 0, 34, 2, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - On Just Died - Set Instance Data 2 to 3'),
(3927, 0, 4, 0, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 118, 0, 0, 0, 0, 0, 0, 14, 33241, 18971, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - On Just Died - Set GO State'),
(3927, 0, 5, 6, 77, 0, 100, 0, 1, 4, 600000, 600000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - On Counter Set - Say Line 0'),
(3927, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - On Counter Set - Attack Start');
