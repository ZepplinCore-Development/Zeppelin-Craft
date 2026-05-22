-- Naxxramas Worshipper Damage reduced to 15 (was 35)
UPDATE `creature_template` SET `DamageModifier` = 15 WHERE (`entry` = 351081);

-- Naxxramas Worshipper cast Widows Embrace on Death
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 351081);
INSERT INTO `smart_scripts` SET
    `entryorguid` = 351081,
    `id` = 1,
    `event_type` = 6,
    `action_type` = 11,
    `action_param1` = 28732,
    `target_type` = 10,
    `target_param1` = 361296,
    `target_param2` = 351007,
    `comment` = 'Cast Spell on Death (Naxx 40)';
