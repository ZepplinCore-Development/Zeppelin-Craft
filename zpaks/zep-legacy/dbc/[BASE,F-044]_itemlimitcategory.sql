-- [BASE,F-044] zep-legacy: itemlimitcategory
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_itemlimitcategory.sql with overrides

-- itemlimitcategory: 1 inserts, 0 updates, 0 deletes
DELETE FROM `itemlimitcategory` WHERE `id` = 86;
INSERT INTO `itemlimitcategory` (`id`, `name_enus`, `name_flags`, `quantity`, `flags`) VALUES (86, 'Arcane Ward', 16712190, 1, 0);