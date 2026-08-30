-- New Murmur model to be Alakir (original diplay ID 18839)
-- Covers both the normal entry (18708) and the heroic clone (20657) - I-358.
UPDATE `creature_template_model` SET `CreatureDisplayID` = 36062, `DisplayScale` = 0.5 WHERE `CreatureID` IN (18708, 20657);

-- New creature_model_info entry
DELETE FROM `creature_model_info` WHERE `DisplayID` = 36062;
INSERT INTO `creature_model_info` SET
    `DisplayID` = 36062,
    `BoundingRadius` = 1.5,
    `CombatReach` = 1.5,
    `Gender` = 0,
    `DisplayID_Other_Gender` = 0;
