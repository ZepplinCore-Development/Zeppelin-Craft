-- [F-149] zep-legacy: skillline
-- Cloud Serpent hunter pet skill

-- skillline: 1 inserts
DELETE FROM `skillline` WHERE `id` = 900;
INSERT INTO `skillline` (`id`, `category`, `cost`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `icon_id`, `verb_enus`, `verb_flags`, `can_link`) VALUES (900, 7, 0, 'Pet - Cloud Serpent', 16712190, '', 16712172, 0, '', 16712172, 0);
