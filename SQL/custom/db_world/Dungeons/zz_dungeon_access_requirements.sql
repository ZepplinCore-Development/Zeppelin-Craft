-- This table specifies special access requirements for dungeons such as items like keys or attunement quests 
-- dungeon_access_id refers to the ID in dungeon_access_template table

DELETE FROM `dungeon_access_requirements`;

-- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 37,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10277,
        `requirement_note` = 'You must complete the quest "The Caverns of Time" to enter Old Hillsbrad.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal';

-- Auchindoun: Shadow Labyrinth (Normal)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 39,
        `requirement_type` = 2, -- Item
        `requirement_id` = 27991,
        `requirement_note` = 'You must obtain the Shadow Labyrinth key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Shadow Labyrinth (Normal)';

-- Auchindoun: Shadow Labyrinth (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 64,
        `requirement_type` = 2, -- Item
        `requirement_id` = 27991,
        `requirement_note` = 'You must obtain the Shadow Labyrinth key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Shadow Labyrinth (Heroic)';

-- Auchindoun: Shadow Labyrinth (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 64,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30633,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Shadow Labyrinth (Heroic)';

-- Coilfang Resevoir: The Steamvault (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 57,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30623,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Coilfang Resevoir: The Steamvault (Heroic)';

-- Caverns of Time: Opening the Dark Portal (Normal)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 42,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10285,
        `requirement_note` = 'You must complete the quest "Return to Andormu" before entering the Black Morass.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Caverns of Time: Opening the Dark Portal (Normal)';

-- Coilfang Reservoir: Serpentshrine Cavern - 25man
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 48,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10901,
        `requirement_note` = 'You must complete the quest "The Cudgel of Kardesh" and be level 70 before entering Serpentshrine Reservoir.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Coilfang Reservoir: Serpentshrine Cavern - 25man';

-- Caverns of Time: Opening the Dark Portal (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 52,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10285,
        `requirement_note` = 'You must complete the quest "Return to Andormu" and be level 70 before entering the Heroic difficulty of the Black Morass.',
        `faction` = 2,
        `priority` = NULL,
        `leader_only` = 1,
        `comment` = 'Caverns of Time: Opening the Dark Portal (Heroic)';

-- Caverns of Time: Opening the Dark Portal (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 52,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30635,
        `requirement_note` = 'You must possess the Key of Time to enter.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Caverns of Time: Opening the Dark Portal (Heroic)';

-- The Battle of Mount Hyjal
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 53,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10445,
        `requirement_note` = 'You must complete the quest "The Vials of Eternity" and be level 70 before entering The Battle of Mount Hyjal.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'The Battle of Mount Hyjal';

-- Hellfire Citadel: The Shattered Halls (Normal)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 26,
        `requirement_type` = 2, -- Item
        `requirement_id` = 28395,
        `requirement_note` = 'You must obtain the Shattered Halls Key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Shattered Halls (Normal)';

-- Hellfire Citadel: The Shattered Halls (Heroic) - Shattered Halls Key
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 54,
        `requirement_type` = 2, -- Item
        `requirement_id` = 28395,
        `requirement_note` = 'You must obtain the Shattered Halls Key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Shattered Halls Key';

-- Hellfire Citadel: The Shattered Halls (Heroic) - Aliance - Flamewrought Key
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 54,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30622,
        `requirement_note` = NULL,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Aliance - Flamewrought Key';

-- Hellfire Citadel: The Shattered Halls (Heroic) - Horde - Flamewrought Key
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 54,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30637,
        `requirement_note` = NULL,
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Shattered Halls (Heroic) - Horde - Flamewrought Key';

-- Hellfire Citadel: The Blood Furnace (Heroic) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 55,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30622,
        `requirement_note` = NULL,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Blood Furnace (Heroic)';

-- Hellfire Citadel: The Blood Furnace (Heroic) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 55,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30637,
        `requirement_note` = NULL,
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: The Blood Furnace (Heroic)';

-- Hellfire Citadel: Hellfire Ramparts (Heroic) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 56,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30622,
        `requirement_note` = NULL,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: Hellfire Ramparts (Heroic)';

-- Hellfire Citadel: Hellfire Ramparts (Heroic) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 56,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30637,
        `requirement_note` = NULL,
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Hellfire Citadel: Hellfire Ramparts (Heroic)';

-- Coilfang Resevoir: The Underbog (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 58,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30623,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Coilfang Resevoir: The Underbog (Heroic)';

-- Coilfang Resevoir: The Slave Pens (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 59,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30623,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Coilfang Resevoir: The Slave Pens (Heroic)';

-- The Eye - Quest
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 60,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 10888,
        `requirement_note` = 'You must complete "The Trial of the Naaru: Magtheridon" to enter The Eye.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'The Eye';

-- The Eye - Key
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 60,
        `requirement_type` = 2, -- Item
        `requirement_id` = 31704,
        `requirement_note` = 'You must possess The Tempest Key to enter The Eye.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'The Eye';

-- Normal Arcatraz
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 49,
        `requirement_type` = 2, -- Item
        `requirement_id` = 31084,
        `requirement_note` = 'You must obtain the Arcatraz key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Normal Arcatraz';

-- Tempest Keep: The Arcatraz (Heroic) - Key to the Arcatraz
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 61,
        `requirement_type` = 2, -- Item
        `requirement_id` = 31084,
        `requirement_note` = 'You must obtain the Arcatraz key.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Tempest Keep: The Arcatraz (Heroic) - Key to the Arcatraz';

-- Tempest Keep: The Arcatraz (Heroic) - Warpforged Key
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 61,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30634,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Tempest Keep: The Arcatraz (Heroic) - Warpforged Key';

-- Tempest Keep: The Botanica (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 62,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30634,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Tempest Keep: The Botanica (Heroic)';

-- Tempest Keep: The Mechanar (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 63,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30634,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Tempest Keep: The Mechanar (Heroic)';

-- Auchindoun: Sethekk Halls (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 65,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30633,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Sethekk Halls (Heroic)';

-- Auchindoun: Mana-Tombs (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 66,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30633,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Mana-Tombs (Heroic)';

-- Auchindoun: Auchenai Crypts (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 67,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30633,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Auchindoun: Auchenai Crypts (Heroic)';

-- Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 68,
        `requirement_type` = 2, -- Item
        `requirement_id` = 30635,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic';

-- Black Temple
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 69,
        `requirement_type` = 2, -- Item
        `requirement_id` = 32649,
        `requirement_note` = 'You must possess the Medallion of Karabor to enter the Black Temple.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Black Temple';

-- Isle of QuelDanas: Magisters Terrace (Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 73,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 11492,
        `requirement_note` = 'You must complete the quest "Hard to Kill" and be level 70 before entering the Heroic difficulty of the Magisters Terrace.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Isle of QuelDanas: Magisters Terrace (Heroic)';

-- Icecrown Citadel: Pit of Saron (Normal) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 83,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24499,
        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron.',
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Pit of Saron (Normal) - Alliance';

-- Icecrown Citadel: Pit of Saron (Normal) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 83,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24511,
        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron.',
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Pit of Saron (Normal) - Horde';

-- Icecrown Citadel: Halls of Reflection (Normal) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 84,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24710,
        `requirement_note` = 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection.',
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Halls of Reflection (Normal) - Alliance';

-- Icecrown Citadel: Halls of Reflection (Normal) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 84,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24712,
        `requirement_note` = 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection.',
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Halls of Reflection (Normal) - Horde';

-- Onyxias Lair - 10man
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 85,
        `requirement_type` = 2, -- Item
        `requirement_id` = 16309,
        `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Onyxias Lair - 10man';

-- Onyxias Lair - 25man
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 86,
        `requirement_type` = 2, -- Item
        `requirement_id` = 16309,
        `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Onyxias Lair - 25man';

-- Onyxias Lair - 40man
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 20,
        `requirement_type` = 2, -- Item
        `requirement_id` = 16309,
        `requirement_note` = 'You must have the Drakefire Amulet in your inventory before entering Onyxias Lair.',
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Onyxias Lair - 40man';

-- Icecrown Citadel (10 player, Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 111,
        `requirement_id` = 4530,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel (10 player, Heroic)';

-- Icecrown Citadel (25 player, Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 112,
        `requirement_id` = 4597,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel (25 player, Heroic)';

-- Trial of the Crusader (10 player, Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 116,
        `requirement_id` = 3917,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Trial of the Crusader (10 player, Heroic)';

-- Trial of the Crusader (25 player, Heroic)
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 117,
        `requirement_id` = 3916,
        `requirement_note` = NULL,
        `faction` = 2,
        `priority` = NULL,
        `comment` = 'Trial of the Crusader (25 player, Heroic)';

-- Icecrown Citadel: Pit of Saron (Heroic) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 119,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24499,
        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" and be level 80 before entering the Heroic difficulty of the Pit of Saron.',
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Pit of Saron (Heroic) - Alliance';

-- Icecrown Citadel: Pit of Saron (Heroic) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 119,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24511,
        `requirement_note` = 'You must complete the quest "Echoes of Tortured Souls" and be level 80 before entering the Heroic difficulty of the Pit of Saron.',
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Pit of Saron (Heroic) - Horde';

-- Icecrown Citadel: Halls of Reflection (Heroic) - Alliance
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 120,
        `requirement_type` = 1, -- Quest
        `requirement_id` = 24710,
        `requirement_note` = 'You must complete the quest "Deliverance from the Pit" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.',
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Halls of Reflection (Heroic) - Alliance';

-- Icecrown Citadel: Halls of Reflection (Heroic) - Horde
    INSERT INTO `dungeon_access_requirements` SET
        `dungeon_access_id` = 120,
        `requirement_type` = 1,
        `requirement_id` = 24712,
        `requirement_note` = 'You must complete the quest "Deliverance from the Pit" and be level 80 before entering the Heroic difficulty of the Halls of Reflection.',
        `faction` = 1,
        `priority` = NULL,
        `comment` = 'Icecrown Citadel: Halls of Reflection (Heroic) - Horde';