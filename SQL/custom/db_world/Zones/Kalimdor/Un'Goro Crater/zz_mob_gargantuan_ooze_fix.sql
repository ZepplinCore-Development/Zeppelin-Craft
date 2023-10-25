UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 6557;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 6557);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(6557, 0, 0, 0, 8, 0, 100, 512, 16031, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - On Spellhit \'Releasing Corrupt Ooze\' - Set Event Phase 2'),
(6557, 0, 1, 2, 60, 2, 100, 513, 1500, 1500, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, 10290, 0, 35, 0, 0, 0, 0, 0, 'Primal Ooze - On Update - Set Data 0 1 (Phase 2) (No Repeat)'),
(6557, 0, 2, 0, 61, 2, 100, 512, 0, 0, 0, 0, 0, 0, 29, 0, 0, 10290, 1, 1, 0, 9, 10290, 0, 35, 0, 0, 0, 0, 0, 'Primal Ooze - On Update - Start Follow Closest Creature \'Captured Felwood Ooze\' (Phase 2) (No Repeat)'),
(6557, 0, 3, 4, 65, 2, 100, 512, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - On Follow Complete - Set Visibility Off (Phase 2)'),
(6557, 0, 4, 5, 61, 2, 100, 512, 0, 0, 0, 0, 0, 0, 12, 9621, 6, 20000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - On Follow Complete - Summon Creature \'Gargantuan Ooze\' (Phase 2)'),
(6557, 0, 5, 6, 61, 2, 100, 512, 0, 0, 0, 0, 0, 0, 11, 16032, 0, 0, 0, 0, 0, 9, 9621, 0, 5, 0, 0, 0, 0, 0, 'Primal Ooze - On Follow Complete - Cast \'Merging Oozes\' (Phase 2)'),
(6557, 0, 6, 0, 61, 2, 100, 512, 0, 0, 0, 0, 0, 0, 41, 50, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - On Follow Complete - Despawn In 50 ms (Phase 2)'),
(6557, 0, 7, 0, 8, 0, 100, 513, 15702, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - On Spell Hit (Filling Empty Jar) - Despawn'),
(6557, 0, 8, 0, 2, 0, 100, 1, 0, 30, 0, 0, 0, 0, 11, 14146, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - Between 0-30% Health - Cast \'Clone\' (No Repeat)'),
(6557, 0, 9, 0, 2, 0, 100, 1, 0, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Primal Ooze - Between 0-30% Health - Say Line 0 (No Repeat)');
