-- [F-164] Shaman Earthwarden spec - spell_bonus_data, spell_threat, spell_proc
-- Rockslam (900119): 25% AP coefficient on physical damage
-- Volcanic Shield triggered damage (900122): 30% SP coefficient
-- Tectonic Blast (900121): 20% AP coefficient on nature damage

-- ============================================================================
-- spell_script_names — C++ SpellScript bindings
-- ============================================================================
DELETE FROM `spell_script_names` WHERE `spell_id` IN (900173, 900170, 900171, 900172);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(900173, 'spell_sha_thunderborne_leap'),
(900170, 'spell_sha_living_guardian_aura'),
(900171, 'spell_sha_living_guardian_aura'),
(900172, 'spell_sha_living_guardian_aura');

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900114, 900116, 900117, 900118, 900119, 900122, 900121, 900166, 900174);

INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900114, 0, 0, 0.10, 0, 'Earthen Reprisal - 10% AP as bonus physical damage'),
(900119, 0, 0, 0.25, 0, 'Rockslam - 25% AP as bonus physical damage'),
(900122, 0.15, 0, 0, 0, 'Volcanic Shield (triggered) - 15% SP as AOE fire damage on block'),
(900121, 0, 0, 0.20, 0, 'Tectonic Blast - 20% AP as bonus nature damage'),
(900166, 0, 0, 0.10, 0, 'Totemic Impact (triggered) - 10% AP as AOE nature + 3.0x threat on any totem summon'),
(900174, 0, 0, 0.20, 0, 'Thunderborne Leap (triggered) - 20% AP as AOE nature damage on landing');
-- NOTE: Living Guardian (900170-900172) SP scaling requires a C++ SpellScript
-- (DoEffectCalcAmount handler), same as PW:S. spell_bonus_data has no effect
-- on SPELL_AURA_SCHOOL_ABSORB auras. Base + ppl scaling works without script.

-- ============================================================================
-- spell_threat - Tectonic Blast high threat multiplier
-- ============================================================================
DELETE FROM `spell_threat` WHERE `entry` IN (900121, 900166);

INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES
(900121, 0, 1.5, 0),
(900166, 0, 3.0, 0);

-- ============================================================================
-- spell_proc - Block-only proc filtering (HitMask=64 = PROC_HIT_BLOCK)
-- Matches Felsteel Shield Spike (29455) pattern
-- ============================================================================
-- 900123/900124 (Improved Volcanic Shield) are passive modifiers, not procs — clean up stale rows
DELETE FROM `spell_proc` WHERE `SpellId` IN (900116, 900123, 900124, 900147, 900148, 900149, 900150, 900151, 900152, 900165, 900167, 900168, 900169, 900181, 900182, 900198, 900199, 900200, 900201);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900116, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0),
-- Bastion of Earth passive — 25% chance on block, no ICD (no stacking)
(900147, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900148, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900149, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
-- Living Guardian — proc only on direct heals received (SpellTypeMask=2 = PROC_SPELL_TYPE_HEAL), 10s ICD
(900167, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 10000, 0),
(900168, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 10000, 0),
(900169, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 10000, 0),
-- Totemic Impact — proc on any totem summon spell, 4 sec ICD
-- SpellFamilyName=11 (Shaman), Mask0=537399320 (all totem family bits, same as Totemic Focus 16173)
-- ProcFlags=87040 = all 4 DONE_SPELL_*_DMG_CLASS flags (POS+NEG, MAGIC+NONE):
--   1024  = PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_POS  (Searing, Call of the Elements)
--   4096  = PROC_FLAG_DONE_SPELL_NONE_DMG_CLASS_NEG
--   16384 = PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS (Magma, Stoneclaw, etc.)
--   65536 = PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_NEG
-- Family mask + SpellFamilyName still constrain to totem summons only.
-- Cooldown=4000ms (4 sec ICD)
(900165, 0, 11, 537399320, 0, 0, 87040, 0, 1, 0, 0, 0, 0, 0, 4000, 0),
-- Improved Rockslam — proc block buff on Rockslam cast
-- SpellFamilyName=11 (Shaman), Mask2=262144 (bit 18, custom Rockslam flag)
(900181, 0, 11, 0, 0, 262144, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900182, 0, 11, 0, 0, 262144, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
-- Bastion of Earth buff — consumed when Lesser Healing Wave is cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=128 (Lesser Healing Wave)
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD)
-- Same pattern as Maelstrom Weapon buff (53817)
(900150, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900151, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900152, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
-- Improved Tectonic Blast (900198/900199) — passive proc on Tectonic Blast cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask1=32768 (Tectonic Blast bit 15)
-- DBC spell_class_mask_2 maps to SpellFamilyFlags[1] / spell_proc.SpellFamilyMask1
-- ProcFlags=256 (DONE_SPELL_RANGED_DMG_CLASS, matches TB damage_class=3)
-- SpellPhaseMask=1 (CAST) — fires reliably even before damage hits
(900198, 0, 11, 0, 32768, 0, 256, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(900199, 0, 11, 0, 32768, 0, 256, 0, 1, 0, 0, 0, 0, 0, 0, 0),
-- Tectonic Resonance buff (900200/900201) — consumed when Earth Shock is cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=1048576 (Earth Shock bit 20)
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD)
-- ProcFlags=81920 = DONE_SPELL_MAGIC_DMG_CLASS_POS+NEG (Earth Shock damage_class=1)
(900200, 0, 11, 1048576, 0, 0, 81920, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900201, 0, 11, 1048576, 0, 0, 81920, 0, 1, 0, 8, 0, 0, 0, 0, 0);

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
