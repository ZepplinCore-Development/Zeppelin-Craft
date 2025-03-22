-- Update the cloud serpent models to use the modern chinese dragons

DELETE FROM `creature_template_model` WHERE `CreatureID` = 4117;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '4117',
    `idx` = 1,
    `CreatureDisplayID` = '24393', -- was 2705
    `probability` = 1.0;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 4118;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '4118',
    `idx` = 1,
    `CreatureDisplayID` = '14778', -- was 10991
    `probability` = 1.0;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 4119;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '4119',
    `idx` = 1,
    `CreatureDisplayID` = '14779', -- was 2703
    `probability` = 1.0;