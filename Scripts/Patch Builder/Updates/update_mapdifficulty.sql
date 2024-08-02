UPDATE `dbc`.`mapdifficulty` SET 
    `messageFlags` = 0 /* was 16712188 */
WHERE `ID` = 1;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 189 /* was 29 */,
    `maxPlayers` = 5 /* was 10 */
WHERE `ID` = 5;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 230 /* was 30 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 6;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 429 /* was 33 */
WHERE `ID` = 7;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 189 /* was 34 */,
    `difficulty` = 1 /* was 0 */
WHERE `ID` = 8;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 329 /* was 35 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 9;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 209 /* was 36 */
WHERE `ID` = 10;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 209 /* was 37 */,
    `difficulty` = 1 /* was 0 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 11;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 349 /* was 42 */,
    `difficulty` = 1 /* was 0 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 12;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 109 /* was 43 */
WHERE `ID` = 13;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 230 /* was 44 */,
    `difficulty` = 1 /* was 0 */,
    `maxPlayers` = 5 /* was 10 */
WHERE `ID` = 14;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 229 /* was 47 */
WHERE `ID` = 15;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 429 /* was 48 */,
    `difficulty` = 1 /* was 0 */
WHERE `ID` = 16;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 289 /* was 70 */
WHERE `ID` = 17;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `ID` = 19;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `ID` = 22;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `ID` = 23;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */,
    `maxPlayers` = 5 /* was 15 */
WHERE `ID` = 24;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `ID` = 25;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `ID` = 28;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `ID` = 30;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `ID` = 31;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `ID` = 35;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 129 /* was 30 */,
    `difficulty` = 2 /* was 1 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 126;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 349 /* was 30 */,
    `difficulty` = 0 /* was 2 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 163;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 389 /* was 30 */,
    `difficulty` = 2 /* was 3 */,
    `maxPlayers` = 5 /* was 0 */
WHERE `ID` = 522;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 758;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 758,
    `Map` = 289,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 759;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 759,
    `Map` = 229,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 760;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 760,
    `Map` = 129,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 761;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 761,
    `Map` = 109,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 762;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 762,
    `Map` = 389,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 763;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 763,
    `Map` = 329,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 768;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 768,
    `Map` = 43,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 771;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 771,
    `Map` = 70,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 772;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 772,
    `Map` = 33,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 773;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 773,
    `Map` = 33,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 774;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 774,
    `Map` = 33,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 775;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 775,
    `Map` = 36,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 776;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 776,
    `Map` = 43,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 777;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 777,
    `Map` = 43,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 779;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 779,
    `Map` = 34,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 780;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 780,
    `Map` = 34,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 781;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 781,
    `Map` = 34,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 782;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 782,
    `Map` = 30,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 783;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 783,
    `Map` = 30,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 784;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 784,
    `Map` = 30,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 788;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 788,
    `Map` = 48,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 789;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 789,
    `Map` = 47,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 790;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 790,
    `Map` = 47,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 791;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 791,
    `Map` = 47,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 793;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 793,
    `Map` = 90,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 794;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 794,
    `Map` = 90,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 795;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 795,
    `Map` = 36,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 797;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 797,
    `Map` = 36,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 798;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 798,
    `Map` = 48,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 799;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 799,
    `Map` = 48,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 800;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 800,
    `Map` = 70,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 801;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 801,
    `Map` = 70,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `maxPlayers` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 802;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 802,
    `Map` = 533,
    `difficulty` = 2,
    `message1` = 'You must be level 60 and in a raid group to enter.',
    `messageFlags` = 16712190,
    `raidDurationSeconds` = 604800,
    `maxPlayers` = 40,
    `difficultyString` = 'RAID_DIFFICULTY_10PLAYER_HEROIC';

DELETE FROM `dbc`.`mapdifficulty` WHERE `ID` = 803;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `ID` = 803,
    `Map` = 44;

