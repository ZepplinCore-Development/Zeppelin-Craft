-- [BASE,F-049] hd-creatures-mounts: creaturefamily
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_creaturefamily.sql with overrides

-- creaturefamily: 1 inserts, 1 updates, 0 deletes
DELETE FROM `creaturefamily` WHERE `id` = 108;
INSERT INTO `creaturefamily` (`id`, `min_scale`, `min_scale_level`, `max_scale`, `max_scale_level`, `skill_line_1`, `skill_line_2`, `pet_food_mask`, `pet_talent_type`, `category_enum_id`, `name_enus`, `name_flags`, `icon`) VALUES (108, '0.3000000119209290', 1, '0.3000000119209290', 60, 206, 0, 0, -1, -1, 'Infernal', 16712190, '');
UPDATE `creaturefamily` SET `min_scale` = '0.3000000119209290', `max_scale` = '0.3000000119209290' WHERE `id` = 19;