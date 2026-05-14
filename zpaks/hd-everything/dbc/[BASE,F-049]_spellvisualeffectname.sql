-- [BASE,F-049] hd-trees-and-textures: spellvisualeffectname
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_spellvisualeffectname.sql with overrides

-- spellvisualeffectname: 1 inserts, 0 updates, 0 deletes
DELETE FROM `spellvisualeffectname` WHERE `id` = 7100;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7100, 'Divine Fury', 'spells\\shadowfury_impact_base_yellow.mdx', '1.0000000000000000', '1.0000000000000000', '0.0099999997764826', '100.0000000000000000');