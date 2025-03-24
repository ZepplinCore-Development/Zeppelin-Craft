-- A new creature template for Naxx 40 crypt guard?
DELETE FROM `creature_template` WHERE (`entry` = 351082);
INSERT INTO `creature_template` SET
    `entry` = 351082,
    `name` = 'Crypt Guard',
    `IconName` = NULL,
    `minlevel` = 61,
    `maxlevel` = 61,
    `faction` = 21,
    `speed_run` = 1.42857,
    `rank` = 1,
    `DamageModifier` = '14.7',
    `BaseAttackTime` = 1000,
    `RangeAttackTime` = 1265,
    `unit_class` = 1,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 6,
    `type_flags` = 72,
    `AIName` = 'SmartAI',
    `HealthModifier` = 30,
    `ArmorModifier` = '1.15',
    `movementId` = 144,
    `mechanic_immune_mask` = 1023391482,
    `VerifiedBuild` = NULL;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 351082;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '351082',
    `idx` = 1,
    `CreatureDisplayID` = '14698',
    `probability` = 1.0;