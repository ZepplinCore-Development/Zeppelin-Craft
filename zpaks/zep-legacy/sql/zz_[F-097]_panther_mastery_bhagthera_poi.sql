-- Panther Mastery (Quest 193) - Add missing quest POI for Bhag'thera objective
-- Bhag'thera spawns at: (-12191,-944), (-12016,-896), (-12380,-787)
-- Only the turn-in POI (ObjectiveIndex=-1) exists; objective area is missing

-- Clean up any previous run
DELETE FROM `quest_poi_points` WHERE `QuestID` = 193 AND `Idx1` = 1;
DELETE FROM `quest_poi` WHERE `QuestID` = 193 AND `id` = 1;

-- Add objective POI entry (id=1, ObjectiveIndex=4 for RequiredItemId1)
-- ObjectiveIndex 0-3 = RequiredNpcOrGo1-4, 4-7 = RequiredItemId1-4
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`)
VALUES (193, 1, 4, 0, 37, 0, 0, 7, 0);

-- Add polygon points defining Bhag'thera's roaming area
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(193, 1, 0, -11900, -950, 0),
(193, 1, 1, -12000, -1080, 0),
(193, 1, 2, -12300, -1080, 0),
(193, 1, 3, -12500, -930, 0),
(193, 1, 4, -12450, -700, 0),
(193, 1, 5, -12250, -630, 0),
(193, 1, 6, -12000, -700, 0);
