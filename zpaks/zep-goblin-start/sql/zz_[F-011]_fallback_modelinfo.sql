-- F-011 fallback creature_model_info + repoint

DELETE FROM creature_model_info WHERE DisplayID IN (30165,30303,30306,31185,31281,31296,31741,31745,31781,31782,34202);
INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES
  (30165,0.5,1.5,2,0,0),
  (30303,0.5,1.5,2,0,0),
  (30306,0.5,1.5,2,0,0),
  (31185,0.5,1.5,2,0,0),
  (31281,0.5,1.5,2,0,0),
  (31296,0.5,1.5,2,0,0),
  (31741,0.5,1.5,2,0,0),
  (31745,0.5,1.5,2,0,0),
  (31781,0.5,1.5,2,0,0),
  (31782,0.5,1.5,2,0,0),
  (34202,0.5,1.5,2,0,0);

UPDATE creature_template_model SET CreatureDisplayID=34202 WHERE CreatureID=33420;
UPDATE creature_template_model SET CreatureDisplayID=31741 WHERE CreatureID=34830;
UPDATE creature_template_model SET CreatureDisplayID=31745 WHERE CreatureID=35239;
UPDATE creature_template_model SET CreatureDisplayID=31741 WHERE CreatureID=35294;
UPDATE creature_template_model SET CreatureDisplayID=30165 WHERE CreatureID=35995;
UPDATE creature_template_model SET CreatureDisplayID=30303 WHERE CreatureID=36735;
UPDATE creature_template_model SET CreatureDisplayID=30306 WHERE CreatureID=36740;
UPDATE creature_template_model SET CreatureDisplayID=31781 WHERE CreatureID=37114;
UPDATE creature_template_model SET CreatureDisplayID=31296 WHERE CreatureID=37203;
UPDATE creature_template_model SET CreatureDisplayID=31185 WHERE CreatureID=38802;
UPDATE creature_template_model SET CreatureDisplayID=31281 WHERE CreatureID=39039;
UPDATE creature_template_model SET CreatureDisplayID=31782 WHERE CreatureID=39354;
UPDATE creature_template_model SET CreatureDisplayID=31745 WHERE CreatureID=48984;
