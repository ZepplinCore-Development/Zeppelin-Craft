UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 6557;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 6557;

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `event_type` = 8,
    `event_flags` = 512,
    `event_param1` = 16031,
    `action_type` = 22,
    `action_param1` = 2,
    `target_type` = 1,
    `comment` = 'Primal Ooze - On Spellhit ''Releasing Corrupt Ooze'' - Set Event Phase 2';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 1,
    `link` = 2,
    `event_type` = 60,
    `event_phase_mask` = 2,
    `event_flags` = 513,
    `event_param1` = 1500,
    `event_param2` = 1500,
    `action_type` = 45,
    `action_param2` = 1,
    `target_type` = 9,
    `target_param1` = 10290,
    `target_param3` = 35,
    `comment` = 'Primal Ooze - On Update - Set Data 0 1 (Phase 2) (No Repeat)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 2,
    `event_type` = 61,
    `event_phase_mask` = 2,
    `event_flags` = 512,
    `action_type` = 29,
    `action_param3` = 10290,
    `action_param4` = 1,
    `action_param5` = 1,
    `target_type` = 9,
    `target_param1` = 10290,
    `target_param3` = 35,
    `comment` = 'Primal Ooze - On Update - Start Follow Closest Creature ''Captured Felwood Ooze'' (Phase 2) (No Repeat)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 3,
    `link` = 4,
    `event_type` = 65,
    `event_phase_mask` = 2,
    `event_flags` = 512,
    `action_type` = 47,
    `target_type` = 1,
    `comment` = 'Primal Ooze - On Follow Complete - Set Visibility Off (Phase 2)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 4,
    `link` = 5,
    `event_type` = 61,
    `event_phase_mask` = 2,
    `event_flags` = 512,
    `action_type` = 12,
    `action_param1` = 9621,
    `action_param2` = 6,
    `action_param3` = 20000,
    `target_type` = 1,
    `comment` = 'Primal Ooze - On Follow Complete - Summon Creature ''Gargantuan Ooze'' (Phase 2)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 5,
    `link` = 6,
    `event_type` = 61,
    `event_phase_mask` = 2,
    `event_flags` = 512,
    `action_type` = 11,
    `action_param1` = 16032,
    `target_type` = 9,
    `target_param1` = 9621,
    `target_param3` = 5,
    `comment` = 'Primal Ooze - On Follow Complete - Cast ''Merging Oozes'' (Phase 2)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 6,
    `event_type` = 61,
    `event_phase_mask` = 2,
    `event_flags` = 512,
    `action_type` = 41,
    `action_param1` = 50,
    `target_type` = 1,
    `comment` = 'Primal Ooze - On Follow Complete - Despawn In 50 ms (Phase 2)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 7,
    `event_type` = 8,
    `event_flags` = 513,
    `event_param1` = 15702,
    `action_type` = 41,
    `target_type` = 1,
    `comment` = 'Primal Ooze - On Spell Hit (Filling Empty Jar) - Despawn';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 8,
    `event_type` = 2,
    `event_flags` = 1,
    `event_param2` = 30,
    `action_type` = 11,
    `action_param1` = 14146,
    `target_type` = 1,
    `comment` = 'Primal Ooze - Between 0-30% Health - Cast ''Clone'' (No Repeat)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = 6557,
    `id` = 9,
    `event_type` = 2,
    `event_flags` = 1,
    `event_param2` = 30,
    `action_type` = 1,
    `target_type` = 1,
    `comment` = 'Primal Ooze - Between 0-30% Health - Say Line 0 (No Repeat)';
