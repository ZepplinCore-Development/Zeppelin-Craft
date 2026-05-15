-- I-117: Spread out Rocklance and his Kolkar companions in the Barrens
-- HD centaur models (model 5016) are larger than originals, causing visual overlap
-- These 3 NPCs are in a creature_formations group led by Rocklance (guid 20720)
-- Formation distance of 3 yards is too tight for the larger HD models

-- Increase formation follow distance from 3 to 6 yards
UPDATE creature_formations SET dist = 6 WHERE leaderGUID = 20720 AND memberGUID IN (14007, 20588);

-- Also spread out their home/spawn positions to match
-- Rocklance (guid 20720, entry 5841) stays put at (-1199.35, -3100.46)
-- Kolkar Bloodcharger (guid 14007) - move ~5 yards south-east
UPDATE creature SET position_x = -1194.92, position_y = -3104.53 WHERE guid = 14007;
-- Kolkar Marauder (guid 20588) - move ~5 yards north-west
UPDATE creature SET position_x = -1203.80, position_y = -3092.75 WHERE guid = 20588;
