-- [F-164E] Earthen Reprisal — split from F-164 Shaman Tuning
-- Self-contained sub-feature owning the Earthen Reprisal ability (spell 900114),
-- a reactive melee strike taught by the Shaman trainer at level 6 and listed on
-- the Earthwarden skill line.
--
-- Ownership split (mirrors F-164C/F-164D):
--   This file (F-164E) owns: the spell DBC record 900114, the @er_* scaling
--   vars, and the retired desc-var 197 cleanup.
--   Parent F-164 retains the Earthwarden skillline definition + the skilllineability
--   membership row (SLA 200045 -> [F-164]_skilllineability.sql).
--   World rows: spell_bonus_data -> zz_[F-164E]_earthen_reprisal_spell_bonus.sql,
--               trainer_spell    -> zz_[F-164E]_earthen_reprisal_trainer.sql
-- ============================================================================
-- Earthen Reprisal scaling (shared between spell and desc variable 197)
SET @er_dmg_base = 10;

SET @er_dmg_die = 1;

SET @er_dmg_perlevel = 5.0;

SET @er_base_level = 6;

SET @er_max_level = 80;

SET @er_ap_coeff = 0.1;

-- Earthen Reprisal (900114) - Reactive melee strike for Shaman
-- Becomes active after blocking, dodging, or parrying (AURA_STATE_DEFENSE).
-- E1: Physical damage (base + perlevel + 10% AP via spell_bonus_data)
-- E2: ENERGIZE_PCT - restores 10% max mana
-- Modeled after Warrior Counter (91001, F-154).
-- ============================================================================
DELETE FROM `spell` WHERE `id` = 900114;

INSERT INTO `spell` SET
    `id` = 900114,
    `attributes` = 327696,
    `attributes_ex_1` = 131584,
    `attributes_ex_4` = 512,
    `facing_caster_flags` = 1,
    `caster_aura_state` = 1,
    `cast_time_index` = 1,
    `recovery_time` = 6000,
    `proc_chance` = 101,
    `max_level` = @er_max_level,
    `base_level` = @er_base_level,
    `spell_level` = @er_base_level,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `effect_1` = 2,
    `effect_2` = 137,
    `effect_die_sides_1` = @er_dmg_die,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_1` = @er_dmg_perlevel,
    `effect_base_points_1` = @er_dmg_base,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 1,
    `spell_visual_1` = 1165,
    `spell_icon_id` = 5488,
    `spell_name_enus` = 'Earthen Reprisal',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after blocking, dodging, or parrying an opponent''s attack. Deals $s1 damage and restores $s2% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `spell_class_set` = 11,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `school_mask` = 1,
    `spell_desc_variable_id` = 0;

-- Variable 197: Earthen Reprisal tooltip damage (base + per-level + AP scaling)
DELETE FROM `spelldescriptionvariables` WHERE `id` = 197;

-- [F-190] var 197 retired (desc -> stock tokens); DELETE above clears it
