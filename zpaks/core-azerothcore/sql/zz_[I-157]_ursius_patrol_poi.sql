-- Quest 5054 (Ursius of the Shardtooth): Replace single-point POI with area polygon
-- Ursius (10806) patrols a 105-point waypoint path across southeastern Winterspring
-- Original POI was a single point at (6990, -4296) which doesn't even match his patrol area
-- New polygon covers his full patrol route with ~30yd padding

-- Remove existing single-point objective POI
DELETE FROM quest_poi_points WHERE QuestID = 5054 AND Idx1 = 0;

-- Insert area polygon covering Ursius patrol path (convex hull + 30yd padding)
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(5054, 0, 0, 6951, -4626, 0),
(5054, 0, 1, 7019, -4750, 0),
(5054, 0, 2, 7033, -4763, 0),
(5054, 0, 3, 7051, -4774, 0),
(5054, 0, 4, 7080, -4789, 0),
(5054, 0, 5, 7420, -4876, 0),
(5054, 0, 6, 7402, -4843, 0),
(5054, 0, 7, 7396, -4836, 0),
(5054, 0, 8, 7385, -4828, 0),
(5054, 0, 9, 6988, -4630, 0),
(5054, 0, 10, 6955, -4615, 0);
