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

DELETE FROM `dbc`.`skillline` WHERE `id` = 791;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 791,
    `category` = 7,
    `name1` = '.Professions',
    `nameFlags` = 16712190,
    `description1` = 'Higher smithing skill allows you to learn higher level smithing plans.  Blacksmithing plans can be found on trainers around the world as well as from quests and monsters.',
    `descriptionFlags` = 16712190,
    `spellIcon` = 162,
    `tooltip1` = 'Modify',
    `tooltipFlags` = 16712190;

DELETE FROM `dbc`.`skillline` WHERE `id` = 792;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 792,
    `category` = 7,
    `name1` = '.Perks',
    `nameFlags` = 16712190,
    `description1` = 'Higher smithing skill allows you to learn higher level smithing plans.  Blacksmithing plans can be found on trainers around the world as well as from quests and monsters.',
    `descriptionFlags` = 16712190,
    `spellIcon` = 5585,
    `tooltip1` = 'Modify',
    `tooltipFlags` = 16712190;

DELETE FROM `dbc`.`skillline` WHERE `id` = 900;
INSERT INTO `dbc`.`skillline` SET 
    `id` = 900,
    `category` = 7,
    `name1` = 'Pet - Cloud Serpent',
    `nameFlags` = 16712190,
    `descriptionFlags` = 16712172,
    `tooltipFlags` = 16712172;

