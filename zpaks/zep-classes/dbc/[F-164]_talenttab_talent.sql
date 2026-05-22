-- [F-164] Earthwarden spec: talenttab
-- TalentTab 900 (Earthwarden) + race_mask updates for all tabs
-- Talent entries are in [F-164]_talent.sql (extracted from live DB)
-- ============================================================================

-- ============================================================================
-- TalentTab
-- ============================================================================
DELETE FROM `talenttab` WHERE `id` = 900;
INSERT INTO `talenttab` (`id`, `name_enus`, `name_flags`, `spell_icon`, `race_mask`, `class_mask`, `creature_family`, `order_index`, `background_file`) VALUES (900, 'Earthwarden', 16712190, 4610, 4095, 64, 0, 3, 'ShamanEnhancement');

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

-- Natural Endurance (900109-900113) lives on Earthwarden tree (talent 2905).
-- Previously this file erroneously inserted talent 605 into spec_id=164 (Fury).
-- The Fury collision is cleaned up; Enhancement replacement (if desired) should
-- be added via talent editor at a specific slot.
DELETE FROM `talent` WHERE `id` = 605 AND `spec_id` = 164;
