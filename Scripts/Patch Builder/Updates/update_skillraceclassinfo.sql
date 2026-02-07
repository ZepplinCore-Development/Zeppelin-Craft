UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4035 /* was 2147483647 */,
    `ClassMask` = 1535 /* was 262111 */
WHERE `id` = 4;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 21;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 27;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 28;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 29;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 30;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 3149 /* was 1101 */
WHERE `id` = 40;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 930 /* was 674 */
WHERE `id` = 41;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 946 /* was 690 */
WHERE `id` = 48;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 3149 /* was 1101 */
WHERE `id` = 49;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 84;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 85;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `ClassMask` = 1535 /* was 262111 */
WHERE `id` = 86;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 88;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 93;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 145;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 146;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 147;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 148;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 241;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 243;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 244;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 281;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 282;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 284;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 4294967295 */,
    `ClassMask` = 1535 /* was 8 */
WHERE `id` = 601;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 865;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 866;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2147483647 */,
    `ClassMask` = 1535 /* was 262111 */
WHERE `id` = 890;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 2047 */
WHERE `id` = 899;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `ClassMask` = 1535 /* was 32 */
WHERE `id` = 925;

UPDATE `dbc`.`skillraceclassinfo` SET 
    `race_mask` = 4095 /* was 524287 */
WHERE `id` = 939;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 971;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 971,
    `SkillLineDbcRecord` = 789,
    `race_mask` = 2048,
    `ClassMask` = 1469,
    `flags` = 1170;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 972;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 972,
    `SkillLineDbcRecord` = 790,
    `race_mask` = 256,
    `ClassMask` = 509,
    `flags` = 1170;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 998;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 998,
    `SkillLineDbcRecord` = 792,
    `race_mask` = 4095,
    `ClassMask` = 1535,
    `flags` = 2,
    `SkillTierId` = 41;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 999;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 999,
    `SkillLineDbcRecord` = 791,
    `race_mask` = 4095,
    `ClassMask` = 1535,
    `flags` = 2,
    `SkillTierId` = 41;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1000;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1000,
    `SkillLineDbcRecord` = 43,
    `race_mask` = 4095,
    `ClassMask` = 431,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1001;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1001,
    `SkillLineDbcRecord` = 44,
    `race_mask` = 4095,
    `ClassMask` = 103,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1002;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1002,
    `SkillLineDbcRecord` = 45,
    `race_mask` = 4095,
    `ClassMask` = 13,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1003;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1003,
    `SkillLineDbcRecord` = 46,
    `race_mask` = 4095,
    `ClassMask` = 13,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1004;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1004,
    `SkillLineDbcRecord` = 54,
    `race_mask` = 4095,
    `ClassMask` = 123,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1005;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1005,
    `SkillLineDbcRecord` = 55,
    `race_mask` = 4095,
    `ClassMask` = 39,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1006;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1006,
    `SkillLineDbcRecord` = 136,
    `race_mask` = 4095,
    `ClassMask` = 469,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1007;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1007,
    `SkillLineDbcRecord` = 160,
    `race_mask` = 4095,
    `ClassMask` = 99,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1008;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1008,
    `SkillLineDbcRecord` = 162,
    `race_mask` = 4095,
    `ClassMask` = 511,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1009;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1009,
    `SkillLineDbcRecord` = 172,
    `race_mask` = 4095,
    `ClassMask` = 103,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1010;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1010,
    `SkillLineDbcRecord` = 173,
    `race_mask` = 4095,
    `ClassMask` = 477,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1011;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1011,
    `SkillLineDbcRecord` = 176,
    `race_mask` = 4095,
    `ClassMask` = 9,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1012;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1012,
    `SkillLineDbcRecord` = 226,
    `race_mask` = 4095,
    `ClassMask` = 13,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1013;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1013,
    `SkillLineDbcRecord` = 228,
    `race_mask` = 4095,
    `ClassMask` = 400,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1014;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1014,
    `SkillLineDbcRecord` = 229,
    `race_mask` = 4095,
    `ClassMask` = 39,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1015;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1015,
    `SkillLineDbcRecord` = 433,
    `race_mask` = 4095,
    `ClassMask` = 67,
    `flags` = 128;

DELETE FROM `dbc`.`skillraceclassinfo` WHERE `id` = 1016;
INSERT INTO `dbc`.`skillraceclassinfo` SET 
    `id` = 1016,
    `SkillLineDbcRecord` = 473,
    `race_mask` = 4095,
    `ClassMask` = 77,
    `flags` = 128;

