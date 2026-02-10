-- [F-155] Paladin Class Tuning: spell
-- Chastise ability, Blessing duration increases (split from [BASE,F-044]_spell.sql)

-- Chastise (new spell 91002)
-- A strike that becomes active after parrying or dodging an opponent's attack.
-- Deals 50% weapon damage and slows melee attack speed by 10% for 10 seconds.
DELETE FROM `spell` WHERE `id` = 91002;
INSERT INTO `spell` (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) VALUES (91002, 0, 0, 0, 327696, 131584, 0, 0, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 6000, 0, 0, 0, 0, 0, 101, 0, 0, 6, 6, 1, 0, 0, 0, 0, 0, 2, '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 31, 6, 0, 1, 1, 1, '0E-16', '0E-16', '0E-16', 49, -11, 0, 0, 8, 0, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 138, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0E-16', '0E-16', '0E-16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 3799, 0, 4919, 0, 0, 'Chastise', 16712190, '', 16712190, 'A strike that becomes active after parrying or dodging an opponent\'s attack.  This attack deals $s1% weapon damage and slows their melee attack speed by $s2% for $d.', 16712190, 'Melee attack speed slowed by $s2%.', 16712190, 5, 133, 1000, 0, 10, 0, 256, 0, 0, 2, 2, 0, '1.0000000000000000', '1.0000000000000000', '1.0000000000000000', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '1.0000000000000000', '1.0000000000000000', '0E-16', 0, 0);

-- Blessing durations increased to 30 minutes (duration_index 30)
-- Blessing of Might, Wisdom, Kings, Sanctuary (all ranks)
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19740;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19742;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19834;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19835;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19836;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19837;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19838;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19850;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19852;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19853;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 19854;
UPDATE `spell` SET `duration_index` = 30, `spell_subtext_flags` = 16712190 WHERE `id` = 20217;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 20911;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 25290;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 25291;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 27140;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 27142;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48931;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48932;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48935;
UPDATE `spell` SET `duration_index` = 30 WHERE `id` = 48936;

-- Greater Blessing durations increased to 60 minutes (duration_index 42)
-- Greater Blessing of Might, Wisdom, Kings, Sanctuary (all ranks)
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25894;
UPDATE `spell` SET `duration_index` = 42, `reagent_1` = 58302, `spell_subtext_flags` = 16712190, `power_cost_percentage` = 0 WHERE `id` = 25898;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25899;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25916;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 25918;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 27141;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 27143;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48933;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48934;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48937;
UPDATE `spell` SET `duration_index` = 42 WHERE `id` = 48938;

-- Improved Blessing of Butts (duration_index 36)
UPDATE `spell` SET `duration_index` = 36, `spell_name_enus` = 'Improved Blessing of Butts', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190 WHERE `id` = 23415;
