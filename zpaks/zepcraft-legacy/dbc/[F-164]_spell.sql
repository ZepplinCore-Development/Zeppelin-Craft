UPDATE spell SET spell_visual_1 = 145 WHERE id = 900166;

UPDATE spell SET spell_visual_1 = 11302 WHERE id = 900166;

UPDATE spell SET proc_flags = 16384 WHERE id = 900165;

UPDATE spell SET spell_visual_1 = 145 WHERE id = 900166;

DELETE FROM `spell` WHERE `id` = 900173;

INSERT INTO `spell` SET
    `id` = 900173,
    `category` = 1211,
    `attributes` = 327696,
    `attributes_ex_1` = 32768,
    `attributes_ex_2` = 4,
    `attributes_ex_6` = 1088,
    `targets` = 64,
    `cast_time_index` = 1,
    `category_recovery_time` = 45000,
    `proc_chance` = 101,
    `base_level` = 60,
    `spell_level` = 60,
    `duration_index` = 407,
    `power_type` = 1,
    `power_cost` = 150,
    `range_index` = 95,
    `equipped_item_class` = -1,
    `effect_1` = 42,
    `effect_2` = 64,
    `effect_3` = 6,
    `effect_die_sides_2` = 1,
    `effect_base_points_2` = -1,
    `effect_implicit_target_a_1` = 89,
    `effect_implicit_target_a_2` = 87,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 77,
    `effect_multiple_value_1` = 4.0,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_3` = 7,
    `effect_misc_value_b_1` = 75,
    `effect_trigger_spell_2` = 52174,
    `spell_visual_1` = 29,
    `spell_icon_id` = 3149,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Leap through the air and slam down on all enemies within $52174a1 yards of the target area, causing $52174s3% weapon damage and stunning them for $52174d.  This ability will remove any Immobilzation effects when used.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `start_recovery_category` = 133,
    `start_recovery_time` = 1500,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `spell_missile_id` = 621;

DELETE FROM `spell` WHERE `id` = 900174;

INSERT INTO `spell` SET
    `id` = 900174,
    `attributes` = 327696,
    `attributes_ex_2` = 4,
    `attributes_ex_3` = 512,
    `targets` = 64,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `base_level` = 60,
    `spell_level` = 60,
    `duration_index` = 39,
    `power_type` = 1,
    `range_index` = 13,
    `speed` = 28.0,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 121,
    `effect_3` = 31,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -1,
    `effect_base_points_2` = -1,
    `effect_base_points_3` = 49,
    `effect_mechanic_1` = 11,
    `effect_implicit_target_a_1` = 16,
    `effect_implicit_target_a_2` = 16,
    `effect_implicit_target_a_3` = 16,
    `effect_radius_index_1` = 8,
    `effect_radius_index_2` = 8,
    `effect_radius_index_3` = 8,
    `effect_apply_aura_name_1` = 12,
    `spell_visual_1` = 11441,
    `spell_icon_id` = 3149,
    `spell_priority` = 50,
    `spell_name_enus` = 'Thunderborne Leap',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_enus` = 'Leap through the air and slam down on all enemies within $52174a1 yards of the target area, causing $52174s3% weapon damage and stunning them for $52174d.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Stunned.',
    `spell_tooltip_flags` = 16712190,
    `damage_class` = 2,
    `prevention_type` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

UPDATE spell SET power_type = 0, power_cost = 0, power_cost_percentage = 10, effect_trigger_spell_2 = 900174, school_mask = 8, spell_class_set = 11, stances = 0, spell_desc_enus = 'Leap through the air and slam down on all enemies within $900174a1 yards of the target area, causing Nature damage and stunning them for $900174d.' WHERE id = 900173;

UPDATE spell SET school_mask = 8, spell_class_set = 11, effect_2 = 2, effect_3 = 0, effect_base_points_2 = 99, effect_base_points_3 = 0, effect_real_points_per_level_2 = 3.0, effect_die_sides_2 = 1, effect_die_sides_3 = 0, effect_mechanic_1 = 11, effect_implicit_target_a_3 = 0, effect_radius_index_3 = 0, attributes_ex_1 = 1024, attributes_ex_3 = 268436224, base_level = 40, spell_level = 40, max_level = 80, spell_desc_enus = 'Leap through the air and slam down on all enemies within $900174a1 yards of the target area, dealing $900174s2 Nature damage and stunning them for $900174d.' WHERE id = 900174;

UPDATE spell SET spell_icon_id = 5364, active_icon_id = 5364, spell_desc_variable_id = 194, spell_desc_enus = 'Leap through the air and slam down on all enemies within $900174a2 yards of the target area, causing $<total> Nature damage and stunning them for $900174d.' WHERE id = 900173;

UPDATE spell SET spell_icon_id = 5364, active_icon_id = 5364, spell_visual_1 = 10703 WHERE id = 900174;
