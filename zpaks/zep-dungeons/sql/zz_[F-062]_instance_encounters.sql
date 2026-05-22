-- [F-062] Uldaman East/West instance_encounters
-- Fix lastEncounterDungeon to point to correct East/West LFG dungeon IDs
-- East (Ironaya): Normal=22, Heroic=304, Mythic=360
-- West (Archaedas): Normal=452, Heroic=453, Mythic=454

-- NORMAL

    -- Ironaya (East) - was 0, set to 22
        DELETE FROM `instance_encounters` WHERE `entry` = 549;
        INSERT INTO `instance_encounters` SET
            `entry` = 549,
            `creditEntry` = 7228,
            `lastEncounterDungeon` = 22,
            `comment` = 'Ironaya';

    -- Archaedas (West) - was 22, set to 452
        DELETE FROM `instance_encounters` WHERE `entry` = 554;
        INSERT INTO `instance_encounters` SET
            `entry` = 554,
            `creditEntry` = 2748,
            `lastEncounterDungeon` = 452,
            `comment` = 'Archaedas';

-- HEROIC

    -- Ironaya (East) - new entry
        DELETE FROM `instance_encounters` WHERE `entry` = 1183;
        INSERT INTO `instance_encounters` SET
            `entry` = 1183,
            `creditEntry` = 7228,
            `lastEncounterDungeon` = 304,
            `comment` = 'Ironaya';

    -- Archaedas (West) - was 304, set to 453
        DELETE FROM `instance_encounters` WHERE `entry` = 1187;
        INSERT INTO `instance_encounters` SET
            `entry` = 1187,
            `creditEntry` = 2748,
            `lastEncounterDungeon` = 453,
            `comment` = 'Archaedas';

-- MYTHIC

    -- Ironaya (East) - new entry
        DELETE FROM `instance_encounters` WHERE `entry` = 1190;
        INSERT INTO `instance_encounters` SET
            `entry` = 1190,
            `creditEntry` = 7228,
            `lastEncounterDungeon` = 360,
            `comment` = 'Ironaya';

    -- Archaedas (West) - was 360, set to 454
        DELETE FROM `instance_encounters` WHERE `entry` = 1194;
        INSERT INTO `instance_encounters` SET
            `entry` = 1194,
            `creditEntry` = 2748,
            `lastEncounterDungeon` = 454,
            `comment` = 'Archaedas';
