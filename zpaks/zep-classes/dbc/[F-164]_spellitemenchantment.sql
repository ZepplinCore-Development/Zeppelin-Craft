-- [F-164] Rockbiter Weapon - Replace flat DPS with passive equip spells
-- Disables enchant slot 1 (type 6 flat DPS) and adds EQUIP_SPELL (type 3)
-- in slot 2 pointing to per-rank passive spells that provide AP + threat.
-- 14 AP = 1 DPS, so passives replicate the same damage bonus as the old type 6.

-- Rockbiter R1 enchants (29, 3021-3023) → passive 900138 (28 AP = 2 DPS)
UPDATE `spellitemenchantment` SET
    `spell_dispel_type_1` = 0, `min_amount_1` = 0, `max_amount_1` = 0,
    `spell_dispel_type_2` = 3, `object_id_2` = 900138
WHERE `id` IN (29, 3021, 3022, 3023);

-- Rockbiter R2 enchants (6, 3024-3026) → passive 900139 (56 AP = 4 DPS)
UPDATE `spellitemenchantment` SET
    `spell_dispel_type_1` = 0, `min_amount_1` = 0, `max_amount_1` = 0,
    `spell_dispel_type_2` = 3, `object_id_2` = 900139
WHERE `id` IN (6, 3024, 3025, 3026);

-- Rockbiter R3 enchants (1, 3027-3029) → passive 900140 (84 AP = 6 DPS)
UPDATE `spellitemenchantment` SET
    `spell_dispel_type_1` = 0, `min_amount_1` = 0, `max_amount_1` = 0,
    `spell_dispel_type_2` = 3, `object_id_2` = 900140
WHERE `id` IN (1, 3027, 3028, 3029);

-- Rockbiter R4 enchants (503, 3030-3032) → passive 900141 (140 AP = 10 DPS)
UPDATE `spellitemenchantment` SET
    `spell_dispel_type_1` = 0, `min_amount_1` = 0, `max_amount_1` = 0,
    `spell_dispel_type_2` = 3, `object_id_2` = 900141
WHERE `id` IN (503, 3030, 3031, 3032);

-- R5-R9 enchants: clear the old 900138 reference (not used in WotLK)
UPDATE `spellitemenchantment` SET
    `spell_dispel_type_2` = 0, `object_id_2` = 0
WHERE `id` IN (683, 1663, 1664, 2632, 2633, 3018, 3019, 3020,
               3033, 3034, 3035, 3036, 3037, 3038, 3039, 3040,
               3041, 3042, 3043, 3044);
