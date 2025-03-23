DELETE FROM `creature_template` WHERE (`entry` = 10564);
INSERT INTO `creature_template` SET
    `entry` = 10564,
    `name` = 'Failed Abomination',
    `minlevel` = 12,
    `maxlevel` = 14,
    `faction` = 16,
    `DamageModifier` = '0.3',
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags2` = 2048,
    `type` = 6,
    `lootid` = 846,
    `mingold` = 17,
    `maxgold` = 29,
    `MovementType` = 1,
    `mechanic_immune_mask` = 8388624,
    `VerifiedBuild` = '0';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 10564;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '10564',
    `idx` = 1,
    `CreatureDisplayID` = '1693',
    `probability` = 1.0;