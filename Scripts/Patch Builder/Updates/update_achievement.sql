UPDATE `dbc`.`achievement` SET 
    `description1` = 'Defeat Jergosh the Invoker.' /* was 'Defeat Taragaman the Hungerer.' */
WHERE `ID` = 629;

UPDATE `dbc`.`achievement` SET 
    `description1` = 'Defeat Verdan the Everliving.' /* was 'Defeat Mutanus the Devourer.' */
WHERE `ID` = 630;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 1429;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 1429,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Realm First! Level 80 Goblin',
    `nameFlags` = 16712190,
    `description1` = 'First goblin on the realm to achieve level 80.',
    `descriptionFlags` = 16712190,
    `categoryId` = 81,
    `orderInCategory` = 161,
    `flags` = 256,
    `icon` = 463874,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 1430;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 1430,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Realm First! Level 80 Worgen',
    `nameFlags` = 16712190,
    `description1` = 'First worgen on the realm to achieve level 80.',
    `descriptionFlags` = 16712190,
    `categoryId` = 81,
    `orderInCategory` = 162,
    `flags` = 256,
    `icon` = 463876,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5000;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5000,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Shadowfang Keep',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Archmage Arugal.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 4,
    `icon` = 3822,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5001;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5001,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Stormwind Stockade',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Bazil Thredd.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 6,
    `icon` = 3652,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5002;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5002,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Razorfen Downs',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Amnennar the Coldbringer.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 9,
    `icon` = 3655,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5003;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5003,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Razorfen Kraul',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Charlga Razorflank.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 7,
    `icon` = 3686,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5004;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5004,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Wailing Caverns',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Verdan the Everliving.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 3,
    `icon` = 3654,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5005;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5005,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Ragefire Chasm',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Jergosh the Invoker.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 1,
    `icon` = 1983,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5006;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5006,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Deadmines',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Edwin VanCleef.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 2,
    `icon` = 3627,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5007;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5007,
    `requiredFaction` = -1,
    `mapId` = 209,
    `name1` = 'Heroic: Zul''Farrak',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Chief Ukorz Sandscalp.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 12,
    `icon` = 3687,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5008;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5008,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Gnomeregan',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Mekgineer Thermaplugg.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 8,
    `icon` = 3641,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5009;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5009,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Blackrock Depths',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Emperor Dagran Thaurissan.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 15,
    `icon` = 3662,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5010;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5010,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Upper Blackrock Spire',
    `nameFlags` = 16712190,
    `description1` = 'Defeat General Drakkisath.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 17,
    `icon` = 3821,
    `titleRewardFlags` = 2113864172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5011;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5011,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Lower Blackrock Spire',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Overlord Wyrmthalak.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 16,
    `icon` = 3650,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5012;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5012,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Blackfathom Deeps',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Aku''mai.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 5,
    `icon` = 3653,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5013;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5013,
    `requiredFaction` = -1,
    `mapId` = 189,
    `name1` = 'Heroic: Scarlet Monastery',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the Scarlet Crusade within the Scarlet Monastery.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 10,
    `icon` = 2792,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5014;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5014,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Uldaman',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Archaedas.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 11,
    `icon` = 3656,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5015;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5015,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Maraudon',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Princess Theradras.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 13,
    `icon` = 3689,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5016;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5016,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Heroic: Sunken Temple',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Shade of Eranikus.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 14,
    `icon` = 3690,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5017;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5017,
    `requiredFaction` = -1,
    `mapId` = 289,
    `name1` = 'Heroic: Scholomance',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the leaders of Scholomance.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 19,
    `icon` = 308,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5018;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5018,
    `requiredFaction` = -1,
    `mapId` = 329,
    `name1` = 'Heroic: Stratholme',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the evil masterminds inhabiting Stratholme.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 20,
    `icon` = 2718,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5019;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5019,
    `requiredFaction` = -1,
    `mapId` = 429,
    `name1` = 'Heroic: King of Dire Maul',
    `nameFlags` = 16712190,
    `description1` = 'Defeat each wing of Dire Maul.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 18,
    `icon` = 559,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5100;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5100,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Deadmines',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Edwin VanCleef.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 2,
    `icon` = 3627,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5101;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5101,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Gnomeregan',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Mekgineer Thermaplugg.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 8,
    `icon` = 3641,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5102;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5102,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Shadowfang Keep',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Archmage Arugal.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 4,
    `icon` = 3822,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5103;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5103,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Ragefire Chasm',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Jergosh the Invoker.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 1,
    `icon` = 1983,
    `titleRewardFlags` = 16712172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5104;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5104,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Razorfen Downs',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Amnennar the Coldbringer.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 9,
    `icon` = 3655,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5105;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5105,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Razorfen Kraul',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Charlga Razorflank.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 7,
    `icon` = 3686,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5106;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5106,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Stormwind Stockade',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Bazil Thredd.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 6,
    `icon` = 3652,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5107;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5107,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Wailing Caverns',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Verdan the Everliving.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 3,
    `icon` = 3654,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5108;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5108,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Blackrock Depths',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Emperor Dagran Thaurissan.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 15,
    `icon` = 3662,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5109;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5109,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Upper Blackrock Spire',
    `nameFlags` = 16712190,
    `description1` = 'Defeat General Drakkisath.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 17,
    `icon` = 3821,
    `titleRewardFlags` = 2113864172,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5110;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5110,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Lower Blackrock Spire',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Overlord Wyrmthalak.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 16,
    `icon` = 3650,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5111;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5111,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Blackfathom Deeps',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Aku''mai.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 5,
    `icon` = 3653,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5112;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5112,
    `requiredFaction` = -1,
    `mapId` = 189,
    `name1` = 'Mythic: Scarlet Monastery',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the Scarlet Crusade within the Scarlet Monastery.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 10,
    `icon` = 2792,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5113;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5113,
    `requiredFaction` = -1,
    `mapId` = 209,
    `name1` = 'Mythic: Zul''Farrak',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Chief Ukorz Sandscalp.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 12,
    `icon` = 3687,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5114;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5114,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Uldaman',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Archaedas.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 11,
    `icon` = 3656,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5115;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5115,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Maraudon',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Princess Theradras.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 13,
    `icon` = 3689,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5116;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5116,
    `requiredFaction` = -1,
    `mapId` = -1,
    `name1` = 'Mythic: Sunken Temple',
    `nameFlags` = 16712190,
    `description1` = 'Defeat Shade of Eranikus.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 14,
    `icon` = 3690,
    `titleRewardFlags` = 16712174,
    `count` = 1;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5117;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5117,
    `requiredFaction` = -1,
    `mapId` = 289,
    `name1` = 'Mythic: Scholomance',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the leaders of Scholomance.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 19,
    `icon` = 308,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5118;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5118,
    `requiredFaction` = -1,
    `mapId` = 329,
    `name1` = 'Mythic: Stratholme',
    `nameFlags` = 16712190,
    `description1` = 'Defeat the evil masterminds inhabiting Stratholme.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 20,
    `icon` = 2718,
    `titleRewardFlags` = 16712174;

DELETE FROM `dbc`.`achievement` WHERE `ID` = 5119;
INSERT INTO `dbc`.`achievement` SET 
    `ID` = 5119,
    `requiredFaction` = -1,
    `mapId` = 429,
    `name1` = 'Mythic: King of Dire Maul',
    `nameFlags` = 16712190,
    `description1` = 'Defeat each wing of Dire Maul.',
    `descriptionFlags` = 16712190,
    `categoryId` = 14808,
    `points` = 10,
    `orderInCategory` = 18,
    `icon` = 559,
    `titleRewardFlags` = 16712174;

