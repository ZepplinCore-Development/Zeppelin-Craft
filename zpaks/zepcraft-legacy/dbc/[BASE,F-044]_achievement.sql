-- [BASE,F-044] zepcraft-legacy: achievement
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_achievement.sql with overrides

-- achievement: 2 inserts
DELETE FROM `achievement` WHERE `id` = 1429;
INSERT INTO `achievement` (`id`, `faction`, `map`, `previous`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `category`, `points`, `order_in_category`, `flags`, `spell_icon`, `reward_enus`, `reward_flags`, `min_criteria_demand`, `linked_achievement`) VALUES (1429, -1, -1, 0, 'Realm First! Level 80 Goblin', 16712190, 'First goblin on the realm to achieve level 80.', 16712190, 81, 0, 161, 256, 463874, '', 16712174, 0, 0);
DELETE FROM `achievement` WHERE `id` = 1430;
INSERT INTO `achievement` (`id`, `faction`, `map`, `previous`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `category`, `points`, `order_in_category`, `flags`, `spell_icon`, `reward_enus`, `reward_flags`, `min_criteria_demand`, `linked_achievement`) VALUES (1430, -1, -1, 0, 'Realm First! Level 80 Worgen', 16712190, 'First worgen on the realm to achieve level 80.', 16712190, 81, 0, 162, 256, 463876, '', 16712174, 0, 0);
