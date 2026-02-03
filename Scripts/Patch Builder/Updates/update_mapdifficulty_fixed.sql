UPDATE `dbc`.`mapdifficulty` SET 
    `message_flags` = 0 /* was 16712188 */
WHERE `id` = 1;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 189 /* was 29 */,
    `max_players` = 5 /* was 10 */
WHERE `id` = 5;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 230 /* was 30 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 6;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 429 /* was 33 */
WHERE `id` = 7;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 189 /* was 34 */,
    `difficulty` = 1 /* was 0 */
WHERE `id` = 8;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 329 /* was 35 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 9;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 209 /* was 36 */
WHERE `id` = 10;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 209 /* was 37 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 11;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 349 /* was 42 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 12;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 109 /* was 43 */
WHERE `id` = 13;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 230 /* was 44 */,
    `difficulty` = 1 /* was 0 */,
    `max_players` = 5 /* was 10 */
WHERE `id` = 14;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 229 /* was 47 */
WHERE `id` = 15;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 429 /* was 48 */,
    `difficulty` = 1 /* was 0 */
WHERE `id` = 16;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 289 /* was 70 */
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
    `map_id` = 129 /* was 30 */,
    `difficulty` = 2 /* was 1 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 126;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 349 /* was 30 */,
    `difficulty` = 0 /* was 2 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 163;

UPDATE `dbc`.`mapdifficulty` SET 
    `map_id` = 389 /* was 30 */,
    `difficulty` = 2 /* was 3 */,
    `max_players` = 5 /* was 0 */
WHERE `id` = 522;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 758;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 758,
    `map_id` = 289,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 759;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 759,
    `map_id` = 229,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 760;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 760,
    `map_id` = 129,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 761;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 761,
    `map_id` = 109,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 762;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 762,
    `map_id` = 389,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 763;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 763,
    `map_id` = 329,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 768;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 768,
    `map_id` = 43,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 771;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 771,
    `map_id` = 70,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 772;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 772,
    `map_id` = 33,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 773;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 773,
    `map_id` = 33,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 774;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 774,
    `map_id` = 33,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 775;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 775,
    `map_id` = 36,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 776;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 776,
    `map_id` = 43,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 777;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 777,
    `map_id` = 43,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 779;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 779,
    `map_id` = 34,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 780;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 780,
    `map_id` = 34,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 781;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 781,
    `map_id` = 34,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 782;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 782,
    `map_id` = 30,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 783;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 783,
    `map_id` = 30,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 784;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 784,
    `map_id` = 30,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 788;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 788,
    `map_id` = 48,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 789;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 789,
    `map_id` = 47,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 790;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 790,
    `map_id` = 47,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 791;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 791,
    `map_id` = 47,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 793;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 793,
    `map_id` = 90,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 794;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 794,
    `map_id` = 90,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 795;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 795,
    `map_id` = 36,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 797;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 797,
    `map_id` = 36,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 798;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 798,
    `map_id` = 48,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 799;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 799,
    `map_id` = 48,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 800;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 800,
    `map_id` = 70,
    `difficulty` = 1,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 801;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 801,
    `map_id` = 70,
    `difficulty` = 2,
    `message_flags` = 16712188,
    `max_players` = 5;

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 802;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 802,
    `map_id` = 533,
    `difficulty` = 2,
    `message_enus` = 'You must be level 60 and in a raid group to enter.',
    `message_flags` = 16712190,
    `lockout_duration` = 604800,
    `max_players` = 40,
    `difficulty_string` = 'RAID_DIFFICULTY_10PLAYER_HEROIC';

DELETE FROM `dbc`.`mapdifficulty` WHERE `id` = 803;
INSERT INTO `dbc`.`mapdifficulty` SET 
    `id` = 803,
    `map_id` = 44;

