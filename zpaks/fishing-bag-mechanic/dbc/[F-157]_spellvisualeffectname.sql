-- [F-157] fishing-bag-mechanic: spellvisualeffectname
-- Create fishing pole spell visual effect for right_weapon_effect on fishing visual kits
-- Uses the Big Iron Fishing Pole weapon model

-- spellvisualeffectname: 1 insert
DELETE FROM `spellvisualeffectname` WHERE `id` = 7104;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7104, 'Fishing Pole', 'Item\\ObjectComponents\\Weapon\\Misc_2H_FishingPole_A_01.mdx', 0.0, 1.0, 0.01, 100.0);
