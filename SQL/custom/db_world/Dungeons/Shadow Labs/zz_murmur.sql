-- New Murmur model to be Alakir (original diplay ID 18839)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 36062 WHERE `CreatureID` = 18708;

-- Smaller Murmur
UPDATE `creature_template` SET `scale` = 0.5 WHERE (`entry` = 18708);

-- New creature_model_info entry
DELETE FROM `creature_model_info` WHERE `DisplayID` = 36062;
INSERT INTO `creature_model_info` SET
    `DisplayID` = '36062',
    `BoundingRadius` = '1.5',
    `CombatReach` = '1.5',
    `Gender` = '0',
    `DisplayID_Other_Gender` = '0';

