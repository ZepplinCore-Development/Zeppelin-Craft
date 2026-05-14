-- [BASE,F-044] zep-legacy: spellvisualeffectname
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_spellvisualeffectname.sql with overrides

-- spellvisualeffectname: 4 inserts, 1 updates, 0 deletes
DELETE FROM `spellvisualeffectname` WHERE `id` = 7101;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7101, 'Mana Shield State Base', 'Spells\\ShadowWard_Impact_Chest.mdx', '1.0000000000000000', '1.0000000000000000', '0.0099999997764826', '100.0000000000000000');
DELETE FROM `spellvisualeffectname` WHERE `id` = 7102;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7102, 'Mana Shield State Base', 'spells\\banish_chest_purple.mdx', '1.0000000000000000', '1.0000000000000000', '0.0099999997764826', '100.0000000000000000');
DELETE FROM `spellvisualeffectname` WHERE `id` = 7103;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7103, 'Mana Shield State Base', 'spells\\ArcaneForceShield_Purple.mdx', '1.0000000000000000', '1.0000000000000000', '0.0099999997764826', '100.0000000000000000');
UPDATE `spellvisualeffectname` SET `file_name` = 'spells\\arcaneforceshield_purple.mdx', `area_effect_size` = '1.0000000000000000', `scale` = '1.2000000476837158' WHERE `id` = 718;