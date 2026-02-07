-- [BASE,F-044] zepcraft-legacy: spellvisualkit
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_spellvisualkit.sql with overrides

-- spellvisualkit: 4 inserts, 2 updates, 0 deletes
DELETE FROM `spellvisualkit` WHERE `id` = 16000;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `head_effect`, `chest_effect`, `base_effect`, `left_hand_effect`, `right_hand_effect`, `breath_effect`, `left_weapon_effect`, `right_weapon_effect`, `world_effect`, `sound_id`, `shake_id`, `flags`) VALUES (16000, 4294967295, 54, 0, 0, 7100, 0, 0, 0, 0, 0, 0, 10065, 3, 0);
DELETE FROM `spellvisualkit` WHERE `id` = 16001;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `head_effect`, `chest_effect`, `base_effect`, `left_hand_effect`, `right_hand_effect`, `breath_effect`, `left_weapon_effect`, `right_weapon_effect`, `world_effect`, `sound_id`, `shake_id`, `flags`) VALUES (16001, 0, 0, 0, 7101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `spellvisualkit` WHERE `id` = 16002;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `head_effect`, `chest_effect`, `base_effect`, `left_hand_effect`, `right_hand_effect`, `breath_effect`, `left_weapon_effect`, `right_weapon_effect`, `world_effect`, `sound_id`, `shake_id`, `flags`) VALUES (16002, 4294967295, 4294967295, 0, 0, 1784, 0, 0, 0, 0, 0, 0, 1432, 0, 0);
DELETE FROM `spellvisualkit` WHERE `id` = 16003;
INSERT INTO `spellvisualkit` (`id`, `start_anim_id`, `anim_id`, `head_effect`, `chest_effect`, `base_effect`, `left_hand_effect`, `right_hand_effect`, `breath_effect`, `left_weapon_effect`, `right_weapon_effect`, `world_effect`, `sound_id`, `shake_id`, `flags`) VALUES (16003, 4294967295, 123, 0, 0, 0, 1785, 1785, 0, 0, 0, 0, 3256, 0, 0);
UPDATE `spellvisualkit` SET `start_anim_id` = 0 WHERE `id` = 173;
UPDATE `spellvisualkit` SET `start_anim_id` = 0, `anim_id` = 0 WHERE `id` = 990;