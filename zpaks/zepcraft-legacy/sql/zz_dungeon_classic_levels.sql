-- I-106: Classic dungeon min_level adjustments
-- Raises entry requirements to be more appropriate for content difficulty
-- Also caps Dire Maul at level 60

UPDATE `dungeon_access_template` SET `min_level` = 15 WHERE `id` = 3;  -- Deadmines (10->15)
UPDATE `dungeon_access_template` SET `min_level` = 15 WHERE `id` = 4;  -- Wailing Caverns (10->15)
UPDATE `dungeon_access_template` SET `min_level` = 16 WHERE `id` = 1;  -- Shadowfang Keep (14->16)
UPDATE `dungeon_access_template` SET `min_level` = 20 WHERE `id` = 2;  -- Stormwind Stockades (15->20)
UPDATE `dungeon_access_template` SET `min_level` = 22 WHERE `id` = 5;  -- Razorfen Kraul (17->22)
UPDATE `dungeon_access_template` SET `min_level` = 23 WHERE `id` = 8;  -- Gnomeregan (15->23)
UPDATE `dungeon_access_template` SET `min_level` = 27 WHERE `id` = 11; -- Scarlet Monastery (20->27)
UPDATE `dungeon_access_template` SET `min_level` = 32 WHERE `id` = 10; -- Razorfen Downs (25->32)
UPDATE `dungeon_access_template` SET `min_level` = 35 WHERE `id` = 7;  -- Uldaman (30->35)
UPDATE `dungeon_access_template` SET `min_level` = 39 WHERE `id` = 22; -- Maraudon (30->39)
UPDATE `dungeon_access_template` SET `min_level` = 41 WHERE `id` = 12; -- Zul''Farrak (35->41)
UPDATE `dungeon_access_template` SET `min_level` = 45 WHERE `id` = 9;  -- Sunken Temple (35->45)
UPDATE `dungeon_access_template` SET `min_level` = 47 WHERE `id` = 14; -- Blackrock Depths (40->47)
UPDATE `dungeon_access_template` SET `min_level` = 53, `max_level` = 60 WHERE `id` = 25; -- Dire Maul (45->53, cap 60)
UPDATE `dungeon_access_template` SET `min_level` = 55 WHERE `id` = 13; -- Blackrock Spire (45->55)
UPDATE `dungeon_access_template` SET `min_level` = 55 WHERE `id` = 19; -- Scholomance (45->55)
UPDATE `dungeon_access_template` SET `min_level` = 55 WHERE `id` = 21; -- Stratholme (45->55)
