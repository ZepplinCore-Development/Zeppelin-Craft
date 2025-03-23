DELETE FROM `creature_template` WHERE (`entry` = 15263);
INSERT INTO `creature_template` SET
    `entry` = 15263,
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
    `HealthModifier` = 175,
    `ManaModifier` = 150,
    `ArmorModifier` = '1.3',
    `movementId` = 192,
    `mechanic_immune_mask` = 617299807,
    `ScriptName` = 'boss_skeram',
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 15263;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '15263',
    `idx` = 1,
    `CreatureDisplayID` = '15345',
    `probability` = 1.0;

DELETE FROM `creature_loot_template` WHERE (`Entry` = 15263 AND `Item` = 966);
INSERT INTO `creature_loot_template` SET
    `Entry` = 15263,
    `Item` = 966,
    `Comment` = 'Pattern: Drums of the Raid Leader';
