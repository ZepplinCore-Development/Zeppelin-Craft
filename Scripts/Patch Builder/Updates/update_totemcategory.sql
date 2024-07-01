UPDATE `dbc`.`totemcategory` SET 
    `CategoryMask` = 2684354623 /* was 63 */
WHERE `ID` = 161;

DELETE FROM `dbc`.`totemcategory` WHERE `ID` = 191;
INSERT INTO `dbc`.`totemcategory` SET 
    `ID` = 191,
    `Name1` = 'Jeweler''s Kit',
    `NameFlags` = 16712190,
    `CategoryType` = 24,
    `CategoryMask` = 536870912;

