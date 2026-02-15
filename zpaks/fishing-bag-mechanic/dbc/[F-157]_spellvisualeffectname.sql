-- [F-157] fishing-bag-mechanic: spellvisualeffectname
-- Custom SpellObject model with hardcoded texture and correct grip origin

-- spellvisualeffectname: 1 insert
DELETE FROM `spellvisualeffectname` WHERE `id` = 7104;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES (7104, 'Fishing Pole', 'Spells\\FishingPole_SpellObject.mdx', 0.0, 1.0, 0.01, 100.0);
DELETE FROM `spellvisualeffectname` WHERE `id` = 7105;
