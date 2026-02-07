UPDATE `dbc`.`achievement_criteria` SET 
    `assetType` = 11518 /* was 11520 */,
    `name_1` = 'Jergosh the Invoker' /* was 'Taragaman the Hungerer' */
WHERE `id` = 525;

UPDATE `dbc`.`achievement_criteria` SET 
    `assetType` = 5775 /* was 3654 */,
    `name_1` = 'Verdan the Everliving' /* was 'Mutanus the Devourer' */
WHERE `id` = 526;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13471;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13471,
    `referredAchievement` = 246,
    `requiredType` = 53,
    `assetType` = 9,
    `assetCount` = 1,
    `name_1` = 'Goblin',
    `name_flags` = 16712190,
    `showOrder` = 6;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13472;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13472,
    `referredAchievement` = 1005,
    `requiredType` = 53,
    `assetType` = 12,
    `assetCount` = 1,
    `name_1` = 'Worgen',
    `name_flags` = 16712190,
    `showOrder` = 6;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13473;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13473,
    `referredAchievement` = 2422,
    `requiredType` = 110,
    `assetType` = 61815,
    `assetCount` = 1,
    `name_1` = 'Goblin',
    `name_flags` = 16712190,
    `showOrder` = 11;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13474;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13474,
    `referredAchievement` = 2422,
    `requiredType` = 110,
    `assetType` = 61815,
    `assetCount` = 1,
    `name_1` = 'Worgen',
    `name_flags` = 16712190,
    `showOrder` = 12;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13475;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13475,
    `referredAchievement` = 291,
    `requiredType` = 110,
    `assetType` = 44212,
    `assetCount` = 1,
    `name_1` = 'Goblin',
    `name_flags` = 16712190,
    `showOrder` = 11;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13476;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13476,
    `referredAchievement` = 291,
    `requiredType` = 110,
    `assetType` = 44212,
    `assetCount` = 1,
    `name_1` = 'Worgen',
    `name_flags` = 16712190,
    `showOrder` = 12;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13477;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13477,
    `referredAchievement` = 1429,
    `requiredType` = 5,
    `assetType` = 80,
    `name_1` = 'Level to 80',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13478;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13478,
    `referredAchievement` = 1430,
    `requiredType` = 5,
    `assetType` = 80,
    `name_1` = 'Level to 80',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13500;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13500,
    `referredAchievement` = 5000,
    `assetType` = 4275,
    `assetCount` = 1,
    `name_1` = 'Archmage Arugal',
    `name_flags` = 16712190,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13501;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13501,
    `referredAchievement` = 5001,
    `assetType` = 1716,
    `assetCount` = 1,
    `name_1` = 'Bazil Thredd',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13502;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13502,
    `referredAchievement` = 5002,
    `assetType` = 7358,
    `assetCount` = 1,
    `name_1` = 'Amnennar the Coldbringer',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13503;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13503,
    `referredAchievement` = 5003,
    `assetType` = 4421,
    `assetCount` = 1,
    `name_1` = 'Charlga Razorflank',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13504;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13504,
    `referredAchievement` = 5004,
    `assetType` = 5775,
    `assetCount` = 1,
    `name_1` = 'Verdan the Everliving',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13505;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13505,
    `referredAchievement` = 5005,
    `assetType` = 11518,
    `assetCount` = 1,
    `name_1` = 'Jergosh the Invoker',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13506;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13506,
    `referredAchievement` = 5006,
    `assetType` = 639,
    `assetCount` = 1,
    `name_1` = 'Edwin VanCleef',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13507;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13507,
    `referredAchievement` = 5007,
    `assetType` = 7267,
    `assetCount` = 1,
    `name_1` = 'Chief Ukorz Sandscalp',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13508;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13508,
    `referredAchievement` = 5008,
    `assetType` = 7800,
    `assetCount` = 1,
    `name_1` = 'Mekgineer Thermaplugg',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13509;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13509,
    `referredAchievement` = 5009,
    `assetType` = 9019,
    `assetCount` = 1,
    `name_1` = 'Emperor Dagran Thaurissan',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13510;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13510,
    `referredAchievement` = 5010,
    `assetType` = 10363,
    `assetCount` = 1,
    `name_1` = 'General Drakkisath',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13511;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13511,
    `referredAchievement` = 5011,
    `assetType` = 9568,
    `assetCount` = 1,
    `name_1` = 'Overlord Wyrmthalak',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13512;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13512,
    `referredAchievement` = 5012,
    `assetType` = 4829,
    `assetCount` = 1,
    `name_1` = 'Aku''mai',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13513;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13513,
    `referredAchievement` = 5013,
    `assetType` = 3977,
    `assetCount` = 1,
    `name_1` = 'High Inquisitor Whitemane',
    `name_flags` = 16712190,
    `showOrder` = 5;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13514;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13514,
    `referredAchievement` = 5014,
    `assetType` = 2748,
    `assetCount` = 1,
    `name_1` = 'Archaedas',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13515;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13515,
    `referredAchievement` = 5015,
    `assetType` = 12201,
    `assetCount` = 1,
    `name_1` = 'Princess Theradras',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13516;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13516,
    `referredAchievement` = 5016,
    `assetType` = 5709,
    `assetCount` = 1,
    `name_1` = 'Shade of Eranikus',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13517;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13517,
    `referredAchievement` = 5017,
    `assetType` = 1853,
    `assetCount` = 1,
    `name_1` = 'Darkmaster Gandling',
    `name_flags` = 16712190,
    `showOrder` = 2;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13518;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13518,
    `referredAchievement` = 5018,
    `assetType` = 10440,
    `assetCount` = 1,
    `name_1` = 'Baron Rivendare',
    `name_flags` = 16712190,
    `showOrder` = 2;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13519;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13519,
    `referredAchievement` = 5019,
    `assetType` = 11501,
    `assetCount` = 1,
    `name_1` = 'King Gordok',
    `name_flags` = 16712190,
    `showOrder` = 3;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13600;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13600,
    `referredAchievement` = 5100,
    `assetType` = 639,
    `assetCount` = 1,
    `name_1` = 'Edwin VanCleef',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13601;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13601,
    `referredAchievement` = 5101,
    `assetType` = 7800,
    `assetCount` = 1,
    `name_1` = 'Mekgineer Thermaplugg',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13602;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13602,
    `referredAchievement` = 5102,
    `assetType` = 4275,
    `assetCount` = 1,
    `name_1` = 'Archmage Arugal',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13603;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13603,
    `referredAchievement` = 5103,
    `assetType` = 11518,
    `assetCount` = 1,
    `name_1` = 'Jergosh the Invoker',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13604;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13604,
    `referredAchievement` = 5104,
    `assetType` = 7358,
    `assetCount` = 1,
    `name_1` = 'Amnennar the Coldbringer',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13605;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13605,
    `referredAchievement` = 5105,
    `assetType` = 4421,
    `assetCount` = 1,
    `name_1` = 'Charlga Razorflank',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13606;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13606,
    `referredAchievement` = 5106,
    `assetType` = 1716,
    `assetCount` = 1,
    `name_1` = 'Bazil Thredd',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13607;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13607,
    `referredAchievement` = 5107,
    `assetType` = 5775,
    `assetCount` = 1,
    `name_1` = 'Verdan the Everliving',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13608;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13608,
    `referredAchievement` = 5108,
    `assetType` = 9019,
    `assetCount` = 1,
    `name_1` = 'Emperor Dagran Thaurissan',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13609;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13609,
    `referredAchievement` = 5109,
    `assetType` = 10363,
    `assetCount` = 1,
    `name_1` = 'General Drakkisath',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13610;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13610,
    `referredAchievement` = 5110,
    `assetType` = 9568,
    `assetCount` = 1,
    `name_1` = 'Overlord Wyrmthalak',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13611;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13611,
    `referredAchievement` = 5111,
    `assetType` = 4829,
    `assetCount` = 1,
    `name_1` = 'Aku''mai',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13612;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13612,
    `referredAchievement` = 5112,
    `assetType` = 3977,
    `assetCount` = 1,
    `name_1` = 'High Inquisitor Whitemane',
    `name_flags` = 16712190,
    `showOrder` = 5;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13613;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13613,
    `referredAchievement` = 5113,
    `assetType` = 7267,
    `assetCount` = 1,
    `name_1` = 'Chief Ukorz Sandscalp',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13614;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13614,
    `referredAchievement` = 5114,
    `assetType` = 2748,
    `assetCount` = 1,
    `name_1` = 'Archaedas',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13615;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13615,
    `referredAchievement` = 5115,
    `assetType` = 12201,
    `assetCount` = 1,
    `name_1` = 'Princess Theradras',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13616;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13616,
    `referredAchievement` = 5116,
    `assetType` = 5709,
    `assetCount` = 1,
    `name_1` = 'Shade of Eranikus',
    `name_flags` = 16712190,
    `flags` = 2,
    `showOrder` = 1;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13617;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13617,
    `referredAchievement` = 5117,
    `assetType` = 1853,
    `assetCount` = 1,
    `name_1` = 'Darkmaster Gandling',
    `name_flags` = 16712190,
    `showOrder` = 2;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13618;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13618,
    `referredAchievement` = 5118,
    `assetType` = 10440,
    `assetCount` = 1,
    `name_1` = 'Baron Rivendare',
    `name_flags` = 16712190,
    `showOrder` = 2;

DELETE FROM `dbc`.`achievement_criteria` WHERE `id` = 13619;
INSERT INTO `dbc`.`achievement_criteria` SET 
    `id` = 13619,
    `referredAchievement` = 5119,
    `assetType` = 11501,
    `assetCount` = 1,
    `name_1` = 'King Gordok',
    `name_flags` = 16712190,
    `showOrder` = 3;

