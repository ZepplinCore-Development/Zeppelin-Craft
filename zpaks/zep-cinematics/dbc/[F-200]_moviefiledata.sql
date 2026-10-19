-- F-200: frame width of the goblin cinematic's HD variant (movie 22). The client picks the variation whose
-- resolution equals the screen width, else the largest one below it.
DELETE FROM `moviefiledata` WHERE `id` IN (460001, 460002);
INSERT INTO `moviefiledata` SET
  `id` = 460001,
  `resolution` = 1280;
