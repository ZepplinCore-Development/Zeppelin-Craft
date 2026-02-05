-- [BASE,F-140] fog-distance: animationdata
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-140]_animationdata.sql with overrides

-- animationdata: 1 inserts, 0 updates, 0 deletes
DELETE FROM `animationdata` WHERE `id` = 646;
INSERT INTO `animationdata` (`id`, `name`, `weapon_flags`, `body_flags`, `flags`, `fallback_animation_id`, `behaviour_id`, `behaviour_tier`) VALUES (646, 'MountSelfStart', 16, 256, 3, 0, 646, 0);