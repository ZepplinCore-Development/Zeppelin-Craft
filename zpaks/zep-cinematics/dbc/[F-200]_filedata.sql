-- F-200: FileData rows for the goblin cinematic (movie 22).
--
-- The client resolves a movie as Movie -> MovieVariation -> MovieFileData (width) + FileData (path + filename);
-- Movie.movie_path is never read. A variation whose FileData row is missing is skipped silently, which is why
-- movie 22 (I-280 variations 124/125 -> 451827/451828) never played.
--   451827 (1024) -> Goblin_1024.avi (stock 1024x576 layout, every client)
--   460001 (1280) -> Goblin_1280.avi (x64 client generic movie layout; picked at screen widths >= 1280)
-- 451828 (800) has no file and stays unresolved, so the client skips it.
DELETE FROM `filedata` WHERE `id` IN (451827, 460001, 460002);
INSERT INTO `filedata` SET
  `id` = 451827,
  `file_name` = 'GOBLIN_1024.AVI',
  `file_path` = 'INTERFACE\\CINEMATICS\\';
INSERT INTO `filedata` SET
  `id` = 460001,
  `file_name` = 'GOBLIN_1280.AVI',
  `file_path` = 'INTERFACE\\CINEMATICS\\';
