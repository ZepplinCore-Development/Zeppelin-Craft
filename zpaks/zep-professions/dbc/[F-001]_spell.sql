-- F-001: Custom Profession Tools - Spell entries
-- Profession tool buff spells, crafting spells, and totem_category updates
-- =====================================================
-- PROFESSION TOOL SPELLS (from module import)
-- Smithing Hammers (91120-91131), Pruning Shears (91140-91143),
-- Mining Picks (91158-91161), Tailoring Scissors (91164-91167),
-- Leathering Kit (91182-91186), Alchemy Mortars (91200-91203)
-- =====================================================
DELETE FROM `spell` WHERE `id` = 91120;

INSERT INTO `spell` SET
    `id` = 91120,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Bronze Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91121;

INSERT INTO `spell` SET
    `id` = 91121,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 5956,
    `reagent_2` = 1210,
    `reagent_3` = 2841,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57003,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Bronze Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91122;

INSERT INTO `spell` SET
    `id` = 91122,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -21,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Iron Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91123;

INSERT INTO `spell` SET
    `id` = 91123,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57003,
    `reagent_2` = 1529,
    `reagent_3` = 3575,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57004,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Iron Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91124;

INSERT INTO `spell` SET
    `id` = 91124,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Mithril Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91125;

INSERT INTO `spell` SET
    `id` = 91125,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57004,
    `reagent_2` = 7909,
    `reagent_3` = 3860,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57005,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Mithril Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91126;

INSERT INTO `spell` SET
    `id` = 91126,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -41,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Thorium Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91127;

INSERT INTO `spell` SET
    `id` = 91127,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57005,
    `reagent_2` = 12363,
    `reagent_3` = 12359,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57006,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Thorium Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91128;

INSERT INTO `spell` SET
    `id` = 91128,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -51,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Felsteel Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91129;

INSERT INTO `spell` SET
    `id` = 91129,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57006,
    `reagent_2` = 23437,
    `reagent_3` = 23448,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57007,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Felsteel Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91130;

INSERT INTO `spell` SET
    `id` = 91130,
    `attributes` = 128,
    `attributes_ex_1` = 268435456,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Titanium Blacksmithing',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Blacksmithing recipes by $s1%. Does not stack with other Smithing Hammer effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91131;

INSERT INTO `spell` SET
    `id` = 91131,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 170,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57007,
    `reagent_2` = 36924,
    `reagent_3` = 41163,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57008,
    `spell_visual_1` = 395,
    `spell_icon_id` = 140,
    `spell_name_enus` = 'Titanium Smithing Hammer',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = '',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91140;

INSERT INTO `spell` SET
    `id` = 91140,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 2,
    `spell_icon_id` = 5050,
    `spell_name_enus` = 'Journeyman Shears',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 10% chance to find extra herbs when gathering. Reduces gathering time for herbs by $s1%. Does not stack with other Pruning Shear effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91141;

INSERT INTO `spell` SET
    `id` = 91141,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 2,
    `spell_icon_id` = 5050,
    `spell_name_enus` = 'Artisan Shears',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 20% chance to find extra herbs when gathering. Reduces gathering time for herbs by $s1%. Does not stack with other Pruning Shear effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91142;

INSERT INTO `spell` SET
    `id` = 91142,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 2,
    `spell_icon_id` = 5050,
    `spell_name_enus` = 'Master Shears',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 30% chance to find extra herbs when gathering. Reduces gathering time for herbs by $s1%. Does not stack with other Pruning Shear effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91143;

INSERT INTO `spell` SET
    `id` = 91143,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 2,
    `spell_icon_id` = 5050,
    `spell_name_enus` = 'Grand Master Shears',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 40% chance to find extra herbs when gathering. Reduces gathering time for herbs by $s1%. Does not stack with other Pruning Shear effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 2,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91158;

INSERT INTO `spell` SET
    `id` = 91158,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 4,
    `spell_icon_id` = 2418,
    `spell_name_enus` = 'Journeyman Mining Pick',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 10% chance to find extra ore when mining. Reduces mining time for veins by $s1%. Does not stack with other Mining Picks effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91159;

INSERT INTO `spell` SET
    `id` = 91159,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 4,
    `spell_icon_id` = 2418,
    `spell_name_enus` = 'Artisan Mining Pick',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 20% chance to find extra ore when mining. Reduces mining time for veins by $s1%. Does not stack with other Mining Picks effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91160;

INSERT INTO `spell` SET
    `id` = 91160,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 4,
    `spell_icon_id` = 2418,
    `spell_name_enus` = 'Master Mining Pick',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 30% chance to find extra ore when mining. Reduces mining time for veins by $s1%. Does not stack with other Mining Picks effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91161;

INSERT INTO `spell` SET
    `id` = 91161,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 4,
    `spell_icon_id` = 2418,
    `spell_name_enus` = 'Grand Master Mining Pick',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 40% chance to find extra ore when mining. Reduces mining time for veins by $s1%. Does not stack with other Mining Picks effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 4,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91164;

INSERT INTO `spell` SET
    `id` = 91164,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 32,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Journeyman Tailoring Scissors',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Tailoring recipes by $s1%. Does not stack with other Tailoring Scissors effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 32,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91165;

INSERT INTO `spell` SET
    `id` = 91165,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 32,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Artisan Tailoring Scissors',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Tailoring recipes by $s1%. Does not stack with other Tailoring Scissors effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 32,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91166;

INSERT INTO `spell` SET
    `id` = 91166,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 32,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Master Tailoring Scissors',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Tailoring recipes by $s1%. Does not stack with other Tailoring Scissors effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 32,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91167;

INSERT INTO `spell` SET
    `id` = 91167,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 32,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Grand Master Tailoring Scissors',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Tailoring recipes by $s1%. Does not stack with other Tailoring Scissors effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 32,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91182;

INSERT INTO `spell` SET
    `id` = 91182,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -11,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 16,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Journeyman Leathering Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Leatherworking recipes by $s1%. Does not stack with other Leathering Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91183;

INSERT INTO `spell` SET
    `id` = 91183,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -21,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 16,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Expert Leathering Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Leatherworking recipes by $s1%. Does not stack with other Leathering Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91184;

INSERT INTO `spell` SET
    `id` = 91184,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 16,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Artisan Leathering Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Leatherworking recipes by $s1%. Does not stack with other Leathering Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91185;

INSERT INTO `spell` SET
    `id` = 91185,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -41,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 16,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Master Leathering Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Leatherworking recipes by $s1%. Does not stack with other Leathering Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91186;

INSERT INTO `spell` SET
    `id` = 91186,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -51,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 16,
    `spell_icon_id` = 341,
    `spell_name_enus` = 'Grand Master Leathering Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Leatherworking recipes by $s1%. Does not stack with other Leathering Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 16,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91200;

INSERT INTO `spell` SET
    `id` = 91200,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = -16,
    `effect_base_points_2` = 9,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 14,
    `spell_icon_id` = 3181,
    `spell_name_enus` = 'Journeyman Alchemy Mortar',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 13,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91201;

INSERT INTO `spell` SET
    `id` = 91201,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = -31,
    `effect_base_points_2` = 14,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 14,
    `spell_icon_id` = 3181,
    `spell_name_enus` = 'Artisan Alchemy Mortar',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 13,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91202;

INSERT INTO `spell` SET
    `id` = 91202,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = -46,
    `effect_base_points_2` = 19,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 14,
    `spell_icon_id` = 3181,
    `spell_name_enus` = 'Master Alchemy Mortar',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 13,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91203;

INSERT INTO `spell` SET
    `id` = 91203,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_base_points_1` = -61,
    `effect_base_points_2` = 24,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_spell_class_mask_a_1` = 2147483648,
    `effect_spell_class_mask_b_1` = 14,
    `spell_icon_id` = 3181,
    `spell_name_enus` = 'Grand Master Alchemy Mortar',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 13,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- =====================================================
-- JC RECIPE TOTEM_CATEGORY UPDATES
-- Set totem_category_1 = 191 (Jeweler's Kit) on JC crafting spells
-- =====================================================
UPDATE `spell` SET `attributes` = 65568, `attributes_ex_1` = 1024, `cast_time_index` = 39, `interrupt_flags` = 15, `reagent_1` = 11754, `reagent_2` = 18335, `reagent_3` = 12360, `reagent_count_1` = 8, `reagent_count_2` = 4, `reagent_count_3` = 4, `effect_1` = 24, `effect_item_type_1` = 38385, `spell_visual_1` = 7374, `spell_icon_id` = 1, `spell_name_enus` = 'Black Diamond Dragonling', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `totem_category_1` = 191 WHERE `id` = 23052;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25278;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25280;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25283;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25284;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25287;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25305;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25317;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25318;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25320;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25321;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25323;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25339;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25490;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25498;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25610;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25612;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25613;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25614;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25615;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25617;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25618;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25619;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25620;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25621;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 25622;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26872;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26873;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26874;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26875;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26876;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26878;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26880;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26881;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26882;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26883;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26885;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26887;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26896;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26897;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26900;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26902;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26903;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26906;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26907;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26908;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26909;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26910;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26911;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26912;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26914;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26915;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26916;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26918;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26920;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26926;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26927;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 26928;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31048;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31049;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31050;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31051;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31052;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31053;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31054;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31055;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31056;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31057;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31058;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31060;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31061;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31062;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31063;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31064;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31065;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31066;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31067;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31068;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31070;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31071;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31072;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31076;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31077;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31078;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31079;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31080;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31081;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31082;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 31083;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 32178;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 32179;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 34955;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 34959;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 34960;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 34961;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 36523;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 36524;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 36525;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 36526;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 37818;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 37855;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 38175;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 38503;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 38504;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 40514;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 41414;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 41415;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 41418;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 46775;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 46776;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 46777;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 46778;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 46779;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56193;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56194;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56195;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56196;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56197;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56199;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56201;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56202;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56203;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56496;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56497;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56498;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56499;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56500;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 56501;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58141;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58142;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58143;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58144;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58145;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58146;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58147;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58148;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58149;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58150;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58492;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58507;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 58954;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 59759;

UPDATE `spell` SET `attributes` = 65584, `spell_focus_object` = 1, `facing_caster_flags` = 0, `cast_time_index` = 34, `interrupt_flags` = 15, `range_index` = 1, `reagent_1` = 17771, `reagent_2` = 20725, `reagent_3` = 17010, `reagent_count_1` = 10, `reagent_count_2` = 20, `reagent_count_3` = 10, `effect_1` = 24, `effect_die_sides_1` = 1, `effect_implicit_target_a_1` = 1, `effect_implicit_target_b_1` = 0, `effect_item_type_1` = 1184, `spell_visual_1` = 395, `spell_icon_id` = 140, `spell_name_enus` = 'Elementium Aegis', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `max_affected_targets` = 0, `totem_category_1` = 162 WHERE `id` = 62195;

UPDATE `spell` SET `attributes` = 65568, `attributes_ex_1` = 1024, `cast_time_index` = 37, `interrupt_flags` = 15, `duration_index` = 0, `reagent_1` = 17771, `reagent_2` = 20725, `reagent_3` = 21752, `reagent_count_1` = 10, `reagent_count_2` = 20, `reagent_count_3` = 6, `effect_1` = 24, `effect_base_points_1` = 0, `effect_apply_aura_name_1` = 0, `effect_item_type_1` = 57501, `spell_visual_1` = 7374, `spell_icon_id` = 1, `spell_name_enus` = 'Elementium Talisman', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190, `spell_tooltip_flags` = 16712190, `totem_category_1` = 191 WHERE `id` = 62203;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 63743;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 64725;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 64726;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 64727;

UPDATE `spell` SET `totem_1` = 0, `totem_category_1` = 191 WHERE `id` = 64728;

-- =====================================================
-- TINKERING TOOLS SPELLS (clone + modify)
-- Buff spells (91214-91217) and crafting spells (91218-91221)
-- =====================================================
-- F-001: Profession Tools - JC Simple Grinder totem category
-- Converts totem_1 (item requirement) to totem_category_1 (tool category) for JC spells
-- totem_1 20815 is Simple Grinder item, totem_category_1 191 is the tool category
UPDATE `dbc`.`spell`
SET `totem_1` = 0, `totem_category_1` = 191
WHERE `totem_1` = 20815;

-- Delete tinkering tools spells before re-creating (idempotency)
DELETE FROM `spell` WHERE `id` IN (91214, 91215, 91216, 91217, 91218, 91219, 91220, 91221);

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91214, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Journeyman Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 91121;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91215, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Artisan Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 91121;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91216, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Master Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 91121;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91217, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Grand Master Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 91121;

UPDATE spell SET effect_1 = 6, effect_apply_aura_name_1 = 108, effect_base_points_1 = -16, effect_misc_value_a_1 = 10, spell_class_mask_1 = 128, effect_spell_class_mask_a_1 = 128, effect_implicit_target_a_1 = 1, attributes = 128, attributes_ex_1 = 268437504, spell_desc_enus = 'Reduces craft time for Engineering recipes by $s1%. Does not stack with other Tinkering Tools effects.' WHERE id = 91214;

UPDATE spell SET effect_1 = 6, effect_apply_aura_name_1 = 108, effect_base_points_1 = -31, effect_misc_value_a_1 = 10, spell_class_mask_1 = 128, effect_spell_class_mask_a_1 = 128, effect_implicit_target_a_1 = 1, attributes = 128, attributes_ex_1 = 268437504, spell_desc_enus = 'Reduces craft time for Engineering recipes by $s1%. Does not stack with other Tinkering Tools effects.' WHERE id = 91215;

UPDATE spell SET effect_1 = 6, effect_apply_aura_name_1 = 108, effect_base_points_1 = -46, effect_misc_value_a_1 = 10, spell_class_mask_1 = 128, effect_spell_class_mask_a_1 = 128, effect_implicit_target_a_1 = 1, attributes = 128, attributes_ex_1 = 268437504, spell_desc_enus = 'Reduces craft time for Engineering recipes by $s1%. Does not stack with other Tinkering Tools effects.' WHERE id = 91216;

UPDATE spell SET effect_1 = 6, effect_apply_aura_name_1 = 108, effect_base_points_1 = -61, effect_misc_value_a_1 = 10, spell_class_mask_1 = 128, effect_spell_class_mask_a_1 = 128, effect_implicit_target_a_1 = 1, attributes = 128, attributes_ex_1 = 268437504, spell_desc_enus = 'Reduces craft time for Engineering recipes by $s1%. Does not stack with other Tinkering Tools effects.' WHERE id = 91217;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91218, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Journeyman Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 7430;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91219, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Artisan Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 7430;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91220, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Master Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 7430;

INSERT INTO spell (`id`, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, `spell_name_enus`, `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id`) SELECT 91221, `category`, `dispel`, `mechanic`, `attributes`, `attributes_ex_1`, `attributes_ex_2`, `attributes_ex_3`, `attributes_ex_4`, `attributes_ex_5`, `attributes_ex_6`, `attributes_ex_7`, `stances`, `unk_1`, `excluded_stances`, `unk_2`, `targets`, `target_creature_type`, `spell_focus_object`, `facing_caster_flags`, `caster_aura_state`, `target_aura_state`, `excluded_caster_aura_state`, `excluded_target_aura_state`, `caster_aura_spell`, `target_aura_spell`, `excluded_caster_aura_spell`, `excluded_target_aura_spell`, `cast_time_index`, `recovery_time`, `category_recovery_time`, `interrupt_flags`, `aura_interrupt_flags`, `channel_interrupt_flags`, `proc_flags`, `proc_chance`, `proc_charges`, `max_level`, `base_level`, `spell_level`, `duration_index`, `power_type`, `power_cost`, `power_cost_per_level`, `power_per_second`, `power_per_second_per_level`, `range_index`, `speed`, `modal_next_spell`, `stack_amount`, `totem_1`, `totem_2`, `reagent_1`, `reagent_2`, `reagent_3`, `reagent_4`, `reagent_5`, `reagent_6`, `reagent_7`, `reagent_8`, `reagent_count_1`, `reagent_count_2`, `reagent_count_3`, `reagent_count_4`, `reagent_count_5`, `reagent_count_6`, `reagent_count_7`, `reagent_count_8`, `equipped_item_class`, `equipped_item_subclass_mask`, `equipped_item_inventorytype_mask`, `effect_1`, `effect_2`, `effect_3`, `effect_die_sides_1`, `effect_die_sides_2`, `effect_die_sides_3`, `effect_real_points_per_level_1`, `effect_real_points_per_level_2`, `effect_real_points_per_level_3`, `effect_base_points_1`, `effect_base_points_2`, `effect_base_points_3`, `effect_mechanic_1`, `effect_mechanic_2`, `effect_mechanic_3`, `effect_implicit_target_a_1`, `effect_implicit_target_a_2`, `effect_implicit_target_a_3`, `effect_implicit_target_b_1`, `effect_implicit_target_b_2`, `effect_implicit_target_b_3`, `effect_radius_index_1`, `effect_radius_index_2`, `effect_radius_index_3`, `effect_apply_aura_name_1`, `effect_apply_aura_name_2`, `effect_apply_aura_name_3`, `effect_amplitude_1`, `effect_amplitude_2`, `effect_amplitude_3`, `effect_multiple_value_1`, `effect_multiple_value_2`, `effect_multiple_value_3`, `effect_chain_target_1`, `effect_chain_target_2`, `effect_chain_target_3`, `effect_item_type_1`, `effect_item_type_2`, `effect_item_type_3`, `effect_misc_value_a_1`, `effect_misc_value_a_2`, `effect_misc_value_a_3`, `effect_misc_value_b_1`, `effect_misc_value_b_2`, `effect_misc_value_b_3`, `effect_trigger_spell_1`, `effect_trigger_spell_2`, `effect_trigger_spell_3`, `effect_points_per_combo_point_1`, `effect_points_per_combo_point_2`, `effect_points_per_combo_point_3`, `effect_spell_class_mask_a_1`, `effect_spell_class_mask_a_2`, `effect_spell_class_mask_a_3`, `effect_spell_class_mask_b_1`, `effect_spell_class_mask_b_2`, `effect_spell_class_mask_b_3`, `effect_spell_class_mask_c_1`, `effect_spell_class_mask_c_2`, `effect_spell_class_mask_c_3`, `spell_visual_1`, `spell_visual_2`, `spell_icon_id`, `active_icon_id`, `spell_priority`, 'Grand Master Tinkering Tools', `spell_name_kokr`, `spell_name_frfr`, `spell_name_dede`, `spell_name_zhcn`, `spell_name_zhtw`, `spell_name_eses`, `spell_name_esmx`, `spell_name_ruru`, `spell_name_jajp`, `spell_name_ptpt`, `spell_name_itit`, `spell_name_unused_1`, `spell_name_unused_2`, `spell_name_unused_3`, `spell_name_unused_4`, `spell_name_flags`, `spell_subtext_enus`, `spell_subtext_kokr`, `spell_subtext_frfr`, `spell_subtext_dede`, `spell_subtext_zhcn`, `spell_subtext_zhtw`, `spell_subtext_eses`, `spell_subtext_esmx`, `spell_subtext_ruru`, `spell_subtext_jajp`, `spell_subtext_ptpt`, `spell_subtext_itit`, `spell_subtext_unused_1`, `spell_subtext_unused_2`, `spell_subtext_unused_3`, `spell_subtext_unused_4`, `spell_subtext_flags`, `spell_desc_enus`, `spell_desc_kokr`, `spell_desc_frfr`, `spell_desc_dede`, `spell_desc_zhcn`, `spell_desc_zhtw`, `spell_desc_eses`, `spell_desc_esmx`, `spell_desc_ruru`, `spell_desc_jajp`, `spell_desc_ptpt`, `spell_desc_itit`, `spell_desc_unused_1`, `spell_desc_unused_2`, `spell_desc_unused_3`, `spell_desc_unused_4`, `spell_desc_flags`, `spell_tooltip_enus`, `spell_tooltip_kokr`, `spell_tooltip_frfr`, `spell_tooltip_dede`, `spell_tooltip_zhcn`, `spell_tooltip_zhtw`, `spell_tooltip_eses`, `spell_tooltip_esmx`, `spell_tooltip_ruru`, `spell_tooltip_jajp`, `spell_tooltip_ptpt`, `spell_tooltip_itit`, `spell_tooltip_unused_1`, `spell_tooltip_unused_2`, `spell_tooltip_unused_3`, `spell_tooltip_unused_4`, `spell_tooltip_flags`, `power_cost_percentage`, `start_recovery_category`, `start_recovery_time`, `maximum_target_level`, `spell_class_set`, `spell_class_mask_1`, `spell_class_mask_2`, `spell_class_mask_3`, `max_affected_targets`, `damage_class`, `prevention_type`, `stance_bar_order`, `effect_damage_multiplier_1`, `effect_damage_multiplier_2`, `effect_damage_multiplier_3`, `min_faction_id`, `min_reputation`, `req_aura_vision`, `totem_category_1`, `totem_category_2`, `area_group_id`, `school_mask`, `rune_cost_id`, `spell_missile_id`, `power_display_id`, `effect_bonus_multiplier_1`, `effect_bonus_multiplier_2`, `effect_bonus_multiplier_3`, `spell_desc_variable_id`, `spell_difficulty_id` FROM spell WHERE ID = 7430;

UPDATE spell SET effect_item_type_1 = 57200, reagent_1 = 5956, reagent_count_1 = 1, reagent_2 = 6219, reagent_count_2 = 1, reagent_3 = 2319, reagent_count_3 = 10, reagent_4 = 0, reagent_count_4 = 0 WHERE id = 91218;

UPDATE spell SET effect_item_type_1 = 57201, reagent_1 = 57200, reagent_count_1 = 1, reagent_2 = 15994, reagent_count_2 = 2, reagent_3 = 18631, reagent_count_3 = 1, reagent_4 = 10498, reagent_count_4 = 1 WHERE id = 91219;

UPDATE spell SET effect_item_type_1 = 57202, reagent_1 = 57201, reagent_count_1 = 1, reagent_2 = 23821, reagent_count_2 = 1, reagent_3 = 23784, reagent_count_3 = 2, reagent_4 = 0, reagent_count_4 = 0 WHERE id = 91220;

UPDATE spell SET effect_item_type_1 = 57203, reagent_1 = 57202, reagent_count_1 = 1, reagent_2 = 39683, reagent_count_2 = 2, reagent_3 = 39682, reagent_count_3 = 2, reagent_4 = 0, reagent_count_4 = 0 WHERE id = 91221;

-- =====================================================
-- ENCHANTING ROD BUFF SPELLS (91222-91231)
-- Passive cast time reduction for Enchanting + Disenchant
-- SpellFamily 14, mask 256 (Enchanting)
-- =====================================================
-- Runed Copper Rod buff (15% reduction)
DELETE FROM `spell` WHERE `id` = 91222;

INSERT INTO `spell` SET
    `id` = 91222,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Copper Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Silver Rod buff (20% reduction)
DELETE FROM `spell` WHERE `id` = 91223;

INSERT INTO `spell` SET
    `id` = 91223,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -21,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Silver Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Golden Rod buff (25% reduction)
DELETE FROM `spell` WHERE `id` = 91224;

INSERT INTO `spell` SET
    `id` = 91224,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -26,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Golden Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Truesilver Rod buff (30% reduction)
DELETE FROM `spell` WHERE `id` = 91225;

INSERT INTO `spell` SET
    `id` = 91225,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Truesilver Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Arcanite Rod buff (35% reduction)
DELETE FROM `spell` WHERE `id` = 91226;

INSERT INTO `spell` SET
    `id` = 91226,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -36,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Arcanite Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Fel Iron Rod buff (40% reduction)
DELETE FROM `spell` WHERE `id` = 91227;

INSERT INTO `spell` SET
    `id` = 91227,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -41,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Fel Iron Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Adamantite Rod buff (45% reduction)
DELETE FROM `spell` WHERE `id` = 91228;

INSERT INTO `spell` SET
    `id` = 91228,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Adamantite Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Eternium Rod buff (50% reduction)
DELETE FROM `spell` WHERE `id` = 91229;

INSERT INTO `spell` SET
    `id` = 91229,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -51,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Eternium Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Cobalt Rod buff (55% reduction)
DELETE FROM `spell` WHERE `id` = 91230;

INSERT INTO `spell` SET
    `id` = 91230,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -56,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Cobalt Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Runed Titanium Rod buff (60% reduction)
DELETE FROM `spell` WHERE `id` = 91231;

INSERT INTO `spell` SET
    `id` = 91231,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 256,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Runed Titanium Rod',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Enchanting recipes and Disenchanting by $s1%. Does not stack with other Enchanting Rod effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = '',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 256,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = 256 WHERE ID IN (7411,7412,7413,7418,7420,7421,7426,7428,7443,7454,7457,7745,7748,7766,7771,7776,7779,7782,7786,7788,7793,7795,7857,7859,7861,7863,7867,13262,13378,13380,13419,13421,13464,13485,13501,13503,13522,13529,13536,13538,13607,13612,13617,13620,13622,13626,13628,13631,13635,13637,13640,13642,13644,13646,13648,13653,13655,13657,13659,13661,13663,13687,13689,13693,13695,13698,13700,13702,13746,13794,13815,13817,13822,13836,13841,13846,13858,13868,13882,13887,13890,13898,13905,13915,13917,13920,13931,13933,13935,13937,13939,13941,13943,13945,13947,13948,14293,14807,14809,14810,15596,17180,17181,20008,20009,20010,20011,20012,20013,20014,20015,20016,20017,20020,20023,20024,20025,20026,20028,20029,20030,20031,20032,20033,20034,20035,20036,20051,21931,22749,22750,23799,23800,23801,23802,23803,23804,25072,25073,25074,25078,25079,25080,25081,25082,25083,25084,25086,25124,25125,25126,25127,25128,25129,25130,27837,27899,27905,27906,27911,27913,27914,27917,27920,27924,27926,27927,27944,27945,27946,27947,27948,27950,27951,27954,27957,27958,27960,27961,27962,27967,27968,27971,27972,27975,27977,27981,27982,27984,28003,28004,28016,28019,28021,28022,28027,28028,28029,32664,32665,32667,33990,33991,33992,33993,33994,33995,33996,33997,33999,34001,34002,34003,34004,34005,34006,34007,34008,34009,34010,42613,42615,42620,42974,44383,44483,44484,44488,44489,44492,44494,44500,44506,44508,44509,44510,44513,44524,44528,44529,44555,44556,44575,44576,44582,44584,44588,44589,44590,44591,44592,44593,44595,44596,44598,44612,44616,44621,44623,44625,44629,44630,44631,44633,44635,44636,44645,45765,46578,46594,47051,47672,47766,47898,47899,47900,47901,51313,59619,59621,59625,59636,60606,60609,60616,60619,60621,60623,60653,60663,60668,60691,60692,60707,60714,60763,60767,62256,62257,62948,62959,63746,64441,64579,69412,71692,72559,91000,91117,91144,91145,91146,91147,91148,91149,91150,91151,91152,91153,91154,91155,91156,91157) AND spell_class_set = 0;

-- =====================================================
-- SKINNING KNIVES (91240-91243)
-- Extra yield (loot conditions) + cast time reduction (aura 108)
-- SpellFamilyName: 14, SpellFamilyFlags: 0x00000008 (8) = Skinning
-- =====================================================
-- Journeyman Skinning Knife buff (15% reduction, 10% yield)
DELETE FROM `spell` WHERE `id` = 91240;

INSERT INTO `spell` SET
    `id` = 91240,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 8,
    `spell_icon_id` = 1524,
    `spell_name_enus` = 'Journeyman Skinning Knife',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 10% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Gives a 10% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Artisan Skinning Knife buff (30% reduction, 20% yield)
DELETE FROM `spell` WHERE `id` = 91241;

INSERT INTO `spell` SET
    `id` = 91241,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 8,
    `spell_icon_id` = 1524,
    `spell_name_enus` = 'Artisan Skinning Knife',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 20% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Gives a 20% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Master Skinning Knife buff (45% reduction, 30% yield)
DELETE FROM `spell` WHERE `id` = 91242;

INSERT INTO `spell` SET
    `id` = 91242,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 8,
    `spell_icon_id` = 1524,
    `spell_name_enus` = 'Master Skinning Knife',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 30% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Gives a 30% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Grand Master Skinning Knife buff (60% reduction, 40% yield)
DELETE FROM `spell` WHERE `id` = 91243;

INSERT INTO `spell` SET
    `id` = 91243,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 8,
    `spell_icon_id` = 1524,
    `spell_name_enus` = 'Grand Master Skinning Knife',
    `spell_name_flags` = 16712190,
    `spell_subtext_enus` = '',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Gives a 40% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Gives a 40% chance to find extra hides when skinning. Reduces skinning time by $s1%. Does not stack with other Skinning Knife effects.',
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 8,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Tag skinning ability spells with SpellFamily 14, mask 8 (Skinning)
-- Required for cast time reduction aura to affect skinning
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = 8 WHERE ID IN (8613, 8617, 8618, 10768, 32678, 50305) AND spell_class_set != 14;

-- Fix skinning ability cast time: index 10 (1.0s) → index 11 (2.0s)
UPDATE spell SET cast_time_index = 11 WHERE ID IN (8613, 8617, 8618, 10768, 32678, 50305) AND cast_time_index = 10;

-- Tag tailoring crafting spells with SpellFamily 14, mask 32 (Tailoring)
-- Required for cast time reduction aura from Tailoring Scissors to affect crafting recipes
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = 32 WHERE ID IN (2385,2386,2387,2389,2392,2393,2394,2395,2396,2397,2399,2401,2402,2403,2406,2963,2964,3755,3757,3758,3813,3839,3840,3841,3842,3843,3844,3845,3847,3848,3849,3850,3851,3852,3854,3855,3856,3857,3858,3859,3860,3861,3862,3863,3864,3865,3866,3868,3869,3870,3871,3872,3873,3914,3915,6521,6686,6688,6690,6692,6693,6695,7623,7624,7629,7630,7633,7636,7639,7643,7892,7893,8465,8467,8483,8489,8758,8760,8762,8764,8766,8770,8772,8774,8776,8778,8780,8782,8784,8786,8789,8791,8793,8795,8797,8799,8802,8804,12044,12045,12046,12047,12048,12049,12050,12052,12053,12055,12056,12059,12060,12061,12062,12063,12064,12065,12066,12067,12068,12069,12070,12071,12072,12073,12074,12075,12076,12077,12078,12079,12080,12081,12082,12083,12084,12085,12086,12087,12088,12089,12090,12091,12092,12093,18401,18402,18403,18404,18405,18406,18407,18408,18409,18410,18411,18412,18413,18414,18415,18416,18417,18418,18419,18420,18421,18422,18423,18424,18434,18436,18437,18438,18439,18440,18441,18442,18444,18445,18446,18447,18448,18449,18450,18451,18452,18453,18454,18455,18456,18457,18458,18560,19435,20848,20849,21945,22759,22813,22866,22867,22868,22869,22870,22902,23662,23663,23664,23665,23666,23667,24091,24092,24093,24901,24902,24903,26085,26086,26087,26403,26407,26745,26746,26747,26749,26750,26751,26752,26753,26754,26755,26756,26757,26758,26759,26760,26761,26762,26763,26764,26765,26770,26771,26772,26773,26774,26775,26776,26777,26778,26779,26780,26781,26782,26783,26784,27658,27659,27660,27724,27725,28205,28207,28208,28209,28210,28480,28481,28482,31373,31430,31431,31432,31433,31434,31435,31437,31438,31440,31441,31442,31443,31444,31448,31449,31450,31451,31452,31453,31454,31455,31456,31459,31460,31461,36315,36316,36317,36318,36665,36667,36668,36669,36670,36672,36686,37873,37882,37883,37884,40020,40021,40023,40024,40060,41205,41206,41207,41208,44950,44958,46128,46129,46130,46131,49677,50194,50644,50647,55642,55769,55777,55898,55899,55900,55901,55902,55903,55904,55906,55907,55908,55910,55911,55913,55914,55919,55920,55921,55922,55923,55924,55925,55941,55943,55993,55994,55995,55996,55997,55998,55999,56000,56001,56002,56003,56004,56005,56006,56007,56008,56009,56010,56011,56014,56015,56016,56017,56018,56019,56020,56021,56022,56023,56024,56025,56026,56027,56028,56029,56030,56031,56034,56039,56048,59582,59583,59584,59585,59586,59587,59588,59589,60969,60971,60990,60993,60994,63203,63204,63205,63206,63742,63924,64729,64730,67064,67065,67066,67079,67144,67145,67146,67147,70550,70551,70552,70553,75597) AND spell_class_set = 0;

-- Tag cooking spells with SpellFamily 14 for cast time reduction
UPDATE spell SET cast_time_index = 14, spell_class_set = 14, spell_class_mask_1 = 4, excluded_stances = 0 WHERE id = 32606;

UPDATE spell SET cast_time_index = 14, spell_class_set = 14, spell_class_mask_1 = 128, excluded_stances = 0, attributes = 144 WHERE id = 49383;

-- =====================================================
-- Jeweler's Kits (91244-91247), Inscription Tools (91248-91251),
-- Engineering Components (91252-91270), Cooking Pots (91271-91275)
-- =====================================================
-- Jeweler's Kit buff spells
DELETE FROM `spell` WHERE `id` = 91244;

INSERT INTO `spell` SET
    `id` = 91244,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 512,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Journeyman Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Jewelcrafting recipes by $s1%. Does not stack with other Jewelers Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 512,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91245;

INSERT INTO `spell` SET
    `id` = 91245,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 512,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Artisan Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Jewelcrafting recipes by $s1%. Does not stack with other Jewelers Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 512,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91246;

INSERT INTO `spell` SET
    `id` = 91246,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 512,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Master Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Jewelcrafting recipes by $s1%. Does not stack with other Jewelers Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 512,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91247;

INSERT INTO `spell` SET
    `id` = 91247,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 512,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Grand Master Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Jewelcrafting recipes by $s1%. Does not stack with other Jewelers Kit effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 512,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Inscription Tool buff spells
DELETE FROM `spell` WHERE `id` = 91248;

INSERT INTO `spell` SET
    `id` = 91248,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -16,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1024,
    `spell_icon_id` = 4664,
    `spell_name_enus` = 'Journeyman Writing Table',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Inscription recipes by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1024,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91249;

INSERT INTO `spell` SET
    `id` = 91249,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -31,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1024,
    `spell_icon_id` = 4664,
    `spell_name_enus` = 'Artisan Writing Table',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Inscription recipes by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1024,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91250;

INSERT INTO `spell` SET
    `id` = 91250,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -46,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1024,
    `spell_icon_id` = 4664,
    `spell_name_enus` = 'Master Writing Table',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Inscription recipes by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1024,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91251;

INSERT INTO `spell` SET
    `id` = 91251,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -61,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_spell_class_mask_a_1` = 1024,
    `spell_icon_id` = 4664,
    `spell_name_enus` = 'Grand Master Writing Table',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Inscription recipes by $s1%.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1024,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

-- Engineering Components - Rivets
DELETE FROM `spell` WHERE `id` = 91252;

INSERT INTO `spell` SET
    `id` = 91252,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 2841,
    `reagent_count_1` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57009,
    `spell_visual_1` = 395,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Bronze Rivets',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91253;

INSERT INTO `spell` SET
    `id` = 91253,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 6037,
    `reagent_count_1` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57010,
    `spell_visual_1` = 395,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Truesilver Rivets',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91254;

INSERT INTO `spell` SET
    `id` = 91254,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 23446,
    `reagent_count_1` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57011,
    `spell_visual_1` = 395,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Adamantite Rivets',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91255;

INSERT INTO `spell` SET
    `id` = 91255,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 36913,
    `reagent_count_1` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 5,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57012,
    `spell_visual_1` = 395,
    `spell_icon_id` = 335,
    `spell_name_enus` = 'Saronite Rivets',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

-- Engineering Components - Fasteners
DELETE FROM `spell` WHERE `id` = 91256;

INSERT INTO `spell` SET
    `id` = 91256,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 2841,
    `reagent_count_1` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57508,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Bronze Fasteners',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91257;

INSERT INTO `spell` SET
    `id` = 91257,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 6037,
    `reagent_count_1` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57509,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Truesilver Fasteners',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91258;

INSERT INTO `spell` SET
    `id` = 91258,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 23446,
    `reagent_count_1` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57510,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Adamantite Fasteners',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91259;

INSERT INTO `spell` SET
    `id` = 91259,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 36913,
    `reagent_count_1` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57511,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Saronite Fasteners',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

-- Engineering Components - Screwdrivers
DELETE FROM `spell` WHERE `id` = 91260;

INSERT INTO `spell` SET
    `id` = 91260,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 2841,
    `reagent_count_1` = 4,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57213,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Bronze Screwdriver',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91261;

INSERT INTO `spell` SET
    `id` = 91261,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 23445,
    `reagent_2` = 23782,
    `reagent_count_1` = 4,
    `reagent_count_2` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57214,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Fel Iron Screwdriver',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91262;

INSERT INTO `spell` SET
    `id` = 91262,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 36913,
    `reagent_2` = 39683,
    `reagent_count_1` = 4,
    `reagent_count_2` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57215,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Saronite Screwdriver',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

-- Engineering Components - Drills
DELETE FROM `spell` WHERE `id` = 91263;

INSERT INTO `spell` SET
    `id` = 91263,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 2841,
    `reagent_2` = 4363,
    `reagent_count_1` = 4,
    `reagent_count_2` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57216,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Bronze Drill',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91264;

INSERT INTO `spell` SET
    `id` = 91264,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 3577,
    `reagent_2` = 10558,
    `reagent_3` = 4389,
    `reagent_count_1` = 4,
    `reagent_count_2` = 6,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57217,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Gold Drill',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91265;

INSERT INTO `spell` SET
    `id` = 91265,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 23445,
    `reagent_2` = 23783,
    `reagent_3` = 7191,
    `reagent_4` = 15994,
    `reagent_count_1` = 4,
    `reagent_count_2` = 6,
    `reagent_count_3` = 2,
    `reagent_count_4` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57218,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Fel Iron Drill',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91266;

INSERT INTO `spell` SET
    `id` = 91266,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 36913,
    `reagent_2` = 39682,
    `reagent_3` = 39681,
    `reagent_count_1` = 4,
    `reagent_count_2` = 2,
    `reagent_count_3` = 6,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57219,
    `spell_visual_1` = 395,
    `spell_icon_id` = 333,
    `spell_name_enus` = 'Saronite Drill',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 14,
    `school_mask` = 1;

-- Engineering Components - Jeweler's Kit crafts
DELETE FROM `spell` WHERE `id` = 91267;

INSERT INTO `spell` SET
    `id` = 91267,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 20815,
    `reagent_2` = 57009,
    `reagent_3` = 57508,
    `reagent_4` = 57216,
    `reagent_count_1` = 1,
    `reagent_count_2` = 12,
    `reagent_count_3` = 4,
    `reagent_count_4` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57504,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Journeyman Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91268;

INSERT INTO `spell` SET
    `id` = 91268,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57504,
    `reagent_2` = 57010,
    `reagent_3` = 57509,
    `reagent_4` = 57217,
    `reagent_count_1` = 1,
    `reagent_count_2` = 12,
    `reagent_count_3` = 4,
    `reagent_count_4` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57505,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Artisan Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91269;

INSERT INTO `spell` SET
    `id` = 91269,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57505,
    `reagent_2` = 57011,
    `reagent_3` = 57510,
    `reagent_4` = 57218,
    `reagent_count_1` = 1,
    `reagent_count_2` = 12,
    `reagent_count_3` = 4,
    `reagent_count_4` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57506,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Master Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 91270;

INSERT INTO `spell` SET
    `id` = 91270,
    `attributes` = 65584,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 33,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 57506,
    `reagent_2` = 57012,
    `reagent_3` = 57511,
    `reagent_4` = 57219,
    `reagent_count_1` = 1,
    `reagent_count_2` = 12,
    `reagent_count_3` = 4,
    `reagent_count_4` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57507,
    `spell_visual_1` = 395,
    `spell_icon_id` = 4662,
    `spell_name_enus` = 'Grand Master Jewelers Kit',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 1,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 191,
    `school_mask` = 1;

-- Cooking Pots
DELETE FROM `spell` WHERE `id` = 91271;

INSERT INTO `spell` SET
    `id` = 91271,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -16,
    `effect_base_points_2` = 34,
    `effect_base_points_3` = 34,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_misc_value_a_3` = 12,
    `effect_spell_class_mask_a_1` = 2048,
    `effect_spell_class_mask_b_1` = 4096,
    `effect_spell_class_mask_c_1` = 8192,
    `spell_icon_id` = 3194,
    `spell_name_enus` = 'Journeyman Cooking Pot',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Cooking recipes by $s1%. Increases the efficacy of food and drink by $s2%. Does not stack with other Cooking Pot effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91272;

INSERT INTO `spell` SET
    `id` = 91272,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -26,
    `effect_base_points_2` = 44,
    `effect_base_points_3` = 44,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_misc_value_a_3` = 12,
    `effect_spell_class_mask_a_1` = 2048,
    `effect_spell_class_mask_b_1` = 4096,
    `effect_spell_class_mask_c_1` = 8192,
    `spell_icon_id` = 3194,
    `spell_name_enus` = 'Expert Cooking Pot',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Cooking recipes by $s1%. Increases the efficacy of food and drink by $s2%. Does not stack with other Cooking Pot effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91273;

INSERT INTO `spell` SET
    `id` = 91273,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -36,
    `effect_base_points_2` = 54,
    `effect_base_points_3` = 54,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_misc_value_a_3` = 12,
    `effect_spell_class_mask_a_1` = 2048,
    `effect_spell_class_mask_b_1` = 4096,
    `effect_spell_class_mask_c_1` = 8192,
    `spell_icon_id` = 3194,
    `spell_name_enus` = 'Artisan Cooking Pot',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Cooking recipes by $s1%. Increases the efficacy of food and drink by $s2%. Does not stack with other Cooking Pot effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91274;

INSERT INTO `spell` SET
    `id` = 91274,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -46,
    `effect_base_points_2` = 64,
    `effect_base_points_3` = 64,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_misc_value_a_3` = 12,
    `effect_spell_class_mask_a_1` = 2048,
    `effect_spell_class_mask_b_1` = 4096,
    `effect_spell_class_mask_c_1` = 8192,
    `spell_icon_id` = 3194,
    `spell_name_enus` = 'Master Cooking Pot',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Cooking recipes by $s1%. Increases the efficacy of food and drink by $s2%. Does not stack with other Cooking Pot effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;

DELETE FROM `spell` WHERE `id` = 91275;

INSERT INTO `spell` SET
    `id` = 91275,
    `attributes` = 128,
    `attributes_ex_1` = 268437504,
    `cast_time_index` = 1,
    `proc_flags` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `stack_amount` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_2` = 6,
    `effect_3` = 6,
    `effect_die_sides_1` = 1,
    `effect_die_sides_2` = 1,
    `effect_die_sides_3` = 1,
    `effect_base_points_1` = -61,
    `effect_base_points_2` = 74,
    `effect_base_points_3` = 74,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_implicit_target_a_3` = 1,
    `effect_apply_aura_name_1` = 108,
    `effect_apply_aura_name_2` = 108,
    `effect_apply_aura_name_3` = 108,
    `effect_misc_value_a_1` = 10,
    `effect_misc_value_a_2` = 3,
    `effect_misc_value_a_3` = 12,
    `effect_spell_class_mask_a_1` = 2048,
    `effect_spell_class_mask_b_1` = 4096,
    `effect_spell_class_mask_c_1` = 8192,
    `spell_icon_id` = 3194,
    `spell_name_enus` = 'Grand Master Cooking Pot',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'Reduces craft time for Cooking recipes by $s1%. Increases the efficacy of food and drink by $s2%. Does not stack with other Cooking Pot effects.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 14,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0;


-- ============================================================================
-- Mass SpellFamily tagging for STOCK profession crafting spells
--
-- Tags stock spells with their SpellFamily so cast-speed tools apply.
-- Uses JOIN against skilllineability so any new skillline entries are covered.
-- Custom spells (80000+) should have spell_class_set/mask in their INSERT SET.
-- ============================================================================
--
-- Also tags potion CONSUMPTION spells (SpellFamily 13) with category masks
-- so Alchemy Mortar effect 2 (potency boost, targeting mask 0x0E) can match.
-- See FamilyPotions.json: Health=0x02, Mana=0x04, Rejuv=0x08
-- ============================================================================

-- Blacksmithing crafting spells (skill_line 164) -> spell_class_set=14, spell_class_mask_1 bit 0
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 1
  WHERE sla.skill_line = 164 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Leatherworking crafting spells (skill_line 165) -> spell_class_set=14, spell_class_mask_1 bit 4
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 16
  WHERE sla.skill_line = 165 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Engineering crafting spells (skill_line 202) -> spell_class_set=14, spell_class_mask_1 bit 7
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 128
  WHERE sla.skill_line = 202 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Alchemy crafting spells (skill_line 171) -> spell_class_set=13, spell_class_mask_1 bit 31
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 13, s.spell_class_mask_1 = s.spell_class_mask_1 | 2147483648
  WHERE sla.skill_line = 171 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Jewelcrafting crafting spells (skill_line 755) -> spell_class_set=14, spell_class_mask_1 bit 9
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 512
  WHERE sla.skill_line = 755 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Inscription crafting spells (skill_line 773) -> spell_class_set=14, spell_class_mask_1 bit 11
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 1024
  WHERE sla.skill_line = 773 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Tailoring crafting spells (skill_line 197) -> spell_class_set=14, spell_class_mask_1 bit 5
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 32
  WHERE sla.skill_line = 197 AND s.effect_1 = 24 AND s.spell_class_set = 0;

-- Enchanting crafting spells (skill_line 333) -> spell_class_set=14, spell_class_mask_1 bit 8
-- Enchanting uses effect_1=53 (Enchant Item) and effect_1=24 (Create Item for shards/crystals)
UPDATE spell s JOIN skilllineability sla ON s.ID = sla.spell_id
  SET s.spell_class_set = 14, s.spell_class_mask_1 = s.spell_class_mask_1 | 256
  WHERE sla.skill_line = 333 AND s.effect_1 IN (24, 53) AND s.spell_class_set = 0;


-- =====================================================
-- POTION CONSUMPTION SPELLS (SpellFamily 13)
-- Tags existing family-13 spells with category masks
-- for Alchemy Mortar / Alchemist Stone targeting
-- =====================================================

-- Health Potions: spell_class_mask_1 |= 2 (0x02, bit 2)
UPDATE spell SET spell_class_mask_1 = spell_class_mask_1 | 2
  WHERE id IN (439,440,441,2024,4042,17534,21393,21394,28495,41306,41619,41620,43185,53144,53670,54572,58862,62352,67486,67489)
  AND spell_class_set = 13;

-- Mana Potions: spell_class_mask_1 |= 4 (0x04, bit 3)
UPDATE spell SET spell_class_mask_1 = spell_class_mask_1 | 4
  WHERE id IN (436,437,438,2023,6612,6613,9512,11903,17528,17530,17531,21395,21396,28499,28718,29236,41304,41617,41618,43186,49748,58864,67487,67490)
  AND spell_class_set = 13;

-- Rejuvenation Potions: spell_class_mask_1 |= 8 (0x08, bit 4)
-- (8 others already tagged via [BASE,F-044]_spell.sql)
UPDATE spell SET spell_class_mask_1 = spell_class_mask_1 | 8
  WHERE id IN (11387,18832,19199,52697,53750)
  AND spell_class_set = 13;


-- =====================================================
-- FOOD CONSUMPTION SPELLS
-- SpellFamily 14, Mask 4096 (0x00001000, bit 12)
-- Cooking pot SPELLMOD_EFFECT1 targets this mask to boost health per tick.
-- Trait: aura 84 (OBS_MOD_HEALTH) in effect_1, seated interrupt flag (262272).
-- =====================================================

-- Standard food: seated eating spells with health regen in effect_1
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = spell_class_mask_1 | 4096
  WHERE effect_apply_aura_name_1 = 84
  AND aura_interrupt_flags = 262272
  AND spell_class_set = 0;

-- Outlier food: aura 84 but non-standard interrupt flags
-- 48720 = underwater food (flags 269), 64345 = immobilizing food (flags 2)
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = spell_class_mask_1 | 4096
  WHERE effect_apply_aura_name_1 = 84
  AND id IN (48720, 64345)
  AND spell_class_set = 0;

-- Brain food: mana via eating (aura 85 in effect_1, seated, named "Brain Food")
-- Boosted by SPELLMOD_EFFECT1 same as regular food.
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = spell_class_mask_1 | 4096
  WHERE spell_name_enus = 'Brain Food'
  AND effect_apply_aura_name_1 = 85
  AND aura_interrupt_flags = 262272
  AND spell_class_set = 0;


-- =====================================================
-- DRINK CONSUMPTION SPELLS
-- SpellFamily 14, Mask 8192 (0x00002000, bit 13)
-- Cooking pot SPELLMOD_EFFECT2 targets this mask to boost mana per tick.
-- Trait: aura 85 (OBS_MOD_POWER) in effect_1, aura 226 in effect_2 (mana amount),
--        seated interrupt flag (262272).
-- =====================================================

-- Standard drinks: seated drinking spells with mana amount in effect_2
UPDATE spell SET spell_class_set = 14, spell_class_mask_1 = spell_class_mask_1 | 8192
  WHERE effect_apply_aura_name_1 = 85
  AND effect_apply_aura_name_2 = 226
  AND aura_interrupt_flags = 262272
  AND spell_class_set = 0;

-- Dual food+drink: already tagged with food mask above, add drink mask.
-- Trait: aura 84 (health) + aura 85 (mana) in same spell, seated flag.
UPDATE spell SET spell_class_mask_1 = spell_class_mask_1 | 8192
  WHERE effect_apply_aura_name_1 = 84
  AND effect_apply_aura_name_2 = 85
  AND aura_interrupt_flags = 262272
  AND spell_class_set = 14;

-- =====================================================
-- SIMPLE GRINDER → TOTEM CATEGORY MIGRATION
-- =====================================================
-- Stock cutting spells hard-coded totem_1 = 20824 (Simple Grinder item id).
-- Move them to totem_category_1 = 222 so Artisan+ Jeweler's Kits (cat 223,
-- mask bits 28+29) also satisfy the requirement.
UPDATE `spell`
SET `totem_1` = 0,
    `totem_category_1` = 222
WHERE `totem_1` = 20824;

