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
-- spell_group - Splinter Armor is NOT in "Major Armor Debuffs" (group 1015).
-- I-383: 1015 is stack_rule 3 (EXCLUSIVE_SAME_EFFECT). AC guesses the group's aura
-- type from its members' majority aura = 101 MOD_RESISTANCE_PCT (Sunder 58567, Expose
-- 8647, Acid Spit 55749); Splinter Armor is aura 22 MOD_RESISTANCE (flat), so the
-- same-effect check never matched it - membership was inert and logged "does not
-- share aura assigned for group 1015". Ranks 900310-900316 were also listed, which
-- LoadSpellGroups rejects ("not first rank": spell_group takes the chain head only).
-- Exclusivity with Sunder would need Splinter Armor moved to aura 101 (design call).
-- The DELETE stays to purge the old rows.
-- ============================================================================
DELETE FROM `spell_group` WHERE `id` = 1015 AND `spell_id` IN (900264, 900310, 900311, 900312, 900313, 900314, 900315, 900316);
