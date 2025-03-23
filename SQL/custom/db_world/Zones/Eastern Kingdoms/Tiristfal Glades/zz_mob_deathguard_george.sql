DELETE FROM `creature_template` WHERE (`entry` = 9000002);
INSERT INTO `creature_template` SET
    `entry` = 9000002,
    `name` = 'Deathguard George',
    `minlevel` = 25,
    `maxlevel` = 25,
    `faction` = 118,
    `npcflag` = 2,
    `detection_range` = 1,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `type` = 6,
    `VerifiedBuild` = '0';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9000002;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '9000002',
    `idx` = 1,
    `CreatureDisplayID` = '25426',
    `probability` = 1.0;