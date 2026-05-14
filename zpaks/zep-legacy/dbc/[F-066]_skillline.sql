-- [F-066] zep-legacy: skillline
-- Custom ".Perks" spellbook category

-- skillline: 1 inserts
DELETE FROM `skillline` WHERE `id` = 792;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (792, 7, 0, '.Perks', 16712190, '', 16712190, 5585, 'Modify', 16712190, 0);
