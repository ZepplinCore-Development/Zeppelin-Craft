UPDATE `dbc`.`achievement` SET 
    `description_1` = 'Defeat Jergosh the Invoker.' /* was 'Defeat Taragaman the Hungerer.' */
WHERE `id` = 629;

UPDATE `dbc`.`achievement` SET 
    `description_1` = 'Defeat Verdan the Everliving.' /* was 'Defeat Mutanus the Devourer.' */
WHERE `id` = 630;

DELETE FROM `dbc`.`achievement` WHERE `id` = 1429;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 1429,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Realm First! Level 80 Goblin',
    `name_flags` = 16712190,
    `description_1` = 'First goblin on the realm to achieve level 80.',
    `descriptionFlags` = 16712190,
    `categoryId` = 81,
    `orderInCategory` = 161,
    `flags` = 256,
    `icon` = 463874,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 1430;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 1430,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Realm First! Level 80 Worgen',
    `name_flags` = 16712190,
    `description_1` = 'First worgen on the realm to achieve level 80.',
    `descriptionFlags` = 16712190,
    `categoryId` = 81,
    `orderInCategory` = 162,
    `flags` = 256,
    `icon` = 463876,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5000;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5000,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Shadowfang Keep',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Archmage Arugal.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 4,
    `icon` = 3822,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5001;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5001,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Stormwind Stockade',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Bazil Thredd.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 6,
    `icon` = 3652,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5002;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5002,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Razorfen Downs',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Amnennar the Coldbringer.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 9,
    `icon` = 3655,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5003;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5003,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Razorfen Kraul',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Charlga Razorflank.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 7,
    `icon` = 3686,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5004;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5004,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Wailing Caverns',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Verdan the Everliving.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 3,
    `icon` = 3654,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5005;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5005,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Ragefire Chasm',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Jergosh the Invoker.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 1,
    `icon` = 1983,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5006;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5006,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Deadmines',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Edwin VanCleef.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 2,
    `icon` = 3627,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5007;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5007,
    `required_faction` = -1,
    `map_id` = 209,
    `name_1` = 'Heroic: Zul''Farrak',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Chief Ukorz Sandscalp.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 12,
    `icon` = 3687,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5008;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5008,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Gnomeregan',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Mekgineer Thermaplugg.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 8,
    `icon` = 3641,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5009;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5009,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Blackrock Depths',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Emperor Dagran Thaurissan.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 15,
    `icon` = 3662,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5010;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5010,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Upper Blackrock Spire',
    `name_flags` = 16712190,
    `description_1` = 'Defeat General Drakkisath.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 17,
    `icon` = 3821,
    `titleRewardFlags` = 2113864172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5011;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5011,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Lower Blackrock Spire',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Overlord Wyrmthalak.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 16,
    `icon` = 3650,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5012;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5012,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Blackfathom Deeps',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Aku''mai.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 5,
    `icon` = 3653,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5013;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5013,
    `required_faction` = -1,
    `map_id` = 189,
    `name_1` = 'Heroic: Scarlet Monastery',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the Scarlet Crusade within the Scarlet Monastery.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 10,
    `icon` = 2792,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5014;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5014,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Uldaman',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Archaedas.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 11,
    `icon` = 3656,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5015;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5015,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Maraudon',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Princess Theradras.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 13,
    `icon` = 3689,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5016;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5016,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Heroic: Sunken Temple',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Shade of Eranikus.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 14,
    `icon` = 3690,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5017;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5017,
    `required_faction` = -1,
    `map_id` = 289,
    `name_1` = 'Heroic: Scholomance',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the leaders of Scholomance.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 19,
    `icon` = 308,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5018;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5018,
    `required_faction` = -1,
    `map_id` = 329,
    `name_1` = 'Heroic: Stratholme',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the evil masterminds inhabiting Stratholme.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 20,
    `icon` = 2718,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5019;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5019,
    `required_faction` = -1,
    `map_id` = 429,
    `name_1` = 'Heroic: King of Dire Maul',
    `name_flags` = 16712190,
    `description_1` = 'Defeat each wing of Dire Maul.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 18,
    `icon` = 559,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5100;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5100,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Deadmines',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Edwin VanCleef.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 2,
    `icon` = 3627,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5101;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5101,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Gnomeregan',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Mekgineer Thermaplugg.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 8,
    `icon` = 3641,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5102;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5102,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Shadowfang Keep',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Archmage Arugal.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 4,
    `icon` = 3822,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5103;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5103,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Ragefire Chasm',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Jergosh the Invoker.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 1,
    `icon` = 1983,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5104;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5104,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Razorfen Downs',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Amnennar the Coldbringer.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 9,
    `icon` = 3655,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5105;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5105,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Razorfen Kraul',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Charlga Razorflank.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 7,
    `icon` = 3686,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5106;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5106,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Stormwind Stockade',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Bazil Thredd.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 6,
    `icon` = 3652,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5107;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5107,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Wailing Caverns',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Verdan the Everliving.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 3,
    `icon` = 3654,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5108;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5108,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Blackrock Depths',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Emperor Dagran Thaurissan.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 15,
    `icon` = 3662,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5109;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5109,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Upper Blackrock Spire',
    `name_flags` = 16712190,
    `description_1` = 'Defeat General Drakkisath.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 17,
    `icon` = 3821,
    `titleRewardFlags` = 2113864172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5110;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5110,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Lower Blackrock Spire',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Overlord Wyrmthalak.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 16,
    `icon` = 3650,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5111;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5111,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Blackfathom Deeps',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Aku''mai.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 5,
    `icon` = 3653,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5112;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5112,
    `required_faction` = -1,
    `map_id` = 189,
    `name_1` = 'Mythic: Scarlet Monastery',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the Scarlet Crusade within the Scarlet Monastery.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 10,
    `icon` = 2792,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5113;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5113,
    `required_faction` = -1,
    `map_id` = 209,
    `name_1` = 'Mythic: Zul''Farrak',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Chief Ukorz Sandscalp.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 12,
    `icon` = 3687,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5114;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5114,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Uldaman',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Archaedas.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 11,
    `icon` = 3656,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5115;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5115,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Maraudon',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Princess Theradras.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 13,
    `icon` = 3689,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5116;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5116,
    `required_faction` = -1,
    `map_id` = -1,
    `name_1` = 'Mythic: Sunken Temple',
    `name_flags` = 16712190,
    `description_1` = 'Defeat Shade of Eranikus.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 14,
    `icon` = 3690,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5117;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5117,
    `required_faction` = -1,
    `map_id` = 289,
    `name_1` = 'Mythic: Scholomance',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the leaders of Scholomance.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 19,
    `icon` = 308,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5118;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5118,
    `required_faction` = -1,
    `map_id` = 329,
    `name_1` = 'Mythic: Stratholme',
    `name_flags` = 16712190,
    `description_1` = 'Defeat the evil masterminds inhabiting Stratholme.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 20,
    `icon` = 2718,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `id` = 5119;
INSERT INTO `dbc`.`achievement` SET 
    `id` = 5119,
    `required_faction` = -1,
    `map_id` = 429,
    `name_1` = 'Mythic: King of Dire Maul',
    `name_flags` = 16712190,
    `description_1` = 'Defeat each wing of Dire Maul.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 18,
    `icon` = 559,
    `titleRewardFlags` = 16712174;

