-- [BASE,F-044] zep-legacy: totemcategory
-- Imported by zep dbc import-module
-- F-001 entries extracted to [F-001]_totemcategory.sql

-- totemcategory: 1 insert
DELETE FROM `totemcategory` WHERE `id` = 210;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (210, 'Riding Crop', 0, 0, 0);
