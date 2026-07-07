-- F-011 Faceless of the Deep model_info + repoint off ghoul fallback 646

DELETE FROM creature_model_info WHERE DisplayID=31674;
INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES (31674,1.0,3.0,2,0,0);

UPDATE creature_template_model SET CreatureDisplayID=31674 WHERE CreatureID=38448;
