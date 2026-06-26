-- [F-164A] Earthwarden - Tectonic Blast — spell DBC
-- Sub-feature of F-164 (Earthwarden). F-164 (parent) retains the Earthwarden
-- skillline + talent-tree structure; this file owns the Tectonic Blast family
-- spell definitions.
-- Spells: 900121 Tectonic Blast; 900274/900275 Glyph of Tectonic Blast effect;
--   900165/900266/900267 Totemic Impact + 900166 snare + 900284/900285/900286 Earthen Impact;
--   900198/900199/900205 Improved Tectonic Blast + 900200/900201/900206 Tectonic Resonance.
-- Stock edits: Call of the Elements/Ancestors/Spirits (66842-66844) proc-mask fix.
-- Retired desc vars 188 & 198 cleared here.

-- Glyph damage % — shared constant defined in parent F-164; redefined locally so this
-- file is self-contained when applied on its own.
SET @glyph_dmg_pct = 20;

-- 900274 Glyph of Tectonic Blast (modifier): +20% Tectonic Blast (900121, now
-- mask_3 bit 23 after the Hex deconfliction) damage.
DELETE FROM `spell` WHERE `id` = 900274;

INSERT INTO `spell` SET
    `id` = 900274,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = @glyph_dmg_pct,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 8388608,
    `spell_icon_id` = 5366,
    `spell_name_enus` = 'Glyph of Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the damage of your Tectonic Blast by 20%.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900275 Glyph of Tectonic Blast (apply) -> glyphproperties 903. Clone of stock 55559.
DELETE FROM `spell` WHERE `id` = 900275;

DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;

CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;

UPDATE `_glyph_apply` SET
    `id` = 900275,
    `spell_name_enus` = 'Glyph of Tectonic Blast',
    `spell_desc_enus` = 'Increases the damage of your Tectonic Blast by 20%.',
    `effect_misc_value_a_1` = 903;

INSERT INTO `spell` SELECT * FROM `_glyph_apply`;

DROP TEMPORARY TABLE `_glyph_apply`;

-- ----------------------------------------------------------------------------
-- Tectonic Blast scaling (shared between spell and desc variable 188)
SET @tb_dmg_base = 99;

SET @tb_dmg_die = 1;

SET @tb_dmg_perlevel = 4.0;

SET @tb_base_level = 40;

SET @tb_max_level = 80;

SET @tb_ap_coeff = 0.2;

-- Tectonic Blast (900121) - cloned from Shockwave
-- Cooldown is a personal recovery_time (10s), NOT a category cooldown: the cloned
-- Shockwave category 1201 is shared with Crag Strike (900262/900300-306), so a
-- category_recovery_time on 1201 put Crag Strike on cooldown whenever TB was cast.
-- category=0 + recovery_time=10000 isolates TB's cooldown (matches Rockslam/Rocksurge).
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900121;

INSERT INTO `spell` SET
    `id` = 900121,
    `category` = 0,
    `attributes` = 327696,
    `cast_time_index` = 1,
    `recovery_time` = 10000,
    `aura_interrupt_flags` = 4718592,
    `proc_chance` = 101,
    `max_level` = @tb_max_level,
    `base_level` = @tb_base_level,
    `spell_level` = @tb_base_level,
    `duration_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @tb_dmg_die,
    `effect_die_sides_3` = 1,
    `effect_real_points_per_level_1` = @tb_dmg_perlevel,
    `effect_base_points_1` = @tb_dmg_base,
    `effect_implicit_target_a_1` = 104,
    `effect_radius_index_1` = 17,
    `effect_2` = 6,
    `effect_apply_aura_name_2` = 166,
    `effect_base_points_2` = -11,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 104,
    `effect_radius_index_2` = 17,
    `spell_visual_1` = 90040,
    `spell_icon_id` = 5366,
    `spell_name_enus` = 'Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Sends a wave of force through the ground in front of the caster, causing $s1 Nature damage to all enemies within $a1 yards in a frontal cone. Causes a high amount of threat. Enemies struck have their attack power reduced by $s2% for $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Reduces attack power by $s2% for $d.',
    `spell_tooltip_flags` = 16712190,
    `power_cost_percentage` = 10,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 8388608,
    `damage_class` = 1,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 8,
    `spell_desc_variable_id` = 0;

-- Variable 188: Tectonic Blast tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 188;

-- ============================================================================
-- Call of the Elements / Ancestors / Spirits (66842-66844) — Totemic Impact fix
-- These stock spells have spell_class_set=0, spell_class_mask_1=0, damage_class=0.
-- Totemic Impact proc requires SpellFamilyName=11 + totem family bits + CAST phase
-- with PROC_FLAG_DONE_SPELL_MAGIC_DMG_CLASS_POS (16384).
-- Tag them as Shaman family with a totem summon bit (536870912) so the
-- spell_proc filter (SpellFamilyName=11, SpellFamilyMask0=537399320) matches.
-- Call of the Elements/Ancestors/Spirits summon their button-totems as TRIGGERED
-- casts (SpellEffects::EffectCastButtons). Triggered casts skip the CAST-phase proc
-- but still fire the FINISH-phase proc, so the Totemic Impact proc listens on FINISH
-- (SpellPhaseMask=4 in zz_[F-164]_shaman_guardian_spells.sql) and each summoned totem
-- adds its own Earthen Impact stack -- up to 4 from a full Call. The wrapper Call spell
-- must NOT also proc, or it would add a spurious 5th stack, so its totem family bit
-- (29, 536870912, part of the proc mask 537399320) is cleared back to stock here.
-- ============================================================================
UPDATE `spell` SET
    `spell_class_mask_1` = 0
    WHERE `id` IN (66842, 66843, 66844);

-- ============================================================================
-- Totemic Impact (900165 / 900266 / 900267) — 3-rank passive talent.
-- Procs when ANY totem is summoned (spell_proc: SpellFamilyMask0=537399320, all
-- totem bits, no ICD). Each proc triggers TWO spells:
--   E1 → 900166  : AOE snare pulse (50% slow, 5s) around the shaman
--   E2 → Earthen Impact buff rank (900284/900285/900286): a stacking SPELLMOD that
--        empowers the NEXT Tectonic Blast by +10/15/20% per stack (one stack per
--        totem; Call of the Elements summons up to 4 totems -> up to 4 stacks via its
--        button-totem procs, no script needed). Stacks cap at 4.
-- Replaces the old AOE Nature damage + 3x threat mechanic (900166 repurposed; the
-- 900265 marker and the three C++ scripts were removed).
-- proc flags / family mask / phase all in spell_proc (zz_[F-164]_shaman_guardian_spells.sql).
-- ============================================================================
-- Totemic Impact R1 (900165) — triggers snare 900166 + Earthen Impact R1 (900284)
DELETE FROM `spell` WHERE `id` = 900165;

INSERT INTO `spell` SET
    `id` = 900165,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900166,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900284,
    `proc_chance` = 100,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Summoning a totem sends a shockwave through the ground, slowing the movement of nearby enemies by 50% for 5 sec and granting you Earthen Impact, increasing the damage of your next Tectonic Blast by 10% per stack. Stacks up to 4 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Totem summons slow nearby enemies by 50% and grant Earthen Impact (+10% Tectonic Blast damage per stack, up to 4).',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 0;

-- Totemic Impact R2 (900266) — triggers snare 900166 + Earthen Impact R2 (900285)
DELETE FROM `spell` WHERE `id` = 900266;

INSERT INTO `spell` SET
    `id` = 900266,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900166,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900285,
    `proc_chance` = 100,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Summoning a totem sends a shockwave through the ground, slowing the movement of nearby enemies by 50% for 5 sec and granting you Earthen Impact, increasing the damage of your next Tectonic Blast by 15% per stack. Stacks up to 4 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Totem summons slow nearby enemies by 50% and grant Earthen Impact (+15% Tectonic Blast damage per stack, up to 4).',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 0;

-- Totemic Impact R3 (900267) — triggers snare 900166 + Earthen Impact R3 (900286)
DELETE FROM `spell` WHERE `id` = 900267;

INSERT INTO `spell` SET
    `id` = 900267,
    `attributes` = 464,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900166,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 42,
    `effect_trigger_spell_2` = 900286,
    `proc_chance` = 100,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Summoning a totem sends a shockwave through the ground, slowing the movement of nearby enemies by 50% for 5 sec and granting you Earthen Impact, increasing the damage of your next Tectonic Blast by 20% per stack. Stacks up to 4 times.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Totem summons slow nearby enemies by 50% and grant Earthen Impact (+20% Tectonic Blast damage per stack, up to 4).',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 0;

-- Totemic Impact (900166) — AOE snare pulse, triggered by the passive on totem summon.
-- Repurposed from the old AOE damage spell: now MOD_DECREASE_SPEED (aura 33) -50% for
-- 5 sec, MECHANIC_SNARE, to nearby enemies around the shaman (target_a=22/b=15, 10yd).
-- No damage / no threat / no AP coeff (spell_bonus_data + spell_threat rows removed).
-- Applied once per totem; during Call of the Elements it simply refreshes (harmless).
DELETE FROM `spell` WHERE `id` = 900166;

INSERT INTO `spell` SET
    `id` = 900166,
    `attributes` = 327696,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 28,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -51,
    `effect_apply_aura_name_1` = 33,
    `effect_mechanic_1` = 0,
    `effect_implicit_target_a_1` = 22,
    `effect_implicit_target_b_1` = 15,
    `effect_radius_index_1` = 13,
    `spell_visual_1` = 145,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Totemic Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Slows the movement speed of nearby enemies.',
    `spell_desc_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8,
    `spell_class_set` = 11;

-- ============================================================================
-- Earthen Impact (900284 / 900285 / 900286) — stacking buff applied by Totemic Impact.
-- Aura 108 SPELLMOD_ADD_PCT_MODIFIER, misc 0 (SPELLMOD_DAMAGE), filtered to Tectonic
-- Blast via class mask word 2 (effect_spell_class_mask_c_1 = 8388608, matches TB's
-- spell_class_mask_3). base_points = pct-1 (+1 convention) PER STACK; the core
-- multiplies the effect amount by stack count (SpellAuraEffects.cpp:581) and the buff
-- tooltip $s1 shows the live stacked total. stack_amount=4 cap, 12 sec duration.
-- Consumed when Tectonic Blast is cast (proc_charges=1 + the consume spell_proc):
-- the first Blast spends the whole stacked buff (charge 1 -> 0 removes all stacks).
-- Mirrors the Tectonic Resonance (900200/201/206) -> Earth Shock consume pattern.
-- ============================================================================
-- Earthen Impact R1 (900284) — +10% Tectonic Blast damage per stack
DELETE FROM `spell` WHERE `id` = 900284;

INSERT INTO `spell` SET
    `id` = 900284,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `stack_amount` = 4,
    `duration_index` = 29,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_c_1` = 8388608,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Earthen Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Earthen Impact R2 (900285) — +15% Tectonic Blast damage per stack
DELETE FROM `spell` WHERE `id` = 900285;

INSERT INTO `spell` SET
    `id` = 900285,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `stack_amount` = 4,
    `duration_index` = 29,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_c_1` = 8388608,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Earthen Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Earthen Impact R3 (900286) — +20% Tectonic Blast damage per stack
DELETE FROM `spell` WHERE `id` = 900286;

INSERT INTO `spell` SET
    `id` = 900286,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `stack_amount` = 4,
    `duration_index` = 29,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_c_1` = 8388608,
    `spell_icon_id` = 5312,
    `spell_name_enus` = 'Earthen Impact',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Tectonic Blast deals $s1% additional damage.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Variable 198: Totemic Impact tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 198;

-- [F-190] var 198 retired (desc -> stock tokens); DELETE above clears it

-- ============================================================================
-- Improved Tectonic Blast (900198, 900199, 900205) - Passive talent, 3 ranks
-- After casting Tectonic Blast, gain Tectonic Resonance buff (900200/900201/900206)
-- for 8 sec: next Earth Shock deals +10/20/30% damage and costs 10/20/30% less mana.
-- proc filter: Tectonic Blast cast (SpellFamilyMask2=32768, SpellPhaseMask=1)
-- ProcFlags lives in spell_proc (zz_[F-164]_shaman_guardian_spells.sql)
-- ============================================================================
-- Improved Tectonic Blast R1 (900198) - triggers Tectonic Resonance R1 (900200)
DELETE FROM `spell` WHERE `id` = 900198;

INSERT INTO `spell` SET
    `id` = 900198,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900200,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 15% and reducing its mana cost by 15%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 10%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Improved Tectonic Blast R2 (900199) - triggers Tectonic Resonance R2 (900201)
DELETE FROM `spell` WHERE `id` = 900199;

INSERT INTO `spell` SET
    `id` = 900199,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900201,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 30% and reducing its mana cost by 30%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 20%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Improved Tectonic Blast R3 (900205) - triggers Tectonic Resonance R3 (900206)
DELETE FROM `spell` WHERE `id` = 900205;

INSERT INTO `spell` SET
    `id` = 900205,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_chance` = 100,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900206,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Improved Tectonic Blast',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'After casting Tectonic Blast, you gain Tectonic Resonance, increasing the damage of your next Earth Shock by 45% and reducing its mana cost by 45%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Tectonic Blast empowers your next Earth Shock by 30%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Tectonic Resonance (900200, 900201, 900206) - Buff applied by Improved Tectonic Blast
-- E1 aura 108 misc 0 (SPELLMOD_DAMAGE): +10/20/30% Earth Shock damage.
-- E2 aura 108 misc 14 (SPELLMOD_COST): -10/20/30% Earth Shock mana cost.
-- Both filtered to Earth Shock via class mask (word 1 bit 1048576): E1 a_1, E2 b_1.
-- Consumed when Earth Shock is cast (proc_charges=1, AttributesMask=8 in spell_proc).
-- ============================================================================
-- Tectonic Resonance R1 (900200) - +15% Earth Shock damage / -15% mana, 8 sec
DELETE FROM `spell` WHERE `id` = 900200;

INSERT INTO `spell` SET
    `id` = 900200,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -16,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Tectonic Resonance R2 (900201) - +30% Earth Shock damage / -30% mana, 8 sec
DELETE FROM `spell` WHERE `id` = 900201;

INSERT INTO `spell` SET
    `id` = 900201,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 29,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -31,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- Tectonic Resonance R3 (900206) - +45% Earth Shock damage / -45% mana, 8 sec
DELETE FROM `spell` WHERE `id` = 900206;

INSERT INTO `spell` SET
    `id` = 900206,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `proc_charges` = 1,
    `proc_chance` = 100,
    `duration_index` = 31,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 44,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_spell_class_mask_a_1` = 1048576,
    `effect_2` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -46,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_2` = 14,
    `effect_spell_class_mask_b_1` = 1048576,
    `effect_damage_multiplier_2` = 1.0,
    `spell_icon_id` = 4635,
    `spell_name_enus` = 'Tectonic Resonance',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Your next Earth Shock deals $s1% additional damage and costs $s1% less mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

