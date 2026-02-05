-- [BASE,F-044] zepcraft-legacy: totemcategory
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_totemcategory.sql with overrides

-- totemcategory: 10 inserts, 2 updates, 0 deletes
DELETE FROM `totemcategory` WHERE `id` = 191;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (191, 'Jeweler\'s Kit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 24, 536870912);
DELETE FROM `totemcategory` WHERE `id` = 192;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (192, 'Bronze Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 4, 3);
DELETE FROM `totemcategory` WHERE `id` = 193;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (193, 'Iron Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712190, 4, 7);
DELETE FROM `totemcategory` WHERE `id` = 194;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (194, 'Mithril Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 15);
DELETE FROM `totemcategory` WHERE `id` = 195;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (195, 'Thorium Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 31);
DELETE FROM `totemcategory` WHERE `id` = 197;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (197, 'Felsteel Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 63);
DELETE FROM `totemcategory` WHERE `id` = 198;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (198, 'Titanium Smithing Hammer', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 127);
DELETE FROM `totemcategory` WHERE `id` = 199;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (199, 'Basic Pruning Shears', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 1);
DELETE FROM `totemcategory` WHERE `id` = 200;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (200, 'Bronze Pruning Shears', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 3);
DELETE FROM `totemcategory` WHERE `id` = 210;
INSERT INTO `totemcategory` (`id`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `category_type`, `category_mask`) VALUES (210, 'Riding Crop', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0);
UPDATE `totemcategory` SET `category_mask` = 2684354623 WHERE `id` = 161;
UPDATE `totemcategory` SET `name_1` = 'Basic Smithing Hammer', `category_type` = 4, `category_mask` = 1 WHERE `id` = 162;