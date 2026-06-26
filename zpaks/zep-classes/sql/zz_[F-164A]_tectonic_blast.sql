-- [F-164A] Earthwarden - Tectonic Blast — world-side data
-- Sub-feature of F-164 (Earthwarden). Owns the Tectonic Blast family's
-- spell_proc / spell_bonus_data / spell_threat rows and the orphaned-script purge.
-- Spell DBC definitions live in dbc/[F-164A]_spell.sql.

-- ============================================================================
-- spell_script_names — purge orphaned bindings for now data-driven family spells.
-- Totemic Impact is fully data-driven (old spell_sha_totemic_impact* scripts and the
-- 900265 marker were removed). 900165/900166/66842/66843/66844 are listed here only to
-- clear any stale binding; they are intentionally NOT re-inserted.
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` IN (900165, 900166, 66842, 66843, 66844);

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
-- 900166 (Totemic Impact) is an AOE snare, not damage: no AP coeff. Kept in the DELETE
-- so any stale row is cleared; intentionally NOT re-inserted.
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900121, 900166);

INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900121, 0, 0, 0.20, 0, 'Tectonic Blast - 20% AP as bonus nature damage');

-- ============================================================================
-- spell_threat - Tectonic Blast high threat multiplier
-- ============================================================================
-- 900166 (Totemic Impact) is an AOE snare, not damage: no threat mod. Kept in the
-- DELETE so any stale row is cleared; intentionally NOT re-inserted.
DELETE FROM `spell_threat` WHERE `entry` IN (900121, 900166);

INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES
(900121, 0, 1.5, 0);

-- ============================================================================
-- spell_proc — Tectonic Blast family procs
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900165, 900266, 900267, 900198, 900199, 900205, 900200, 900201, 900206, 900284, 900285, 900286);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
-- Totemic Impact (3 ranks) — proc on any totem summon spell, NO ICD.
-- SpellFamilyName=11 (Shaman), Mask0=537399320 (all totem family bits, same as Totemic Focus 16173)
-- ProcFlags=87040 = all 4 DONE_SPELL_*_DMG_CLASS flags (POS+NEG, MAGIC+NONE):
--   1024  = PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_POS  (Searing, Call of the Elements)
--   4096  = PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_NEG
--   16384 = PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS (Magma, Stoneclaw, etc.)
--   65536 = PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_NEG
-- SpellPhaseMask=4 (PROC_SPELL_PHASE_FINISH), NOT 1 (CAST): Call of the Elements summons its
-- button-totems as TRIGGERED casts, and the CAST-phase proc is gated on !IsTriggered()
-- (Spell.cpp), so triggered totems only reach the FINISH-phase dispatch.
-- AttributesMask=2 (PROC_ATTR_TRIGGERED_CAN_PROC) is REQUIRED: without it, Aura::GetProcEffectMask
-- (SpellAuras.cpp) drops every proc whose triggering spell IsTriggered() BEFORE the phase check,
-- so Call's button-totems never proc and ONLY direct totem casts do (the bug reported in-game).
-- With the bit set, each summoned totem procs once -> a full Call adds up to 4 Earthen Impact
-- stacks (stack_amount=4 caps it) and refreshes the snare. The Call wrapper no longer carries a
-- totem family bit so it doesn't add a spurious extra stack (see [F-164A]_spell.sql).
-- ICD removed (Cooldown=0): each totem adds one stack.
(900165, 0, 11, 537399320, 0, 0, 87040, 0, 4, 0, 2, 0, 0, 0, 0, 0),
(900266, 0, 11, 537399320, 0, 0, 87040, 0, 4, 0, 2, 0, 0, 0, 0, 0),
(900267, 0, 11, 537399320, 0, 0, 87040, 0, 4, 0, 2, 0, 0, 0, 0, 0),
-- Improved Tectonic Blast (900198/900199/900205) — passive proc on Tectonic Blast cast.
-- SpellFamilyName=11 (Shaman), SpellFamilyMask2=8388608 (Tectonic Blast m3 bit 23) — unique to TB.
-- ProcFlags=82176 = DONE_SPELL_MAGIC_DMG_CLASS_POS+NEG (81920) OR'd with DONE_SPELL_RANGED (256).
-- Tectonic Blast is damage_class=1 (MAGIC), so the old ranged-only 256 never matched -> Tectonic
-- Resonance never procced (the "damage_class=3" claim in the old comment was wrong). Mirrors the
-- Earthen Impact proc below, which already hedged with 82176. SpellPhaseMask=1 (CAST).
(900198, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900199, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900205, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 0, 0, 0, 0, 0, 0),
-- Tectonic Resonance buff (900200/900201/900206) — consumed when Earth Shock is cast.
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=1048576 (Earth Shock bit 20).
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD).
-- ProcFlags=81920 = DONE_SPELL_MAGIC_DMG_CLASS_POS+NEG (Earth Shock damage_class=1).
(900200, 0, 11, 1048576, 0, 0, 81920, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900201, 0, 11, 1048576, 0, 0, 81920, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900206, 0, 11, 1048576, 0, 0, 81920, 0, 1, 0, 8, 0, 0, 0, 0, 0),
-- Earthen Impact buff (900284/900285/900286) — consumed when Tectonic Blast is cast.
-- SpellFamilyName=11 (Shaman), SpellFamilyMask2=8388608 (Tectonic Blast m3 bit 23) — TB-only.
-- ProcFlags=82176 = DONE_SPELL_MAGIC_DMG_CLASS_POS+NEG (81920) OR'd with DONE_SPELL_RANGED (256)
-- belt-and-braces vs the TB class-flag ambiguity; family mask keeps it TB-only.
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (REQ_SPELLMOD). proc_charges=1 on the buff removes
-- the whole stacked buff on the first Blast.
(900284, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900285, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900286, 0, 11, 0, 0, 8388608, 82176, 0, 1, 0, 8, 0, 0, 0, 0, 0);
