-- I-169: FelBoar HD model is much larger than stock - 2x BoundingRadius and CombatReach
-- Affects all creatures using FelBoar model (CreatureModelData ID 1631)
UPDATE `creature_model_info` SET `BoundingRadius` = 1.5, `CombatReach` = 3.0 WHERE `DisplayID` = 11410;
UPDATE `creature_model_info` SET `BoundingRadius` = 1.85, `CombatReach` = 3.7 WHERE `DisplayID` = 16572;
UPDATE `creature_model_info` SET `BoundingRadius` = 1.65, `CombatReach` = 3.3 WHERE `DisplayID` = 18701;
UPDATE `creature_model_info` SET `BoundingRadius` = 2.5, `CombatReach` = 5.0 WHERE `DisplayID` = 19249;
UPDATE `creature_model_info` SET `BoundingRadius` = 2.0, `CombatReach` = 4.0 WHERE `DisplayID` = 20146;
UPDATE `creature_model_info` SET `BoundingRadius` = 2.5, `CombatReach` = 5.0 WHERE `DisplayID` = 20831;
