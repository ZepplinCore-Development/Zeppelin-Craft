-- [BASE,F-044] zepcraft-legacy: mapdifficulty
-- Imported by zep dbc import-module (F-060 entries extracted to [F-060]_mapdifficulty.sql)

-- mapdifficulty: 2 deletes, 2 inserts, 74 updates
DELETE FROM `mapdifficulty` WHERE `id` = 3;
DELETE FROM `mapdifficulty` WHERE `id` = 4;

-- Naxxramas 40-man and map 44
DELETE FROM `mapdifficulty` WHERE `id` = 802;
INSERT INTO `mapdifficulty` (`id`, `map_id`, `difficulty`, `message_enus`, `message_flags`, `lockout_duration`, `max_players`, `difficulty_string`) VALUES (802, 533, 2, '', 16712190, 604800, 40, 'RAID_DIFFICULTY_10PLAYER_HEROIC');
DELETE FROM `mapdifficulty` WHERE `id` = 803;
INSERT INTO `mapdifficulty` (`id`, `map_id`, `difficulty`, `message_enus`, `message_flags`, `lockout_duration`, `max_players`, `difficulty_string`) VALUES (803, 44, 0, '', 0, 0, 0, '');

-- Clear expansion requirement messages
UPDATE `mapdifficulty` SET `message_flags` = 0 WHERE `id` = 1;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 26;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 46;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 74;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 76;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 77;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 91;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 95;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 96;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 97;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 98;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 99;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 100;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 104;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 110;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 111;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 114;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 119;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 124;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 125;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 127;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 128;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 129;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 130;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 131;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 132;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 133;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 134;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 135;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 136;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 137;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 138;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 139;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 140;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 141;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 142;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 143;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 144;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 145;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 146;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 147;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 148;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 149;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 150;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 151;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 152;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 153;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 154;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 155;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 156;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 157;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 158;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 159;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 160;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 161;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 162;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 221;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 222;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 323;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 341;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 342;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 481;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 482;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 483;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 484;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 485;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 486;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 487;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 488;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 750;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 751;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 752;
UPDATE `mapdifficulty` SET `message_enus` = '' WHERE `id` = 753;
