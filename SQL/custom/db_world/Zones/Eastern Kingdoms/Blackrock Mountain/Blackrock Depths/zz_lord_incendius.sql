-- Replace the stock fire elemental model for lord incendius with a modern elemental lord. ID was 1204
UPDATE `creature_template` SET `modelid1` = 39094 WHERE (`entry` = 9017);

DELETE FROM `creature_model_info` WHERE `DisplayID` = 39094;
INSERT INTO `creature_model_info` (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender) VALUES
	 (39094,1.5,3.0,2,0);
