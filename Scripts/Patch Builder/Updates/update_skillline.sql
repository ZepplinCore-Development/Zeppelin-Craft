UPDATE `dbc`.`skillline` SET 
    `category` = 9 /* was 7 */
WHERE `id` = 633;

DELETE FROM `dbc`.`skillline` WHERE `id` = 789;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 789,
    `category` = 7,
    `name1` = 'Racial - Worgen',
    `nameFlags` = 16712190,
    `descriptionFlags` = 16712172,
    `tooltipFlags` = 16712172;

DELETE FROM `dbc`.`skillline` WHERE `id` = 790;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 790,
    `category` = 9,
    `name1` = 'Racial - Goblin',
    `nameFlags` = 16712190,
    `descriptionFlags` = 16712172,
    `spellIcon` = 133032,
    `tooltipFlags` = 16712172;

DELETE FROM `dbc`.`skillline` WHERE `id` = 900;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 900,
    `category` = 7,
    `name1` = 'Pet - Cloud Serpent',
    `nameFlags` = 16712190,
    `descriptionFlags` = 16712172,
    `tooltipFlags` = 16712172;

