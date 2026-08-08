-- I-327 : "Who's Top of the Food Chain Now?" (quest 24816) — client crash on world map
--
-- The 3.3.5a quest-POI renderer has a fixed 12-point-per-POI buffer. This quest's
-- objective polygon was ported verbatim from Cata with 20 points, so drawing it
-- overflowed the buffer and crashed the client with
--   ERROR #132 (0x85100084) 0xC0000005 ACCESS_VIOLATION at 0x0058EF31
-- (the faulting stack literally holds the 20 float pairs below). No stock 3.3.5
-- quest_poi group exceeds 12 points.
--
-- Fix: the polygon is decimated to 12 vertices (Visvalingam-Whyatt — drop the
-- vertex that changes the enclosed area least), keeping 99.7% of the original
-- area, and Idx2 renumbered 0..11.
--
-- The generator now caps every ported group the same way
-- (cli/commands/goblin_gen/quest_poi.py, MAX_POI_POINTS). This override is
-- redundant once zz_[AUTO,F-011]_35_quest_poi_points.sql is regenerated and
-- applied, and can be retired then.
--
-- Dropped vertices: (604,-9974) (224,-10198) (-50,-10234) (-165,-10329)
--                   (383,-10385) (424,-10393) (564,-10262) (639,-10195)

DELETE FROM quest_poi_points WHERE QuestID = 24816 AND Idx1 = 0;

INSERT INTO quest_poi_points (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
  (24816, 0,  0,  688, -10142, 0),
  (24816, 0,  1,  800, -10006, 0),
  (24816, 0,  2,  808,  -9902, 0),
  (24816, 0,  3,  729,  -9880, 0),
  (24816, 0,  4,  377, -10138, 0),
  (24816, 0,  5,   97, -10249, 0),
  (24816, 0,  6, -153, -10239, 0),
  (24816, 0,  7, -182, -10421, 0),
  (24816, 0,  8,  -56, -10482, 0),
  (24816, 0,  9,  107, -10442, 0),
  (24816, 0, 10,  268, -10420, 0),
  (24816, 0, 11,  494, -10351, 0);
