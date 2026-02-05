-- [BASE,F-049] hd-creatures-mounts: creaturefamily
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_creaturefamily.sql with overrides

-- creaturefamily: 1 inserts, 1 updates, 0 deletes
DELETE FROM `creaturefamily` WHERE `id` = 108;
INSERT INTO `creaturefamily` (`id`, `min_scale`, `min_scale_level`, `max_scale`, `max_scale_level`, `skillline_1`, `petfoodmask`, `pettalenttype`, `categoryenumid`, `name_1`, `name_flags`, `iconpath`) VALUES (108, '0.3000000119209290', 1, '0.3000000119209290', 60, 206, 0, 4294967295, 4294967295, 'Infernal', 16712190, '');
UPDATE `creaturefamily` SET `min_scale` = '0.3000000119209290', `max_scale` = '0.3000000119209290' WHERE `id` = 19;