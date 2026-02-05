-- [BASE,F-044] zepcraft-legacy: currencycategory
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_currencycategory.sql with overrides

-- currencycategory: 1 inserts, 7 updates, 1 deletes
DELETE FROM `currencycategory` WHERE `id` = 41;
DELETE FROM `currencycategory` WHERE `id` = 24;
INSERT INTO `currencycategory` (`id`, `flags`, `name_enus`, `name_flags`) VALUES (24, 0, 'Holidays', 16712188);
UPDATE `currencycategory` SET `name_flags` = 16712188 WHERE `id` = 1;
UPDATE `currencycategory` SET `name_enus` = 'PVP', `name_flags` = 16712188 WHERE `id` = 2;
UPDATE `currencycategory` SET `name_flags` = 16712188 WHERE `id` = 3;
UPDATE `currencycategory` SET `name_flags` = 16712188 WHERE `id` = 4;
UPDATE `currencycategory` SET `name_flags` = 16712188 WHERE `id` = 21;
UPDATE `currencycategory` SET `name_enus` = 'Raid', `name_flags` = 16712188 WHERE `id` = 22;
UPDATE `currencycategory` SET `name_flags` = 16712188 WHERE `id` = 23;