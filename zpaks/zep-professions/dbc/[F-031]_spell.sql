-- [F-031] zep-professions: spell
-- Tiered practice locks for universal lockpicking levelling via Engineering.
-- Tiers: Beginner's (stock 8334/item 6712, retuned) -> Journeyman's 900817 ->
-- Expert's 900818 -> Artisan's 900819. All cloned from stock 8334
-- (anvil + Arclight Spanner preserved).

-- Beginner's Practice Lock (stock spell, renamed + retuned to copper mats,
-- trainer requirement lowered to Engineering 50 in npc_trainer)
UPDATE `spell` SET
  `spell_name_enus` = 'Beginner''s Practice Lock',
  `reagent_1` = 2840,  -- Copper Bar
  `reagent_2` = 4359,  -- Handful of Copper Bolts
  `reagent_3` = 0,
  `reagent_count_1` = 1,
  `reagent_count_2` = 1,
  `reagent_count_3` = 0
WHERE `id` = 8334;

-- Journeyman's Practice Lock (lockpicking 50): Bronze Bar + 2x Copper Bolts + Weak Flux
DELETE FROM `spell` WHERE `id` = 900817;

INSERT INTO `spell` SET
    `id` = 900817,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 34,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 2841,
    `reagent_2` = 4359,
    `reagent_3` = 2880,
    `reagent_count_1` = 1,
    `reagent_count_2` = 2,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57220,
    `spell_visual_1` = 395,
    `spell_icon_id` = 1,
    `spell_name_enus` = 'Journeyman''s Practice Lock',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900818;

INSERT INTO `spell` SET
    `id` = 900818,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 34,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 3575,   -- Iron Bar
    `reagent_2` = 4375,   -- Whirring Bronze Gizmo
    `reagent_3` = 3466,   -- Strong Flux
    `reagent_count_1` = 3,
    `reagent_count_2` = 1,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57221,
    `spell_visual_1` = 395,
    `spell_icon_id` = 1,
    `spell_name_enus` = 'Expert''s Practice Lock',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900819;

INSERT INTO `spell` SET
    `id` = 900819,
    `attributes` = 65568,
    `attributes_ex_1` = 1024,
    `spell_focus_object` = 1,
    `cast_time_index` = 34,
    `interrupt_flags` = 15,
    `proc_chance` = 101,
    `range_index` = 1,
    `reagent_1` = 3860,   -- Mithril Bar
    `reagent_2` = 10561,  -- Mithril Casing
    `reagent_3` = 3466,   -- Strong Flux
    `reagent_count_1` = 4,
    `reagent_count_2` = 1,
    `reagent_count_3` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 24,
    `effect_die_sides_1` = 1,
    `effect_implicit_target_a_1` = 1,
    `effect_item_type_1` = 57222,
    `spell_visual_1` = 395,
    `spell_icon_id` = 1,
    `spell_name_enus` = 'Artisan''s Practice Lock',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 14,
    `spell_class_mask_1` = 128,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `totem_category_1` = 162,
    `school_mask` = 1;
