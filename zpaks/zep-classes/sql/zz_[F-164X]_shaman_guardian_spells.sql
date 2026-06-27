-- [F-164X] Enhancement-tree retune - world-side support (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- Shock and Awe proc + debuff red-border display. (Improved Lava Lash and Wolf's Hunger
-- are data-only — no world-side rows.)

-- ============================================================================
-- Shock and Awe (900210/900211/900212) — proc on shock casts
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=2416967680 (Earth/Flame/Frost Shock)
-- ProcFlags=65536 (DONE_SPELL_MAGIC_DMG_CLASS_NEG — shocks are damage_class=1 neg)
-- SpellPhaseMask=1 (CAST) — fires only on initial cast, NOT Flame Shock ticks
-- Chance=100, no ICD (debuff is single-target, refresh-only)
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900210, 900211, 900212);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900210, 0, 11, 2416967680, 0, 0, 65536, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900211, 0, 11, 2416967680, 0, 0, 65536, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900212, 0, 11, 2416967680, 0, 0, 65536, 0, 1, 0, 0, 0, 0, 0, 0, 0);

-- ============================================================================
-- Shock and Awe debuffs (900213/214/215) — force negative display (red border)
-- spell_custom_attr: 0x1000 = SPELL_ATTR0_CU_NEGATIVE_EFF0
-- ============================================================================
DELETE FROM `spell_custom_attr` WHERE `spell_id` IN (900213, 900214, 900215);
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES
(900213, 0x1000),
(900214, 0x1000),
(900215, 0x1000);
