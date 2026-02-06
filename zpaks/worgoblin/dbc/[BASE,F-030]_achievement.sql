-- [BASE,F-030] worgoblin: achievement
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_achievement.sql with overrides

-- achievement: 2 inserts, 2 updates, 0 deletes
DELETE FROM `achievement` WHERE `id` = 1429;
INSERT INTO `achievement` (`id`, `required_faction`, `map_id`, `parent_achievement`, `name_1`, `name_flags`, `description_1`, `description_flags`, `category_id`, `points`, `order_in_category`, `flags`, `icon`, `title_reward_1`, `title_reward_flags`, `count`, `ref_achievement`) VALUES (1429, -1, -1, 0, 'Realm First! Level 80 Goblin', 16712190, 'First goblin on the realm to achieve level 80.', 16712190, 81, 0, 161, 256, 463874, '', 16712174, 0, 0);
DELETE FROM `achievement` WHERE `id` = 1430;
INSERT INTO `achievement` (`id`, `required_faction`, `map_id`, `parent_achievement`, `name_1`, `name_flags`, `description_1`, `description_flags`, `category_id`, `points`, `order_in_category`, `flags`, `icon`, `title_reward_1`, `title_reward_flags`, `count`, `ref_achievement`) VALUES (1430, -1, -1, 0, 'Realm First! Level 80 Worgen', 16712190, 'First worgen on the realm to achieve level 80.', 16712190, 81, 0, 162, 256, 463876, '', 16712174, 0, 0);
UPDATE `achievement` SET `description_1` = 'Get an honorable, killing blow on six different races.' WHERE `id` = 246;
UPDATE `achievement` SET `description_1` = 'Get an honorable, killing blow on six different races.' WHERE `id` = 1005;