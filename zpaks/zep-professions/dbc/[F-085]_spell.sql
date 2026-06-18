-- F-085: Portable Forge and Anvil - DBC spell overrides
-- Relocated from zep-legacy/dbc/[BASE,F-044]_spell.sql.
-- Stock-spell UPDATE (idempotent).

UPDATE `spell` SET `attributes` = 268435456, `cast_time_index` = 12, `duration_index` = 5, `effect_3` = 0, `effect_misc_value_a_1` = 21270, `effect_misc_value_a_2` = 21271, `effect_trigger_spell_3` = 0, `spell_visual_1` = 10383, `spell_icon_id` = 2773, `spell_name_enus` = 'Thermal Anvil', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Right Click to summon your Thermal Anvil.', `spell_tooltip_flags` = 16712190, `effect_damage_multiplier_3` = '0E-16', `effect_bonus_multiplier_2` = '1.0000000000000000' WHERE `id` = 40530;
