-- [F-078] Food and Drink Efficacy: spell
-- QOL buff to all food and drink restoration values

-- Food/Drink efficacy buff
-- Drink: 2x mana restoration (all spells named 'Drink' with periodic energize aura)
UPDATE `spell` SET `effect_base_points_2` = `effect_base_points_2` * 2
WHERE `spell_name_enus` = 'Drink' AND `effect_apply_aura_name_2` = 226 AND `effect_base_points_2` > 0;

-- Food: 1.5x health restoration (all spells named 'Food' with periodic heal aura)
UPDATE `spell` SET `effect_base_points_1` = FLOOR(`effect_base_points_1` * 1.5)
WHERE `spell_name_enus` = 'Food' AND `effect_apply_aura_name_1` = 84 AND `effect_base_points_1` > 0;
