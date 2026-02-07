-- [BASE,F-030] worgoblin: skillline
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_skillline.sql with overrides

-- skillline: 2 inserts, 0 updates, 0 deletes
DELETE FROM `skillline` WHERE `id` = 789;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (789, 9, 0, 'Racial - Worgen', 16712190, '', 16712172, 132203, '', 16712172, 0);
DELETE FROM `skillline` WHERE `id` = 790;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (790, 9, 0, 'Racial - Goblin', 16712190, '', 16712172, 133032, '', 16712172, 0);