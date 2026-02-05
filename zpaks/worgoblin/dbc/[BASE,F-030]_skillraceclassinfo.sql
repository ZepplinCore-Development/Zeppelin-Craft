-- [BASE,F-030] worgoblin: skillraceclassinfo
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_skillraceclassinfo.sql with overrides

-- skillraceclassinfo: 2 inserts, 30 updates, 0 deletes
DELETE FROM `skillraceclassinfo` WHERE `id` = 971;
INSERT INTO `skillraceclassinfo` (`id`, `skill_line_dbc_record`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_index`) VALUES (971, 789, 2048, 1469, 1170, 0, 0, 0);
DELETE FROM `skillraceclassinfo` WHERE `id` = 972;
INSERT INTO `skillraceclassinfo` (`id`, `skill_line_dbc_record`, `race_mask`, `class_mask`, `flags`, `min_level`, `skill_tier_id`, `skill_cost_index`) VALUES (972, 790, 256, 509, 1170, 0, 0, 0);
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 21;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 27;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 28;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 29;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 30;
UPDATE `skillraceclassinfo` SET `race_mask` = 3149 WHERE `id` = 40;
UPDATE `skillraceclassinfo` SET `race_mask` = 930 WHERE `id` = 41;
UPDATE `skillraceclassinfo` SET `race_mask` = 946 WHERE `id` = 48;
UPDATE `skillraceclassinfo` SET `race_mask` = 3149 WHERE `id` = 49;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 84;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 85;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 88;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 93;
UPDATE `skillraceclassinfo` SET `race_mask` = 2340 WHERE `id` = 133;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 145;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 146;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 147;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 148;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 241;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 243;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 244;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 246;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 281;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 282;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 284;
UPDATE `skillraceclassinfo` SET `race_mask` = 288 WHERE `id` = 624;
UPDATE `skillraceclassinfo` SET `race_mask` = 261855 WHERE `id` = 625;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 865;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 866;
UPDATE `skillraceclassinfo` SET `race_mask` = 4095 WHERE `id` = 899;