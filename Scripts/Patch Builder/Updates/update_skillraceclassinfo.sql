UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4035 /* was 2147483647 */,
    `ClassMask` = 1535 /* was 262111 */
WHERE `Id` = 4;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 21;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 27;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 28;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 29;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 30;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 3149 /* was 1101 */
WHERE `Id` = 40;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 930 /* was 674 */
WHERE `Id` = 41;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 946 /* was 690 */
WHERE `Id` = 48;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 3149 /* was 1101 */
WHERE `Id` = 49;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 84;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 85;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `ClassMask` = 1535 /* was 262111 */
WHERE `Id` = 86;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 88;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 93;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 145;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 146;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 147;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 148;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 241;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 243;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 244;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 281;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 282;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 284;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 4294967295 */,
    `ClassMask` = 1535 /* was 8 */
WHERE `Id` = 601;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 865;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 866;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2147483647 */,
    `ClassMask` = 1535 /* was 262111 */
WHERE `Id` = 890;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 2047 */
WHERE `Id` = 899;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `ClassMask` = 1535 /* was 32 */
WHERE `Id` = 925;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `RaceMask` = 4095 /* was 524287 */
WHERE `Id` = 939;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 971;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 971,
    `SkillLineDbcRecord` = 789,
    `RaceMask` = 2048,
    `ClassMask` = 1469,
    `Flags` = 1170;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 972;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 972,
    `SkillLineDbcRecord` = 790,
    `RaceMask` = 256,
    `ClassMask` = 509,
    `Flags` = 1170;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 998;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 998,
    `SkillLineDbcRecord` = 792,
    `RaceMask` = 4095,
    `ClassMask` = 1535,
    `Flags` = 2,
    `SkillTierId` = 41;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 999;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 999,
    `SkillLineDbcRecord` = 791,
    `RaceMask` = 4095,
    `ClassMask` = 1535,
    `Flags` = 2,
    `SkillTierId` = 41;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1000;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1000,
    `SkillLineDbcRecord` = 43,
    `RaceMask` = 4095,
    `ClassMask` = 431,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1001;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1001,
    `SkillLineDbcRecord` = 44,
    `RaceMask` = 4095,
    `ClassMask` = 103,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1002;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1002,
    `SkillLineDbcRecord` = 45,
    `RaceMask` = 4095,
    `ClassMask` = 13,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1003;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1003,
    `SkillLineDbcRecord` = 46,
    `RaceMask` = 4095,
    `ClassMask` = 13,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1004;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1004,
    `SkillLineDbcRecord` = 54,
    `RaceMask` = 4095,
    `ClassMask` = 123,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1005;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1005,
    `SkillLineDbcRecord` = 55,
    `RaceMask` = 4095,
    `ClassMask` = 39,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1006;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1006,
    `SkillLineDbcRecord` = 136,
    `RaceMask` = 4095,
    `ClassMask` = 469,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1007;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1007,
    `SkillLineDbcRecord` = 160,
    `RaceMask` = 4095,
    `ClassMask` = 99,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1008;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1008,
    `SkillLineDbcRecord` = 162,
    `RaceMask` = 4095,
    `ClassMask` = 511,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1009;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1009,
    `SkillLineDbcRecord` = 172,
    `RaceMask` = 4095,
    `ClassMask` = 103,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1010;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1010,
    `SkillLineDbcRecord` = 173,
    `RaceMask` = 4095,
    `ClassMask` = 477,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1011;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1011,
    `SkillLineDbcRecord` = 176,
    `RaceMask` = 4095,
    `ClassMask` = 9,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1012;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1012,
    `SkillLineDbcRecord` = 226,
    `RaceMask` = 4095,
    `ClassMask` = 13,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1013;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1013,
    `SkillLineDbcRecord` = 228,
    `RaceMask` = 4095,
    `ClassMask` = 400,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1014;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1014,
    `SkillLineDbcRecord` = 229,
    `RaceMask` = 4095,
    `ClassMask` = 39,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1015;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1015,
    `SkillLineDbcRecord` = 433,
    `RaceMask` = 4095,
    `ClassMask` = 67,
    `Flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `Id` = 1016;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `Id` = 1016,
    `SkillLineDbcRecord` = 473,
    `RaceMask` = 4095,
    `ClassMask` = 77,
    `Flags` = 128;

