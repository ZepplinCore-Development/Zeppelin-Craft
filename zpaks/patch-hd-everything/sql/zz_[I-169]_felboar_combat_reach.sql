-- I-169: FelBoar HD model is much larger than stock - 3x BoundingRadius and CombatReach
UPDATE `creature_model_info` SET `BoundingRadius` = 2.25,  `CombatReach` = 4.5  WHERE `DisplayID` = 11410;
UPDATE `creature_model_info` SET `BoundingRadius` = 2.775, `CombatReach` = 5.55 WHERE `DisplayID` = 16572;
UPDATE `creature_model_info` SET `BoundingRadius` = 2.475, `CombatReach` = 4.95 WHERE `DisplayID` = 18701;
UPDATE `creature_model_info` SET `BoundingRadius` = 3.75,  `CombatReach` = 7.5  WHERE `DisplayID` = 19249;
UPDATE `creature_model_info` SET `BoundingRadius` = 3.0,   `CombatReach` = 6.0  WHERE `DisplayID` = 20146;
UPDATE `creature_model_info` SET `BoundingRadius` = 3.75,  `CombatReach` = 7.5  WHERE `DisplayID` = 20831;
