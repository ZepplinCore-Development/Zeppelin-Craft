-- [F-164D] Earthwarden - Volcanic Shield: spell.dbc rows (split from F-164 [F-164]_spell.sql, 2026-06-26).
-- F-164 remains the PARENT feature and keeps the talent-tree placement (talents 2948/2946)
-- and the Earthwarden skillline (9001) SLA membership (200065/200068/200069/200101).
-- This file owns the Volcanic Shield SPELL definitions + the Glyph of Volcanic Shield.
--
-- Spells:
--   900116  Volcanic Shield (active shield buff)
--   900122  Volcanic Shield eruption (hidden triggered AOE Fire damage + % mana)
--   900123/900124/900125  Improved Volcanic Shield (passive, 3 ranks)
--   900278  Glyph of Volcanic Shield (passive modifier, +20% eruption damage)
--   900279  Glyph of Volcanic Shield (APPLY_GLYPH, clone of stock 55559)
--   900294  Glyph of Volcanic Shield (Inscription CREATE_ITEM recipe -> item 57494)

-- Volcanic Shield scaling (shared between aura buff, triggered spell, and the eruption damage)
SET @vs_dmg_base = 30;

SET @vs_dmg_die = 1;

SET @vs_dmg_perlevel = 5;

SET @vs_spell_level = 30;

SET @vs_base_level = 30;

SET @vs_max_level = 80;

SET @vs_sp_coeff = 0.15;

-- ----------------------------------------------------------------------------
-- Volcanic Shield (900116) - Active shield buff, cloned from Lightning Shield
-- Old ranks 900117/900118 deleted (was 3-rank passive, now 1-rank active)
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` IN (900117, 900118);

DELETE FROM `spell` WHERE `id` = 900116;

INSERT INTO `spell` SET
    `id` = 900116,
    `dispel` = 1,
    `attributes` = 327680,
    `attributes_ex_1` = 1024,
    `attributes_ex_3` = 196608,
    `attributes_ex_4` = 524288,
    `cast_time_index` = 1,
    `proc_flags` = 40,
    `proc_chance` = 100,
    `max_level` = @vs_max_level,
    `base_level` = @vs_base_level,
    `spell_level` = @vs_spell_level,
    `duration_index` = 6,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 42,
    `effect_trigger_spell_1` = 900122,
    `effect_2` = 3,
    `effect_die_sides_2` = @vs_dmg_die,
    `effect_base_points_2` = @vs_dmg_base,
    `effect_real_points_per_level_2` = @vs_dmg_perlevel,
    `spell_visual_1` = 90003,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Surrounds the caster with a shield of volcanic energy. When you block an attack, the shield erupts for $900122s1 Fire damage to all enemies within 8 yards. Only one eruption will fire every few seconds.$?s900125[ Each activation also restores $900125s1% of your maximum mana and $900125s2% of your maximum health.][]$?s900124[ Each activation also restores $900124s1% of your maximum mana and $900124s2% of your maximum health.][]$?s900123[ Each activation also restores $900123s1% of your maximum mana and $900123s2% of your maximum health.][] Lasts $d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Deals $900122s1 Fire damage to all nearby enemies when you block. Only one eruption will fire every few seconds.$?s900125[ Each activation also restores $900125s1% mana and $900125s2% health.][]$?s900124[ Each activation also restores $900124s1% mana and $900124s2% health.][]$?s900123[ Each activation also restores $900123s1% mana and $900123s2% health.][]',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `spell_class_mask_1` = 1024,
    `damage_class` = 1,
    `prevention_type` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 4,
    `effect_bonus_multiplier_1` = 0.267,
    `spell_desc_variable_id` = 0;

-- ----------------------------------------------------------------------------
-- Volcanic Shield Triggered (900122) - AOE Fire damage + % mana regen on block
-- E1: SCHOOL_DAMAGE (effect 2) - 8yd AOE Fire damage around caster, Fire Nova visual.
--     Scales on ARMOR natively (F-188 effect_misc_value_a_1=2 ZEP_STAT_ARMOR, b_1=2 -> 2% armor).
-- E2: ENERGIZE_PCT (effect 137) - base 0% max mana, boosted by Imp VS E1 modifier.
-- E3: HEAL_PCT (effect 136) - base 0% max health, boosted by Imp VS E2 modifier.
--     Both base 0, so plain Volcanic Shield restores nothing; Improved VS feeds them.
-- spell_class_mask_3 = 32768 (bit 15) for modifier targeting by Imp VS / Glyph.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900122;

INSERT INTO `spell` SET
    `id` = 900122,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_die_sides_1` = @vs_dmg_die,
    `effect_base_points_1` = @vs_dmg_base,
    `effect_real_points_per_level_1` = @vs_dmg_perlevel,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_b_1` = 2,
    `effect_implicit_target_a_1` = 22,
    `effect_implicit_target_b_1` = 15,
    `effect_radius_index_1` = 14,
    `effect_2` = 137,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -1,
    `effect_implicit_target_a_2` = 1,
    `effect_3` = 136,
    `effect_die_sides_3` = 1,
    `effect_base_points_3` = -1,
    `effect_implicit_target_a_3` = 1,
    `spell_level` = @vs_spell_level,
    `base_level` = @vs_base_level,
    `max_level` = @vs_max_level,
    `spell_visual_1` = 90001,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Deals $s1 Fire damage to nearby enemies.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 32768,
    `school_mask` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0;

-- Variable 187 (Volcanic Shield tooltip damage) was retired by [F-190] when the
-- VS desc/tooltip moved to stock tokens ($900122s1). DELETE clears any stale row.
DELETE FROM `spelldescriptionvariables` WHERE `id` = 187;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R1 (900123) - mana + health restore on block (no armor)
-- effect_1: ADD_FLAT_MODIFIER op 12 (SPELLMOD_EFFECT2) on eruption 900122's
--   ENERGIZE_PCT (mask_a_3 = 32768) -> +3% max mana per block (= base_1 + 1).
-- effect_2: ADD_FLAT_MODIFIER op 23 (SPELLMOD_EFFECT3) on eruption 900122's
--   HEAL_PCT (mask_b_3 = 32768) -> +1% max health per block (= base_2 + 1).
-- Bonus armor dropped 2026-06-26 (Earthwarden already stacks plenty of armor);
-- mana cut 4/8/12 -> 3/6/9% per the shield-balance pass. % so it scales L40-80.
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900123;

INSERT INTO `spell` SET
    `id` = 900123,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 2,   -- F-164D: Imp VS R1 -> 3% mana (energize% = base+1)
    `effect_base_points_2` = 0,   -- F-164D: Imp VS R1 -> 1% health (heal% = base+1)
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each eruption also restores $s1% of your maximum mana and $s2% of your maximum health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Each Volcanic Shield eruption restores $s1% max mana and $s2% max health.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- ----------------------------------------------------------------------------
-- Improved Volcanic Shield R2 (900124) - +6% mana / +2% health on block
-- ----------------------------------------------------------------------------
DELETE FROM `spell` WHERE `id` = 900124;

INSERT INTO `spell` SET
    `id` = 900124,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 5,   -- F-164D: Imp VS R2 -> 6% mana
    `effect_base_points_2` = 1,   -- F-164D: Imp VS R2 -> 2% health
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each eruption also restores $s1% of your maximum mana and $s2% of your maximum health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Each Volcanic Shield eruption restores $s1% max mana and $s2% max health.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Improved Volcanic Shield R3 (900125) - +9% mana / +3% health on block
DELETE FROM `spell` WHERE `id` = 900125;

INSERT INTO `spell` SET
    `id` = 900125,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_apply_aura_name_2` = 107,
    `effect_base_points_1` = 8,   -- F-164D: Imp VS R3 -> 9% mana
    `effect_base_points_2` = 2,   -- F-164D: Imp VS R3 -> 3% health
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_misc_value_a_1` = 12,
    `effect_misc_value_a_2` = 23,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `effect_spell_class_mask_b_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each eruption also restores $s1% of your maximum mana and $s2% of your maximum health.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Each Volcanic Shield eruption restores $s1% max mana and $s2% max health.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 8;

-- Clean up deleted mana return spell (consolidated into 900122 E2 + modifiers)
DELETE FROM `spell` WHERE `id` = 900126;

-- ============================================================================
-- Glyph of Volcanic Shield
-- ============================================================================
SET @glyph_dmg_pct = 20;             -- +% eruption damage for the Volcanic Shield glyph

-- 900278 Glyph of Volcanic Shield (modifier): +20% eruption damage. Targets the
-- triggered eruption spell 900122 (mask_3 bit 15), NOT the shield buff 900116 -
-- the eruption is where the damage lives.
DELETE FROM `spell` WHERE `id` = 900278;

INSERT INTO `spell` SET
    `id` = 900278,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 108,
    `effect_base_points_1` = @glyph_dmg_pct,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 4610,
    `spell_name_enus` = 'Glyph of Volcanic Shield',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the eruption damage of your Volcanic Shield by 20%.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900279 Glyph of Volcanic Shield (apply) -> glyphproperties 905. Clone of stock 55559.
DELETE FROM `spell` WHERE `id` = 900279;

DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;

CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;

UPDATE `_glyph_apply` SET
    `id` = 900279,
    `spell_name_enus` = 'Glyph of Volcanic Shield',
    `spell_desc_enus` = 'Increases the eruption damage of your Volcanic Shield by 20%.',
    `effect_misc_value_a_1` = 905;

INSERT INTO `spell` SELECT * FROM `_glyph_apply`;

DROP TEMPORARY TABLE `_glyph_apply`;

-- 900294 Glyph of Volcanic Shield (Inscription recipe): CREATE_ITEM -> 57494,
-- reagent 1x Lion's Ink (43116). Learned from any Inscription trainer (SLA 200114).
DELETE FROM `spell` WHERE `id` = 900294;

INSERT INTO `spell` SET
    `id` = 900294,
    `attributes` = 65568,
    `cast_time_index` = 14,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_item_type_1` = 57494,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `reagent_1` = 43116,
    `reagent_count_1` = 1,
    `spell_icon_id` = 2557,
    `spell_name_enus` = 'Glyph of Volcanic Shield',
    `spell_name_flags` = 16712190,
    `school_mask` = 1;
