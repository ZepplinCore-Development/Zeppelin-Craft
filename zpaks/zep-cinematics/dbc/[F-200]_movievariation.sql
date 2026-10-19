-- F-200: HD variation of the goblin cinematic (movie 22); the 1024/800 ones are I-280's 124/125.
DELETE FROM `movievariation` WHERE `id` IN (200, 201);
INSERT INTO `movievariation` SET
  `id` = 200,
  `movie_id` = 22,
  `file_data_id` = 460001;
