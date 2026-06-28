-- [F-164] zep-classes: talent
-- Extracted by zep dbc extract

-- talent: 29 inserts, 3 updates, 2 deletes

-- Apply order: DELETEs, then UPDATEs (vacate stock slots), then INSERTs.
-- Required because the talent table has a unique (spec,tier,column) key:
-- e.g. UPDATE 1693 (move Shamanistic Rage off 263/8/1) must precede
-- INSERT 2960 (Improved Lava Lash into 263/8/1).

DELETE FROM `talent` WHERE `id` = 605;
DELETE FROM `talent` WHERE `id` = 2056;
DELETE FROM `talent` WHERE `id` = 2901;
DELETE FROM `talent` WHERE `id` = 2903;
DELETE FROM `talent` WHERE `id` = 2909;
DELETE FROM `talent` WHERE `id` = 2915;
DELETE FROM `talent` WHERE `id` = 2930;
DELETE FROM `talent` WHERE `id` = 2934;
DELETE FROM `talent` WHERE `id` = 2946;
DELETE FROM `talent` WHERE `id` = 2948;
DELETE FROM `talent` WHERE `id` = 2951;
DELETE FROM `talent` WHERE `id` = 2953;
DELETE FROM `talent` WHERE `id` = 2954;
DELETE FROM `talent` WHERE `id` = 2957;
DELETE FROM `talent` WHERE `id` = 2960;
DELETE FROM `talent` WHERE `id` = 2961;
DELETE FROM `talent` WHERE `id` = 2967;
DELETE FROM `talent` WHERE `id` = 2968;
DELETE FROM `talent` WHERE `id` = 2969;
DELETE FROM `talent` WHERE `id` = 2970;
DELETE FROM `talent` WHERE `id` = 2971;
DELETE FROM `talent` WHERE `id` = 2972;
DELETE FROM `talent` WHERE `id` = 2973;
DELETE FROM `talent` WHERE `id` = 2974;
DELETE FROM `talent` WHERE `id` = 2975;
DELETE FROM `talent` WHERE `id` = 2976;
DELETE FROM `talent` WHERE `id` = 2977;
DELETE FROM `talent` WHERE `id` = 2978;
DELETE FROM `talent` WHERE `id` = 2979;
DELETE FROM `talent` WHERE `id` = 2980;
DELETE FROM `talent` WHERE `id` = 2981;
DELETE FROM `talent` WHERE `id` = 2982;

UPDATE `talent` SET `rank_1` = 900216, `rank_2` = 0, `flags` = 1 WHERE `id` = 609;
UPDATE `talent` SET `column_index` = 2 WHERE `id` = 1693;
UPDATE `talent` SET `rank_1` = 900210, `rank_2` = 900211, `rank_3` = 900212 WHERE `id` = 2101;

INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2901, 900, 0, 1, 16043, 16130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2903, 900, 1, 0, 16258, 16293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2909, 900, 2, 3, 900175, 900176, 900177, 900178, 900179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2915, 900, 5, 0, 900192, 900193, 900194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2930, 900, 5, 1, 900129, 900130, 900131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2934, 900, 6, 0, 900161, 900162, 900163, 900203, 900204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2946, 900, 7, 2, 900123, 900124, 900125, 0, 0, 0, 0, 0, 0, 2948, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2948, 900, 5, 2, 900116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2951, 900, 9, 1, 900225, 900227, 900228, 900229, 900236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2953, 900, 10, 1, 900173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2954, 900, 6, 1, 900121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2957, 900, 4, 0, 900195, 900196, 900197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2960, 263, 8, 1, 900217, 900218, 900219, 0, 0, 0, 0, 0, 0, 2249, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2961, 263, 1, 2, 16262, 16287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2967, 900, 1, 1, 900147, 900148, 900149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2968, 900, 3, 1, 900167, 900168, 900169, 0, 0, 0, 0, 0, 0, 2967, 0, 0, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2969, 900, 0, 0, 900142, 900143, 900144, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2970, 900, 0, 2, 900256, 900257, 900258, 900259, 900260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2971, 900, 1, 3, 900109, 900110, 900111, 900112, 900113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2972, 900, 2, 2, 900181, 900182, 0, 0, 0, 0, 0, 0, 0, 2970, 0, 0, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2973, 900, 4, 1, 900189, 900190, 900191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2974, 900, 4, 2, 900223, 0, 0, 0, 0, 0, 0, 0, 0, 2972, 0, 0, 1, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2975, 900, 3, 3, 900154, 900155, 900156, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2976, 900, 8, 0, 900115, 900127, 900128, 900207, 900208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2977, 900, 3, 0, 900220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2978, 900, 2, 0, 900262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2979, 900, 7, 0, 900187, 900188, 900202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2980, 900, 8, 1, 900198, 900199, 900205, 0, 0, 0, 0, 0, 0, 2954, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2981, 900, 8, 2, 900165, 900266, 900267, 0, 0, 0, 0, 0, 0, 2980, 0, 0, 2, 0, 0, 0, 0, 0, 0);
-- Stoneskin (sub-feature F-164K, spell 900164): Earthwarden tier 7 (row 8), column 3. Single-rank defensive CD.
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (2982, 900, 7, 3, 900164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);

