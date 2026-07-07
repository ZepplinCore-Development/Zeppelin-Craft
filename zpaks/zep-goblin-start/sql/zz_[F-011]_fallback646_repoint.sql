-- F-011 repoint ghoul-fallback creatures to their real displays + creature_model_info

DELETE FROM creature_model_info WHERE DisplayID IN (29680,30702,30997,31477,32118,36372);
INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES
  (29680,0.5,1.5,0,0,0),
  (30702,0.5,1.5,0,0,0),
  (30997,0.5,1.5,0,0,0),
  (31477,0.5,1.5,0,0,0),
  (32118,0.5,1.5,0,0,0),
  (36372,0.5,1.5,0,0,0);

UPDATE creature_template_model SET CreatureDisplayID=29383 WHERE CreatureID=34748;
UPDATE creature_template_model SET CreatureDisplayID=29680 WHERE CreatureID=35222;
UPDATE creature_template_model SET CreatureDisplayID=29680 WHERE CreatureID=36403;
UPDATE creature_template_model SET CreatureDisplayID=26559 WHERE CreatureID=37179;
UPDATE creature_template_model SET CreatureDisplayID=11686 WHERE CreatureID=37561;
UPDATE creature_template_model SET CreatureDisplayID=11686 WHERE CreatureID=37590;
UPDATE creature_template_model SET CreatureDisplayID=11686 WHERE CreatureID=37594;
UPDATE creature_template_model SET CreatureDisplayID=30702 WHERE CreatureID=37598;
UPDATE creature_template_model SET CreatureDisplayID=30997 WHERE CreatureID=38224;
UPDATE creature_template_model SET CreatureDisplayID=21763 WHERE CreatureID=38318;
UPDATE creature_template_model SET CreatureDisplayID=32108 WHERE CreatureID=38644;
UPDATE creature_template_model SET CreatureDisplayID=32118 WHERE CreatureID=38713;
UPDATE creature_template_model SET CreatureDisplayID=31477 WHERE CreatureID=39582;
UPDATE creature_template_model SET CreatureDisplayID=29680 WHERE CreatureID=39615;
UPDATE creature_template_model SET CreatureDisplayID=36372 WHERE CreatureID=48519;
