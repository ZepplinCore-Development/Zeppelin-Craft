-- [F-052] zepcraft-legacy: spellicon
-- Custom Verdan the Everliving icon for Wailing Caverns achievements

DELETE FROM `spellicon` WHERE `id` = 514645;
INSERT INTO `spellicon` (`id`, `name`) VALUES (514645, 'Interface\\Icons\\achievement_boss_loatheb_BASIC_GREEN');
