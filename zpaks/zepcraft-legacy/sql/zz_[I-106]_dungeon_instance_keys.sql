-- I-106: Restore instance-specific dungeon key requirements
-- These are separate from the heroic reputation keys (Flamewrought, Reservoir, etc.)
-- Also adds a note to the Black Morass Heroic Key of Time requirement

-- Shattered Halls Key (item 28395) - required on both Normal and Heroic
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 33 AND `requirement_type` = 2 AND `requirement_id` = 28395;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (33, 2, 28395, 'You must obtain the Shattered Halls Key.', 2, 'Shattered Halls (Normal) - Instance Key');
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 34 AND `requirement_type` = 2 AND `requirement_id` = 28395;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (34, 2, 28395, 'You must obtain the Shattered Halls Key.', 2, 'Shattered Halls (Heroic) - Instance Key');

-- Shadow Labyrinth Key (item 27991) - required on both Normal and Heroic
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 54 AND `requirement_type` = 2 AND `requirement_id` = 27991;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (54, 2, 27991, 'You must obtain the Shadow Labyrinth key.', 2, 'Shadow Labyrinth (Normal) - Instance Key');
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 55 AND `requirement_type` = 2 AND `requirement_id` = 27991;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (55, 2, 27991, 'You must obtain the Shadow Labyrinth key.', 2, 'Shadow Labyrinth (Heroic) - Instance Key');

-- Key to the Arcatraz (item 31084) - required on both Normal and Heroic
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 48 AND `requirement_type` = 2 AND `requirement_id` = 31084;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (48, 2, 31084, 'You must obtain the Arcatraz key.', 2, 'The Arcatraz (Normal) - Instance Key');
DELETE FROM `dungeon_access_requirements` WHERE `dungeon_access_id` = 49 AND `requirement_type` = 2 AND `requirement_id` = 31084;
INSERT INTO `dungeon_access_requirements` (`dungeon_access_id`,`requirement_type`,`requirement_id`,`requirement_note`,`faction`,`comment`)
VALUES (49, 2, 31084, 'You must obtain the Arcatraz key.', 2, 'The Arcatraz (Heroic) - Instance Key');

-- Black Morass Heroic - add note to Key of Time requirement
UPDATE `dungeon_access_requirements`
SET `requirement_note` = 'You must possess the Key of Time to enter.'
WHERE `dungeon_access_id` = 18 AND `requirement_type` = 2 AND `requirement_id` = 30635;
