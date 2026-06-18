-- Quest 10020 (A Cure for Zahlia): fix objective POI for Stonegazer (18648)
-- Stonegazer is a single spawn (guid 86357) at (-1996.77, 3691.44) on a 128-point
-- patrol path (path 863570) spanning ~600yd across Zangarmarsh.
-- The stock objective POI was a single point at (-1831, 3802) sitting on the far
-- NE tip of his patrol, so the marker rarely matches where he actually is.
-- Spawn is kept as-is. The objective POI (ObjectiveIndex=4) is replaced with an
-- area polygon (convex hull of patrol path + 15yd padding) covering his full roam
-- route, verified to enclose all 128 waypoints. The client centres the objective
-- marker over this polygon, which sits in the middle of his roam area.
-- id=1 (turn-in to Zahlia) is left untouched.

-- Header (DELETE + INSERT for idempotency; id=1 turn-in preserved)
DELETE FROM quest_poi WHERE QuestID = 10020 AND id IN (0, 2);
INSERT INTO quest_poi (QuestID, id, ObjectiveIndex, MapID, WorldMapAreaId, Floor, Priority, Flags, VerifiedBuild) VALUES
(10020, 0, 4, 530, 478, 0, 0, 1, 0);

-- Points: area polygon around the patrol route (convex hull + 15yd padding)
DELETE FROM quest_poi_points WHERE QuestID = 10020 AND Idx1 IN (0, 2);
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(10020, 0, 0, -2143, 3378, 0),
(10020, 0, 1, -2116, 3308, 0),
(10020, 0, 2, -2033, 3217, 0),
(10020, 0, 3, -1822, 3817, 0),
(10020, 0, 4, -1858, 3808, 0),
(10020, 0, 5, -1978, 3744, 0),
(10020, 0, 6, -2069, 3651, 0),
(10020, 0, 7, -2107, 3562, 0);
