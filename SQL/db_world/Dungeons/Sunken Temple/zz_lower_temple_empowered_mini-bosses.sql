-- Lower Sunken Temple Mini-bosses

-- Empowered Deep Lurker

    -- Empowered Deep Lurker Creature Template
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

    -- Empowered Deep Lurker Creature Template Model
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

-- Empowered Murk Worm

    -- Empowered Murk Worm Template
        DELETE FROM `creature_template` WHERE (`entry` = 9102594);
        INSERT INTO `creature_template` SET
            `entry` = 9102594,
            `difficulty_entry_1` = 9101311,
            `difficulty_entry_2` = 9101356,
            `name` = 'Empowered Murk Worm',
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
            `family` = 42,
            `type` = 1,
            `type_flags` = 65537,
            `lootid` = 9102594,
            `skinloot` = 5226,
            `AIName` = 'SmartAI',
            `MovementType` = 1,
            `HealthModifier` = 12,
            `VerifiedBuild` = '12340';

    -- Empowered Murk Worm Models
        DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102594;
        INSERT INTO `creature_template_model` SET
            `CreatureID` = '9102594',
            `idx` = 1,
            `CreatureDisplayID` = '7549',
            `probability` = 0.3333333333333333;

        INSERT INTO `creature_template_model` SET
            `CreatureID` = '9102594',
            `idx` = 2,
            `CreatureDisplayID` = '7671',
            `probability` = 0.3333333333333333;

        INSERT INTO `creature_template_model` SET
            `CreatureID` = '9102594',
            `idx` = 3,
            `CreatureDisplayID` = '7672',
            `probability` = 0.3333333333333333;

    -- Remove the original Murk Worm Spawns
        DELETE FROM `creature` WHERE (`id1` = 5226) AND (`guid` IN (33598, 34173, 34476, 33619, 33620));

    -- Add the new Empowered Murk Worm Spawns
        DELETE FROM `creature` WHERE (`id1` = 9102594);
        INSERT INTO `creature` SET
            `guid` = 3110553,
            `id1` = 9102594,
            `map` = 109,
            `position_x` = -492.734,
            `position_y` = 142.199,
            `position_z` = -148.744,
            `orientation` = 0.502489,
            `spawntimesecs` = 300,
            `curhealth` = 3253;

        INSERT INTO `creature` SET
            `guid` = 3110554,
            `id1` = 9102594,
            `map` = 109,
            `position_x` = -440.856,
            `position_y` = 48.5799,
            `position_z` = -148.743,
            `orientation` = 4.94,
            `spawntimesecs` = 300,
            `curhealth` = 3253;

    -- Empowered Murk Worm Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 9102594) AND (`Item` IN (24025, 35010));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 9102594,
            `Item` = 35010,
            `Reference` = 35010,
            `Chance` = 1,
            `GroupId` = 1,
            `Comment` = 'Murk Worm - (ReferenceTable)';

-- Empowered Ooze

    -- Empowered Ooze Creature Template
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

    -- Empowered Ooze Creature Template Model
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
