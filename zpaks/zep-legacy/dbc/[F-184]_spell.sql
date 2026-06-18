-- F-184: Guild Bank Summon - DBC spell override
-- Summon Guild Bank spell for the .Perks spell-tab skill line (see [F-066]_skillline.sql).
-- Relocated from zep-legacy/dbc/[BASE,F-044]_spell.sql. Stock-spell UPDATE (idempotent).

UPDATE `spell` SET `attributes` = 268435456, `cast_time_index` = 12, `effect_1` = 76, `effect_radius_index_1` = 16, `effect_misc_value_a_1` = 187299, `spell_name_enus` = 'Summon Guild Bank', `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'Right Click to summon your Guild Bank.', `spell_tooltip_flags` = 16712190, `effect_bonus_multiplier_1` = '1.0000000000000000' WHERE `id` = 42766;
