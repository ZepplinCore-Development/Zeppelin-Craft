-- F-040: creaturefamily
-- Extracted by zep dbc extract

-- creaturefamily: 1 inserts, 7 updates, 0 deletes
DELETE FROM `creaturefamily` WHERE `id` = 47;
INSERT INTO `creaturefamily` (`id`, `min_scale`, `min_scale_level`, `max_scale`, `max_scale_level`, `skillline_1`, `skillline_2`, `petfoodmask`, `pettalenttype`, `categoryenumid`, `name_1`, `name_2`, `name_3`, `name_4`, `name_5`, `name_6`, `name_7`, `name_8`, `name_9`, `name_10`, `name_11`, `name_12`, `name_13`, `name_14`, `name_15`, `name_16`, `name_flags`, `iconpath`) VALUES (47, '0.4000000000000000', 1, '0.5000000000000000', 60, 789, 270, 1, 1, 64, 'Cloud Serpent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16712190, 'InterfaceIconsSpell_Nature_GuardianWard');
UPDATE `creaturefamily` SET `max_scale` = '0.7200000000000000' WHERE `id` = 21;
UPDATE `creaturefamily` SET `max_scale` = '0.6300000000000000' WHERE `id` = 24;
UPDATE `creaturefamily` SET `max_scale` = '0.6300000000000000' WHERE `id` = 38;
UPDATE `creaturefamily` SET `min_scale` = '0.3000000000000000' WHERE `id` = 39;
UPDATE `creaturefamily` SET `min_scale` = '0.3500000000000000', `max_scale` = '0.5600000000000000' WHERE `id` = 43;
UPDATE `creaturefamily` SET `min_scale` = '0.3000000000000000', `pettalenttype` = NULL, `name_2` = NULL, `name_3` = NULL, `name_4` = NULL, `name_5` = NULL, `name_6` = NULL, `name_7` = NULL, `name_8` = NULL, `name_9` = NULL, `name_10` = NULL, `name_11` = NULL, `name_12` = NULL, `name_13` = NULL, `name_14` = NULL, `name_15` = NULL, `name_16` = NULL WHERE `id` = 45;
UPDATE `creaturefamily` SET `min_scale` = '0.7000000000000000', `max_scale` = '1.1000000000000000', `pettalenttype` = NULL, `name_2` = NULL, `name_3` = NULL, `name_4` = NULL, `name_5` = NULL, `name_6` = NULL, `name_7` = NULL, `name_8` = NULL, `name_9` = NULL, `name_10` = NULL, `name_11` = NULL, `name_12` = NULL, `name_13` = NULL, `name_14` = NULL, `name_15` = NULL, `name_16` = NULL WHERE `id` = 46;