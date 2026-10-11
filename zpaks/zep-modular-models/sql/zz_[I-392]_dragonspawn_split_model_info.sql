-- I-392: server-side model info for the split-armour dragonspawn template display 900402
-- (values from stock dragonspawn display 363).
DELETE FROM creature_model_info WHERE DisplayID = 900402;
INSERT INTO creature_model_info (DisplayID, BoundingRadius, CombatReach, Gender, DisplayID_Other_Gender) VALUES
(900402, 1.967, 1.5, 0, 0);
