-- [F-059] Sunken Temple Upper/Lower instance_encounters
-- Set lastEncounterDungeon for Atal'alarion (Lower wing final boss)
-- Upper (Shade of Eranikus): Normal=28, Heroic=307, Mythic=363 (already set in F-060)
-- Lower (Atal'alarion): Normal=455, Heroic=456, Mythic=457

-- NORMAL

    -- Atal'alarion (Lower) - was 0, set to 455
        DELETE FROM `instance_encounters` WHERE `entry` = 485;
        INSERT INTO `instance_encounters` SET
            `entry` = 485,
            `creditEntry` = 8580,
            `lastEncounterDungeon` = 455,
            `comment` = 'Atal''alarion';

-- HEROIC

    -- Atal'alarion (Lower) - new entry
        DELETE FROM `instance_encounters` WHERE `entry` = 1349;
        INSERT INTO `instance_encounters` SET
            `entry` = 1349,
            `creditEntry` = 8580,
            `lastEncounterDungeon` = 456,
            `comment` = 'Atal''alarion';

-- MYTHIC

    -- Atal'alarion (Lower) - new entry
        DELETE FROM `instance_encounters` WHERE `entry` = 1350;
        INSERT INTO `instance_encounters` SET
            `entry` = 1350,
            `creditEntry` = 8580,
            `lastEncounterDungeon` = 457,
            `comment` = 'Atal''alarion';
