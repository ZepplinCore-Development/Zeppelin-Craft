DELETE FROM `creature_template` WHERE (`entry` = 15509);
INSERT INTO `creature_template` SET
    `entry` = 15509,
    `name` = 'Princess Huhuran',
    `subname` = '',
    `minlevel` = 63,
    `maxlevel` = 63,
    `faction` = 16,
    `speed_walk` = '2.4',
    `speed_run` = 2.14286,
    `rank` = 3,
    `DamageModifier` = 25,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 10,
    `type_flags` = 76,
    `lootid` = 15509,
    `mingold` = 724999,
    `maxgold` = 886110,
    `HealthModifier` = 300,
    `ManaModifier` = 150,
    `ArmorModifier` = '1.3',
    `movementId` = 192,
    `mechanic_immune_mask` = 1691041627,
    `flags_extra` = 1,
    `ScriptName` = 'boss_huhuran',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15509;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15509',
    `idx` = 1,
    `CreatureDisplayID` = '15739',
    `probability` = 1.0;