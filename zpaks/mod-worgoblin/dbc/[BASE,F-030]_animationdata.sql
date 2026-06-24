-- [BASE,F-030] mod-worgoblin: animationdata
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_animationdata.sql with overrides

-- animationdata: 1 inserts, 0 updates, 0 deletes
DELETE FROM `animationdata` WHERE `id` = 646;
INSERT INTO `animationdata` (`id`, `name`, `wep_flags`, `body_flags`, `flags`, `fallback_anim_id`, `behavior_id`, `behavior_tier`) VALUES (646, 'MountSelfStart', 16, 256, 3, 0, 646, 0);