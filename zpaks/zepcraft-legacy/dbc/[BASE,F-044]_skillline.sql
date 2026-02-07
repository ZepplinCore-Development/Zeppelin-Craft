-- [BASE,F-044] zepcraft-legacy: skillline
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_skillline.sql with overrides

-- skillline: 5 inserts, 1 updates, 0 deletes
DELETE FROM `skillline` WHERE `id` = 789;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (789, 7, 0, 'Racial - Worgen', 16712190, '', 16712172, 0, '', 16712172, 0);
DELETE FROM `skillline` WHERE `id` = 790;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (790, 9, 0, 'Racial - Goblin', 16712190, '', 16712172, 133032, '', 16712172, 0);
DELETE FROM `skillline` WHERE `id` = 791;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (791, 7, 0, '.Professions', 16712190, '', 16712190, 162, 'Modify', 16712190, 0);
DELETE FROM `skillline` WHERE `id` = 792;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (792, 7, 0, '.Perks', 16712190, '', 16712190, 5585, 'Modify', 16712190, 0);
DELETE FROM `skillline` WHERE `id` = 900;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (900, 7, 0, 'Pet - Cloud Serpent', 16712190, '', 16712172, 0, '', 16712172, 0);
UPDATE `skillline` SET `category` = 9 WHERE `id` = 633;