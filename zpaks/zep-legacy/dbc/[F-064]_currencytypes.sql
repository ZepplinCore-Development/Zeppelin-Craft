-- [F-064] zep-legacy: currencytypes
-- Badge of Heroism currency

-- currencytypes: 1 inserts
DELETE FROM `currencytypes` WHERE `id` = 6;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (6, 58200, 1, 4);
