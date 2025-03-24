DELETE FROM `creature_template` WHERE (`entry` = 29093);
INSERT INTO `creature_template` SET
    `entry` = 29093,
    `name` = 'Travis Coomingham',
    `minlevel` = 35,
    `maxlevel` = 35,
    `faction` = 12,
    `npcflag` = 2,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 7,
    `type_flags` = 4096,
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 29093;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '29093',
    `idx` = 1,
    `CreatureDisplayID` = '3614',
    `probability` = 1.0;