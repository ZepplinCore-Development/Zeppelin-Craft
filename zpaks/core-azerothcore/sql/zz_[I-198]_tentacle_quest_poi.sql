-- I-198 follow-up: enlarge Fen Strider Tentacle POI (quest 9801, ObjectiveIndex 5)
-- Stock data had three ~40yd triangles; actual Fen Strider (18134) + Marsh Walker
-- (18135) spawns form 6 natural clusters (300yd single-linkage, singles merged to
-- nearest within 900yd). One convex-hull blob per cluster, 50yd padding.
-- Striders hold the east/south marshes, walkers the west/north - blobs reflect that.
-- Blob 14 (turn-in) and sporebat blobs (ObjectiveIndex 4) untouched.

DELETE FROM quest_poi WHERE QuestID = 9801 AND ObjectiveIndex = 5;
INSERT INTO quest_poi (QuestID, id, ObjectiveIndex, MapID, WorldMapAreaId, Floor, Priority, Flags, VerifiedBuild) VALUES
(9801, 11, 5, 530, 467, 0, 0, 1, 0),
(9801, 12, 5, 530, 467, 0, 0, 1, 0),
(9801, 13, 5, 530, 467, 0, 0, 1, 0),
(9801, 15, 5, 530, 467, 0, 0, 1, 0),
(9801, 16, 5, 530, 467, 0, 0, 1, 0),
(9801, 17, 5, 530, 467, 0, 0, 1, 0);

DELETE FROM quest_poi_points WHERE QuestID = 9801 AND Idx1 IN (11,12,13,15,16,17);
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(9801, 11, 0, -880, 5091, 0),
(9801, 11, 1, 130, 5366, 0),
(9801, 11, 2, 785, 5702, 0),
(9801, 11, 3, 788, 5837, 0),
(9801, 11, 4, 628, 5924, 0),
(9801, 11, 5, -33, 6258, 0),
(9801, 11, 6, -474, 6394, 0),
(9801, 11, 7, -562, 6315, 0),
(9801, 11, 8, -629, 6097, 0),
(9801, 12, 0, -295, 7485, 0),
(9801, 12, 1, -86, 7178, 0),
(9801, 12, 2, 161, 7266, 0),
(9801, 12, 3, 331, 7735, 0),
(9801, 12, 4, -68, 7700, 0),
(9801, 13, 0, -202, 6968, 0),
(9801, 13, 1, 327, 6103, 0),
(9801, 13, 2, 766, 6257, 0),
(9801, 13, 3, 140, 6903, 0),
(9801, 15, 0, 398, 8070, 0),
(9801, 15, 1, 631, 7574, 0),
(9801, 15, 2, 783, 7492, 0),
(9801, 15, 3, 1168, 8004, 0),
(9801, 15, 4, 896, 8570, 0),
(9801, 15, 5, 712, 8651, 0),
(9801, 16, 0, -429, 8222, 0),
(9801, 16, 1, 115, 8116, 0),
(9801, 16, 2, 210, 9020, 0),
(9801, 16, 3, -396, 8545, 0),
(9801, 17, 0, -1054, 5504, 0),
(9801, 17, 1, -781, 5523, 0),
(9801, 17, 2, -1003, 5792, 0);
