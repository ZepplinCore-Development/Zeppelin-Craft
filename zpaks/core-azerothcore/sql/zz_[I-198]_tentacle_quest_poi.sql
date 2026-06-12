-- I-198 follow-up: enlarge Fen Strider Tentacle POI (quest 9801, ObjectiveIndex 5)
-- Stock data had three ~40yd triangles (blobs 11-13); actual Fen Strider (18134)
-- + Marsh Walker (18135) spawns span ~2100x3850yd across Zangarmarsh (75 spawns).
-- Replaced with one convex-hull polygon over all spawns, 40yd padding.
-- Blob 14 (ObjectiveIndex -1 turn-in) untouched; sporebat blobs (ObjectiveIndex 4) untouched.

DELETE FROM quest_poi WHERE QuestID = 9801 AND ObjectiveIndex = 5;
INSERT INTO quest_poi (QuestID, id, ObjectiveIndex, MapID, WorldMapAreaId, Floor, Priority, Flags, VerifiedBuild) VALUES
(9801, 11, 5, 530, 467, 0, 0, 1, 0);

DELETE FROM quest_poi_points WHERE QuestID = 9801 AND Idx1 IN (11, 12, 13);
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(9801, 11, 0, -1042, 5507, 0),
(9801, 11, 1, -861, 5089, 0),
(9801, 11, 2, 119, 5374, 0),
(9801, 11, 3, 758, 5680, 0),
(9801, 11, 4, 1146, 8039, 0),
(9801, 11, 5, 903, 8557, 0),
(9801, 11, 6, 188, 9017, 0),
(9801, 11, 7, -355, 8573, 0),
(9801, 11, 8, -1014, 5714, 0);
