-- F-229 Gendered Dragonmaw Illusion
-- 900940: female copy of the 42016 transform; turns the player into creature 900962 (female disguise).
-- 900942 (female copy of the 40214 parent aura) links 40216 + 900940; spell_area gives males 40214
-- and females 900942 (zz_[F-229]_dragonmaw_illusion.sql).
DELETE FROM `spell` WHERE `id` = 900940;

INSERT INTO `spell` SET
    `id` = 900940,
    `attributes` = 2835415296,
    `attributes_ex_1` = 268435456,
    `excluded_stances` = 335544320,
    `cast_time_index` = 1,
    `aura_interrupt_flags` = 32768,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 56,
    `effect_misc_value_a_1` = 900962,
    `effect_spell_class_mask_a_1` = 3221225472,
    `effect_spell_class_mask_a_2` = 122880,
    `spell_icon_id` = 1962,
    `spell_name_enus` = 'Dragonmaw Illusion',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712190,
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712190,
    `spell_class_set` = 7,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900941;

-- 900941: strips both transforms from the caster. Mor'ghor's Illidan scene has the player cast it
-- where stock removed 42016 only.
INSERT INTO `spell` SET
    `id` = 900941,
    `attributes` = 256,
    `attributes_ex_2` = 4,
    `attributes_ex_3` = 256,
    `attributes_ex_6` = 8192,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 164,
    `effect_2` = 164,
    `effect_implicit_target_a_1` = 1,
    `effect_implicit_target_a_2` = 1,
    `effect_trigger_spell_1` = 42016,
    `effect_trigger_spell_2` = 900940,
    `spell_icon_id` = 1,
    `spell_name_enus` = 'Dragonmaw Illusion Removal',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_flags` = 16712188,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;

DELETE FROM `spell` WHERE `id` = 900942;

-- 900942: female copy of 40214 (dummy parent aura, autocast by spell_area).

INSERT INTO `spell` SET
    `id` = 900942,
    `attributes` = 687866112,
    `attributes_ex_1` = 268435456,
    `attributes_ex_5` = 1048576,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 13,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 4,
    `spell_icon_id` = 1691,
    `spell_name_enus` = 'Dragonmaw Illusion',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712172,
    `spell_desc_enus` = 'Disguised as a Dragonmaw fel orc.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_enus` = 'Disguised as a Dragonmaw fel orc.',
    `spell_tooltip_flags` = 16712190,
    `effect_damage_multiplier_1` = 1.0,
    `effect_damage_multiplier_2` = 1.0,
    `effect_damage_multiplier_3` = 1.0,
    `school_mask` = 1;
