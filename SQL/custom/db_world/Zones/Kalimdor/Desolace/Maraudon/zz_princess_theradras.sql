-- replace the model with the modern Therazane model (Model was 12292)
UPDATE `creature_template` SET `modelid1` = 32913 WHERE (`entry` = 12201);

DELETE FROM `creature_model_info` WHERE `DisplayID` = 32913;
INSERT INTO `creature_model_info` (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender) VALUES
	 (32913,2.0,3.0,2,0);