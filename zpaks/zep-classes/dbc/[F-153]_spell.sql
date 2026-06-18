-- [F-153] Hunter Tuning: spell
-- Searing Shot — reworks the stock Silencing Shot talent spell (34490) into an
-- instant fire-damage shot (ID retained; the talent row that grants it is
-- unchanged, only the spell behavior). Moved here from the zep-legacy base
-- spell file so class-tuning reworks live in zep-classes, not BASE corrections.
-- The relocated "real" Silencing Shot (91119) and its cross-class thematic
-- trainer entries stay in zep-legacy ([BASE,F-044]_spell.sql / [F-003] silencing).

UPDATE `spell` SET
    `dispel` = 0,
    `recovery_time` = 8000,
    `base_level` = 4,
    `spell_level` = 4,
    `duration_index` = 0,
    `speed` = '0E-16',
    `effect_2` = 0,
    `effect_die_sides_2` = 0,
    `effect_base_points_1` = 74,
    `effect_base_points_2` = 0,
    `effect_mechanic_2` = 0,
    `effect_implicit_target_a_2` = 0,
    `effect_apply_aura_name_2` = 0,
    `spell_visual_1` = 557,
    `spell_icon_id` = 5590,
    `spell_name_enus` = 'Searing Shot',
    `spell_subtext_flags` = 16712190,
    `spell_desc_enus` = 'An instant shot that causes $m1% of weapon damage as fire damage. Empowered by the same effects as your Arcane Shot.',
    `spell_tooltip_enus` = 'Searing Shot',
    `power_cost_percentage` = 0,
    `start_recovery_category` = 133,
    `spell_class_mask_1` = 2048,
    `prevention_type` = 0,
    `school_mask` = 4,
    `effect_bonus_multiplier_1` = '0E-16',
    `effect_bonus_multiplier_2` = '0E-16'
WHERE `id` = 34490;

-- ============================================================
-- F-153 Hunter Tuning: pet utility & Aspect of the Fish (relocated)
-- Relocated from zep-legacy/dbc/[BASE,F-044]_spell.sql (stock-spell UPDATEs, idempotent).
-- ============================================================
UPDATE `spell` SET `spell_icon_id` = 1581, `spell_name_enus` = 'Ankle Crack', `spell_subtext_flags` = 16712190, `spell_tooltip_flags` = 16712190 WHERE `id` = 6580;
UPDATE `spell` SET `spell_icon_id` = 1581, `spell_name_enus` = 'Ankle Crack', `spell_subtext_flags` = 16712190, `spell_desc_flags` = 16712190, `spell_tooltip_enus` = 'Movement speed reduced', `spell_tooltip_flags` = 16712190 WHERE `id` = 6581;
UPDATE `spell` SET `category` = 47, `attributes` = 327696, `attributes_ex_3` = 67108864, `attributes_ex_4` = 524288, `category_recovery_time` = 1000, `aura_interrupt_flags` = 0, `proc_flags` = 0, `proc_chance` = 101, `base_level` = 20, `spell_level` = 20, `power_cost` = 0, `effect_1` = 6, `effect_2` = 6, `effect_base_points_1` = 49, `effect_implicit_target_a_2` = 1, `effect_radius_index_1` = 0, `effect_apply_aura_name_1` = 58, `effect_apply_aura_name_2` = 82, `effect_amplitude_2` = 1, `spell_icon_id` = 2533, `spell_name_enus` = 'Aspect of the Fish', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'The hunter takes on the aspect of a fish, increasing swim speed by $s1%.  Only one Aspect can be active at a time.', `spell_tooltip_enus` = 'Increases swim speed by $s1%', `start_recovery_category` = 0, `start_recovery_time` = 0, `damage_class` = 0, `prevention_type` = 0 WHERE `id` = 36613;
UPDATE `spell` SET `attributes` = 327696, `attributes_ex_1` = 512, `cast_time_index` = 1, `recovery_time` = 20000, `interrupt_flags` = 0, `base_level` = 1, `spell_level` = 1, `duration_index` = 18, `power_type` = 2, `power_cost` = 20, `reagent_1` = 0, `reagent_2` = 0, `reagent_5` = 0, `reagent_6` = 0, `reagent_7` = 0, `reagent_8` = 0, `reagent_count_1` = 0, `reagent_count_2` = 0, `reagent_count_5` = 0, `reagent_count_6` = 0, `reagent_count_7` = 0, `reagent_count_8` = 0, `effect_1` = 6, `effect_base_points_1` = 4, `effect_implicit_target_a_1` = 20, `effect_radius_index_1` = 12, `effect_apply_aura_name_1` = 192, `effect_item_type_1` = 0, `spell_visual_1` = 11387, `spell_icon_id` = 2225, `spell_name_enus` = 'Dance of the Dragon', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Hastens all nearby party members. Increasing melee and ranged haste by $s1 for $d.', `spell_desc_flags` = 16712190, `spell_tooltip_enus` = 'Melee and ranged haste increased by $s1%.', `spell_tooltip_flags` = 16712190, `spell_class_set` = 9, `spell_class_mask_2` = 268435456, `damage_class` = 2, `prevention_type` = 2, `totem_category_1` = 0 WHERE `id` = 56992;
