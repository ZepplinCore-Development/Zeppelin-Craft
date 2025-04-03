-- Empowered Ooze Template
DELETE FROM `creature_template` WHERE (`entry` = 9102596);
INSERT INTO `creature_template` SET
    `entry` = 9102596,
    `difficulty_entry_1` = 9101316,
    `difficulty_entry_2` = 9101361,
    `name` = 'Empowered Ooze',
    `minlevel` = 47,
    `maxlevel` = 48,
    `faction` = 14,
    `scale` = '1.5',
    `rank` = 1,
    `DamageModifier` = 6,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 64,
    `unit_flags2` = 2048,
    `type` = 10,
    `lootid` = 9102596,
    `pickpocketloot` = 5228,
    `AIName` = 'SmartAI',
    `MovementType` = 1,
    `HealthModifier` = 12,
    `VerifiedBuild` = '12340';

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102596;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '9102596',
    `idx` = 1,
    `CreatureDisplayID` = '682',
    `probability` = 1.0;

-- Remove the original Saturated Ooze Spawns
DELETE FROM `creature` WHERE (`id1` = 5228) AND (`guid` IN (33628, 33629, 34472));

-- Add the new Empowered Ooze Spawns
DELETE FROM `creature` WHERE (`id1` = 9102596);
INSERT INTO `creature` SET
    `guid` = 3110557,
    `id1` = 9102596,
    `map` = 109,
    `position_x` = -521.588,
    `position_y` = 94.8218,
    `position_z` = -148.744,
    `orientation` = 1.09155,
    `spawntimesecs` = 300,
    `curhealth` = 3371;

INSERT INTO `creature` SET
    `guid` = 3110558,
    `id1` = 9102596,
    `map` = 109,
    `position_x` = -413.433,
    `position_y` = 95.8003,
    `position_z` = -148.743,
    `orientation` = 6.2202,
    `spawntimesecs` = 300,
    `curhealth` = 3253;

-- Empowered Ooze loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9102596) AND (`Item` IN (24025, 35010));
INSERT INTO `creature_loot_template` SET
    `Entry` = 9102596,
    `Item` = 35010,
    `Reference` = 35010,
    `Chance` = 50,
    `GroupId` = 1,
    `Comment` = 'Saturated Ooze - (ReferenceTable)';
