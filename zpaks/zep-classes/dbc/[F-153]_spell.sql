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
