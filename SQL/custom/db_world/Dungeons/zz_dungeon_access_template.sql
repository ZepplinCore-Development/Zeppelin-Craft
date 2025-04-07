-- This query replaces the dungeon_access_template table which contains the minimum entry level for dungeon at each difficulty. 
-- It also controls the minimum item level for entry.

DELETE FROM `dungeon_access_template`;

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

    -- Auchenai Crypts - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 34,
            `map_id` = 558,
            `min_level` = 55,
            `comment` = 'Auchenai Crypts';

    -- Auchenai Crypts - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 67,
            `map_id` = 558,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Auchenai Crypts';

    -- Battle Of Mount Hyjal,Alliance Base
        INSERT INTO `dungeon_access_template` SET
            `id` = 53,
            `map_id` = 534,
            `min_level` = 70,
            `comment` = 'Battle Of Mount Hyjal,Alliance Base';

    -- Black Temple
        INSERT INTO `dungeon_access_template` SET
            `id` = 69,
            `map_id` = 564,
            `min_level` = 70,
            `comment` = 'Black Temple';

    -- Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 52,
            `map_id` = 269,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic';

    -- Caverns Of Time: Black Morass/Opening the Dark Portal - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 42,
            `map_id` = 269,
            `min_level` = 66,
            `comment` = 'Caverns Of Time: Black Morass/Opening the Dark Portal - Normal';

    -- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 68,
            `map_id` = 560,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic';

    -- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 37,
            `map_id` = 560,
            `min_level` = 64,
            `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal';

    -- Coilfang Reservoir: Serpentshrine Cavern - 25man
        INSERT INTO `dungeon_access_template` SET
            `id` = 48,
            `map_id` = 548,
            `min_level` = 68,
            `comment` = 'Coilfang Reservoir: Serpentshrine Cavern - 25man';

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

    -- Gruuls Lair
        INSERT INTO `dungeon_access_template` SET
            `id` = 70,
            `map_id` = 565,
            `min_level` = 70,
            `comment` = 'Gruuls Lair';

    -- Hellfire Citadel: Magtheridons Lair - 25man
        INSERT INTO `dungeon_access_template` SET
            `id` = 38,
            `map_id` = 544,
            `min_level` = 65,
            `comment` = 'Hellfire Citadel: Magtheridons Lair - 25man';

    -- Hellfire Ramparts - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 28,
            `map_id` = 543,
            `min_level` = 55,
            `comment` = 'Hellfire Ramparts - Normal';

    -- Hellfire Ramparts - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 56,
            `map_id` = 543,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Hellfire Ramparts - Heroic';

    -- Karazhan - 10man
        INSERT INTO `dungeon_access_template` SET
            `id` = 47,
            `map_id` = 532,
            `min_level` = 68,
            `comment` = 'Karazhan - 10man';

    -- Magisters Terrace - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 73,
            `map_id` = 585,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Magisters Terrace - Heroic';

    -- Magisters Terrace - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 41,
            `map_id` = 585,
            `min_level` = 65,
            `comment` = 'Magisters Terrace - Normal';

    -- Mana Tombs - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 33,
            `map_id` = 557,
            `min_level` = 55,
            `comment` = 'Mana Tombs - Normal';

    -- Mana Tombs - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 66,
            `map_id` = 557,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Mana Tombs - Heroic';

    -- Sethekk Halls - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 32,
            `map_id` = 556,
            `min_level` = 55,
            `comment` = 'Sethekk Halls - Normal';

    -- Sethekk Halls - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 65,
            `map_id` = 556,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Sethekk Halls - Heroic';

    -- Shadow Labyrinth - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 39,
            `map_id` = 555,
            `min_level` = 65,
            `comment` = 'Shadow Labyrinth - Normal';

    -- Shadow Labyrinth - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 64,
            `map_id` = 555,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'Shadow Labyrinth - Heroic';

    -- Sunwell Plateau
        INSERT INTO `dungeon_access_template` SET
            `id` = 72,
            `map_id` = 580,
            `min_level` = 70,
            `comment` = 'Sunwell Plateau';

    -- The Arcatraz

        -- The Arcatraz - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 49,
                `map_id` = 552,
                `min_level` = 68,
                `comment` = 'The Arcatraz - Normal';

        -- The Arcatraz - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 61,
            `map_id` = 552,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Arcatraz - Heroic';

    -- The Blood Furnace

        -- The Blood Furnace - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 27,
                `map_id` = 542,
                `min_level` = 55,
                `comment` = 'The Blood Furnace - Normal';

        -- The Blood Furnace - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 55,
            `map_id` = 542,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Blood Furnace - Heroic';

    -- The Botanica

        -- The Botanica - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 44,
                `map_id` = 553,
                `min_level` = 67,
                `comment` = 'The Botanica - Normal';

        -- The Botanica - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 62,
            `map_id` = 553,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Botanica - Heroic';

    -- The Eye
        INSERT INTO `dungeon_access_template` SET
            `id` = 60,
            `map_id` = 550,
            `min_level` = 70,
            `comment` = 'The Eye';

    -- The Mechanar

        -- The Mechanar - Normal
            INSERT INTO `dungeon_access_template` SET
                `id` = 45,
                `map_id` = 554,
                `min_level` = 67,
                `comment` = 'The Mechanar - Normal';

        -- The Mechanar - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 63,
            `map_id` = 554,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Mechanar - Heroic';

    -- The Shattered Halls - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 26,
            `map_id` = 540,
            `min_level` = 55,
            `comment` = 'The Shattered Halls - Normal';

    -- The Shattered Halls - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 54,
            `map_id` = 540,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Shattered Halls - Heroic';

    -- The Slave Pens - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 31,
            `map_id` = 547,
            `min_level` = 55,
            `comment` = 'The Slave Pens - Normal';

    -- The Slave Pens - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 59,
            `map_id` = 547,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Slave Pens - Heroic';

    -- The Steamvault - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 29,
            `map_id` = 545,
            `min_level` = 55,
            `comment` = 'The Steamvault - Normal';

    -- The Steamvault - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 57,
            `map_id` = 545,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Steamvault - Heroic';

    -- The Underbog - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 30,
            `map_id` = 546,
            `min_level` = 55,
            `comment` = 'The Underbog - Normal';

    -- The Underbog - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 58,
            `map_id` = 546,
            `difficulty` = 1,
            `min_level` = 70,
            `comment` = 'The Underbog - Heroic';

    -- ZulAman
        INSERT INTO `dungeon_access_template` SET
            `id` = 71,
            `map_id` = 568,
            `min_level` = 70,
            `comment` = 'ZulAman';

-- Northrend Dungeons and Raids

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

    -- Chamber of Aspects,Obsidian Sanctum
        INSERT INTO `dungeon_access_template` SET
            `id` = 103,
            `map_id` = 615,
            `difficulty` = 1,
            `min_level` = 80,
            `comment` = 'Chamber of Aspects,Obsidian Sanctum';

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

    -- Halls of Reflection - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 84,
            `map_id` = 668,
            `min_level` = 78,
            `min_avg_item_level` = 180,
            `comment` = 'Halls of Reflection - Normal';

    -- Halls of Reflection - Heroic
        INSERT INTO `dungeon_access_template` SET
        `id` = 120,
        `map_id` = 668,
        `difficulty` = 1,
        `min_level` = 80,
        `min_avg_item_level` = 219,
        `comment` = 'Halls of Reflection - Heroic';

    -- Icecrown Citadel - 10man - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 109,
            `map_id` = 631,
            `min_level` = 80,
            `comment` = 'Icecrown Citadel - 10man Normal';

    -- IceCrown Citadel - 10man - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 111,
            `map_id` = 631,
            `difficulty` = 2,
            `min_level` = 80,
            `comment` = 'IceCrown Citadel - 10man - Heroic';

    -- IceCrown Citadel - 25man - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 110,
            `map_id` = 631,
            `difficulty` = 1,
            `min_level` = 80,
            `comment` = 'IceCrown Citadel - 25man - Normal';

    -- IceCrown Citadel - 25man - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 112,
            `map_id` = 631,
            `difficulty` = 3,
            `min_level` = 80,
            `comment` = 'IceCrown Citadel - 25man - Heroic';

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

    -- Onyxias Lair - 10man
        INSERT INTO `dungeon_access_template` SET
            `id` = 85,
            `map_id` = 249,
            `min_level` = 80,
            `comment` = 'Onyxias Lair - 10man';

    -- Onyxias Lair - 25man
        INSERT INTO `dungeon_access_template` SET
            `id` = 86,
            `map_id` = 249,
            `difficulty` = 1,
            `min_level` = 80,
            `comment` = 'Onyxias Lair - 25man';

    -- Pit of Saron - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 83,
            `map_id` = 658,
            `min_level` = 78,
            `min_avg_item_level` = 180,
            `comment` = 'Pit of Saron - Normal';

    -- Pit of Saron - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 119,
            `map_id` = 658,
            `difficulty` = 1,
            `min_level` = 80,
            `min_avg_item_level` = 200,
            `comment` = 'Pit of Saron - Heroic';

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

    -- The Obsidian Sanctum - 10man
        INSERT INTO `dungeon_access_template` SET
            `id` = 102,
            `map_id` = 615,
            `min_level` = 80,
            `comment` = 'The Obsidian Sanctum - 10man';

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

    -- Trial of the Crusader - 25man - Heroic
        INSERT INTO `dungeon_access_template` SET
            `id` = 117,
            `map_id` = 649,
            `difficulty` = 3,
            `min_level` = 80,
            `comment` = 'Trial of the Crusader - 25man - Heroic';

    -- Trial of the Crusader - 10man - Normal
        INSERT INTO `dungeon_access_template` SET
            `id` = 114,
            `map_id` = 649,
            `min_level` = 80,
            `comment` = 'Trial of the Crusader - 10man - Normal';

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


