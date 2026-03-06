-- [F-164] Earthwarden spec: talenttab and talent
-- TalentTab 900 (Earthwarden) + race_mask updates for all tabs
-- All Earthwarden talents (spec_id=900)
-- ============================================================================

-- ============================================================================
-- TalentTab
-- ============================================================================
DELETE FROM `talenttab` WHERE `id` = 900;
INSERT INTO `talenttab` (`id`, `name_enus`, `name_flags`, `spell_icon`, `race_mask`, `class_mask`, `creature_family`, `order_index`, `background_file`) VALUES (900, 'Earthwarden', 16712190, 19, 4095, 64, 0, 3, 'ShamanEnhancement');

-- race_mask = 4095 (all races) for all talent tabs
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 41;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 61;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 81;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 161;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 163;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 164;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 181;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 182;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 183;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 201;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 202;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 203;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 261;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 262;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 263;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 281;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 282;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 283;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 301;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 302;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 303;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 361;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 362;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 363;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 381;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 382;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 383;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 398;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 399;
UPDATE `talenttab` SET `race_mask` = 4095 WHERE `id` = 400;

-- ============================================================================
-- Talents (spec_id=900, Earthwarden)
-- ============================================================================

-- Clean up old talent IDs removed during tree restructures
DELETE FROM `talent` WHERE `id` IN (2929, 2932, 2933, 2935);

-- Tier 0
DELETE FROM `talent` WHERE `id` = 2900;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2900, 900, 0, 0, 900129, 900130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2901;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2901, 900, 0, 1, 16043, 16130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2902;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2902, 900, 0, 2, 900142, 900143, 900144, 900145, 900146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 1
DELETE FROM `talent` WHERE `id` = 2903;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2903, 900, 1, 0, 16258, 16293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2904;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2904, 900, 1, 1, 900133, 900134, 900135, 900136, 900137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2905;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2905, 900, 1, 2, 900109, 900110, 900111, 900112, 900113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2906;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2906, 900, 1, 3, 900157, 900158, 900159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 2
DELETE FROM `talent` WHERE `id` = 2937;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2937, 900, 2, 0, 16268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2908;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2908, 900, 2, 2, 900154, 900155, 900156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2909;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2909, 900, 2, 3, 43338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 3
DELETE FROM `talent` WHERE `id` = 2936;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2936, 900, 3, 0, 900119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2910;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2910, 900, 3, 1, 900147, 900148, 900149, 0, 0, 0, 0, 0, 0, 2904, 2936, 0, 3, 1, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2911;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2911, 900, 3, 2, 16252, 16306, 16307, 16308, 16309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2938;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2938, 900, 3, 3, 900115, 900116, 900117, 0, 0, 0, 0, 0, 0, 2909, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Tier 4
DELETE FROM `talent` WHERE `id` = 2912;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2912, 900, 4, 0, 900121, 0, 0, 0, 0, 0, 0, 0, 0, 2936, 0, 0, 1, 0, 0, 1, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2914;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2914, 900, 4, 2, 30812, 30813, 30814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 5
DELETE FROM `talent` WHERE `id` = 2915;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2915, 900, 5, 0, 30802, 30808, 30809, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2930;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2930, 900, 5, 1, 900164, 0, 0, 0, 0, 0, 0, 0, 0, 2910, 0, 0, 3, 0, 0, 1, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2916;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2916, 900, 5, 2, 29082, 29084, 29086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2917;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2917, 900, 5, 3, 63373, 63374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 6
DELETE FROM `talent` WHERE `id` = 2934;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2934, 900, 6, 0, 900161, 900162, 900163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2920;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2920, 900, 6, 2, 900116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);

-- Tier 7
DELETE FROM `talent` WHERE `id` = 2921;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2921, 900, 7, 0, 900165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2923;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2923, 900, 7, 2, 900123, 900124, 0, 0, 0, 0, 0, 0, 0, 2920, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 8
DELETE FROM `talent` WHERE `id` = 2925;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2925, 900, 8, 1, 30823, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
DELETE FROM `talent` WHERE `id` = 2926;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2926, 900, 8, 2, 51523, 51524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 9
DELETE FROM `talent` WHERE `id` = 2927;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2927, 900, 9, 1, 51528, 51529, 51530, 51531, 51532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Tier 10
DELETE FROM `talent` WHERE `id` = 2928;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2928, 900, 10, 1, 51533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
