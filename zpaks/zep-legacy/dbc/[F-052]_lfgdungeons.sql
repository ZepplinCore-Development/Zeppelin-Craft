-- [F-052] zep-legacy: lfgdungeons
-- Standardise LFG level ranges for all normal Azeroth dungeons
-- Formula: min = boss-5, target_min = boss-3, target_level = boss-2, target_max = boss, max = boss+3
-- Floor: 15 (minimum LFG level), Cap: 60 (Azeroth content ceiling)
-- Boss = RDF completion boss from instance_encounters.lastEncounterDungeon
-- Uldaman East/West handled in [F-062]_lfgdungeons.sql (runs after this file)

-- Ragefire Chasm (boss: Jergosh the Invoker, 16)
UPDATE `lfgdungeons` SET `min_level` = 15, `max_level` = 19, `target_level` = 15, `target_level_min` = 15, `target_level_max` = 16 WHERE `id` = 4;

-- Deadmines (boss: Edwin VanCleef, 21)
UPDATE `lfgdungeons` SET `min_level` = 16, `max_level` = 24, `target_level` = 19, `target_level_min` = 18, `target_level_max` = 21 WHERE `id` = 6;

-- Wailing Caverns (boss: Verdan the Everliving, 21)
UPDATE `lfgdungeons` SET `min_level` = 16, `max_level` = 24, `target_level` = 19, `target_level_min` = 18, `target_level_max` = 21 WHERE `id` = 1;

-- Shadowfang Keep (boss: Archmage Arugal, 26)
UPDATE `lfgdungeons` SET `min_level` = 21, `max_level` = 29, `target_level` = 24, `target_level_min` = 23, `target_level_max` = 26 WHERE `id` = 8;

-- Blackfathom Deeps (boss: Aku'mai, 28)
UPDATE `lfgdungeons` SET `min_level` = 23, `max_level` = 31, `target_level` = 26, `target_level_min` = 25, `target_level_max` = 28 WHERE `id` = 10;

-- Stormwind Stockade (boss: Bazil Thredd, 29)
UPDATE `lfgdungeons` SET `min_level` = 24, `max_level` = 32, `target_level` = 27, `target_level_min` = 26, `target_level_max` = 29 WHERE `id` = 12;

-- Razorfen Kraul (boss: Charlga Razorflank, 33)
UPDATE `lfgdungeons` SET `min_level` = 28, `max_level` = 36, `target_level` = 31, `target_level_min` = 30, `target_level_max` = 33 WHERE `id` = 16;

-- Gnomeregan (boss: Mekgineer Thermaplugg, 34)
UPDATE `lfgdungeons` SET `min_level` = 29, `max_level` = 37, `target_level` = 32, `target_level_min` = 31, `target_level_max` = 34 WHERE `id` = 14;

-- Scarlet Monastery - Graveyard (boss: Bloodmage Thalnos, 34)
UPDATE `lfgdungeons` SET `min_level` = 29, `max_level` = 37, `target_level` = 32, `target_level_min` = 31, `target_level_max` = 34 WHERE `id` = 18;

-- Scarlet Monastery - Library (boss: Arcanist Doan, 37)
UPDATE `lfgdungeons` SET `min_level` = 32, `max_level` = 40, `target_level` = 35, `target_level_min` = 34, `target_level_max` = 37 WHERE `id` = 165;

-- Scarlet Monastery - Armory (boss: Herod, 40)
UPDATE `lfgdungeons` SET `min_level` = 35, `max_level` = 43, `target_level` = 38, `target_level_min` = 37, `target_level_max` = 40 WHERE `id` = 163;

-- Razorfen Downs (boss: Amnennar the Coldbringer, 41)
UPDATE `lfgdungeons` SET `min_level` = 36, `max_level` = 44, `target_level` = 39, `target_level_min` = 38, `target_level_max` = 41 WHERE `id` = 20;

-- Scarlet Monastery - Cathedral (boss: High Inquisitor Whitemane, 42)
UPDATE `lfgdungeons` SET `min_level` = 37, `max_level` = 45, `target_level` = 40, `target_level_min` = 39, `target_level_max` = 42 WHERE `id` = 164;

-- Maraudon - Purple Crystals (boss: Celebras the Cursed, 49)
UPDATE `lfgdungeons` SET `min_level` = 44, `max_level` = 52, `target_level` = 47, `target_level_min` = 46, `target_level_max` = 49 WHERE `id` = 272;

-- Zul'Farrak (boss: Chief Ukorz Sandscalp, 48)
UPDATE `lfgdungeons` SET `min_level` = 43, `max_level` = 51, `target_level` = 46, `target_level_min` = 45, `target_level_max` = 48 WHERE `id` = 24;

-- Maraudon - Orange Crystals (boss: Razorlash, 48)
UPDATE `lfgdungeons` SET `min_level` = 43, `max_level` = 51, `target_level` = 46, `target_level_min` = 45, `target_level_max` = 48 WHERE `id` = 26;

-- Maraudon - Pristine Waters (boss: Princess Theradras, 51)
UPDATE `lfgdungeons` SET `min_level` = 46, `max_level` = 54, `target_level` = 49, `target_level_min` = 48, `target_level_max` = 51 WHERE `id` = 273;

-- Sunken Temple Lower/Upper handled in [F-059]_lfgdungeons.sql (runs after this file)

-- Blackrock Depths - Prison (boss: Lord Incendius, 55)
UPDATE `lfgdungeons` SET `min_level` = 50, `max_level` = 58, `target_level` = 53, `target_level_min` = 52, `target_level_max` = 55 WHERE `id` = 30;

-- Blackrock Depths - Upper City (boss: Emperor Dagran Thaurissan, 59)
UPDATE `lfgdungeons` SET `min_level` = 54, `max_level` = 60, `target_level` = 57, `target_level_min` = 56, `target_level_max` = 59 WHERE `id` = 276;

-- Dire Maul - East (boss: Alzzin the Wildshaper, 58)
UPDATE `lfgdungeons` SET `min_level` = 53, `max_level` = 60, `target_level` = 56, `target_level_min` = 55, `target_level_max` = 58 WHERE `id` = 34;

-- Dire Maul - West (boss: Immol'thar, 61)
UPDATE `lfgdungeons` SET `min_level` = 56, `max_level` = 60, `target_level` = 59, `target_level_min` = 58, `target_level_max` = 60 WHERE `id` = 36;

-- Dire Maul - North (boss: King Gordok, 62)
UPDATE `lfgdungeons` SET `min_level` = 57, `max_level` = 60, `target_level` = 60, `target_level_min` = 59, `target_level_max` = 60 WHERE `id` = 38;

-- Lower Blackrock Spire (boss: Overlord Wyrmthalak, 60)
UPDATE `lfgdungeons` SET `min_level` = 55, `max_level` = 60, `target_level` = 58, `target_level_min` = 57, `target_level_max` = 60 WHERE `id` = 32;

-- Upper Blackrock Spire (boss: General Drakkisath, 62)
UPDATE `lfgdungeons` SET `min_level` = 57, `max_level` = 60, `target_level` = 60, `target_level_min` = 59, `target_level_max` = 60 WHERE `id` = 44;

-- Stratholme - Main Gate (boss: Balnazzar, 62)
UPDATE `lfgdungeons` SET `min_level` = 57, `max_level` = 60, `target_level` = 60, `target_level_min` = 59, `target_level_max` = 60 WHERE `id` = 40;

-- Stratholme - Service Entrance (boss: Baron Rivendare, 62)
UPDATE `lfgdungeons` SET `min_level` = 57, `max_level` = 60, `target_level` = 60, `target_level_min` = 59, `target_level_max` = 60 WHERE `id` = 274;

-- Scholomance (boss: Darkmaster Gandling, 61)
UPDATE `lfgdungeons` SET `min_level` = 56, `max_level` = 60, `target_level` = 59, `target_level_min` = 58, `target_level_max` = 60 WHERE `id` = 2;
