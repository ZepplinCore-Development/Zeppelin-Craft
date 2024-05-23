-- Naxxramas Worshipper

UPDATE `creature_template` SET `DamageModifier` = 25 WHERE (`entry` = 351081);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 351081;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 351081);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(351081, 0, 0, 0, 0, 0, 100, 0, 4000, 5000, 7000, 9000, 0, 0, 11, 54095, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Cast Spell IC (Naxx 40)'),
(351081, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 28732, 0, 0, 0, 0, 0, 10, 361296, 351007, 0, 0, 0, 0, 0, 0, 'Cast Spell on Death (Naxx 40)');
