-- [F-164] Shaman Earthwarden spec - spell_bonus_data, spell_threat, spell_proc
-- Rockslam (900119): no AP/SP coefficient - scales only off shield block value (native F-188 effect_misc_value_b_1)
-- Volcanic Shield triggered damage (900122): 30% SP coefficient
-- Tectonic Blast (900121): 20% AP coefficient on nature damage

-- ============================================================================
-- spell_script_names — C++ SpellScript bindings
-- ============================================================================
-- 900224 kept in this DELETE to purge the orphaned old binding (spell_sha_stoneguard_totem,
-- the retired custom totem); it is intentionally NOT re-inserted below.
DELETE FROM `spell_script_names` WHERE `spell_id` IN (900170, 900167, 900168, 900169, 900171, 900172, 900224, 5730, 6390, 6391, 6392, 10427, 10428, 25525, 58580, 58581, 58582, 900226);  -- Rocksteady IDs (900119/900120/900180/900181/900182/900223/900256-900260/900261/900263) -> zz_[F-164R]_rocksteady_world.sql
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
-- (Thunderborne Leap 900173 spell_sha_thunderborne_leap binding moved to zz_[F-164T]_thunderborne_leap.sql)
(900170, 'spell_sha_living_guardian_aura'),
-- Living Guardian heal-only filtering is data-driven (spell_proc SpellTypeMask=2 +
-- SpellPhaseMask=2 on all 5 ranks); no proc-filter script needed.
-- Stonebond: attach to every stock Stoneclaw summon rank. AfterCast grabs the
-- just-summoned earth totem; only activates when the talent marker (900225) is up.
(5730,  'spell_sha_stonebond'),
(6390,  'spell_sha_stonebond'),
(6391,  'spell_sha_stonebond'),
(6392,  'spell_sha_stonebond'),
(10427, 'spell_sha_stonebond'),
(10428, 'spell_sha_stonebond'),
(25525, 'spell_sha_stonebond'),
(58580, 'spell_sha_stonebond'),
(58581, 'spell_sha_stonebond'),
(58582, 'spell_sha_stonebond'),
-- Stonebond pulse driver (900226): re-casts the split (900222) on the owner each tick
(900226, 'spell_sha_stonebond_pulse');
-- (Rocksteady family C++ bindings — Rockwall 900223 = spell_sha_rockwall,
--  Rocksteady 900261 = spell_sha_rocksteady_block, stack proc 900181/900182/
--  900256-900260 = spell_sha_rocksteady_stack_proc — moved to zz_[F-164R]_rocksteady_world.sql)
-- [F-164A] Totemic Impact script purge (900165/900166/66842/66843/66844) moved to
-- zz_[F-164A]_tectonic_blast.sql (Totemic Impact is fully data-driven; old scripts removed).
-- 900180/900120 deprecated (superseded by the unified Rocksteady buff 900261); bindings removed.

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900114, 900117, 900118, 900262);  -- 900116/900122 (Volcanic Shield) -> zz_[F-164D]_; 900119/900263 (Rockslam/Rocksurge) -> zz_[F-164R]_rocksteady_world.sql

INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900114, 0, 0, 0.10, 0, 'Earthen Reprisal - 10% AP as bonus physical damage');
-- Rockslam (900119) intentionally has NO spell_bonus_data row: AP scaling removed (double-dipped with shield block value). Block value is added natively (F-188 effect_misc_value_b_1). Kept in the DELETE above so any stale row is cleared. Do NOT re-add a row with ap_bonus=0 and direct_bonus=0 unless effect_bonus_multiplier_1 is also 0, or coeff falls back to BonusMultiplier (SP scaling).
-- Crag Strike (900262): AP scaling migrated to F-188 native (effect_misc_value_a_1=3 ZEP_STAT_ATTACK_POWER, b_1=15 -> 15% AP), so the addon/calculator reads it from the DBC. No spell_bonus_data row; effect_bonus_multiplier_1=0 so the coeff can't fall back to SP. Kept in the DELETE above.
-- (Rocksurge 900263 spell_bonus_data moved to zz_[F-164R]_rocksteady_world.sql)
-- Volcanic Shield eruption (900122): SP scaling REMOVED — now scales on ARMOR natively
-- (F-188 effect_misc_value_a_1=2 ZEP_STAT_ARMOR, b_1=2 -> 2% of armor). No spell_bonus_data
-- row; effect_bonus_multiplier_1=0 so the coeff can't fall back to SP. Kept in the DELETE above.
-- [F-164A] Tectonic Blast (900121) spell_bonus_data + Totemic Impact snare (900166) cleanup
-- moved to zz_[F-164A]_tectonic_blast.sql.
-- (Thunderborne Leap impact 900174 spell_bonus_data moved to zz_[F-164T]_thunderborne_leap.sql)
-- NOTE: Living Guardian (900170) SP scaling requires a C++ SpellScript
-- (DoEffectCalcAmount handler), same as PW:S. spell_bonus_data has no effect
-- on SPELL_AURA_SCHOOL_ABSORB auras. Base + ppl scaling works without script.

-- [F-164A] spell_threat (Tectonic Blast 900121 high-threat multiplier + Totemic Impact
-- snare 900166 cleanup) moved to zz_[F-164A]_tectonic_blast.sql.

-- ============================================================================
-- spell_proc - Block-only proc filtering (HitMask=64 = PROC_HIT_BLOCK)
-- Matches Felsteel Shield Spike (29455) pattern
-- ============================================================================
-- 900123/900124 (Improved Volcanic Shield) are passive modifiers, not procs — clean up stale rows
DELETE FROM `spell_proc` WHERE `SpellId` IN (900147, 900148, 900149, 900150, 900151, 900152, 900167, 900168, 900169, 900171, 900172);  -- 900116/900123/900124 (Volcanic Shield) -> zz_[F-164D]_; Rocksteady procs (900120/900180/900181/900182/900223/900256-900260/900261) -> zz_[F-164R]_rocksteady_world.sql

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
-- (900116 Volcanic Shield block-proc moved to zz_[F-164D]_shaman_guardian_spells.sql)
-- Bastion of Earth passive — chance on block (Chance=0 => uses DBC proc_chance
-- 15/25/35 per rank), no ICD (no stacking)
(900147, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900148, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900149, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
-- (Rocksteady buff 900261 + talent 900256-900260 proc rows moved to zz_[F-164R]_rocksteady_world.sql)
-- 900180/900120 deprecated (superseded by 900261); proc rows removed.
-- Living Guardian (all 5 ranks) — proc only on direct heals received.
-- SpellTypeMask=2 (PROC_SPELL_TYPE_HEAL) + SpellPhaseMask=2 (PROC_SPELL_PHASE_HIT), 10s ICD.
-- SpellPhaseMask=2 is REQUIRED: at CAST/FINISH phase AC forces spellTypeMask=MASK_ALL
-- (Unit.cpp), so a 0 phase let self-cast positive buffs (Rockbiter, Ghost Wolf) slip
-- past the HEAL filter. Restricting to the HIT phase classifies by real heal info.
-- Ranks 4-5 (900171/900172) previously had no spell_proc row at all (no filter).
-- Defense-in-depth: spell_sha_living_guardian_proc CheckProc also requires an actual heal.
(900167, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0),
(900168, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0),
(900169, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 10000, 0),
-- Living Guardian reduced to 3 ranks; old R4/R5 (900171/900172) removed.
-- [F-164A] Totemic Impact proc rows (900165/900266/900267) moved to zz_[F-164A]_tectonic_blast.sql.
-- (Improved Rockslam 900181/900182 proc rows moved to zz_[F-164R]_rocksteady_world.sql)
-- Bastion of Earth buff — consumed when Lesser Healing Wave is cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=128 (Lesser Healing Wave)
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD)
-- Same pattern as Maelstrom Weapon buff (53817)
(900150, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900151, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900152, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0);
-- [F-164A] Improved Tectonic Blast (900198/900199/900205), Tectonic Resonance
-- (900200/900201/900206), and Earthen Impact (900284/900285/900286) proc rows moved to
-- zz_[F-164A]_tectonic_blast.sql.

-- ============================================================================
-- Spirit Communion — consume Spirited buff when active is cast
-- spell_linked_spell: casting 900185 removes aura 900184
-- ============================================================================
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 900185 AND `spell_effect` = -900184;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900185, -900184, 0, 'Spirit Communion: remove Spirited buff on cast');

-- Spirit Communion — auto-teach passive (900183) when active (900185) is learned
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 900185 AND `spell_effect` = 900183 AND `type` = 2;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900185, 900183, 2, 'Spirit Communion: learn passive on-kill proc when active is learned');

-- ============================================================================
-- Living Guardian — apply cooldown debuff when shield triggers
-- spell_linked_spell: shield buff (900170/171/172) applies debuff (900186)
-- ============================================================================
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (900170, 900171, 900172) AND `spell_effect` = 900186;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900170, 900186, 0, 'Living Guardian: apply cooldown debuff when shield triggers');

-- ============================================================================
-- Living Guardian debuff — force negative display (red border)
-- spell_custom_attr: 0x1000 = SPELL_ATTR0_CU_NEGATIVE_EFF0
-- ============================================================================
DELETE FROM `spell_custom_attr` WHERE `spell_id` = 900186;
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES
(900186, 0x1000);

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
-- Splinter Armor (900264 + ranks) red-border display moved to zz_[F-164B]_shaman_guardian_spells.sql.

-- spell_group — Splinter Armor (900264 + ranks) "Major Armor Debuffs" (1015) membership
-- moved to zz_[F-164B]_shaman_guardian_spells.sql.
