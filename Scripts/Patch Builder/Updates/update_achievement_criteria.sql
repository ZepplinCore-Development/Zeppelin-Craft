UPDATE `dbc`.`achievement_criteria` SET 
    `assetType` = '11518' /* was 11520 */,
    `name1` = 'Jergosh the Invoker' /* was Taragaman the Hungerer */
WHERE `ID` = '525';

UPDATE `dbc`.`achievement_criteria` SET 
    `assetType` = '5775' /* was 3654 */,
    `name1` = 'Verdan the Everliving' /* was Mutanus the Devourer */
WHERE `ID` = '526';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13471';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13471',
`referredAchievement` = '246',
`requiredType` = '53',
`assetType` = '9',
`assetCount` = '1',
`name1` = 'Goblin',
`nameFlags` = '16712190',
`showOrder` = '6';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13472';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13472',
`referredAchievement` = '1005',
`requiredType` = '53',
`assetType` = '12',
`assetCount` = '1',
`name1` = 'Worgen',
`nameFlags` = '16712190',
`showOrder` = '6';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13473';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13473',
`referredAchievement` = '2422',
`requiredType` = '110',
`assetType` = '61815',
`assetCount` = '1',
`name1` = 'Goblin',
`nameFlags` = '16712190',
`showOrder` = '11';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13474';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13474',
`referredAchievement` = '2422',
`requiredType` = '110',
`assetType` = '61815',
`assetCount` = '1',
`name1` = 'Worgen',
`nameFlags` = '16712190',
`showOrder` = '12';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13475';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13475',
`referredAchievement` = '291',
`requiredType` = '110',
`assetType` = '44212',
`assetCount` = '1',
`name1` = 'Goblin',
`nameFlags` = '16712190',
`showOrder` = '11';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13476';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13476',
`referredAchievement` = '291',
`requiredType` = '110',
`assetType` = '44212',
`assetCount` = '1',
`name1` = 'Worgen',
`nameFlags` = '16712190',
`showOrder` = '12';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13477';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13477',
`referredAchievement` = '1429',
`requiredType` = '5',
`assetType` = '80',
`name1` = 'Level to 80',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13478';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13478',
`referredAchievement` = '1430',
`requiredType` = '5',
`assetType` = '80',
`name1` = 'Level to 80',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13500';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13500',
`referredAchievement` = '5000',
`assetType` = '4275',
`assetCount` = '1',
`name1` = 'Archmage Arugal',
`nameFlags` = '16712190',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13501';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13501',
`referredAchievement` = '5001',
`assetType` = '1716',
`assetCount` = '1',
`name1` = 'Bazil Thredd',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13502';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13502',
`referredAchievement` = '5002',
`assetType` = '7358',
`assetCount` = '1',
`name1` = 'Amnennar the Coldbringer',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13503';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13503',
`referredAchievement` = '5003',
`assetType` = '4421',
`assetCount` = '1',
`name1` = 'Charlga Razorflank',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13504';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13504',
`referredAchievement` = '5004',
`assetType` = '5775',
`assetCount` = '1',
`name1` = 'Verdan the Everliving',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13505';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13505',
`referredAchievement` = '5005',
`assetType` = '11518',
`assetCount` = '1',
`name1` = 'Jergosh the Invoker',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13506';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13506',
`referredAchievement` = '5006',
`assetType` = '639',
`assetCount` = '1',
`name1` = 'Edwin VanCleef',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13507';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13507',
`referredAchievement` = '5007',
`assetType` = '7267',
`assetCount` = '1',
`name1` = 'Chief Ukorz Sandscalp',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13508';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13508',
`referredAchievement` = '5008',
`assetType` = '7800',
`assetCount` = '1',
`name1` = 'Mekgineer Thermaplugg',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13509';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13509',
`referredAchievement` = '5009',
`assetType` = '9019',
`assetCount` = '1',
`name1` = 'Emperor Dagran Thaurissan',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13510';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13510',
`referredAchievement` = '5010',
`assetType` = '10363',
`assetCount` = '1',
`name1` = 'General Drakkisath',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13511';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13511',
`referredAchievement` = '5011',
`assetType` = '9568',
`assetCount` = '1',
`name1` = 'Overlord Wyrmthalak',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13512';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13512',
`referredAchievement` = '5012',
`assetType` = '4829',
`assetCount` = '1',
`name1` = 'Aku'mai',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13513';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13513',
`referredAchievement` = '5013',
`assetType` = '3977',
`assetCount` = '1',
`name1` = 'High Inquisitor Whitemane',
`nameFlags` = '16712190',
`showOrder` = '5';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13514';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13514',
`referredAchievement` = '5014',
`assetType` = '2748',
`assetCount` = '1',
`name1` = 'Archaedas',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13515';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13515',
`referredAchievement` = '5015',
`assetType` = '12201',
`assetCount` = '1',
`name1` = 'Princess Theradras',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13516';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13516',
`referredAchievement` = '5016',
`assetType` = '5709',
`assetCount` = '1',
`name1` = 'Shade of Eranikus',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13517';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13517',
`referredAchievement` = '5017',
`assetType` = '1853',
`assetCount` = '1',
`name1` = 'Darkmaster Gandling',
`nameFlags` = '16712190',
`showOrder` = '2';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13518';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13518',
`referredAchievement` = '5018',
`assetType` = '10440',
`assetCount` = '1',
`name1` = 'Baron Rivendare',
`nameFlags` = '16712190',
`showOrder` = '2';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13519';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13519',
`referredAchievement` = '5019',
`assetType` = '11501',
`assetCount` = '1',
`name1` = 'King Gordok',
`nameFlags` = '16712190',
`showOrder` = '3';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13600';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13600',
`referredAchievement` = '5100',
`assetType` = '639',
`assetCount` = '1',
`name1` = 'Edwin VanCleef',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13601';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13601',
`referredAchievement` = '5101',
`assetType` = '7800',
`assetCount` = '1',
`name1` = 'Mekgineer Thermaplugg',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13602';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13602',
`referredAchievement` = '5102',
`assetType` = '4275',
`assetCount` = '1',
`name1` = 'Archmage Arugal',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13603';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13603',
`referredAchievement` = '5103',
`assetType` = '11518',
`assetCount` = '1',
`name1` = 'Jergosh the Invoker',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13604';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13604',
`referredAchievement` = '5104',
`assetType` = '7358',
`assetCount` = '1',
`name1` = 'Amnennar the Coldbringer',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13605';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13605',
`referredAchievement` = '5105',
`assetType` = '4421',
`assetCount` = '1',
`name1` = 'Charlga Razorflank',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13606';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13606',
`referredAchievement` = '5106',
`assetType` = '1716',
`assetCount` = '1',
`name1` = 'Bazil Thredd',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13607';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13607',
`referredAchievement` = '5107',
`assetType` = '5775',
`assetCount` = '1',
`name1` = 'Verdan the Everliving',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13608';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13608',
`referredAchievement` = '5108',
`assetType` = '9019',
`assetCount` = '1',
`name1` = 'Emperor Dagran Thaurissan',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13609';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13609',
`referredAchievement` = '5109',
`assetType` = '10363',
`assetCount` = '1',
`name1` = 'General Drakkisath',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13610';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13610',
`referredAchievement` = '5110',
`assetType` = '9568',
`assetCount` = '1',
`name1` = 'Overlord Wyrmthalak',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13611';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13611',
`referredAchievement` = '5111',
`assetType` = '4829',
`assetCount` = '1',
`name1` = 'Aku'mai',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13612';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13612',
`referredAchievement` = '5112',
`assetType` = '3977',
`assetCount` = '1',
`name1` = 'High Inquisitor Whitemane',
`nameFlags` = '16712190',
`showOrder` = '5';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13613';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13613',
`referredAchievement` = '5113',
`assetType` = '7267',
`assetCount` = '1',
`name1` = 'Chief Ukorz Sandscalp',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13614';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13614',
`referredAchievement` = '5114',
`assetType` = '2748',
`assetCount` = '1',
`name1` = 'Archaedas',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13615';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13615',
`referredAchievement` = '5115',
`assetType` = '12201',
`assetCount` = '1',
`name1` = 'Princess Theradras',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13616';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13616',
`referredAchievement` = '5116',
`assetType` = '5709',
`assetCount` = '1',
`name1` = 'Shade of Eranikus',
`nameFlags` = '16712190',
`flags` = '2',
`showOrder` = '1';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13617';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13617',
`referredAchievement` = '5117',
`assetType` = '1853',
`assetCount` = '1',
`name1` = 'Darkmaster Gandling',
`nameFlags` = '16712190',
`showOrder` = '2';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13618';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13618',
`referredAchievement` = '5118',
`assetType` = '10440',
`assetCount` = '1',
`name1` = 'Baron Rivendare',
`nameFlags` = '16712190',
`showOrder` = '2';

DELETE FROM `dbc`.`achievement_criteria` WHERE `ID` = '13619';
INSERT INTO `dbc`.`achievement_criteria` SET 
`ID` = '13619',
`referredAchievement` = '5119',
`assetType` = '11501',
`assetCount` = '1',
`name1` = 'King Gordok',
`nameFlags` = '16712190',
`showOrder` = '3';

