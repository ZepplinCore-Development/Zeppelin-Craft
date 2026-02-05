-- [BASE,F-044] zepcraft-legacy: loadingscreens
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_loadingscreens.sql with overrides

-- loadingscreens: 13 inserts, 87 updates, 0 deletes
DELETE FROM `loadingscreens` WHERE `id` = 255;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (255, 'InstanceCoTHyjal', 'Interface\\Glues\\LoadingScreens\\LoadScreenHyjal.blp', 1);
DELETE FROM `loadingscreens` WHERE `id` = 257;
INSERT INTO `loadingscreens` (`id`, `name`, `file_name`, `has_wide_screen`) VALUES (257, 'InstanceCoTOpening', 'Interface\\Glues\\LoadingScreens\\LoadScreenOpening.blp', 1);
