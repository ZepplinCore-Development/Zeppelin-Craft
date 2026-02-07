-- Entries in this table are required for Autobalance to recognise bosses and for RDF to recognise the final boss completion of a dungeon.

-- NORMAL ENCOUNTERS

    -- WAILING CAVERNS

        -- Verdan the Everliving
            DELETE FROM `instance_encounters` WHERE `entry` = '591';
            INSERT INTO `instance_encounters` SET
                `entry` = '591',
                `creditEntry` = '5775',
                `lastEncounterDungeon` = '1',
                `comment` = 'Verdan the Everliving';

        -- Mutanus the Devourer
            DELETE FROM `instance_encounters` WHERE `entry` = '592';
            INSERT INTO `instance_encounters` SET
                `entry` = '592',
                `creditEntry` = '3654',
                `lastEncounterDungeon` = '0',
                `comment` = 'Mutanus the Devourer';

    -- BLACKROCK DEPTHS

        -- Lord Incendius
            DELETE FROM `instance_encounters` WHERE `entry` = '232';
            INSERT INTO `instance_encounters` SET
                `entry` = '232',
                `creditEntry` = '9017',
                `lastEncounterDungeon` = '30',
                `comment` = 'Lord Incendius';

        -- High Interrogator Gerstahn
            DELETE FROM `instance_encounters` WHERE `entry` = '227';
            INSERT INTO `instance_encounters` SET
                `entry` = '227',
                `creditEntry` = '9018',
                `lastEncounterDungeon` = '0',
                `comment` = 'High Interrogator Gerstahn';

    -- MARAUDON

        -- Celebras the Cursed
            DELETE FROM `instance_encounters` WHERE `entry` = '425';
            INSERT INTO `instance_encounters` SET
                `entry` = '425',
                `creditEntry` = '12225',
                `lastEncounterDungeon` = '272',
                `comment` = 'Celebras the Cursed';

        -- Lord Vyletongue
        DELETE FROM `instance_encounters` WHERE `entry` = '424';
        INSERT INTO `instance_encounters` SET
            `entry` = '424',
            `creditType` = '0',
            `creditEntry` = '12236',
            `lastEncounterDungeon` = '0',
            `comment` = 'Lord Vyletongue';

    -- DIRE MAUL WEST

        -- Immolthar
            DELETE FROM `instance_encounters` WHERE `entry` = '349';
            INSERT INTO `instance_encounters` SET
                `entry` = '349',
                `creditEntry` = '11496',
                `lastEncounterDungeon` = '36',
                `comment` = 'Immolthar';

        -- Prince Tortheldrin
            DELETE FROM `instance_encounters` WHERE `entry` = '361';
            INSERT INTO `instance_encounters` SET
                `entry` = '361',
                `creditEntry` = '11486',
                `lastEncounterDungeon` = '0',
                `comment` = 'Prince Tortheldrin';

    -- RAGEFIRE CHASM

        -- Jergosh the Invoker
            DELETE FROM `instance_encounters` WHERE `entry` = '432';
            INSERT INTO `instance_encounters` SET
                `entry` = '432',
                `creditEntry` = '11518',
                `lastEncounterDungeon` = '4',
                `comment` = 'Jergosh the Invoker';

        -- Taragaman the Hungerer
            DELETE FROM `instance_encounters` WHERE `entry` = '431';
            INSERT INTO `instance_encounters` SET
                `entry` = '431',
                `creditEntry` = '11520',
                `lastEncounterDungeon` = '0',
                `comment` = 'Taragaman the Hungerer';

    -- SUNKEN TEMPLE

        -- Hukku
            DELETE FROM `instance_encounters` WHERE `entry` = '1331';
            INSERT INTO `instance_encounters` SET
                `entry` = '1331',
                `creditEntry` = '5715',
                `lastEncounterDungeon` = '0',
                `comment` = 'Hukku';

        -- Gasher
            DELETE FROM `instance_encounters` WHERE `entry` = '1332';
            INSERT INTO `instance_encounters` SET
                `entry` = '1332',
                `creditEntry` = '5713',
                `lastEncounterDungeon` = '0',
                `comment` = 'Gasher';

        -- Loro
            DELETE FROM `instance_encounters` WHERE `entry` = '1333';
            INSERT INTO `instance_encounters` SET
                `entry` = '1333',
                `creditEntry` = '5714',
                `lastEncounterDungeon` = '0',
                `comment` = 'Loro';

        -- Mijan
            DELETE FROM `instance_encounters` WHERE `entry` = '1334';
            INSERT INTO `instance_encounters` SET
                `entry` = '1334',
                `creditEntry` = '5717',
                `lastEncounterDungeon` = '0',
                `comment` = 'Mijan';

        -- Zolo
            DELETE FROM `instance_encounters` WHERE `entry` = '1335';
            INSERT INTO `instance_encounters` SET
                `entry` = '1335',
                `creditEntry` = '5712',
                `lastEncounterDungeon` = '0',
                `comment` = 'Zolo';

        -- ZulLor
            DELETE FROM `instance_encounters` WHERE `entry` = '1336';
            INSERT INTO `instance_encounters` SET
                `entry` = '1336',
                `creditEntry` = '5716',
                `lastEncounterDungeon` = '0',
                `comment` = 'ZulLor';

