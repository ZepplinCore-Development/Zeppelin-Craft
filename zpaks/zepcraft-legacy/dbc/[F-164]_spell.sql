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
    `effect_implicit_target_a_1` = 28,
    `effect_implicit_target_a_2` = 87,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_3` = 77,
    `effect_multiple_value_1` = 4.0,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_3` = 7,
    `effect_misc_value_b_1` = 75,
    `effect_trigger_spell_2` = 52174,
    `spell_visual_1` = 8251,
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

UPDATE spell SET spell_icon_id = 5364, active_icon_id = 5364, spell_visual_1 = 0 WHERE id = 900174;

UPDATE spell SET effect_radius_index_1 = 14 WHERE id = 900173;
UPDATE spell SET effect_radius_index_1 = 14, effect_radius_index_2 = 14 WHERE id = 900174;

DELETE FROM `spell` WHERE `id` = 900175;

INSERT INTO `spell` SET
    `id` = 900175,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 1,
    `effect_base_points_2` = -7,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 52,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900176;

INSERT INTO `spell` SET
    `id` = 900176,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 3,
    `effect_base_points_2` = -13,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 52,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 2',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900177;

INSERT INTO `spell` SET
    `id` = 900177,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 5,
    `effect_base_points_2` = -19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 52,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 3',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900178;

INSERT INTO `spell` SET
    `id` = 900178,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 7,
    `effect_base_points_2` = -25,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 52,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 4',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900179;

INSERT INTO `spell` SET
    `id` = 900179,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `spell_level` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = 9,
    `effect_base_points_2` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 137,
    `effect_apply_aura_name_2` = 232,
    `effect_misc_value_a_1` = 2,
    `effect_misc_value_a_2` = 11,
    `spell_icon_id` = 52,
    `spell_priority` = 50,
    `spell_name_enus` = 'Juggernaut',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 5',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Increases your Stamina by $s1%, and reduces the duration of movement slowing effects on you by $s2%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

UPDATE spell SET spell_icon_id = 5452 WHERE ID IN (900175, 900176, 900177, 900178, 900179);

UPDATE spell SET attributes_ex_4 = 32768 WHERE ID IN (900133, 900134, 900135, 900136, 900137);

UPDATE spell SET effect_base_points_1 = 75, effect_real_points_per_level_1 = 6, base_level = 20, spell_level = 20, max_level = 80, effect_2 = 0, effect_trigger_spell_2 = 0, effect_implicit_target_a_2 = 0, spell_class_mask_3 = 262144 WHERE ID = 900119;

UPDATE spell SET spell_desc_enus = 'Bashes the target with your shield, dealing $<dmg> Physical damage, scaling with Attack Power.' WHERE ID = 900119;

DELETE FROM `spell` WHERE `id` = 900180;

INSERT INTO `spell` SET
    `id` = 900180,
    `attributes` = 327696,
    `attributes_ex_1` = 1024,
    `attributes_ex_3` = 2,
    `stances` = 131072,
    `cast_time_index` = 1,
    `recovery_time` = 60000,
    `proc_chance` = 101,
    `base_level` = 16,
    `spell_level` = 16,
    `duration_index` = 1,
    `power_type` = 1,
    `range_index` = 1,
    `equipped_item_class` = 4,
    `equipped_item_subclass_mask` = 64,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 51,
    `effect_spell_class_mask_c_2` = 512,
    `spell_visual_1` = 3442,
    `spell_icon_id` = 5489,
    `spell_name_enus` = 'Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Block chance increased by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Block chance increased by $s1%.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `spell_class_mask_1` = 4096,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

UPDATE spell SET effect_base_points_1 = 4 WHERE ID = 900180;

DELETE FROM `spell` WHERE `id` = 900181;

INSERT INTO `spell` SET
    `id` = 900181,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 12,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each block also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield block restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

DELETE FROM `spell` WHERE `id` = 900182;

INSERT INTO `spell` SET
    `id` = 900182,
    `attributes` = 327760,
    `attributes_ex_4` = 32768,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_misc_value_a_1` = 12,
    `effect_spell_class_mask_a_3` = 32768,
    `spell_icon_id` = 5494,
    `spell_name_enus` = 'Improved Rockslam',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = 'Rank 1',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'While Volcanic Shield is active, each block also restores $s1% of your maximum mana.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Volcanic Shield block restores $s1% max mana.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 11,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 8;

UPDATE spell SET effect_apply_aura_name_1 = 108, effect_misc_value_a_1 = 3, effect_base_points_1 = 14, effect_spell_class_mask_a_3 = 262144, effect_2 = 6, effect_apply_aura_name_2 = 42, effect_trigger_spell_2 = 900180, effect_implicit_target_a_2 = 1, proc_flags = 16, proc_chance = 100, spell_icon_id = 5489, spell_subtext_enus = 'Rank 1', spell_desc_enus = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant $900180s1% increased block chance for $900180d.' WHERE ID = 900181;

UPDATE spell SET effect_apply_aura_name_1 = 108, effect_misc_value_a_1 = 3, effect_base_points_1 = 24, effect_spell_class_mask_a_3 = 262144, effect_2 = 6, effect_apply_aura_name_2 = 42, effect_trigger_spell_2 = 900120, effect_implicit_target_a_2 = 1, proc_flags = 16, proc_chance = 100, spell_icon_id = 5489, spell_subtext_enus = 'Rank 2', spell_desc_enus = 'Increases the damage dealt by Rockslam by $s1% and causes it to grant $900120s1% increased block chance for $900120d.' WHERE ID = 900182;

UPDATE spell SET effect_base_points_1 = 5, effect_die_sides_1 = 0 WHERE ID = 900180;

UPDATE spell SET effect_base_points_1 = 10, effect_die_sides_1 = 0 WHERE ID = 900120;

UPDATE spell SET spell_desc_enus = 'Bashes the target with your shield, dealing $<dmg> Physical damage, scaling with Attack Power.$?s900182[ $<blocktext2>][$?s900181[ $<blocktext1>][]]' WHERE ID = 900119;
