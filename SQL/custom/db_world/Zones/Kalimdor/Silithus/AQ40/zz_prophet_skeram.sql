-- Cloning was causing issues in this fight, so we subbed a new creature template to use.
DELETE FROM `creature_template` WHERE (`entry` = 9000014);
INSERT INTO `creature_template` SET
    `entry` = 9000014,
    `name` = 'The Prophet Skeram',
    `subname` = '',
    `minlevel` = 63,
    `maxlevel` = 63,
    `faction` = 16,
    `speed_walk` = '2.4',
    `speed_run` = 2.14286,
    `rank` = 3,
    `DamageModifier` = '10.05',
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 2,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 76,
    `lootid` = 15263,
    `mingold` = 504000,
    `maxgold` = 609840,
    `HealthModifier` = 50,
    `ManaModifier` = 150,
    `ArmorModifier` = '1.3',
    `movementId` = 192,
    `mechanic_immune_mask` = 617299807,
    `ScriptName` = 'boss_skeram',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9000014;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '9000014',
    `idx` = 1,
    `CreatureDisplayID` = '15345',
    `probability` = 1.0;