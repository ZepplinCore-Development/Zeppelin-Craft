-- [F-014] Mage Tuning: spell
-- Conjure Water per-level scaling (moved from [F-078]_spell.sql)

UPDATE `spell` SET `max_level` = 5, `base_level` = 1, `spell_level` = 1, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5504;
UPDATE `spell` SET `max_level` = 9, `base_level` = 5, `spell_level` = 5, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5505;
UPDATE `spell` SET `max_level` = 19, `base_level` = 15, `spell_level` = 15, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5506;
UPDATE `spell` SET `max_level` = 29, `base_level` = 25, `spell_level` = 25, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 6127;
