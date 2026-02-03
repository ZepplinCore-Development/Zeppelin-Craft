-- Replace the stock fire elemental model for lord incendius with a modern elemental lord. ID was 1204
UPDATE `creature_template_model` SET `CreatureDisplayID` = 39094 WHERE `CreatureID` = 9017;

DELETE FROM `creature_model_info` WHERE `DisplayID` = 39094;
INSERT INTO `creature_model_info` SET
    `DisplayID` = '39094',
    `BoundingRadius` = '1.5',
    `CombatReach` = '3.0',
    `Gender` = '2',
    `DisplayID_Other_Gender` = '0';
 