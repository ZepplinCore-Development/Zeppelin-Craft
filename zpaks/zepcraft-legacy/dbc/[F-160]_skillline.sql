-- [F-160] zepcraft-legacy: skillline
-- Custom ".Professions" spellbook category

-- skillline: 1 inserts
DELETE FROM `skillline` WHERE `id` = 791;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (791, 7, 0, '.Professions', 16712190, '', 16712190, 162, 'Modify', 16712190, 0);
