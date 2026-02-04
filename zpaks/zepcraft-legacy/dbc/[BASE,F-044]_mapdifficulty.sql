UPDATE `dbc`.`mapdifficulty` SET 
    `messageFlags` = 0 /* was 16712188 */
WHERE `id` = 1;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 189 /* was 29 */,
    `max_players` = 5 /* was 10 */
WHERE `id` = 5;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 230 /* was 30 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 6;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 429 /* was 33 */
WHERE `id` = 7;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 189 /* was 34 */,
    `difficulty` = 1 /* was 0 */
WHERE `id` = 8;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 329 /* was 35 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 9;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 209 /* was 36 */
WHERE `id` = 10;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 209 /* was 37 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 11;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 349 /* was 42 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 12;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 109 /* was 43 */
WHERE `id` = 13;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 230 /* was 44 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 10 */
WHERE `id` = 14;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 229 /* was 47 */
WHERE `id` = 15;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 429 /* was 48 */,
    `difficulty` = 1 /* was 0 */
WHERE `id` = 16;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 289 /* was 70 */
WHERE `id` = 17;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `id` = 19;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `id` = 22;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `id` = 23;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 15 */
WHERE `id` = 24;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `id` = 25;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `id` = 28;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 1 /* was 0 */
WHERE `id` = 30;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `id` = 31;

UPDATE `dbc`.`mapdifficulty` SET 
    `difficulty` = 2 /* was 0 */
WHERE `id` = 35;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 129 /* was 30 */,
    `difficulty` = 2 /* was 1 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 126;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 349 /* was 30 */,
    `difficulty` = 0 /* was 2 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 163;

UPDATE `dbc`.`mapdifficulty` SET 
    `Map` = 389 /* was 30 */,
    `difficulty` = 2 /* was 3 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 522;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 758;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 758,
    `Map` = 289,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 759;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 759,
    `Map` = 229,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 760;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 760,
    `Map` = 129,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 761;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 761,
    `Map` = 109,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 762;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 762,
    `Map` = 389,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 763;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 763,
    `Map` = 329,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 768;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 768,
    `Map` = 43,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 771;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 771,
    `Map` = 70,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 772;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 772,
    `Map` = 33,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 773;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 773,
    `Map` = 33,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 774;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 774,
    `Map` = 33,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 775;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 775,
    `Map` = 36,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 776;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 776,
    `Map` = 43,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 777;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 777,
    `Map` = 43,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 779;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 779,
    `Map` = 34,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 780;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 780,
    `Map` = 34,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 781;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 781,
    `Map` = 34,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 782;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 782,
    `Map` = 30,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 783;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 783,
    `Map` = 30,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 784;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 784,
    `Map` = 30,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 788;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 788,
    `Map` = 48,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 789;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 789,
    `Map` = 47,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 790;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 790,
    `Map` = 47,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 791;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 791,
    `Map` = 47,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 793;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 793,
    `Map` = 90,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 794;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 794,
    `Map` = 90,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 795;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 795,
    `Map` = 36,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 797;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 797,
    `Map` = 36,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 798;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 798,
    `Map` = 48,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 799;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 799,
    `Map` = 48,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 800;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 800,
    `Map` = 70,
    `difficulty` = 1,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 801;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 801,
    `Map` = 70,
    `difficulty` = 2,
    `messageFlags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 802;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 802,
    `Map` = 533,
    `difficulty` = 2,
    `message1` = 'You must be level 60 and in a raid group to enter.',
    `messageFlags` = 16712190,
    `raidDurationSeconds` = 604800,
    `max_players` = 40,
    `difficultyString` = 'RAID_DIFFICULTY_10PLAYER_HEROIC';

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 803;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 803,
    `Map` = 44;

