-- Replace Princess Theradras model with the modern Therazane model (Model was 12292)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 32913 WHERE `CreatureID` = 12201;

DELETE FROM `creature_model_info` WHERE `DisplayID` = 32913;
INSERT INTO `creature_model_info` SET
    `DisplayID` = '32913',
    `BoundingRadius` = '2.0',
    `CombatReach` = '3.0',
    `Gender` = '2',
    `DisplayID_Other_Gender` = '0';