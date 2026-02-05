-- [BASE,F-030] worgoblin: skillline
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-030]_skillline.sql with overrides

-- skillline: 2 inserts, 9 updates, 0 deletes
DELETE FROM `skillline` WHERE `id` = 789;
INSERT INTO `skillline` (`id`, `category`, `cost_id`, `name_1`, `name_flags`, `description_1`, `description_flags`, `spell_icon`, `tooltip_1`, `tooltip_2`, `tooltip_3`, `tooltip_4`, `tooltip_5`, `tooltip_6`, `tooltip_7`, `tooltip_8`, `tooltip_9`, `tooltip_10`, `tooltip_11`, `tooltip_12`, `tooltip_13`, `tooltip_14`, `tooltip_15`, `tooltip_16`, `tooltip_flags`, `can_link`) VALUES (789, 9, 0, 'Racial - Worgen', 16712190, '', 16712172, 132203, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712172, 0);
DELETE FROM `skillline` WHERE `id` = 790;
INSERT INTO `skillline` (`id`, `category`, `cost_id`, `name_1`, `name_flags`, `description_1`, `description_flags`, `spell_icon`, `tooltip_1`, `tooltip_2`, `tooltip_3`, `tooltip_4`, `tooltip_5`, `tooltip_6`, `tooltip_7`, `tooltip_8`, `tooltip_9`, `tooltip_10`, `tooltip_11`, `tooltip_12`, `tooltip_13`, `tooltip_14`, `tooltip_15`, `tooltip_16`, `tooltip_flags`, `can_link`) VALUES (790, 9, 0, 'Racial - Goblin', 16712190, '', 16712172, 133032, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 16712172, 0);
UPDATE `skillline` SET `tooltip_2` = '개조', `tooltip_3` = 'Modifier', `tooltip_4` = 'Umarbeiten', `tooltip_5` = '修改', `tooltip_7` = 'Transformar', `tooltip_8` = 'Transformar', `tooltip_9` = 'Выковать' WHERE `id` = 164;
UPDATE `skillline` SET `tooltip_2` = '새김무늬', `tooltip_3` = 'Estamper', `tooltip_4` = 'Prägen', `tooltip_5` = '雕饰', `tooltip_7` = 'Remachar', `tooltip_8` = 'Remachar', `tooltip_9` = 'Украсить' WHERE `id` = 165;
UPDATE `skillline` SET `tooltip_2` = '보충', `tooltip_3` = 'Remplir', `tooltip_4` = 'Nachfüllen', `tooltip_5` = '装填', `tooltip_7` = 'Rellenar', `tooltip_8` = 'Rellenar', `tooltip_9` = 'Наполнить' WHERE `id` = 171;
UPDATE `skillline` SET `tooltip_2` = '자수', `tooltip_3` = 'Broder', `tooltip_4` = 'Besticken', `tooltip_5` = '刺绣', `tooltip_7` = 'Bordar', `tooltip_8` = 'Bordar', `tooltip_9` = 'Вышить' WHERE `id` = 197;
UPDATE `skillline` SET `tooltip_2` = '수선', `tooltip_3` = 'Bricoler', `tooltip_4` = 'Basteln', `tooltip_5` = '制造', `tooltip_7` = 'Componer', `tooltip_8` = 'Componer', `tooltip_9` = 'Усилить' WHERE `id` = 202;
UPDATE `skillline` SET `tooltip_2` = '마법부여', `tooltip_3` = 'Enchanter', `tooltip_4` = 'Verzaubern', `tooltip_5` = '附魔', `tooltip_7` = 'Encantar', `tooltip_8` = 'Encantar', `tooltip_9` = 'Зачаровать' WHERE `id` = 333;
UPDATE `skillline` SET `tooltip_2` = '연마', `tooltip_3` = 'Modifier', `tooltip_4` = 'Umgestalten', `tooltip_5` = '修改', `tooltip_7` = 'Transformar', `tooltip_8` = 'Transformar', `tooltip_9` = 'Изменить' WHERE `id` = 755;
UPDATE `skillline` SET `tooltip_2` = '각인', `tooltip_3` = 'Calligraphier', `tooltip_4` = 'Beschriften', `tooltip_5` = '铭文', `tooltip_7` = 'Inscribir', `tooltip_8` = 'Inscribir', `tooltip_9` = 'Начертать' WHERE `id` = 773;
UPDATE `skillline` SET `tooltip_2` = '새김', `tooltip_3` = 'Graver', `tooltip_4` = 'Prägen', `tooltip_5` = '铭刻', `tooltip_7` = 'Grabar', `tooltip_8` = 'Grabar', `tooltip_9` = 'Гравировать' WHERE `id` = 776;