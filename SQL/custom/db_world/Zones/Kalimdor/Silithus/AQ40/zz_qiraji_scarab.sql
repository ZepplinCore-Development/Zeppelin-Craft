-- when respawning auto balance skips them and they end up too strong....

DELETE FROM `creature_template` WHERE (`entry` = 15316);
INSERT INTO `creature_template` SET
    `entry` = 15316,
    `name` = 'Qiraji Scarab',
    `subname` = '',
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 311,
    `speed_run` = 1.42857,
    `detection_range` = 18,
    `DamageModifier` = '1.05',
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 8,
    `HealthModifier` = '0.25',
    `ArmorModifier` = '1.1',
    `ExperienceModifier` = '0.1',
    `movementId` = 144,
    `ScriptName` = 'npc_ahnqiraji_critter',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15316;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15316',
    `idx` = 1,
    `CreatureDisplayID` = '9354',
    `probability` = 1.0;

DELETE FROM `creature_template` WHERE (`entry` = 15317);
INSERT INTO `creature_template` SET
    `entry` = 15317,
    `name` = 'Qiraji Scorpion',
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 311,
    `speed_run` = 1.42857,
    `detection_range` = 18,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 8,
    `HealthModifier` = '0.25',
    `ArmorModifier` = '1.1',
    `ExperienceModifier` = '0.1',
    `movementId` = 144,
    `ScriptName` = 'npc_ahnqiraji_critter',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15317;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15317',
    `idx` = 1,
    `CreatureDisplayID` = '9749',
    `probability` = 1.0;