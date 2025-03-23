-- Empowered Deep Lurker Template
DELETE FROM `creature_template` WHERE (`entry` = 9102595);
INSERT INTO `creature_template` SET
    `entry` = 9102595,
    `difficulty_entry_1` = 9101306,
    `difficulty_entry_2` = 9101351,
    `name` = 'Empowered Deep Lurker',
    `minlevel` = 47,
    `maxlevel` = 49,
    `faction` = 14,
    `speed_walk` = '0.666668',
    `scale` = '1.5',
    `rank` = 1,
    `DamageModifier` = 6,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 4,
    `type_flags` = 256,
    `lootid` = 9102595,
    `skinloot` = 100044,
    `AIName` = 'SmartAI',
    `MovementType` = 1,
    `HealthModifier` = 12,
    `mechanic_immune_mask` = 16384,
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102595;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '9102595',
    `idx` = 1,
    `CreatureDisplayID` = '631',
    `probability` = 1.0;

-- Remove the original Deep Lurker Spawns
DELETE FROM `creature` WHERE (`id1` = 8384) AND (`guid` IN (33609, 33610, 34469, 34475));

-- Add the new Empowered Deep Lurker Spawns
DELETE FROM `creature` WHERE (`id1` = 9102595);
INSERT INTO `creature` SET
    `guid` = 3110555,
    `id1` = 9102595,
    `map` = 109,
    `position_x` = -439.079,
    `position_y` = 142.352,
    `position_z` = -148.744,
    `orientation` = 0.361132,
    `spawntimesecs` = 300,
    `curhealth` = 3253;

INSERT INTO `creature` SET
    `guid` = 3110556,
    `id1` = 9102595,
    `map` = 109,
    `position_x` = -492.514,
    `position_y` = 48.5624,
    `position_z` = -148.743,
    `orientation` = 3.51451,
    `spawntimesecs` = 300,
    `curhealth` = 3495;

-- Empowered Deep Lurker Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9102595) AND (`Item` IN (24025, 35010));
INSERT INTO `creature_loot_template` SET
    `Entry` = 9102595,
    `Item` = 35010,
    `Reference` = 35010,
    `Chance` = 1,
    `GroupId` = 1,
    `Comment` = 'Deep Lurker - (ReferenceTable)';
