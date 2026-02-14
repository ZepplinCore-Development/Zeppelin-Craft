-- [F-157] fishing-bag-mechanic: totemcategory
-- Create "Fishing Pole" totem category for bag-based fishing

-- totemcategory: 1 insert
DELETE FROM `totemcategory` WHERE `id` = 221;
INSERT INTO `totemcategory` (`id`, `name_enus`, `category_type`, `category_mask`) VALUES (221, 'Fishing Pole', 0, 1);
