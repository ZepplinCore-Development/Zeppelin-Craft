-- [I-212] Nagrand safari elite-hunt quests: replace single-point objective POI with patrol-area polygon
-- Quests 9856/9859/9851 (Windroc/Talbuk/Clefthoof Mastery, final stage) require an item from a roaming
-- rare elite (MovementType=2 waypoint patrol). The stock POI was a single point on the rare's spawn,
-- which is misleading since the elite roams a large closed loop. Replaced with a convex-hull polygon
-- (+30yd padding) over each rare's full patrol path. Mirrors zz_[I-157]_ursius_patrol_poi.sql.
-- quest_poi_points.X/Y map directly to creature world position_x/position_y (verified).
-- The quest_poi header rows (id=0 ObjectiveIndex=4 hunt, id=1 turn-in) are left intact.
-- NOTE: the 3.3.5a client POI renderer caps at 12 points per POI (stock data never exceeds 12);
--       >12 overflows a fixed buffer and crashes the client (ERROR #132). Hulls downsampled to <=12.

-- Quest 9856 Windroc Mastery: Gutripper (18257) drops Eye of Gutripper | path 655250, 33 waypoints -> 12-vertex hull
DELETE FROM `quest_poi_points` WHERE `QuestID` = 9856 AND `Idx1` = 0;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(9856, 0, 0, -1124, 8599, 0),
(9856, 0, 1, -1121, 8587, 0),
(9856, 0, 2, -1117, 8577, 0),
(9856, 0, 3, -1096, 8534, 0),
(9856, 0, 4, -1083, 8514, 0),
(9856, 0, 5, -1070, 8498, 0),
(9856, 0, 6, -834, 8287, 0),
(9856, 0, 7, -688, 8230, 0),
(9856, 0, 8, -646, 8255, 0),
(9856, 0, 9, -638, 8307, 0),
(9856, 0, 10, -675, 8453, 0),
(9856, 0, 11, -714, 8487, 0);

-- Quest 9859 Talbuk Mastery: Bach'lor (18258) drops Hoof of Bach'lor | path 655280, 67 waypoints -> 12-vertex hull
DELETE FROM `quest_poi_points` WHERE `QuestID` = 9859 AND `Idx1` = 0;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(9859, 0, 0, -1977, 8885, 0),
(9859, 0, 1, -1945, 8858, 0),
(9859, 0, 2, -1313, 8567, 0),
(9859, 0, 3, -1267, 8577, 0),
(9859, 0, 4, -1222, 8615, 0),
(9859, 0, 5, -1195, 8657, 0),
(9859, 0, 6, -1203, 8679, 0),
(9859, 0, 7, -1236, 8724, 0),
(9859, 0, 8, -1523, 8973, 0),
(9859, 0, 9, -1594, 8995, 0),
(9859, 0, 10, -1637, 8997, 0),
(9859, 0, 11, -1835, 8998, 0);

-- Quest 9851 Clefthoof Mastery: Banthar (18259) drops Horn of Banthar | path 655290, 64 waypoints -> 12-vertex hull
DELETE FROM `quest_poi_points` WHERE `QuestID` = 9851 AND `Idx1` = 0;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(9851, 0, 0, -2495, 7859, 0),
(9851, 0, 1, -2490, 7787, 0),
(9851, 0, 2, -2477, 7731, 0),
(9851, 0, 3, -2433, 7692, 0),
(9851, 0, 4, -2365, 7675, 0),
(9851, 0, 5, -2289, 7708, 0),
(9851, 0, 6, -2239, 7755, 0),
(9851, 0, 7, -2100, 8220, 0),
(9851, 0, 8, -2094, 8284, 0),
(9851, 0, 9, -2189, 8507, 0),
(9851, 0, 10, -2234, 8561, 0),
(9851, 0, 11, -2300, 8622, 0);
