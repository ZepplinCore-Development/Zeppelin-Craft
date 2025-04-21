-- Dungeon Access

-- dungeon_access_template table contains the minimum entry level for dungeon at each difficulty. 
-- It also controls the minimum item level for entry.

-- dungeon_access_requirements specifies special access requirements for dungeons such as items like keys or attunement quests 
-- dungeon_access_id refers to the ID in dungeon_access_template table

DELETE FROM `dungeon_access_template`;
DELETE FROM `dungeon_access_requirements`;

-- Azeroth Dungeons and Raids

    -- AhnQiraj Ruins (AQ20)
        INSERT INTO `dungeon_access_template` SET
            `id` = 18,
            `map_id` = 509,
            `min_level` = 50,
            `comment` = 'AhnQiraj Ruins (AQ20)';

    -- AhnQiraj Temple (AQ40)
        INSERT INTO `dungeon_access_template` SET
            `id` = 19,
            `map_id` = 531,
            `min_level` = 50,
            `comment` = 'AhnQiraj Temple (AQ40)';

    -- Blackfathom Deeps
        INSERT INTO `dungeon_access_template` SET
            `id` = 5,
            `map_id` = 48,
            `min_level` = 19,
            `comment` = 'Blackfathom Deeps';

    -- Blackrock Depths (BRD)
        INSERT INTO `dungeon_access_template` SET
            `id` = 15,
            `map_id` = 230,
            `min_level` = 47,
            `comment` = 'Blackrock Depths (BRD)';

    -- Blackrock Spire - Lower (LBRS) and upper
        INSERT INTO `dungeon_access_template` SET
            `id` = 22,
            `map_id` = 229,
            `min_level` = 55,
            `comment` = 'Blackrock Spire - Lower (LBRS) and upper';

    -- Blackwing Lair (BWL) - 40man
        INSERT INTO `dungeon_access_template` SET
            `id` = 35,
            `map_id` = 469,
            `min_level` = 60,
            `comment` = 'Blackwing Lair (BWL) - 40man';

    -- Deadmines (DM)
        INSERT INTO `dungeon_access_template` SET
            `id` = 2,
            `map_id` = 36,
            `min_level` = 15,
            `comment` = 'Deadmines (DM)';

    -- Dire Maul - All wings
        INSERT INTO `dungeon_access_template` SET
            `id` = 21,
            `map_id` = 429,
            `min_level` = 53,
            `max_level` = 60,
            `comment` = 'Dire Maul - All wings';

    -- Gnomeregan
        INSERT INTO `dungeon_access_template` SET
            `id` = 8,
            `map_id` = 90,
            `min_level` = 23,
            `comment` = 'Gnomeregan';

    -- Maraudon - All wings
        INSERT INTO `dungeon_access_template` SET
            `id` = 12,
            `map_id` = 349,
            `min_level` = 39,
            `comment` = 'Maraudon - All wings';

    -- Molten Core - 40man
        INSERT INTO `dungeon_access_template` SET
            `id` = 17,
            `map_id` = 409,
            `min_level` = 50,
            `comment` = 'Molten Core - 40man';

    -- Naxxramas - 40man
        INSERT INTO `dungeon_access_template` SET
            `id` = 36,
            `map_id` = 533,
            `difficulty` = 2,
            `min_level` = 60,
            `comment` = 'Naxxramas - 40man';

    -- Onyxias Lair - 40man
        INSERT INTO `dungeon_access_template` SET
            `id` = 20,
            `map_id` = 249,
            `difficulty` = 2,
            `min_level` = 50,
            `comment` = 'Onyxias Lair - 40man';

        INSERT INTO `dungeon_access_requirements` SET
            `dungeon_access_id` = 20,
            `requirement_type` = 2, -- Item
            `requirement_id` = 16309,
            `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
            `faction` = 2,
            `comment` = 'Onyxias Lair - 40man';

    -- Ragefire Chasm (RFC)
        INSERT INTO `dungeon_access_template` SET
            `id` = 1,
            `map_id` = 389,
            `min_level` = 8,
            `comment` = 'Ragefire Chasm (RFC)';

    -- Razorfen Downs
        INSERT INTO `dungeon_access_template` SET
            `id` = 10,
            `map_id` = 129,
            `min_level` = 32,
            `comment` = 'Razorfen Downs';

    -- Razorfen Kraul
        INSERT INTO `dungeon_access_template` SET
            `id` = 7,
            `map_id` = 47,
            `min_level` = 22,
            `comment` = 'Razorfen Kraul';

    -- Scarlet Monastery (SM) - All wings
        INSERT INTO `dungeon_access_template` SET
            `id` = 9,
            `map_id` = 189,
            `min_level` = 27,
            `comment` = 'Scarlet Monastery (SM) - All wings';

    -- Scholomance
        INSERT INTO `dungeon_access_template` SET
            `id` = 24,
            `map_id` = 289,
            `min_level` = 55,
            `comment` = 'Scholomance';

    -- Shadowfang Keep
        INSERT INTO `dungeon_access_template` SET
            `id` = 4,
            `map_id` = 33,
            `min_level` = 16,
            `comment` = 'Shadowfang Keep';

    -- Stormwind Stockades
        INSERT INTO `dungeon_access_template` SET
            `id` = 6,
            `map_id` = 34,
            `min_level` = 20,
            `comment` = 'Stormwind Stockades';

    -- Stratholme
        INSERT INTO `dungeon_access_template` SET
            `id` = 25,
            `map_id` = 329,
            `min_level` = 55,
            `comment` = 'Stratholme';

    -- Sunken Temple (of AtalHakkar)
        INSERT INTO `dungeon_access_template` SET
            `id` = 14,
            `map_id` = 109,
            `min_level` = 45,
            `comment` = 'Sunken Temple (of AtalHakkar)';

    -- Uldaman
        INSERT INTO `dungeon_access_template` SET
            `id` = 11,
            `map_id` = 70,
            `min_level` = 35,
            `comment` = 'Uldaman';

    -- Wailing Caverns (WC)
        INSERT INTO `dungeon_access_template` SET
            `id` = 3,
            `map_id` = 43,
            `min_level` = 15,
            `comment` = 'Wailing Caverns (WC)';

    -- ZulFarrak (ZF)
        INSERT INTO `dungeon_access_template` SET
            `id` = 13,
            `map_id` = 209,
            `min_level` = 41,
            `comment` = 'ZulFarrak (ZF)';

    -- ZulGurub (ZG) - 20man
        INSERT INTO `dungeon_access_template` SET
            `id` = 16,
            `map_id` = 309,
            `min_level` = 50,
            `comment` = 'ZulGurub (ZG) - 20man';

-- Outland Dungeons and Raids

    -- The Battle of Mount Hyjal
        INSERT INTO `dungeon_access_requirements` SET
            `dungeon_access_id` = 53,
            `requirement_type` = 1, -- Quest
            `requirement_id` = 10445,
            `requirement_note` = 'You must complete the quest "The Vials of Eternity" and be level 70 before entering The Battle of Mount Hyjal.',
            `faction` = 2,
            `priority` = NULL,
            `comment` = 'The Battle of Mount Hyjal';

        INSERT INTO `dungeon_access_template` SET
            `id` = 53,
            `map_id` = 534,
            `min_level` = 70,
            `comment` = 'The Battle of Mount Hyjal';

    -- Black Temple
        INSERT INTO `dungeon_access_template` SET
            `id` = 69,
            `map_id` = 564,
            `min_level` = 70,
            `comment` = 'Black Temple';

        INSERT INTO `dungeon_access_requirements` SET
            `dungeon_access_id` = 69,
            `requirement_type` = 2, -- Item
            `requirement_id` = 32649,
            `requirement_note` = 'You must possess the Medallion of Karabor to enter the Black Temple.',
            `faction` = 2,
            `comment` = 'Black Temple';

    -- Caverns Of Time:

        -- Caverns Of Time: Black Morass/Opening the Dark Portal

            -- Caverns Of Time: Black Morass/Opening the Dark Portal - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 42,
                    `map_id` = 269,
                    `min_level` = 66,
                    `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Normal';

            -- Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 52,
                    `map_id` = 269,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 52,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 10285,
                    `requirement_note` = 'You must complete the quest "Return to Andormu" and be level 70 before entering the Heroic difficulty of the Black Morass.',
                    `faction` = 2,
                    `leader_only` = 1,
                    `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 52,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30635,
                    `requirement_note` = 'You must possess the Key of Time to enter.',
                    `faction` = 2,
                    `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic';

        -- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde

            -- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 68,
                    `map_id` = 560,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 68,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30635,
                    `faction` = 2,
                    `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic - Key of Time';

            -- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 37,
                    `map_id` = 560,
                    `min_level` = 64,
                    `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 37,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 10277,
                    `requirement_note` = 'You must complete the quest "The Caverns of Time" to enter Old Hillsbrad.',
                    `faction` = 2,
                    `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal';

    -- Gruuls Lair
        INSERT INTO `dungeon_access_template` SET
            `id` = 70,
            `map_id` = 565,
            `min_level` = 70,
            `comment` = 'Gruuls Lair';

    -- Karazhan - 10man
        INSERT INTO `dungeon_access_template` SET
            `id` = 47,
            `map_id` = 532,
            `min_level` = 68,
            `comment` = 'Karazhan - 10man';

    -- Isle of QuelDanas:

        -- Isle of QuelDanas: Magisters Terrace

            -- Isle of QuelDanas: Magisters Terrace (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 41,
                    `map_id` = 585,
                    `min_level` = 65,
                    `comment` = 'Isle of QuelDanas: Magisters Terrace (Normal)';

            -- Isle of QuelDanas: Magisters Terrace (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 73,
                    `map_id` = 585,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Isle of QuelDanas: Magisters Terrace (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 73,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 11492,
                    `requirement_note` = 'You must complete the quest "Hard to Kill" and be level 70 before entering the Heroic difficulty of the Magisters Terrace.',
                    `faction` = 2,
                    `comment` = 'Isle of QuelDanas: Magisters Terrace (Heroic)';

        -- Isle of QuelDanas: Sunwell Plateau
            INSERT INTO `dungeon_access_template` SET
                `id` = 72,
                `map_id` = 580,
                `min_level` = 70,
                `comment` = 'Isle of QuelDanas: Sunwell Plateau';

    -- Auchindoun

        -- Auchindoun: Auchenai Crypts

            -- Auchindoun: Auchenai Crypts (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 34,
                    `map_id` = 558,
                    `min_level` = 55,
                    `comment` = 'Auchindoun: Auchenai Crypts (Normal)';

            -- Auchindoun: Auchenai Crypts (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 67,
                    `map_id` = 558,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Auchindoun: Auchenai Crypts (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 67,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30633,
                    `faction` = 2,
                    `comment` = 'Auchindoun: Auchenai Crypts (Heroic) - Auchenai Key';

        -- Auchindoun: Mana-Tombs

            -- Auchindoun: Mana-Tombs (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 33,
                    `map_id` = 557,
                    `min_level` = 55,
                    `comment` = 'Auchindoun: Mana-Tombs (Normal)';

            -- Auchindoun: Mana-Tombs (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 66,
                    `map_id` = 557,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Auchindoun: Mana-Tombs (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 66,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30633,
                    `faction` = 2,
                    `comment` = 'Auchindoun: Mana-Tombs (Heroic) - Auchenai Key';

        -- Auchindoun: Sethekk Halls

            -- Auchindoun: Sethekk Halls (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 32,
                    `map_id` = 556,
                    `min_level` = 55,
                    `comment` = 'Auchindoun: Sethekk Halls (Normal)';

            -- Auchindoun: Sethekk Halls (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 65,
                    `map_id` = 556,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Auchindoun: Sethekk Halls (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 65,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30633,
                    `faction` = 2,
                    `comment` = 'Auchindoun: Sethekk Halls (Heroic) - Auchenai Key';

        -- Auchindoun: Shadow Labyrinth

            -- Auchindoun: Shadow Labyrinth (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 39,
                    `map_id` = 555,
                    `min_level` = 65,
                    `comment` = 'Auchindoun: Shadow Labyrinth (Normal)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 39,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 27991,
                    `requirement_note` = 'You must obtain the Shadow Labyrinth key.',
                    `faction` = 2,
                    `comment` = 'Auchindoun: Shadow Labyrinth (Normal) - Shadow Labyrinth key';

            -- Auchindoun: Shadow Labyrinth (Heroic)

                INSERT INTO `dungeon_access_template` SET
                    `id` = 64,
                    `map_id` = 555,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Auchindoun: Shadow Labyrinth (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 64,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 27991,
                    `requirement_note` = 'You must obtain the Shadow Labyrinth key.',
                    `faction` = 2,
                    `comment` = 'Auchindoun: Shadow Labyrinth (Heroic) - Shadow Labyrinth key';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 64,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30633,
                    `requirement_note` = 'You must obtain the Auchenai Key',
                    `faction` = 2,
                    `comment` = 'Auchindoun: Shadow Labyrinth (Heroic) - Auchenai Key';

    -- Hellfire Citadel

        -- Hellfire Citadel: The Blood Furnace

            -- Hellfire Citadel: The Blood Furnace - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 27,
                    `map_id` = 542,
                    `min_level` = 55,
                    `comment` = 'Hellfire Citadel: The Blood Furnace - Normal';

            -- Hellfire Citadel: The Blood Furnace - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 55,
                    `map_id` = 542,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Hellfire Citadel: The Blood Furnace - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 55,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30622,
                    `faction` = 0,
                    `comment` = 'Hellfire Citadel: The Blood Furnace - Heroic - Alliance - Flamewrought Key';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 55,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30637,
                    `faction` = 1,
                    `comment` = 'Hellfire Citadel: The Blood Furnace - Heroic - Horde - Flamewrought Key';

        -- Hellfire Citadel: The Shattered Halls

            -- Hellfire Citadel: The Shattered Halls (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 26,
                    `map_id` = 540,
                    `min_level` = 55,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Normal)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 26,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 28395,
                    `requirement_note` = 'You must obtain the Shattered Halls Key.',
                    `faction` = 2,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Normal)';

            -- Hellfire Citadel: The Shattered Halls (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 54,
                    `map_id` = 540,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 54,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 28395,
                    `requirement_note` = 'You must obtain the Shattered Halls Key.',
                    `faction` = 2,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Shattered Halls Key';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 54,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30622,
                    `faction` = 0,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Alliance - Flamewrought Key';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 54,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30637,
                    `faction` = 1,
                    `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Horde - Flamewrought Key';

        -- Hellfire Citadel: Magtheridons Lair - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 38,
                `map_id` = 544,
                `min_level` = 65,
                `comment` = 'Hellfire Citadel: Magtheridons Lair - 25man';

        -- Hellfire Citadel: Hellfire Ramparts

        -- Hellfire Citadel: Hellfire Ramparts (Normal)
            INSERT INTO `dungeon_access_template` SET
                `id` = 28,
                `map_id` = 543,
                `min_level` = 55,
                `comment` = 'Hellfire Citadel: Hellfire Ramparts (Normal)';

        -- Hellfire Citadel: Hellfire Ramparts (Heroic)
            INSERT INTO `dungeon_access_template` SET
                `id` = 56,
                `map_id` = 543,
                `difficulty` = 1,
                `min_level` = 70,
                `comment` = 'Hellfire Ramparts - Heroic';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 56,
                `requirement_type` = 2, -- Item
                `requirement_id` = 30622,
                `faction` = 0,
                `comment` = 'Hellfire Citadel: Hellfire Ramparts (Heroic) - Alliance - Flamewrought Key';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 56,
                `requirement_type` = 2, -- Item
                `requirement_id` = 30637,
                `faction` = 1,
                `comment` = 'Hellfire Citadel: Hellfire Ramparts (Heroic) - Horde - Flamewrought Key';

    -- Tempest Keep

        -- Tempest Keep: The Botanica

            -- Tempest Keep: The Botanica (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 44,
                    `map_id` = 553,
                    `min_level` = 67,
                    `comment` = 'Tempest Keep: The Botanica (Normal)';

            -- Tempest Keep: The Botanica (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 62,
                    `map_id` = 553,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Tempest Keep: The Botanica (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 62,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30634,
                    `faction` = 2,
                    `comment` = 'Tempest Keep: The Botanica (Heroic) - Warpforged Key';

        -- Tempest Keep: The Eye
            INSERT INTO `dungeon_access_template` SET
                `id` = 60,
                `map_id` = 550,
                `min_level` = 70,
                `comment` = 'Tempest Keep: The Eye';
        
            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 60,
                `requirement_type` = 1, -- Quest
                `requirement_id` = 10888,
                `requirement_note` = 'You must complete "The Trial of the Naaru: Magtheridon" to enter The Eye.',
                `faction` = 2,
                `comment` = 'Tempest Keep: The Eye';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 60,
                `requirement_type` = 2, -- Item
                `requirement_id` = 31704,
                `requirement_note` = 'You must possess The Tempest Key to enter The Eye.',
                `faction` = 2,
                `comment` = 'Tempest Keep: The Eye';

        -- Tempest Keep: The Arcatraz

            -- Tempest Keep: The Arcatraz (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 49,
                    `map_id` = 552,
                    `min_level` = 68,
                    `comment` = 'Tempest Keep: The Arcatraz (Normal)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 49,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 31084,
                    `requirement_note` = 'You must obtain the Arcatraz key.',
                    `faction` = 2,
                    `comment` = 'Tempest Keep: The Arcatraz (Normal)';

            -- Tempest Keep: The Arcatraz (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 61,
                    `map_id` = 552,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Tempest Keep: The Arcatraz (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 61,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 31084,
                    `requirement_note` = 'You must obtain the Arcatraz key.',
                    `faction` = 2,
                    `comment` = 'Tempest Keep: The Arcatraz (Heroic) - Key to the Arcatraz';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 61,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30634,
                    `faction` = 2,
                    `comment` = 'Tempest Keep: The Arcatraz (Heroic) - Warpforged Key';

        -- Tempest Keep: The Mechanar

            -- Tempest Keep: The Mechanar (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 45,
                    `map_id` = 554,
                    `min_level` = 67,
                    `comment` = 'Tempest Keep: The Mechanar (Normal)';

            -- Tempest Keep: The Mechanar (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 63,
                    `map_id` = 554,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Tempest Keep: The Mechanar (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 63,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30634,
                    `faction` = 2,
                    `comment` = 'Tempest Keep: The Mechanar (Heroic) - Warpforged Key';

    -- Coilfang Resevoir

        -- Coilfang Resevoir: The Slave Pens

            -- Coilfang Resevoir: The Slave Pens (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 31,
                    `map_id` = 547,
                    `min_level` = 55,
                    `comment` = 'Coilfang Resevoir: The Slave Pens (Normal)';

            -- Coilfang Resevoir: The Slave Pens (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 59,
                    `map_id` = 547,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Coilfang Resevoir: The Slave Pens (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 59,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30623,
                    `faction` = 2,
                    `comment` = 'Coilfang Resevoir: The Slave Pens (Heroic) - Reservoir Key';

        -- Coilfang Resevoir: The Steamvault

            -- Coilfang Resevoir: The Steamvault - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 29,
                    `map_id` = 545,
                    `min_level` = 55,
                    `comment` = 'Coilfang Resevoir: The Steamvault - Normal';

            -- Coilfang Resevoir: The Steamvault - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 57,
                    `map_id` = 545,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Coilfang Resevoir: The Steamvault - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 57,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30623,
                    `faction` = 2,
                    `comment` = 'Coilfang Resevoir: The Steamvault - Heroic';

        -- Coilfang Resevoir: The Underbog

            -- Coilfang Resevoir: The Underbog (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 30,
                    `map_id` = 546,
                    `min_level` = 55,
                    `comment` = 'Coilfang Resevoir: The Underbog (Normal)';

            -- Coilfang Resevoir: The Underbog (Heroic)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 58,
                    `map_id` = 546,
                    `difficulty` = 1,
                    `min_level` = 70,
                    `comment` = 'Coilfang Resevoir: The Underbog (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 58,
                    `requirement_type` = 2, -- Item
                    `requirement_id` = 30623,
                    `faction` = 2,
                    `comment` = 'Coilfang Resevoir: The Underbog (Heroic) - Reservoir Key';

        -- Coilfang Reservoir: Serpentshrine Cavern - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 48,
                `map_id` = 548,
                `min_level` = 68,
                `comment` = 'Coilfang Reservoir: Serpentshrine Cavern - 25man';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 48,
                `requirement_type` = 1, -- Quest
                `requirement_id` = 10901,
                `requirement_note` = 'You must complete the quest "The Cudgel of Kardesh" and be level 70 before entering Serpentshrine Reservoir.',
                `faction` = 2,
                `priority` = NULL,
                `comment` = 'Coilfang Reservoir: Serpentshrine Cavern - 25man';

    -- ZulAman
        INSERT INTO `dungeon_access_template` SET
            `id` = 71,
            `map_id` = 568,
            `min_level` = 70,
            `comment` = 'ZulAman';

-- Northrend Dungeons and Raids

    -- AhnKahet

        -- AhnKahet - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 50,
                `map_id` = 619,
                `min_level` = 68,
                `comment` = 'AhnKahet - Normal';

        -- AhnKahet - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 106,
                `map_id` = 619,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'AhnKahet - Heroic';

    -- Azjol-Nerub

        -- Azjol-Nerub - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 46,
                `map_id` = 601,
                `min_level` = 67,
                `comment` = 'Azjol-Nerub';

        -- Azjol-Nerub - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 96,
                `map_id` = 601,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Azjol-Nerub';

    -- Culling of Stratholme

        -- Culling of Stratholme - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 79,
                `map_id` = 595,
                `min_level` = 75,
                `comment` = 'Culling of Stratholme';

        -- Culling of Stratholme - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 93,
                `map_id` = 595,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Culling of Stratholme';

    -- The Obsidian Sanctum

        -- The Obsidian Sanctum - 10man
            INSERT INTO `dungeon_access_template` SET
                `id` = 102,
                `map_id` = 615,
                `min_level` = 80,
                `comment` = 'The Obsidian Sanctum - 10man';

        -- Obsidian Sanctum - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 103,
                `map_id` = 615,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Chamber of Aspects,Obsidian Sanctum';

    -- DrakTharon Keep

        -- DrakTharon Keep - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 51,
                `map_id` = 600,
                `min_level` = 69,
                `comment` = 'DrakTharon Keep';

        -- DrakTharon Keep - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 95,
                `map_id` = 600,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'DrakTharon Keep';

    -- Forge of Souls

        -- Forge of Souls - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 81,
                `map_id` = 632,
                `min_level` = 75,
                `min_avg_item_level` = 180,
                `comment` = 'Forge of Souls';

        -- Forge of Souls - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 113,
                `map_id` = 632,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 200,
                `comment` = 'Forge of Souls';

    -- Gundrak

        -- Gundrak (North entrance) - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 75,
                `map_id` = 604,
                `min_level` = 71,
                `comment` = 'Gundrak (North entrance) - Normal';

        -- Gundrak (North entrance) - Heroic
            INSERT INTO `dungeon_access_template` SET
            `id` = 100,
            `map_id` = 604,
            `difficulty` = 1,
            `min_level` = 80,
            `min_avg_item_level` = 180,
            `comment` = 'Gundrak (North entrance) - Heroic';

    -- Naxxramas

        -- Naxxramas - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 88,
                `map_id` = 533,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Naxxramas - 25man';

        -- Naxxramas - 10man
            INSERT INTO `dungeon_access_template` SET
                `id` = 87,
                `map_id` = 533,
                `min_level` = 80,
                `comment` = 'Naxxramas - 10man';

    -- Onyxias Lair

        -- Onyxias Lair - 10man
            INSERT INTO `dungeon_access_template` SET
                `id` = 85,
                `map_id` = 249,
                `min_level` = 80,
                `comment` = 'Onyxias Lair - 10man';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 85,
                `requirement_type` = 2, -- Item
                `requirement_id` = 16309,
                `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
                `faction` = 2,
                `comment` = 'Onyxias Lair - 10man';

        -- Onyxias Lair - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 86,
                `map_id` = 249,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Onyxias Lair - 25man';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 86,
                `requirement_type` = 2, -- Item
                `requirement_id` = 16309,
                `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
                `faction` = 2,
                `comment` = 'Onyxias Lair - 25man';
                
    -- Icecrown Citadel

        -- Icecrown Citadel: Pit of Saron 

            -- Icecrown Citadel: Pit of Saron (Normal)
                    INSERT INTO `dungeon_access_template` SET
                        `id` = 83,
                        `map_id` = 658,
                        `min_level` = 78,
                        `min_avg_item_level` = 180,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Normal)';

                    INSERT INTO `dungeon_access_requirements` SET
                        `dungeon_access_id` = 83,
                        `requirement_type` = 1, -- Quest
                        `requirement_id` = 24499,
                        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron.',
                        `faction` = 0,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Normal) - Alliance';

                    INSERT INTO `dungeon_access_requirements` SET
                        `dungeon_access_id` = 83,
                        `requirement_type` = 1, -- Quest
                        `requirement_id` = 24511,
                        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron.',
                        `faction` = 1,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Normal) - Horde';

            -- Icecrown Citadel: Pit of Saron (Heroic)
                    INSERT INTO `dungeon_access_template` SET
                        `id` = 119,
                        `map_id` = 658,
                        `difficulty` = 1,
                        `min_level` = 80,
                        `min_avg_item_level` = 200,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Heroic)';

                    INSERT INTO `dungeon_access_requirements` SET
                        `dungeon_access_id` = 119,
                        `requirement_type` = 1, -- Quest
                        `requirement_id` = 24499,
                        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" and be level 80 before entering the Heroic difficulty of the Pit of Saron.',
                        `faction` = 0,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Heroic) - Alliance';

                    INSERT INTO `dungeon_access_requirements` SET
                        `dungeon_access_id` = 119,
                        `requirement_type` = 1, -- Quest
                        `requirement_id` = 24511,
                        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" and be level 80 before entering the Heroic difficulty of the Pit of Saron.',
                        `faction` = 1,
                        `comment` = 'Icecrown Citadel: Pit of Saron (Heroic) - Horde';

        -- Icecrown Citadel: Halls of Reflection

            -- Icecrown Citadel: Halls of Reflection (Normal)
                INSERT INTO `dungeon_access_template` SET
                    `id` = 84,
                    `map_id` = 668,
                    `min_level` = 78,
                    `min_avg_item_level` = 180,
                    `comment` = 'Icecrown Citadel: Halls of Reflection (Normal)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 84,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 24710,
                    `requirement_note` = 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection.',
                    `faction` = 0,
                    `comment` = 'Icecrown Citadel: Halls of Reflection (Normal) - Alliance';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 84,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 24712,
                    `requirement_note` = 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection.',
                    `faction` = 1,
                    `comment` = 'Icecrown Citadel: Halls of Reflection (Normal) - Horde';

            -- Icecrown Citadel: Halls of Reflection (Heroic)
                INSERT INTO `dungeon_access_template` SET
                `id` = 120,
                `map_id` = 668,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 219,
                `comment` = 'Icecrown Citadel: Halls of Reflection (Heroic)';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 120,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 24710,
                    `requirement_note` = 'You must complete the quest "Deliverance from the Pit" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.',
                    `faction` = 0,
                    `comment` = 'Icecrown Citadel: Halls of Reflection (Heroic) - Alliance';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 120,
                    `requirement_type` = 1, -- Quest
                    `requirement_id` = 24712,
                    `requirement_note` = 'You must complete the quest "Deliverance from the Pit" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.',
                    `faction` = 1,
                    `comment` = 'Icecrown Citadel: Halls of Reflection (Heroic) - Horde';

        -- Icecrown Citadel: Raid

            -- Icecrown Citadel - 10man - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 109,
                    `map_id` = 631,
                    `min_level` = 80,
                    `comment` = 'Icecrown Citadel - 10man Normal';

            -- Icecrown Citadel - 10man - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 111,
                    `map_id` = 631,
                    `difficulty` = 2,
                    `min_level` = 80,
                    `comment` = 'Icecrown Citadel - 10man - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 111,
                    `requirement_type` = 0, -- Achievement
                    `requirement_id` = 4530,
                    `faction` = 2,
                    `comment` = 'Icecrown Citadel - 10man - Heroic';

            -- Icecrown Citadel - 25man - Normal
                INSERT INTO `dungeon_access_template` SET
                    `id` = 110,
                    `map_id` = 631,
                    `difficulty` = 1,
                    `min_level` = 80,
                    `comment` = 'Icecrown Citadel - 25man - Normal';

            -- Icecrown Citadel - 25man - Heroic
                INSERT INTO `dungeon_access_template` SET
                    `id` = 112,
                    `map_id` = 631,
                    `difficulty` = 3,
                    `min_level` = 80,
                    `comment` = 'Icecrown Citadel - 25man - Heroic';

                INSERT INTO `dungeon_access_requirements` SET
                    `dungeon_access_id` = 112,
                    `requirement_type` = 0, -- Achievement
                    `requirement_id` = 4597,
                    `faction` = 2,
                    `comment` = 'Icecrown Citadel - 25man - Heroic';
                    
    -- The Eye of Eternity

        -- The Eye of Eternity - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 105,
                `map_id` = 616,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'The Eye of Eternity - 25man';

        -- The Eye of Eternity - 10man 
            INSERT INTO `dungeon_access_template` SET
                `id` = 104,
                `map_id` = 616,
                `min_level` = 80,
                `comment` = 'The Eye of Eternity - 10man';

    -- The Nexus

        -- The Nexus - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 43,
                `map_id` = 576,
                `min_level` = 66,
                `comment` = 'The Nexus - Normal';

        -- The Nexus - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 91,
            `map_id` = 576,
            `difficulty` = 1,
            `min_level` = 80,
            `min_avg_item_level` = 180,
            `comment` = 'The Nexus - Heroic';

    -- The Oculus

        -- The Oculus - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 78,
                `map_id` = 578,
                `min_level` = 75,
                `comment` = 'The Oculus - Normal';

        -- The Oculus - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 92,
            `map_id` = 578,
            `difficulty` = 1,
            `min_level` = 80,
            `min_avg_item_level` = 180,
            `comment` = 'The Oculus - Heroic';

    -- The Ruby Sanctum

        -- The Ruby Sanctum - 25man - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 122,
                `map_id` = 724,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'The Ruby Sanctum - 25man - Normal';

        -- The Ruby Sanctum - 10man - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 123,
                `map_id` = 724,
                `difficulty` = 2,
                `min_level` = 80,
                `comment` = 'The Ruby Sanctum - 10man - Heroic';

        -- The Ruby Sanctum - 25man - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 124,
                `map_id` = 724,
                `difficulty` = 3,
                `min_level` = 80,
                `comment` = 'The Ruby Sanctum - 25man - Heroic';

        -- The Ruby Sanctum - 10man - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 121,
                `map_id` = 724,
                `min_level` = 80,
                `comment` = 'The Ruby Sanctum - 10man - Normal';

    -- Trial of the Champion

        -- Trial of the Champion - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 82,
                `map_id` = 650,
                `min_level` = 75,
                `min_avg_item_level` = 180,
                `comment` = 'Trial of the Champion - Normal';

        -- Trial of the Champion - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 118,
                `map_id` = 650,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 200,
                `comment` = 'Trial of the Champion - Heroic';

    -- Trial of the Crusader

        -- Trial of the Crusader - 10man - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 114,
                `map_id` = 649,
                `min_level` = 80,
                `comment` = 'Trial of the Crusader - 10man - Normal';

        -- Trial of the Crusader - 25man - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 115,
                `map_id` = 649,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Trial of the Crusader - 25man - Normal';

        -- Trial of the Crusader - 10man - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 116,
                `map_id` = 649,
                `difficulty` = 2,
                `min_level` = 80,
                `comment` = 'Trial of the Crusader - 10man - Heroic';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 116,
                `requirement_type` = 0, -- Achievement
                `requirement_id` = 3917,
                `faction` = 2,
                `comment` = 'Trial of the Crusader - 10man - Heroic';                

        -- Trial of the Crusader - 25man - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 117,
                `map_id` = 649,
                `difficulty` = 3,
                `min_level` = 80,
                `comment` = 'Trial of the Crusader - 25man - Heroic';

            INSERT INTO `dungeon_access_requirements` SET
                `dungeon_access_id` = 117,
                `requirement_type` = 0, -- Achievement
                `requirement_id` = 3916,
                `faction` = 2,
                `comment` = 'Trial of the Crusader - 25man - Heroic';            

    -- Ulduar

        -- Ulduar - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 99,
                `map_id` = 603,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Ulduar - 25man';

        -- Ulduar - 10man
            INSERT INTO `dungeon_access_template` SET
                `id` = 98,
                `map_id` = 603,
                `min_level` = 80,
                `comment` = 'Ulduar - 10man';

    -- Ulduar,Halls of Lightning

        -- Ulduar,Halls of Lightning - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 80,
                `map_id` = 602,
                `min_level` = 75,
                `comment` = 'Ulduar,Halls of Lightning - Normal';

        -- Ulduar,Halls of Lightning - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 97,
                `map_id` = 602,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Ulduar,Halls of Lightning - Heroic';

    -- Ulduar,Halls of Stone

        -- Ulduar,Halls of Stone - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 76,
                `map_id` = 599,
                `min_level` = 72,
                `comment` = 'Ulduar,Halls of Stone - Normal';

        -- Ulduar,Halls of Stone - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 94,
                `map_id` = 599,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Ulduar,Halls of Stone - Heroic';

    -- Utgarde Keep

        -- Utgarde Keep - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 40,
                `map_id` = 574,
                `min_level` = 65,
                `comment` = 'Utgarde Keep - Normal';

        -- Utgarde Keep - Heroic 
            INSERT INTO `dungeon_access_template` SET
                `id` = 89,
                `map_id` = 574,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Utgarde Keep - Heroic';

    -- Utgarde Pinnacle

        -- Utgarde Pinnacle - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 77,
                `map_id` = 575,
                `min_level` = 75,
                `comment` = 'Utgarde Pinnacle - Normal';

        -- Utgarde Pinnacle - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 90,
                `map_id` = 575,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Utgarde Pinnacle - Heroic';

    -- Vault of Archavon

        -- Vault of Archavon - 25man
            INSERT INTO `dungeon_access_template` SET
                `id` = 108,
                `map_id` = 624,
                `difficulty` = 1,
                `min_level` = 80,
                `comment` = 'Vault of Archavon - 25man';

        -- Vault of Archavon - 10man
            INSERT INTO `dungeon_access_template` SET
                `id` = 107,
                `map_id` = 624,
                `min_level` = 80,
                `comment` = 'Vault of Archavon - 10man';

    -- Violet Hold

        -- Violet Hold - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 74,
                `map_id` = 608,
                `min_level` = 70,
                `comment` = 'Violet Hold - Normal';

        -- Violet Hold - Heroic
            INSERT INTO `dungeon_access_template` SET
                `id` = 101,
                `map_id` = 608,
                `difficulty` = 1,
                `min_level` = 80,
                `min_avg_item_level` = 180,
                `comment` = 'Violet Hold - Heroic';
