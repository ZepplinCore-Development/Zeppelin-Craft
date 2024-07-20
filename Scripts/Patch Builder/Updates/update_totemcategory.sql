UPDATE `dbc`.`totemcategory` SET 
    `CategoryMask` = 2684354623 /* was 63 */
WHERE `ID` = 161;

UPDATE `dbc`.`totemcategory` SET 
    `CategoryType` = 4 /* was 24 */,
    `CategoryMask` = 1 /* was 4 */
WHERE `ID` = 162;

DELETE FROM `dbc`.`totemcategory` WHERE `ID` = 191;
INSERT INTO `dbc`.`totemcategory` SET 
    `ID` = 191,
    `Name1` = 'Jeweler''s Kit',
    `NameFlags` = 16712190,
    `CategoryType` = 24,
    `CategoryMask` = 536870912;

DELETE FROM `dbc`.`totemcategory` WHERE `ID` = 192;
INSERT INTO `dbc`.`totemcategory` SET 
    `ID` = 192,
    `Name1` = 'Bronze Smithing Hammer',
    `NameFlags` = 16712190,
    `CategoryType` = 4,
    `CategoryMask` = 3;

DELETE FROM `dbc`.`totemcategory` WHERE `ID` = 193;
INSERT INTO `dbc`.`totemcategory` SET 
    `ID` = 193,
    `Name1` = 'Iron Smithing Hammer',
    `NameFlags` = 16712190,
    `CategoryType` = 4,
    `CategoryMask` = 7;

