-- [F-164] Earthwarden spec: talenttab
-- TalentTab 900 (Earthwarden) + race_mask updates for all tabs
-- Talent entries are in [F-164]_talent.sql (extracted from live DB)
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

-- Talent 605: Natural Endurance (replaces Improved Ghost Wolf)
DELETE FROM `talent` WHERE `id` = 605;
INSERT INTO `talent` (`id`, `spec_id`, `tier_id`, `column_index`, `rank_1`, `rank_2`, `rank_3`, `rank_4`, `rank_5`, `rank_6`, `rank_7`, `rank_8`, `rank_9`, `pre_req_talent_1`, `pre_req_talent_2`, `pre_req_talent_3`, `pre_req_rank_1`, `pre_req_rank_2`, `pre_req_rank_3`, `flags`, `req_spell_id`, `allow_for_pet_flags_1`, `allow_for_pet_flags_2`) VALUES (605, 164, 1, 0, 900109, 900110, 900111, 900112, 900113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
