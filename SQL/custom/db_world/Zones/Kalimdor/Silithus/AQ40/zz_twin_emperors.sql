DELETE FROM `creature_template` WHERE (`entry` = 15275);
INSERT INTO `creature_template` SET
    `entry` = 15275,
    `name` = 'Emperor Veknilash',
    `subname` = '',
    `minlevel` = 63,
    `maxlevel` = 63,
    `faction` = 16,
    `speed_run` = 2.14286,
    `rank` = 3,
    `DamageModifier` = 30,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 76,
    `lootid` = 15275,
    `HealthModifier` = 650,
    `ManaModifier` = 180,
    `ArmorModifier` = '1.3',
    `movementId` = 188,
    `mechanic_immune_mask` = 1691041631,
    `spell_school_immune_mask` = 124,
    `flags_extra` = 1,
    `ScriptName` = 'boss_veknilash',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15275;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15275',
    `idx` = 1,
    `CreatureDisplayID` = '15761',
    `probability` = 1.0;


DELETE FROM `creature_template` WHERE (`entry` = 15276);
INSERT INTO `creature_template` SET
    `entry` = 15276,
    `name` = 'Emperor Veklor',
    `subname` = '',
    `minlevel` = 63,
    `maxlevel` = 63,
    `faction` = 16,
    `speed_run` = 2.14286,
    `rank` = 3,
    `DamageModifier` = '30.05',
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 2,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 76,
    `lootid` = 15276,
    `mingold` = 720000,
    `maxgold` = 880000,
    `HealthModifier` = 650,
    `ManaModifier` = 180,
    `ArmorModifier` = '1.6',
    `movementId` = 188,
    `mechanic_immune_mask` = 1724596063,
    `spell_school_immune_mask` = 1,
    `flags_extra` = 1,
    `ScriptName` = 'boss_veklor',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15276;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15276',
    `idx` = 1,
    `CreatureDisplayID` = '15778',
    `probability` = 1.0;