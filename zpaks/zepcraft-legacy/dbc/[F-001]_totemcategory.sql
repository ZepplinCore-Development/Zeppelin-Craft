-- F-001: Custom Profession Tools - TotemCategory entries
-- Jeweler's Kit, Smithing Hammers, Pruning Shears, Tinkering Tools, Gnomish Army Knife updates

-- Jeweler's Kit
DELETE FROM `totemcategory` WHERE `id` = 191;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (191, 'Jeweler\'s Kit', 16712190, 24, 536870912);

-- Smithing Hammers (tiered categories)
DELETE FROM `totemcategory` WHERE `id` = 192;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (192, 'Bronze Smithing Hammer', 16712190, 4, 3);
DELETE FROM `totemcategory` WHERE `id` = 193;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (193, 'Iron Smithing Hammer', 16712190, 4, 7);
DELETE FROM `totemcategory` WHERE `id` = 194;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (194, 'Mithril Smithing Hammer', 0, 0, 15);
DELETE FROM `totemcategory` WHERE `id` = 195;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (195, 'Thorium Smithing Hammer', 0, 0, 31);
DELETE FROM `totemcategory` WHERE `id` = 197;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (197, 'Felsteel Smithing Hammer', 0, 0, 63);
DELETE FROM `totemcategory` WHERE `id` = 198;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (198, 'Titanium Smithing Hammer', 0, 0, 127);

-- Pruning Shears (tiered categories)
DELETE FROM `totemcategory` WHERE `id` = 199;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (199, 'Basic Pruning Shears', 0, 0, 1);
DELETE FROM `totemcategory` WHERE `id` = 200;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (200, 'Bronze Pruning Shears', 0, 0, 3);

-- Tinkering Tools
DELETE FROM `totemcategory` WHERE `id` = 220;
INSERT INTO `totemcategory` (`id`, `name_enus`, `name_flags`, `category_type`, `category_mask`) VALUES (220, 'Tinkering Tools', 0, 24, 7);

-- Gnomish Army Knife and Basic Smithing Hammer updates
UPDATE `totemcategory` SET `category_mask` = 2684354623 WHERE `id` = 161;
UPDATE `totemcategory` SET `name_enus` = 'Basic Smithing Hammer', `category_type` = 4, `category_mask` = 1 WHERE `id` = 162;
