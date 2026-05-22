-- [I-156] Quest 4501 (Beware of Pterrordax): Add missing POI for regular Pterrordax spawns near Northern Crystal Pylon
-- There is a clump of 8 regular Pterrordax (entry 9166) around the north pylon with no quest POI

DELETE FROM quest_poi WHERE QuestID = 4501 AND id = 7;
DELETE FROM quest_poi_points WHERE QuestID = 4501 AND Idx1 = 7;

INSERT INTO quest_poi (QuestID, id, ObjectiveIndex, MapID, WorldMapAreaId, Floor, Priority, Flags, VerifiedBuild)
VALUES (4501, 7, 0, 1, 201, 0, 0, 1, 0);

INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(4501, 7, 0, -6300, -1280, 0),
(4501, 7, 1, -6180, -1280, 0),
(4501, 7, 2, -6110, -1500, 0),
(4501, 7, 3, -6110, -1650, 0),
(4501, 7, 4, -6220, -1650, 0),
(4501, 7, 5, -6310, -1610, 0);
