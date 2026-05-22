-- Replace the stock fire elemental model for lord incendius with a modern
-- Unbound Fire Elemental Lord (model 3871). Display 38030 is scale 3.0 with
-- no sound/particle overrides. Stock display ID was 1204; the prior F-049
-- swap aimed at Deepholm Golem display 39094 (cleaned up here).
UPDATE `creature_template_model` SET `CreatureDisplayID` = 38030, `DisplayScale` = 0.5 WHERE `CreatureID` = 9017;

DELETE FROM `creature_model_info` WHERE `DisplayID` IN (38030, 39094);
INSERT INTO `creature_model_info` SET
    `DisplayID` = '38030',
    `BoundingRadius` = '1.5',
    `CombatReach` = '3.0',
    `Gender` = '2',
    `DisplayID_Other_Gender` = '0';
 