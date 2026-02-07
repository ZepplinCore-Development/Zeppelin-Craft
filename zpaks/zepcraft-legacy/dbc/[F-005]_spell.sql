-- F-005: Remove mount-not-allowed-in-combat flag from mounted spells
UPDATE `dbc`.`spell`
SET `attributes_ex_4` = `attributes_ex_4` & ~67108864
WHERE (`effect_apply_aura_name_1` = 78
   OR `effect_apply_aura_name_2` = 78
   OR `effect_apply_aura_name_3` = 78)
  AND (`attributes_ex_4` & 67108864) = 67108864;
