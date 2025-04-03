-- A new creature template for the web wraps?
DELETE FROM `creature_template` WHERE (`entry` = 351079);
INSERT INTO `creature_template` SET
    `entry` = 351079,
    `name` = 'Web Wrap',
    `IconName` = NULL,
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 16,
    `speed_run` = 1.0,
    `detection_range` = 18,
    `DamageModifier` = '0.6',
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags2` = 2048,
    `type` = 10,
    `ArmorModifier` = '0.3',
    `ScriptName` = 'boss_maexxna_webwrap40',
    `VerifiedBuild` = NULL;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 351079;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '351079',
    `idx` = 1,
    `CreatureDisplayID` = '16213',
    `probability` = 1.0;