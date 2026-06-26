-- [F-164D] Volcanic Shield - spell_bonus_data + spell_proc (split from F-164
-- zz_[F-164]_shaman_guardian_spells.sql).

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
-- Volcanic Shield buff (900116) and eruption (900122) intentionally have NO
-- spell_bonus_data row: the eruption now scales on ARMOR natively (F-188
-- effect_misc_value_a_1=2 ZEP_STAT_ARMOR, b_1=2 -> 2% of armor), with
-- effect_bonus_multiplier_1=0 so the coeff can't fall back to SP. Both IDs are
-- kept in this DELETE so any stale row is cleared.
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900116, 900122);

-- ============================================================================
-- spell_proc - Block-only proc filtering (HitMask=64 = PROC_HIT_BLOCK)
-- Volcanic Shield (900116) erupts only on a block. Matches Felsteel Shield Spike (29455).
-- 900123/900124 (Improved Volcanic Shield) are passive modifiers, not procs — kept in
-- the DELETE only so any stale rows are cleared.
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900116, 900123, 900124);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900116, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0);
