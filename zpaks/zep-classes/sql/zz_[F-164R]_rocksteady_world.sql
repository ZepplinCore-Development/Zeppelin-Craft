-- [F-164R] Rocksteady Family - world DB rows (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- spell_script_names (C++ bindings), spell_bonus_data (Rocksurge AP coeff), spell_proc
-- (Rocksteady buff consume-on-block, talent proc, Improved Rockslam proc).
-- DELETEs are scoped to exactly this feature's spell IDs so nothing else is clobbered.

-- ============================================================================
-- spell_script_names — C++ SpellScript bindings
-- ----------------------------------------------------------------------------
-- DELETE covers deprecated IDs (900119 old spell_sha_rockslam, 900120/900180 block
-- buffs, 900263 any old spell_sha_rocksurge) so stale bindings are purged.
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` IN (900119, 900120, 900180, 900181, 900182, 900223, 900256, 900257, 900258, 900259, 900260, 900261, 900263);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
-- Rockwall: instant CD that adds 5 Rocksteady stacks
(900223, 'spell_sha_rockwall'),
-- Rocksteady shared block buff: +5% block per stack, consume a stack on block
(900261, 'spell_sha_rocksteady_block'),
-- Stack generators: add stacks of Rocksteady on proc (Improved Rockslam R2 +2, all others +1)
(900181, 'spell_sha_rocksteady_stack_proc'),
(900182, 'spell_sha_rocksteady_stack_proc'),
(900256, 'spell_sha_rocksteady_stack_proc'),
(900257, 'spell_sha_rocksteady_stack_proc'),
(900258, 'spell_sha_rocksteady_stack_proc'),
(900259, 'spell_sha_rocksteady_stack_proc'),
(900260, 'spell_sha_rocksteady_stack_proc');
-- Rockslam (900119): block-value scaling is native (F-188 effect_misc_value_b_1) — no script.
-- Rocksurge (900263): no script — scales via the SPELLMOD_DAMAGE effect on the Rocksteady buff.
-- 900119/900263 stay in the DELETE above so any old binding is cleaned up.
-- 900120/900180 deprecated (superseded by 900261); bindings removed.

-- ============================================================================
-- spell_bonus_data — Rocksurge AP coefficient
-- ----------------------------------------------------------------------------
-- Rockslam (900119) intentionally has NO row: AP scaling removed (double-dipped with
-- shield block value); block value is added natively (F-188). Kept in the DELETE so any
-- stale row is cleared. Do NOT re-add a 0/0 row unless effect_bonus_multiplier_1 is also
-- 0, or the coeff falls back to BonusMultiplier (SP scaling).
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900119, 900263);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900263, 0, 0, 0.25, 0, 'Rocksurge - 25% AP as bonus physical damage (Rocksteady spender)');

-- ============================================================================
-- spell_proc
-- ----------------------------------------------------------------------------
-- Rocksteady buff (900261) — consume a stack on each block (ProcFlags=40
--   TAKEN_MELEE_AUTO 0x8 + TAKEN_SPELL_MELEE_DMG_CLASS 0x20, HitMask=64 PROC_HIT_BLOCK),
--   no ICD. DBC proc_flags=0, so ProcFlags MUST be set here or it never procs.
-- Rocksteady talent (900256-900260) — chance on melee hit dealt (ProcFlags=4
--   DONE_MELEE_AUTO_ATTACK) to add a stack; Chance = 2/4/6/8/10% per rank.
-- Improved Rockslam (900181/900182) — proc on Rockslam hit (SpellFamilyName=11 Shaman,
--   Mask2=262144 Rockslam flag, SpellPhaseMask=2 HIT) to add the Rocksteady stack.
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900120, 900180, 900181, 900182, 900223, 900256, 900257, 900258, 900259, 900260, 900261);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900261, 0, 0, 0, 0, 0, 40, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900256, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 2, 0, 0),
(900257, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(900258, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(900259, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 8, 0, 0),
(900260, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 10, 0, 0),
(900181, 0, 11, 0, 0, 262144, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0),
(900182, 0, 11, 0, 0, 262144, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0);
-- 900120/900180 deprecated (superseded by 900261); proc rows removed via the DELETE.
