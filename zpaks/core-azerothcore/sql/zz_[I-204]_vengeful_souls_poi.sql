-- [I-204] Quest 10842 (Vengeful Souls): Completion POI in wrong spot
-- The completion POI (ObjectiveIndex -1, Idx1 = 1) was placed at (-2958, 4522), sitting inside
-- the Vengeful Draenei kill area instead of at the turn-in NPC, High Priest Orglum (22278).
-- Move it to Orglum's spawn location (-2827, 5061) in the Bone Wastes, Terokkar Forest.

DELETE FROM quest_poi_points WHERE QuestID = 10842 AND Idx1 = 1;

INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
(10842, 1, 0, -2827, 5061, 0);
