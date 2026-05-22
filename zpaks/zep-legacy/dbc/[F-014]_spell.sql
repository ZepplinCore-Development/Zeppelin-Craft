-- [F-014] Mage Tuning: spell
-- Conjure Water per-level scaling (moved from [F-078]_spell.sql)

UPDATE `spell` SET `max_level` = 5, `base_level` = 1, `spell_level` = 1, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5504;
UPDATE `spell` SET `max_level` = 9, `base_level` = 5, `spell_level` = 5, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5505;
UPDATE `spell` SET `max_level` = 19, `base_level` = 15, `spell_level` = 15, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 5506;
UPDATE `spell` SET `max_level` = 29, `base_level` = 25, `spell_level` = 25, `effect_real_points_per_level_1` = '4.0000000000000000', `effect_base_points_1` = 3, `spell_tooltip_flags` = 16712190 WHERE `id` = 6127;

-- I-186 compliance: keep "Conjure Arcane Ward" spells (91058-91066) pointing at
-- the renumbered Arcane Ward items. The 9 items moved 902100-902108 → 58400-58408
-- in zpaks/zep-legacy/sql/zz_arcane_ward_[F-014].sql; the spells use
-- SPELL_EFFECT_CREATE_ITEM (effect_1 = 24) with effect_item_type_1 = item id.

UPDATE `spell` SET `effect_item_type_1` = 58400 WHERE `id` = 91058;  -- Rank 1 → Arcane Ward I
UPDATE `spell` SET `effect_item_type_1` = 58401 WHERE `id` = 91059;  -- Rank 2 → Arcane Ward II
UPDATE `spell` SET `effect_item_type_1` = 58402 WHERE `id` = 91060;  -- Rank 3 → Arcane Ward III
UPDATE `spell` SET `effect_item_type_1` = 58403 WHERE `id` = 91061;  -- Rank 4 → Arcane Ward IV
UPDATE `spell` SET `effect_item_type_1` = 58404 WHERE `id` = 91062;  -- Rank 5 → Arcane Ward V
UPDATE `spell` SET `effect_item_type_1` = 58405 WHERE `id` = 91063;  -- Rank 6 → Arcane Ward VI
UPDATE `spell` SET `effect_item_type_1` = 58406 WHERE `id` = 91064;  -- Rank 7 → Arcane Ward VII
UPDATE `spell` SET `effect_item_type_1` = 58407 WHERE `id` = 91065;  -- Rank 8 → Arcane Ward VIII
UPDATE `spell` SET `effect_item_type_1` = 58408 WHERE `id` = 91066;  -- Rank 9 → Arcane Ward IX
