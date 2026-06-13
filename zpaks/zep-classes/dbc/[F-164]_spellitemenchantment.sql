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

-- New custom enchants 9000-9005 → AP passives 900250-900255 (Rockbiter R5-R10).
-- type 3 = EQUIP_SPELL. The enchant-spells (900240-900245) reference these via
-- effect_misc_value_a_1, applied on the weapon by the C++ Rockbiter damage-switch.
DELETE FROM `spellitemenchantment` WHERE `id` IN (9000, 9001, 9002, 9003, 9004, 9005);
INSERT INTO `spellitemenchantment`
    (`id`, `spell_dispel_type_2`, `object_id_2`, `s_ref_name_enus`, `s_ref_name_flags`, `item_visuals`, `flags`)
VALUES
    (9000, 3, 900250, 'Rockbiter 5',  16712190, 61, 9),
    (9001, 3, 900251, 'Rockbiter 6',  16712190, 61, 9),
    (9002, 3, 900252, 'Rockbiter 7',  16712190, 61, 9),
    (9003, 3, 900253, 'Rockbiter 8',  16712190, 61, 9),
    (9004, 3, 900254, 'Rockbiter 9',  16712190, 61, 9),
    (9005, 3, 900255, 'Rockbiter 10', 16712190, 61, 9);
