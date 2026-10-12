-- I-396: server-side model info for the split HD lasher displays 900403 / 900404
-- (values from stock lasher display 8149, scale 1.0).
DELETE FROM creature_model_info WHERE DisplayID IN (900403, 900404);
INSERT INTO creature_model_info (DisplayID, BoundingRadius, CombatReach, Gender, DisplayID_Other_Gender) VALUES
(900403, 1.3, 1.95, 2, 0),
(900404, 1.3, 1.95, 2, 0);
