UPDATE spell SET effect_2 = 0, effect_trigger_spell_2 = 0 WHERE id = 16268;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 18848;

UPDATE spell SET spell_desc_enus = 'Gives a chance to parry enemy melee attacks.' WHERE id = 16268;

-- ============================================================================
-- Totemic Recall (36936) - Allow casting in Ghost Wolf form
-- Removes SPELL_ATTR0_NOT_SHAPESHIFTED (0x10000 = 65536)
-- ============================================================================
UPDATE `spell` SET `attributes` = `attributes` & ~65536 WHERE `id` = 36936;

-- ============================================================================
-- Earthen Reprisal (900114) - Reactive melee strike for Shaman
-- Becomes active after blocking, dodging, or parrying (AURA_STATE_DEFENSE).
-- Deals 50% weapon damage + Nature bonus (scales +4/level above 6).
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
    `max_level` = 80,
    `base_level` = 6,
    `spell_level` = 6,
    `range_index` = 2,
    `equipped_item_class` = -1,
    `effect_1` = 31,
    `effect_2` = 2,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_real_points_per_level_2` = '4.0000000000000000',
    `effect_base_points_1` = 49,
    `effect_base_points_2` = 49,
    `effect_implicit_target_a_1` = 6,
    `effect_implicit_target_a_2` = 6,
    `spell_visual_1` = 7660,
    `spell_icon_id` = 5488,
    `spell_name_enus` = 'Earthen Reprisal',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'A strike that becomes active after blocking, dodging, or parrying an opponent''s attack.  This attack deals $s1% weapon damage plus $s2 Nature damage.',
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
    `school_mask` = 8,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0;
