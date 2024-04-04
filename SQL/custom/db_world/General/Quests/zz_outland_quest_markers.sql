-- Kalimdor Zones
UPDATE quest_poi
SET MapID = 1
WHERE (WorldMapAreaId = 476 OR WorldMapAreaId = 464);

UPDATE quest_poi_points
SET x = x + 9598,
    y = y + 18134,
    VerifiedBuild = 1
WHERE QuestID IN (
    SELECT QuestID
    FROM quest_poi
    WHERE (WorldMapAreaId = 476 OR WorldMapAreaId = 464)
      AND MapID = 1
)
AND VerifiedBuild = 0;

-- Easern Kingdom Zones
UPDATE quest_poi
SET MapID = 0
WHERE WorldMapAreaId IN (462, 463, 480);

UPDATE quest_poi_points
SET x = x - 2133,
    y = y + 2135
WHERE QuestID IN (
    SELECT QuestID
    FROM quest_poi
    WHERE WorldMapAreaId IN (462, 463, 480)
      AND MapID = 0
);


