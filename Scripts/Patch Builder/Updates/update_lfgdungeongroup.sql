UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Azeroth Dungeon' /* was 'Classic Dungeons' */
WHERE `id` = 1;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Outland Dungeon' /* was 'Burning Crusade Normal' */
WHERE `id` = 2;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Outland Heroic' /* was 'Burning Crusade Heroic' */
WHERE `id` = 3;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Northrend Dungeon' /* was 'Wrath of the Lich King Normal' */
WHERE `id` = 4;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Northrend Heroic' /* was 'Wrath of the Lich King Heroic' */
WHERE `id` = 5;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Azeroth Raid' /* was 'Classic Raid' */
WHERE `id` = 6;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Outland Raid' /* was 'Burning Crusade Raid' */
WHERE `id` = 7;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Northrend Raid' /* was 'Wrath of the Lich King Raid (10)' */
WHERE `id` = 8;

UPDATE `dbc`.`lfgdungeongroup` SET 
    `name1` = 'Northrend Heroic Raid' /* was 'Wrath of the Lich King Raid (25)' */
WHERE `id` = 9;

DELETE FROM `dbc`.`lfgdungeongroup` WHERE `id` = 12;
INSERT INTO `dbc`.`lfgdungeongroup` SET 
    `id` = 12,
    `name1` = 'Azeroth Heroic',
    `nameFlags` = 16712190,
    `order` = 6,
    `type` = 5;

DELETE FROM `dbc`.`lfgdungeongroup` WHERE `id` = 13;
INSERT INTO `dbc`.`lfgdungeongroup` SET 
    `id` = 13,
    `name1` = 'Azeroth Mythic',
    `nameFlags` = 16712190,
    `order` = 7,
    `type` = 5;

