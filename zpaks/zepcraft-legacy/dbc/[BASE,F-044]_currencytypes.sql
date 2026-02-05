-- [BASE,F-044] zepcraft-legacy: currencytypes
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_currencytypes.sql with overrides

-- currencytypes: 3 inserts, 0 updates, 0 deletes
DELETE FROM `currencytypes` WHERE `id` = 6;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (6, 58200, 1, 4);
DELETE FROM `currencytypes` WHERE `id` = 361;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (361, 24579, 1, 30);
DELETE FROM `currencytypes` WHERE `id` = 381;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (381, 24581, 1, 31);