-- [F-164B] Crag Strike support rows (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- Covers the target-side debuff, Splinter Armor (900264 + ranks 900310-900316). The
-- self-side Crag Plating buff (900320-900327) needs no support rows (plain MOD_RESISTANCE).
-- Crag Strike (900262 + ranks) carries native F-188 AP scaling (effect_misc_value_a_1=3,
-- b_1=22) so it needs NO spell_bonus_data row; effect_bonus_multiplier_1=0 stops any SP
-- fallback. (The 900262 defensive DELETE stays in [F-164]'s spell_bonus_data cleanup.)

-- ============================================================================
-- Splinter Armor (900264, 900310-900316) - force red/negative display (red border)
-- spell_custom_attr 0x1000 = SPELL_ATTR0_CU_NEGATIVE_EFF0. Applied to every rank
-- (F-164 only flagged R1 900264 - extended here so higher ranks also read as a debuff).
-- ============================================================================
DELETE FROM `spell_custom_attr` WHERE `spell_id` IN (900264, 900310, 900311, 900312, 900313, 900314, 900315, 900316);
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES
(900264, 0x1000),
(900310, 0x1000),
(900311, 0x1000),
(900312, 0x1000),
(900313, 0x1000),
(900314, 0x1000),
(900315, 0x1000),
(900316, 0x1000);

-- ============================================================================
-- spell_group - Splinter Armor joins "Major Armor Debuffs" (group 1015,
-- stack_rule 3 EXCLUSIVE_SAME_EFFECT) so it does NOT stack with Sunder/Expose
-- (all use aura 22 MOD_RESISTANCE flat armor; only the strongest applies). A player
-- only ever has one rank of Splinter Armor, so listing all ranks is harmless.
-- ============================================================================
DELETE FROM `spell_group` WHERE `id` = 1015 AND `spell_id` IN (900264, 900310, 900311, 900312, 900313, 900314, 900315, 900316);
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1015, 900264),
(1015, 900310),
(1015, 900311),
(1015, 900312),
(1015, 900313),
(1015, 900314),
(1015, 900315),
(1015, 900316);
