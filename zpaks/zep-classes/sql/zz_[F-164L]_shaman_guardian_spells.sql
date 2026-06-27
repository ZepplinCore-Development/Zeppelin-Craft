-- [F-164L] Living Guardian - world-side support (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- The C++ SpellScript SOURCE (spell_sha_living_guardian_aura) stays in core patch 0017;
-- the binding row below is data and moves with this feature.

-- ============================================================================
-- spell_script_names — C++ SpellScript binding
-- 900171/900172 kept in the DELETE to purge old retired-rank bindings.
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` IN (900170, 900167, 900168, 900169, 900171, 900172);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(900170, 'spell_sha_living_guardian_aura');
-- Living Guardian heal-only filtering is data-driven (spell_proc SpellTypeMask=2 +
-- SpellPhaseMask=2 on all 3 ranks); no proc-filter script needed.

-- ============================================================================
-- spell_proc — proc only on direct heals received.
-- SpellTypeMask=2 (PROC_SPELL_TYPE_HEAL) + SpellPhaseMask=2 (PROC_SPELL_PHASE_HIT), 10s ICD.
-- SpellPhaseMask=2 is REQUIRED: at CAST/FINISH phase AC forces spellTypeMask=MASK_ALL
-- (Unit.cpp), so a 0 phase let self-cast positive buffs slip past the HEAL filter.
-- 900171/900172 kept in DELETE to purge old retired-rank rows.
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900167, 900168, 900169, 900171, 900172);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900167, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0),
(900168, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0),
(900169, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0);

-- ============================================================================
-- spell_linked_spell — shield buff (900170) applies cooldown debuff (900186)
-- ============================================================================
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (900170, 900171, 900172) AND `spell_effect` = 900186;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900170, 900186, 0, 'Living Guardian: apply cooldown debuff when shield triggers');

-- ============================================================================
-- spell_custom_attr — cooldown debuff (900186) forces negative display (red border)
-- 0x1000 = SPELL_ATTR0_CU_NEGATIVE_EFF0
-- ============================================================================
DELETE FROM `spell_custom_attr` WHERE `spell_id` = 900186;
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES
(900186, 0x1000);
