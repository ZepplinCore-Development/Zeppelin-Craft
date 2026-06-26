-- [F-164T] Earthwarden - Thunderborne Leap — spell DBC
-- Sub-feature of F-164 (Earthwarden). Parent F-164 keeps the Earthwarden skillline
-- + talent-tree structure; this file owns the Thunderborne Leap spell definitions.
-- Spells: 900173 (cast), 900174 (impact AoE stun+damage), 900282/900283 (Glyph of
-- Thunderborne Leap effect). Retired desc var 194 cleared here.

-- Thunderborne Leap damage scaling (shared between triggered spell, cast dummy, and desc variable 194)
SET @tbl_dmg_base = 99;

SET @tbl_dmg_die = 1;

SET @tbl_dmg_perlevel = 3;

SET @tbl_spell_level = 40;

SET @tbl_base_level = 40;

SET @tbl_max_level = 80;

SET @tbl_ap_coeff = 0.2;

-- ============================================================================
-- Thunderborne Leap (900173) — cast spell
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900173;

INSERT INTO `spell` SET
    `id` = 900173,
    `category` = 1211,
    `attributes` = 327696,
    `attributes_ex_1` = 32768,
    `attributes_ex_2` = 4,
    `attributes_ex_6` = 1088,
    `cast_time_index` = 1,
    `category_recovery_time` = 20000,
    `proc_chance` = 101,
    `base_level` = @tbl_base_level,
    `spell_level` = @tbl_spell_level,
    `max_level` = @tbl_max_level,
    `duration_index` = 39,
    `power_cost_percentage` = 10,
    `range_index` = 95,
    `equipped_item_class` = -1,
    `effect_1` = 42,
    `effect_implicit_target_a_1` = 53,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_b_1` = 75,
    `effect_multiple_value_1` = 4.0,
    `spell_visual_1` = 8251,
    `spell_icon_id` = 5364,
    `active_icon_id` = 5364,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Leap to a targeted location, slamming down on all enemies within $900174a1 yards, causing $900174s2 Nature damage and stunning them for $900174d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_desc_variable_id` = 0,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

-- ============================================================================
-- Thunderborne Leap Impact (900174) — hidden triggered AoE
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900174;

INSERT INTO `spell` SET
    `id` = 900174,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `attributes_ex_2` = 4,
    `attributes_ex_3` = 268435968,
    `mechanic` = 12,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `base_level` = @tbl_base_level,
    `spell_level` = @tbl_spell_level,
    `max_level` = @tbl_max_level,
    `duration_index` = 39,
    `power_type` = 1,
    `range_index` = 13,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 2,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = @tbl_dmg_die,
    `effect_base_points_1` = -1,
    `effect_base_points_2` = @tbl_dmg_base,
    `effect_real_points_per_level_2` = @tbl_dmg_perlevel,
    `effect_mechanic_1` = 0,
    `effect_implicit_target_a_1` = 15,
    `effect_implicit_target_a_2` = 15,
    `effect_radius_index_1` = 14,
    `effect_radius_index_2` = 14,
    `effect_apply_aura_name_1` = 12,
    `spell_visual_1` = 90041,
    `spell_icon_id` = 5364,
    `active_icon_id` = 5364,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_enus` = 'Leap to a targeted location, slamming down on all enemies within $900174a1 yards, dealing $900174s2 Nature damage and stunning them for $900174d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Stunned.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_3` = 4194304,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 8;

-- Variable 194: Thunderborne Leap tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 194;

-- [F-190] var 194 retired (desc -> stock tokens); DELETE above clears it

-- Glyph of Thunderborne Leap: +1s stun duration. @glyph_tbl_stun is shared in
-- parent F-164; redefined locally so this file is self-contained.
SET @glyph_tbl_stun = 1000;

-- 900282 Glyph of Thunderborne Leap (modifier): +1 sec stun duration. Targets the
-- triggered landing stun 900174 (mask_3 bit 22), NOT the leap 900173 - the stun is
-- where the duration lives. Flat duration modifier in ms (2s -> 3s).
DELETE FROM `spell` WHERE `id` = 900282;

INSERT INTO `spell` SET
    `id` = 900282,
    `attributes` = 64,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 1,
    `effect_base_points_1` = @glyph_tbl_stun,
    `effect_implicit_target_a_1` = 1,
    `effect_spell_class_mask_a_3` = 4194304,
    `spell_icon_id` = 5364,
    `spell_name_enus` = 'Glyph of Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_desc_enus` = 'Increases the stun duration of your Thunderborne Leap by 1 sec.',
    `spell_desc_flags` = 16712190,
    `spell_class_set` = 11,
    `school_mask` = 1;

-- 900283 Glyph of Thunderborne Leap (apply) -> glyphproperties 907. Clone of stock 55559.
DELETE FROM `spell` WHERE `id` = 900283;

DROP TEMPORARY TABLE IF EXISTS `_glyph_apply`;

CREATE TEMPORARY TABLE `_glyph_apply` AS SELECT * FROM `spell` WHERE `id` = 55559;

UPDATE `_glyph_apply` SET
    `id` = 900283,
    `spell_name_enus` = 'Glyph of Thunderborne Leap',
    `spell_desc_enus` = 'Increases the stun duration of your Thunderborne Leap by 1 sec.',
    `effect_misc_value_a_1` = 907;

INSERT INTO `spell` SELECT * FROM `_glyph_apply`;

DROP TEMPORARY TABLE `_glyph_apply`;
