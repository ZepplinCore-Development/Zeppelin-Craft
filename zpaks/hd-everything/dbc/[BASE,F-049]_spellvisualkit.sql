-- [BASE,F-049] hd-everything: spellvisualkit
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_spellvisualkit.sql with overrides

-- spellvisualkit: 1 inserts, 0 updates, 0 deletes
DELETE FROM `spellvisualkit` WHERE `id` = 16000;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `head_effect`, `chest_effect`, `base_effect`, `left_hand_effect`, `right_hand_effect`, `breath_effect`, `left_weapon_effect`, `right_weapon_effect`, `world_effect`, `sound_id`, `shake_id`, `flags`) VALUES (16000, 4294967295, 54, 0, 0, 7100, 0, 0, 0, 0, 0, 0, 10065, 3, 0);