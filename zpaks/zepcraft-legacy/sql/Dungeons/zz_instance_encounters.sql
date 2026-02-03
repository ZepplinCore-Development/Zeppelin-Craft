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

-- HEROIC ENCOUNTERS

    -- STOCKADES

        -- Bazil Thredd
            DELETE FROM `instance_encounters` WHERE `entry` = 991;
            INSERT INTO `instance_encounters` SET
                `entry` = 991,
                `creditEntry` = 1716,
                `lastEncounterDungeon` = 295,
                `comment` = 'Bazil Thredd';

    -- SHADOWFANG KEEP

        -- Archmage Arugal
            DELETE FROM `instance_encounters` WHERE `entry` = 1002;
            INSERT INTO `instance_encounters` SET
                `entry` = 1002,
                `creditEntry` = 4275,
                `lastEncounterDungeon` = 296,
                `comment` = 'Archmage Arugal';

    -- RAZORFEN KRAUL

        -- Charlga Razorflank
            DELETE FROM `instance_encounters` WHERE `entry` = 1008;
            INSERT INTO `instance_encounters` SET
                `entry` = 1008,
                `creditEntry` = 4421,
                `lastEncounterDungeon` = 297,
                `comment` = 'Charlga Razorflank';

    -- RAZORFEN DOWNS

        -- Amnennar the Coldbringer
            DELETE FROM `instance_encounters` WHERE `entry` = 1012;
            INSERT INTO `instance_encounters` SET
                `entry` = 1012,
                `creditEntry` = 7358,
                `lastEncounterDungeon` = 298,
                `comment` = 'Amnennar the Coldbringer';

    -- WAILING CAVERNS

        -- Verdan the Everliving
            DELETE FROM `instance_encounters` WHERE `entry` = 1019;
            INSERT INTO `instance_encounters` SET
                `entry` = 1019,
                `creditEntry` = 5775,
                `lastEncounterDungeon` = 299,
                `comment` = 'Verdan the Everliving';

    -- RAGEFIRE CHASM

        -- Jergosh the Invoker
            DELETE FROM `instance_encounters` WHERE `entry` = 1014;
            INSERT INTO `instance_encounters` SET
                `entry` = 1014,
                `creditEntry` = 11518,
                `lastEncounterDungeon` = 300,
                `comment` = 'Jergosh the Invoker';

    -- GNOMERAGAN

        -- Mekgineer Thermaplugg
            DELETE FROM `instance_encounters` WHERE `entry` = 1034;
            INSERT INTO `instance_encounters` SET
                `entry` = 1034,
                `creditEntry` = 7800,
                `lastEncounterDungeon` = 301,
                `comment` = 'Mekgineer Thermaplugg';

    -- BLACKFATHOM DEEPS
    
        -- Akumai
            DELETE FROM `instance_encounters` WHERE `entry` = 1159;
            INSERT INTO `instance_encounters` SET
                `entry` = 1159,
                `creditEntry` = 4829,
                `lastEncounterDungeon` = 302,
                `comment` = 'Akumai';

    -- SCARLET MONASTERY GRAVEYARD

        -- Bloodmage Thalnos
            DELETE FROM `instance_encounters` WHERE `entry` = 1168;
            INSERT INTO `instance_encounters` SET
                `entry` = 1168,
                `creditEntry` = 4543,
                `lastEncounterDungeon` = 303,
                `comment` = 'Bloodmage Thalnos';

    -- ULDAMAN

        -- Archaedas
            DELETE FROM `instance_encounters` WHERE `entry` = 1187;
            INSERT INTO `instance_encounters` SET
                `entry` = 1187,
                `creditEntry` = 2748,
                `lastEncounterDungeon` = 304,
                `comment` = 'Archaedas';

    -- ZUL'FARAK

        -- Chief Ukorz Sandscalp
            DELETE FROM `instance_encounters` WHERE `entry` = 1202;
            INSERT INTO `instance_encounters` SET
                `entry` = 1202,
                `creditEntry` = 7267,
                `lastEncounterDungeon` = 305,
                `comment` = 'Chief Ukorz Sandscalp';

    -- MARAUDON ORANGE

        -- Razorlash
            DELETE FROM `instance_encounters` WHERE `entry` = 1212;
            INSERT INTO `instance_encounters` SET
                `entry` = 1212,
                `creditEntry` = 12258,
                `lastEncounterDungeon` = 306,
                `comment` = 'Razorlash';

    -- SUNKEN TEMPLE

        -- Shade of Eranikus
            DELETE FROM `instance_encounters` WHERE `entry` = 1235;
            INSERT INTO `instance_encounters` SET
                `entry` = 1235,
                `creditEntry` = 5709,
                `lastEncounterDungeon` = 307,
                `comment` = 'Shade of Eranikus';

        -- Hukku
            DELETE FROM `instance_encounters` WHERE `entry` = 1337;
            INSERT INTO `instance_encounters` SET
                `entry` = 1337,
                `creditEntry` = 5715,
                `comment` = 'Hukku';

        -- Gasher
            DELETE FROM `instance_encounters` WHERE `entry` = 1338;
            INSERT INTO `instance_encounters` SET
                `entry` = 1338,
                `creditEntry` = 5713,
                `comment` = 'Gasher';

        -- Loro
            DELETE FROM `instance_encounters` WHERE `entry` = 1339;
            INSERT INTO `instance_encounters` SET
                `entry` = 1339,
                `creditEntry` = 5714,
                `comment` = 'Loro';

        -- Mijan
            DELETE FROM `instance_encounters` WHERE `entry` = 1340;
            INSERT INTO `instance_encounters` SET
                `entry` = 1340,
                `creditEntry` = 5717,
                `comment` = 'Mijan';

        -- Zolo
            DELETE FROM `instance_encounters` WHERE `entry` = 1341;
            INSERT INTO `instance_encounters` SET
                `entry` = 1341,
                `creditEntry` = 5712,
                `comment` = 'Zolo';

        -- ZulLor
            DELETE FROM `instance_encounters` WHERE `entry` = 1342;
            INSERT INTO `instance_encounters` SET
                `entry` = 1342,
                `creditEntry` = 5716,
                `comment` = 'ZulLor';

    -- BLACKROCK DEPTHS PRISON

        -- Lord Incendius
            DELETE FROM `instance_encounters` WHERE `entry` = 1066;
            INSERT INTO `instance_encounters` SET
                `entry` = 1066,
                `creditEntry` = 9017,
                `lastEncounterDungeon` = 308,
                `comment` = 'Lord Incendius';

    -- LOWER BLACKROCK SPIRE

        -- Overlord Wyrmthalak
            DELETE FROM `instance_encounters` WHERE `entry` = 1252;
            INSERT INTO `instance_encounters` SET
                `entry` = 1252,
                `creditEntry` = 9568,
                `lastEncounterDungeon` = 309,
                `comment` = 'Overlord Wyrmthalak';

    -- DIRE MAUL EAST

        -- Alzzin the Wildshaper
            DELETE FROM `instance_encounters` WHERE `entry` = 1275;
            INSERT INTO `instance_encounters` SET
                `entry` = 1275,
                `creditEntry` = 11492,
                `lastEncounterDungeon` = 310,
                `comment` = 'Alzzin the Wildshaper';

    -- DIRE MAUL WEST

        -- Immolthar
            DELETE FROM `instance_encounters` WHERE `entry` = 1278;
            INSERT INTO `instance_encounters` SET
                `entry` = 1278,
                `creditEntry` = 11496,
                `lastEncounterDungeon` = 311,
                `comment` = 'Immolthar';

    -- DIRE MAUL NORTH

        -- King Gordok
            DELETE FROM `instance_encounters` WHERE `entry` = 1287;
            INSERT INTO `instance_encounters` SET
                `entry` = 1287,
                `creditEntry` = 11501,
                `lastEncounterDungeon` = 312,
                `comment` = 'King Gordok';

    -- STRATHOLME HUMAN

        -- Balnazzar
            DELETE FROM `instance_encounters` WHERE `entry` = 1310;
            INSERT INTO `instance_encounters` SET
                `entry` = 1310,
                `creditEntry` = 10813,
                `lastEncounterDungeon` = 313,
                `comment` = 'Balnazzar';

    -- UPPER BLACKROCK SPIRE

        -- General Drakkisath
            DELETE FROM `instance_encounters` WHERE `entry` = 1257;
            INSERT INTO `instance_encounters` SET
                `entry` = 1257,
                `creditEntry` = 10363,
                `lastEncounterDungeon` = 314,
                `comment` = 'General Drakkisath';

    -- SCARLET MONASTERY ARMORY

        -- Herod
            DELETE FROM `instance_encounters` WHERE `entry` = 1171;
            INSERT INTO `instance_encounters` SET
                `entry` = 1171,
                `creditEntry` = 3975,
                `lastEncounterDungeon` = 315,
                `comment` = 'Herod';

    -- SCARLET MONASTERY CATHEDRAL

        -- High Inquisitor Whitemane
            DELETE FROM `instance_encounters` WHERE `entry` = 1173;
            INSERT INTO `instance_encounters` SET
                `entry` = 1173,
                `creditEntry` = 3977,
                `lastEncounterDungeon` = 316,
                `comment` = 'High Inquisitor Whitemane';

    -- SCARLET MONASTERY LIBRARY

        -- Arcanist Doan
            DELETE FROM `instance_encounters` WHERE `entry` = 1170;
            INSERT INTO `instance_encounters` SET
                `entry` = 1170,
                `creditEntry` = 6487,
                `lastEncounterDungeon` = 317,
                `comment` = 'Arcanist Doan';

    -- MARAUDON PURPLE

        -- Celebras the Cursed
            DELETE FROM `instance_encounters` WHERE `entry` = 1214;
            INSERT INTO `instance_encounters` SET
                `entry` = 1214,
                `creditEntry` = 12225,
                `lastEncounterDungeon` = 318,
                `comment` = 'Celebras the Cursed';

    -- MARAUDON PRISTINE WATERS

        -- Princess Theradras
            DELETE FROM `instance_encounters` WHERE `entry` = 1218;
            INSERT INTO `instance_encounters` SET
                `entry` = 1218,
                `creditEntry` = 12201,
                `lastEncounterDungeon` = 319,
                `comment` = 'Princess Theradras';

    -- STRATHOLME UNDEAD

        -- Baron Rivendare
            DELETE FROM `instance_encounters` WHERE `entry` = 1317;
            INSERT INTO `instance_encounters` SET
                `entry` = 1317,
                `creditEntry` = 10440,
                `lastEncounterDungeon` = 320,
                `comment` = 'Baron Rivendare';

    -- BLACKROCK DEPTHS UPPER CITY

        -- Emperor Dagran Thaurissan
            DELETE FROM `instance_encounters` WHERE `entry` = 1079;
            INSERT INTO `instance_encounters` SET
                `entry` = 1079,
                `creditEntry` = 9019,
                `lastEncounterDungeon` = 321,
                `comment` = 'Emperor Dagran Thaurissan';

    -- SCHOLOMANCE

        -- Darkmaster Gandling
            DELETE FROM `instance_encounters` WHERE `entry` = 1047;
            INSERT INTO `instance_encounters` SET
                `entry` = 1047,
                `creditEntry` = 1853,
                `lastEncounterDungeon` = 322,
                `comment` = 'Darkmaster Gandling';

    -- DEADMINES

        -- Edwin VanCleef
            DELETE FROM `instance_encounters` WHERE `entry` = 1112;
            INSERT INTO `instance_encounters` SET
                `entry` = 1112,
                `creditEntry` = 639,
                `lastEncounterDungeon` = 323,
                `comment` = 'Edwin VanCleef';

-- MYTHIC ENCOUNTERS

    -- GNOMERAGAN

        -- Mekgineer Thermaplugg
            DELETE FROM `instance_encounters` WHERE `entry` = 1029;
            INSERT INTO `instance_encounters` SET
                `entry` = 1029,
                `creditEntry` = 7800,
                `lastEncounterDungeon` = 350,
                `comment` = 'Mekgineer Thermaplugg';

    -- DEADMINES

        -- Edwin VanCleef
            DELETE FROM `instance_encounters` WHERE `entry` = 1105;
            INSERT INTO `instance_encounters` SET
                `entry` = 1105,
                `creditEntry` = 639,
                `lastEncounterDungeon` = 351,
                `comment` = 'Edwin VanCleef';

    -- STOCKADES

        -- Bazil Thredd
            DELETE FROM `instance_encounters` WHERE `entry` = 1114;
            INSERT INTO `instance_encounters` SET
                `entry` = 1114,
                `creditEntry` = 1716,
                `lastEncounterDungeon` = 352,
                `comment` = 'Bazil Thredd';

    -- SHADOWFANG KEEP

        -- Archmage Arugal
            DELETE FROM `instance_encounters` WHERE `entry` = 1125;
            INSERT INTO `instance_encounters` SET
                `entry` = 1125,
                `creditEntry` = 4275,
                `lastEncounterDungeon` = 353,
                `comment` = 'Archmage Arugal';

    -- RAZORFEN KRAUL

        -- Charlga Razorflank
            DELETE FROM `instance_encounters` WHERE `entry` = 1131;
            INSERT INTO `instance_encounters` SET
                `entry` = 1131,
                `creditEntry` = 4421,
                `lastEncounterDungeon` = 354,
                `comment` = 'Charlga Razorflank';

    -- RAZORFEN DOWNS

        -- Amnennar the Coldbringer
            DELETE FROM `instance_encounters` WHERE `entry` = 1135;
            INSERT INTO `instance_encounters` SET
                `entry` = 1135,
                `creditEntry` = 7358,
                `lastEncounterDungeon` = 355,
                `comment` = 'Amnennar the Coldbringer';

    -- WAILING CAVERNS

        -- Verdan the Everliving
            DELETE FROM `instance_encounters` WHERE `entry` = 1142;
            INSERT INTO `instance_encounters` SET
                `entry` = 1142,
                `creditEntry` = 5775,
                `lastEncounterDungeon` = 356,
                `comment` = 'Verdan the Everliving';

    -- RAGEFIRE CHASM

        -- Jergosh the Invoker
            DELETE FROM `instance_encounters` WHERE `entry` = 1151;

            INSERT INTO `instance_encounters` SET
                `entry` = 1151,
                `creditEntry` = 11518,
                `lastEncounterDungeon` = 357,
                `comment` = 'Jergosh the Invoker';

    -- BLACKFATHOM DEEPS

        -- Akumai
            DELETE FROM `instance_encounters` WHERE `entry` = 1166;
            INSERT INTO `instance_encounters` SET
                `entry` = 1166,
                `creditEntry` = 4829,
                `lastEncounterDungeon` = 358,
                `comment` = 'Akumai';

    -- SCARLET MONASTERY GRAVEYARD

        -- Bloodmage Thalnos
            DELETE FROM `instance_encounters` WHERE `entry` = 1175;
            INSERT INTO `instance_encounters` SET
                `entry` = 1175,
                `creditEntry` = 4543,
                `lastEncounterDungeon` = 359,
                `comment` = 'Bloodmage Thalnos';

    -- ULDAMAN

        -- Archaedas
            DELETE FROM `instance_encounters` WHERE `entry` = 1194;
            INSERT INTO `instance_encounters` SET
                `entry` = 1194,
                `creditEntry` = 2748,
                `lastEncounterDungeon` = 360,
                `comment` = 'Archaedas';

    -- ZUL'FARAK

        -- Chief Ukorz Sandscalp
            DELETE FROM `instance_encounters` WHERE `entry` = 1210;
            INSERT INTO `instance_encounters` SET
                `entry` = 1210,
                `creditEntry` = 7267,
                `lastEncounterDungeon` = 361,
                `comment` = 'Chief Ukorz Sandscalp';

    -- MARAUDON ORANGE

        -- Razorlash
            DELETE FROM `instance_encounters` WHERE `entry` = 1220;
            INSERT INTO `instance_encounters` SET
                `entry` = 1220,
                `creditEntry` = 12258,
                `lastEncounterDungeon` = 362,
                `comment` = 'Razorlash';

    -- SUNKEN TEMPLE

        -- Shade of Eranikus
            DELETE FROM `instance_encounters` WHERE `entry` = 1243;
            INSERT INTO `instance_encounters` SET
                `entry` = 1243,
                `creditEntry` = 5709,
                `lastEncounterDungeon` = 363,
                `comment` = 'Shade of Eranikus';

        -- Hukku
            DELETE FROM `instance_encounters` WHERE `entry` = 1343;
            INSERT INTO `instance_encounters` SET
                `entry` = 1343,
                `creditEntry` = 5715,
                `comment` = 'Hukku';

        -- Gasher
            DELETE FROM `instance_encounters` WHERE `entry` = 1344;
            INSERT INTO `instance_encounters` SET
                `entry` = 1344,
                `creditEntry` = 5713,
                `comment` = 'Gasher';
                
        -- Loro
            DELETE FROM `instance_encounters` WHERE `entry` = 1345;
            INSERT INTO `instance_encounters` SET
                `entry` = 1345,
                `creditEntry` = 5714,
                `comment` = 'Loro';

        -- Mijan
            DELETE FROM `instance_encounters` WHERE `entry` = 1346;
            INSERT INTO `instance_encounters` SET
                `entry` = 1346,
                `creditEntry` = 5717,
                `comment` = 'Mijan';

        -- Zolo
            DELETE FROM `instance_encounters` WHERE `entry` = 1347;
            INSERT INTO `instance_encounters` SET
                `entry` = 1347,
                `creditEntry` = 5712,
                `comment` = 'Zolo';

        -- ZulLor
            DELETE FROM `instance_encounters` WHERE `entry` = 1348;
            INSERT INTO `instance_encounters` SET
                `entry` = 1348,
                `creditEntry` = 5716,
                `comment` = 'ZulLor';

    -- BLACKROCK DEPTHS PRISON

        -- Lord Incendius
            DELETE FROM `instance_encounters` WHERE `entry` = 1085;
            INSERT INTO `instance_encounters` SET
                `entry` = 1085,
                `creditEntry` = 9017,
                `lastEncounterDungeon` = 364,
                `comment` = 'Lord Incendius';

    -- LOWER BLACKROCK SPIRE

        -- Overlord Wyrmthalak
            DELETE FROM `instance_encounters` WHERE `entry` = 1266;
            INSERT INTO `instance_encounters` SET
                `entry` = 1266,
                `creditEntry` = 9568,
                `lastEncounterDungeon` = 365,
                `comment` = 'Overlord Wyrmthalak';

    -- DIREMAUL EAST

        -- Alzzin the Wildshaper
            DELETE FROM `instance_encounters` WHERE `entry` = 1291;
            INSERT INTO `instance_encounters` SET
                `entry` = 1291,
                `creditEntry` = 11492,
                `lastEncounterDungeon` = 366,
                `comment` = 'Alzzin the Wildshaper';

    -- DIREMAUL WEST

        -- Immolthar
            DELETE FROM `instance_encounters` WHERE `entry` = 1294;
            INSERT INTO `instance_encounters` SET
                `entry` = 1294,
                `creditEntry` = 11496,
                `lastEncounterDungeon` = 367,
                `comment` = 'Immolthar';

    -- DIREMAUL NORTH

        -- King Gordok
            DELETE FROM `instance_encounters` WHERE `entry` = 1303;
            INSERT INTO `instance_encounters` SET
                `entry` = 1303,
                `creditEntry` = 11501,
                `lastEncounterDungeon` = 368,
                `comment` = 'King Gordok';

    -- STRATHOLME LIVING

        -- Balnazzar
            DELETE FROM `instance_encounters` WHERE `entry` = 1324;
            INSERT INTO `instance_encounters` SET
                `entry` = 1324,
                `creditEntry` = 10813,
                `lastEncounterDungeon` = 369,
                `comment` = 'Balnazzar';

    -- UPPER BLACKROCK SPIRE

        -- General Drakkisath
            DELETE FROM `instance_encounters` WHERE `entry` = 1271;
            INSERT INTO `instance_encounters` SET
                `entry` = 1271,
                `creditEntry` = 10363,
                `lastEncounterDungeon` = 370,
                `comment` = 'General Drakkisath';

    -- SCARLET MONASTERY ARMORY

        -- Herod
            DELETE FROM `instance_encounters` WHERE `entry` = 1178;
            INSERT INTO `instance_encounters` SET
                `entry` = 1178,
                `creditEntry` = 3975,
                `lastEncounterDungeon` = 371,
                `comment` = 'Herod';

    -- SCARLET MONASTERY CATHEDRAL

        -- High Inquisitor Whitemane
            DELETE FROM `instance_encounters` WHERE `entry` = 1180;
            INSERT INTO `instance_encounters` SET
                `entry` = 1180,
                `creditEntry` = 3977,
                `lastEncounterDungeon` = 372,
                `comment` = 'High Inquisitor Whitemane';

    -- SCARLET MONASTERY LIBRARY

        -- Arcanist Doan
            DELETE FROM `instance_encounters` WHERE `entry` = 1177;
            INSERT INTO `instance_encounters` SET
                `entry` = 1177,
                `creditEntry` = 6487,
                `lastEncounterDungeon` = 373,
                `comment` = 'Arcanist Doan';

    -- MARAUDON PURPLE

        -- Celebras the Cursed
            DELETE FROM `instance_encounters` WHERE `entry` = 1223;
            INSERT INTO `instance_encounters` SET
                `entry` = 1223,
                `creditEntry` = 12225,
                `lastEncounterDungeon` = 374,
                `comment` = 'Celebras the Cursed';

    -- MARUADON PRISTINE WATERS

        -- Princess Theradras
            DELETE FROM `instance_encounters` WHERE `entry` = 1227;
            INSERT INTO `instance_encounters` SET
                `entry` = 1227,
                `creditEntry` = 12201,
                `lastEncounterDungeon` = 375,
                `comment` = 'Princess Theradras';

    -- STRATHOLME UNDEAD

        -- Baron Rivendare
            DELETE FROM `instance_encounters` WHERE `entry` = 1330;
            INSERT INTO `instance_encounters` SET
                `entry` = 1330,
                `creditEntry` = 10440,
                `lastEncounterDungeon` = 376,
                `comment` = 'Baron Rivendare';

    -- BLACKROCK DEPTHS UPPER CITY
    
        -- Emperor Dagran Thaurissan
            DELETE FROM `instance_encounters` WHERE `entry` = 1090;
            INSERT INTO `instance_encounters` SET
                `entry` = 1090,
                `creditEntry` = 9019,
                `lastEncounterDungeon` = 377,
                `comment` = 'Emperor Dagran Thaurissan';

    -- SCHOLOMANCE

        -- Darkmaster Gandling
            DELETE FROM `instance_encounters` WHERE `entry` = 1060;
            INSERT INTO `instance_encounters` SET
                `entry` = 1060,
                `creditEntry` = 1853,
                `lastEncounterDungeon` = 378,
                `comment` = 'Darkmaster Gandling';