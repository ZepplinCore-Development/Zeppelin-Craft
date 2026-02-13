-- [F-065] zepcraft-legacy: currencytypes
-- PvP token currencies (Mark of Honor Hold, Mark of Thrallmar)

-- currencytypes: 2 inserts
DELETE FROM `currencytypes` WHERE `id` = 361;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (361, 24579, 1, 30);
DELETE FROM `currencytypes` WHERE `id` = 381;
INSERT INTO `currencytypes` (`id`, `item`, `category`, `bit_index`) VALUES (381, 24581, 1, 31);
