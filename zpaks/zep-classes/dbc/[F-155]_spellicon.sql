-- [F-155] Paladin Class Tuning: spellicon
-- Chastise spell icons (split from [BASE,F-044]_spellicon.sql)

DELETE FROM `spellicon` WHERE `id` = 4435;
INSERT INTO `spellicon` (`id`, `name`) VALUES (4435, 'INTERFACE\\ICONS\\icon_hots_anduin_chastise');
DELETE FROM `spellicon` WHERE `id` = 4436;
INSERT INTO `spellicon` (`id`, `name`) VALUES (4436, 'INTERFACE\\ICONS\\icon_hots_anduin_chastise_a');
