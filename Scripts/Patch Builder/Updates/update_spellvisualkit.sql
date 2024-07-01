UPDATE `dbc`.`spellvisualkit` SET 
    `StartAnimId` = 0 /* was 4294967295 */
WHERE `ID` = 173;

UPDATE `dbc`.`spellvisualkit` SET 
    `StartAnimId` = 0 /* was 4294967295 */,
    `AnimationId` = 0 /* was 4294967295 */
WHERE `ID` = 990;

DELETE FROM `dbc`.`spellvisualkit` WHERE `ID` = 16000;
INSERT INTO `dbc`.`spellvisualkit` SET 
    `ID` = 16000,
    `StartAnimId` = 4294967295,
    `AnimationId` = 54,
    `BaseEffect` = 7100,
    `SoundID` = 10065,
    `ShakeID` = 3,
    `CharProc1` = 4294967295,
    `CharProc2` = 4294967295,
    `CharProc3` = 4294967295,
    `CharProc4` = 4294967295;

DELETE FROM `dbc`.`spellvisualkit` WHERE `ID` = 16001;
INSERT INTO `dbc`.`spellvisualkit` SET 
    `ID` = 16001,
    `ChestEffect` = 7101,
    `CharProc1` = 4294967295,
    `CharProc2` = 4294967295,
    `CharProc3` = 4294967295,
    `CharProc4` = 4294967295;

DELETE FROM `dbc`.`spellvisualkit` WHERE `ID` = 16002;
INSERT INTO `dbc`.`spellvisualkit` SET 
    `ID` = 16002,
    `StartAnimId` = 4294967295,
    `AnimationId` = 4294967295,
    `BaseEffect` = 1784,
    `SoundID` = 1432,
    `CharProc1` = 4294967295,
    `CharProc2` = 4294967295,
    `CharProc3` = 4294967295,
    `CharProc4` = 4294967295;

DELETE FROM `dbc`.`spellvisualkit` WHERE `ID` = 16003;
INSERT INTO `dbc`.`spellvisualkit` SET 
    `ID` = 16003,
    `StartAnimId` = 4294967295,
    `AnimationId` = 123,
    `LeftHandEffect` = 1785,
    `RightHandEffect` = 1785,
    `SoundID` = 3256,
    `CharProc1` = 4294967295,
    `CharProc2` = 4294967295,
    `CharProc3` = 4294967295,
    `CharProc4` = 4294967295;

