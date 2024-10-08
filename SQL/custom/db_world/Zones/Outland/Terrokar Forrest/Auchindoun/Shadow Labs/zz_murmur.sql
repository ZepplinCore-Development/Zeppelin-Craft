-- New Murmur model to be Alakir (original diplay ID 18839)
UPDATE `creature_template` SET `modelid1` = 36062 WHERE (`entry` = 18708);
-- Smaller Murmur
UPDATE `creature_template` SET `scale` = 0.5 WHERE (`entry` = 18708);

-- New creature_model_info entry
DELETE FROM `creature_model_info` WHERE `DisplayID` = 36062;
INSERT INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`Gender`,`DisplayID_Other_Gender`) VALUES
	 (36062,1.5,1.5,0,0);
