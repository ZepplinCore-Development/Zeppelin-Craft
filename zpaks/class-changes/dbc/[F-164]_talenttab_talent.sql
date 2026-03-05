-- [F-164] fourth-talent-tree: talenttab and talent
-- Earthwarden spec (4th Shaman tree)
-- ============================================================================
-- TalentTab: Earthwarden (id=900)
-- ============================================================================
DELETE FROM `talenttab` WHERE `id` = 900;

INSERT INTO `talenttab` SET
    `id` = 900,
    `name_enus` = 'Earthwarden',
    `name_kokr` = '',
    `name_frfr` = '',
    `name_dede` = '',
    `name_zhcn` = '',
    `name_zhtw` = '',
    `name_eses` = '',
    `name_esmx` = '',
    `name_ruru` = '',
    `name_jajp` = '',
    `name_ptpt` = '',
    `name_itit` = '',
    `name_unused_1` = '',
    `name_unused_2` = '',
    `name_unused_3` = '',
    `name_unused_4` = '',
    `name_flags` = 16712190,
    `spell_icon` = 19,
    `race_mask` = 4095,
    `class_mask` = 64,
    `order_index` = 3,
    `background_file` = 'ShamanEnhancement';

-- ============================================================================
-- Talent entries (27 rows) for spec_id=900 (Earthwarden)
-- ============================================================================
-- 2900 - tier 0, col 0 - Improved Rockbiter Weapon (2 ranks)
DELETE FROM `talent` WHERE `id` = 2900;

INSERT INTO `talent` SET
    `id` = 2900,
    `spec_id` = 900,
    `rank_1` = 900129,
    `rank_2` = 900130;

-- 2901 - tier 0, col 1
DELETE FROM `talent` WHERE `id` = 2901;

INSERT INTO `talent` SET
    `id` = 2901,
    `spec_id` = 900,
    `column_index` = 1,
    `rank_1` = 16043,
    `rank_2` = 16130;

-- 2902 - tier 0, col 2 - Relentless (5 ranks)
DELETE FROM `talent` WHERE `id` = 2902;

INSERT INTO `talent` SET
    `id` = 2902,
    `spec_id` = 900,
    `column_index` = 2,
    `rank_1` = 900142,
    `rank_2` = 900143,
    `rank_3` = 900144,
    `rank_4` = 900145,
    `rank_5` = 900146;

-- 2903 - tier 1, col 0
DELETE FROM `talent` WHERE `id` = 2903;

INSERT INTO `talent` SET
    `id` = 2903,
    `spec_id` = 900,
    `tier_id` = 1,
    `rank_1` = 16258,
    `rank_2` = 16293;

-- 2904 - tier 1, col 1 - Shield Mastery (5 ranks)
DELETE FROM `talent` WHERE `id` = 2904;

INSERT INTO `talent` SET
    `id` = 2904,
    `spec_id` = 900,
    `tier_id` = 1,
    `column_index` = 1,
    `rank_1` = 900133,
    `rank_2` = 900134,
    `rank_3` = 900135,
    `rank_4` = 900136,
    `rank_5` = 900137;

-- 2905 - tier 1, col 2 (5 ranks)
DELETE FROM `talent` WHERE `id` = 2905;

INSERT INTO `talent` SET
    `id` = 2905,
    `spec_id` = 900,
    `tier_id` = 1,
    `column_index` = 2,
    `rank_1` = 900109,
    `rank_2` = 900110,
    `rank_3` = 900111,
    `rank_4` = 900112,
    `rank_5` = 900113;

-- 2906 - tier 1, col 3 - Lightning Ward (3 ranks, replaces Improved Shields)
DELETE FROM `talent` WHERE `id` = 2906;

INSERT INTO `talent` SET
    `id` = 2906,
    `spec_id` = 900,
    `tier_id` = 1,
    `column_index` = 3,
    `rank_1` = 900157,
    `rank_2` = 900158,
    `rank_3` = 900159;

-- 2933 - tier 2, col 0 - Rockslam (1 rank)
DELETE FROM `talent` WHERE `id` = 2933;

INSERT INTO `talent` SET
    `id` = 2933,
    `spec_id` = 900,
    `tier_id` = 2,
    `rank_1` = 900119,
    `flags` = 1;

-- 2908 - tier 2, col 2
DELETE FROM `talent` WHERE `id` = 2908;

INSERT INTO `talent` SET
    `id` = 2908,
    `spec_id` = 900,
    `tier_id` = 2,
    `column_index` = 2,
    `rank_1` = 43338,
    `flags` = 1;

-- 2909 - tier 2, col 3 - Anticipation (3 ranks, cloned with icon 5340)
DELETE FROM `talent` WHERE `id` = 2909;

INSERT INTO `talent` SET
    `id` = 2909,
    `spec_id` = 900,
    `tier_id` = 2,
    `column_index` = 3,
    `rank_1` = 900154,
    `rank_2` = 900155,
    `rank_3` = 900156;

-- 2929 - tier 3, col 0 - Spirit Weapons (1 rank)
DELETE FROM `talent` WHERE `id` = 2929;

INSERT INTO `talent` SET
    `id` = 2929,
    `spec_id` = 900,
    `tier_id` = 3,
    `rank_1` = 16268;

-- 2910 - tier 3, col 1 - Elemental Bulwark (3 ranks) - prereq: Shield Mastery (2904) rank 3
DELETE FROM `talent` WHERE `id` = 2910;

INSERT INTO `talent` SET
    `id` = 2910,
    `spec_id` = 900,
    `tier_id` = 3,
    `column_index` = 1,
    `rank_1` = 900147,
    `rank_2` = 900148,
    `rank_3` = 900149,
    `pre_req_talent_1` = 2904,
    `pre_req_rank_1` = 3;

-- 2911 - tier 3, col 2
DELETE FROM `talent` WHERE `id` = 2911;

INSERT INTO `talent` SET
    `id` = 2911,
    `spec_id` = 900,
    `tier_id` = 3,
    `column_index` = 2,
    `rank_1` = 16252,
    `rank_2` = 16306,
    `rank_3` = 16307,
    `rank_4` = 16308,
    `rank_5` = 16309;

-- 2912 - tier 4, col 0
DELETE FROM `talent` WHERE `id` = 2912;

INSERT INTO `talent` SET
    `id` = 2912,
    `spec_id` = 900,
    `tier_id` = 4,
    `rank_1` = 29192,
    `rank_2` = 29193;

-- 2914 - tier 4, col 2
DELETE FROM `talent` WHERE `id` = 2914;

INSERT INTO `talent` SET
    `id` = 2914,
    `spec_id` = 900,
    `tier_id` = 4,
    `column_index` = 2,
    `rank_1` = 30812,
    `rank_2` = 30813,
    `rank_3` = 30814;

-- 2932 - tier 4, col 3 - Tectonic Blast (1 rank)
DELETE FROM `talent` WHERE `id` = 2932;

INSERT INTO `talent` SET
    `id` = 2932,
    `spec_id` = 900,
    `tier_id` = 4,
    `column_index` = 3,
    `rank_1` = 900121,
    `flags` = 1;

-- 2915 - tier 5, col 0
DELETE FROM `talent` WHERE `id` = 2915;

INSERT INTO `talent` SET
    `id` = 2915,
    `spec_id` = 900,
    `tier_id` = 5,
    `rank_1` = 30802,
    `rank_2` = 30808,
    `rank_3` = 30809;

-- 2930 - tier 5, col 1 - Elemental Ward (3 ranks, was Stone Skin)
DELETE FROM `talent` WHERE `id` = 2930;

INSERT INTO `talent` SET
    `id` = 2930,
    `spec_id` = 900,
    `tier_id` = 5,
    `column_index` = 1,
    `rank_1` = 900115,
    `rank_2` = 900127,
    `rank_3` = 900128;

-- 2916 - tier 5, col 2
DELETE FROM `talent` WHERE `id` = 2916;

INSERT INTO `talent` SET
    `id` = 2916,
    `spec_id` = 900,
    `tier_id` = 5,
    `column_index` = 2,
    `rank_1` = 29082,
    `rank_2` = 29084,
    `rank_3` = 29086;

-- 2917 - tier 5, col 3
DELETE FROM `talent` WHERE `id` = 2917;

INSERT INTO `talent` SET
    `id` = 2917,
    `spec_id` = 900,
    `tier_id` = 5,
    `column_index` = 3,
    `rank_1` = 63373,
    `rank_2` = 63374;

-- 2920 - tier 6, col 2 - Volcanic Shield (1 rank)
DELETE FROM `talent` WHERE `id` = 2920;

INSERT INTO `talent` SET
    `id` = 2920,
    `spec_id` = 900,
    `tier_id` = 6,
    `column_index` = 2,
    `rank_1` = 900116,
    `flags` = 1;

-- 2921 - tier 7, col 0
DELETE FROM `talent` WHERE `id` = 2921;

INSERT INTO `talent` SET
    `id` = 2921,
    `spec_id` = 900,
    `tier_id` = 7,
    `rank_1` = 51525,
    `rank_2` = 51526,
    `rank_3` = 51527;

-- 2923 - tier 7, col 2 - Improved Volcanic Shield (2 ranks) - prereq: Volcanic Shield (2920)
DELETE FROM `talent` WHERE `id` = 2923;

INSERT INTO `talent` SET
    `id` = 2923,
    `spec_id` = 900,
    `tier_id` = 7,
    `column_index` = 2,
    `rank_1` = 900123,
    `rank_2` = 900124,
    `pre_req_talent_1` = 2920;

-- 2925 - tier 8, col 1
DELETE FROM `talent` WHERE `id` = 2925;

INSERT INTO `talent` SET
    `id` = 2925,
    `spec_id` = 900,
    `tier_id` = 8,
    `column_index` = 1,
    `rank_1` = 30823,
    `flags` = 1;

-- 2926 - tier 8, col 2
DELETE FROM `talent` WHERE `id` = 2926;

INSERT INTO `talent` SET
    `id` = 2926,
    `spec_id` = 900,
    `tier_id` = 8,
    `column_index` = 2,
    `rank_1` = 51523,
    `rank_2` = 51524;

-- 2927 - tier 9, col 1
DELETE FROM `talent` WHERE `id` = 2927;

INSERT INTO `talent` SET
    `id` = 2927,
    `spec_id` = 900,
    `tier_id` = 9,
    `column_index` = 1,
    `rank_1` = 51528,
    `rank_2` = 51529,
    `rank_3` = 51530,
    `rank_4` = 51531,
    `rank_5` = 51532;

-- 2928 - tier 10, col 1
DELETE FROM `talent` WHERE `id` = 2928;

INSERT INTO `talent` SET
    `id` = 2928,
    `spec_id` = 900,
    `tier_id` = 10,
    `column_index` = 1,
    `rank_1` = 51533,
    `flags` = 1;

