-- [BASE,F-044] zepcraft-legacy: creaturefamily
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_creaturefamily.sql with overrides

-- creaturefamily: 1 inserts, 0 updates, 0 deletes
DELETE FROM `creaturefamily` WHERE `id` = 47;
INSERT INTO `creaturefamily` (`id`, `min_scale`, `min_scale_level`, `max_scale`, `max_scale_level`, `skillline_1`, `skillline_2`, `petfoodmask`, `pettalenttype`, `categoryenumid`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `iconpath`) VALUES (47, '0.4000000059604645', 1, '0.5000000000000000', 60, 789, 270, 1, 1, 64, 'Cloud Serpent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 'InterfaceIconsSpell_Nature_GuardianWard');