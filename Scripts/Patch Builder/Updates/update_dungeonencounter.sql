UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 1000 /* was 4000 */
WHERE `ID` = 431;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 3000 /* was 2000 */,
    `bit` = 3 /* was 2 */
WHERE `ID` = 432;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 2000 /* was 3000 */,
    `bit` = 2 /* was 3 */
WHERE `ID` = 433;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 7000 /* was 6000 */,
    `bit` = 7 /* was 6 */
WHERE `ID` = 591;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 6000 /* was 7000 */,
    `bit` = 6 /* was 7 */
WHERE `ID` = 592;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 990;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 990,
    `mapId` = 34,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Dextren Ward',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 991;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 991,
    `mapId` = 34,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 3,
    `name1` = 'Bazil Thredd',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 992;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 992,
    `mapId` = 34,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Hamhock',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 993;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 993,
    `mapId` = 34,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Kam Deepfury',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 994;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 994,
    `mapId` = 34,
    `difficulty` = 1,
    `name1` = 'Targorr the Dread',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 995;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 995,
    `mapId` = 33,
    `difficulty` = 1,
    `name1` = 'Rethilgore',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 996;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 996,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Razorclaw the Butcher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 997;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 997,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Baron Silverlaine',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 998;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 998,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Commander Springvale',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 999;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 999,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Odo the Blindwatcher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1000;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1000,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Fenrus the Devourer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1001;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1001,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Wolf Master Nandos',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1002;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1002,
    `mapId` = 33,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Archmage Arugal',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1003;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1003,
    `mapId` = 47,
    `difficulty` = 1,
    `name1` = 'Roogug',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1004;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1004,
    `mapId` = 47,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Aggem Thorncurse',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1005;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1005,
    `mapId` = 47,
    `difficulty` = 1,
    `orderIndex` = -1000,
    `bit` = 2,
    `name1` = 'Death Speaker Jargba',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1006;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1006,
    `mapId` = 47,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Overlord Ramtusk',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1007;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1007,
    `mapId` = 47,
    `difficulty` = 1,
    `orderIndex` = 3500,
    `bit` = 5,
    `name1` = 'Agathelos the Raging',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1008;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1008,
    `mapId` = 47,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Charlga Razorflank',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1009;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1009,
    `mapId` = 129,
    `difficulty` = 1,
    `name1` = 'Tuten''kash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1010;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1010,
    `mapId` = 129,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Mordresh Fire Eye',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1011;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1011,
    `mapId` = 129,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Glutton',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1012;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1012,
    `mapId` = 129,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Amnennar the Coldbringer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1013;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1013,
    `mapId` = 43,
    `difficulty` = 1,
    `name1` = 'Lady Anacondra',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1014;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1014,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lord Cobrahn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1015;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1015,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Kresh',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1016;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1016,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Lord Pythas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1017;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1017,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Skum',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1018;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1018,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Lord Serpentis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1019;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1019,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Verdan the Everliving',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1020;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1020,
    `mapId` = 43,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Mutanus the Devourer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1021;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1021,
    `mapId` = 389,
    `difficulty` = 1,
    `name1` = 'Oggleflint',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1022;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1022,
    `mapId` = 389,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Taragaman the Hungerer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1023;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1023,
    `mapId` = 389,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Jergosh the Invoker',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1024;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1024,
    `mapId` = 389,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Bazzalan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1025;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1025,
    `mapId` = 90,
    `difficulty` = 2,
    `orderIndex` = 2500,
    `bit` = 1,
    `name1` = 'Viscous Fallout',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1026;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1026,
    `mapId` = 90,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Grubbis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1027;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1027,
    `mapId` = 90,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Electrocutioner 6000',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1028;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1028,
    `mapId` = 90,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Crowd Pummeler 9-60',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1029;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1029,
    `mapId` = 90,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Mekgineer Thermaplugg',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1030;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1030,
    `mapId` = 90,
    `difficulty` = 1,
    `orderIndex` = 2500,
    `bit` = 1,
    `name1` = 'Viscous Fallout',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1031;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1031,
    `mapId` = 90,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Grubbis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1032;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1032,
    `mapId` = 90,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Electrocutioner 6000',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1033;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1033,
    `mapId` = 90,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Crowd Pummeler 9-60',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1034;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1034,
    `mapId` = 90,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Mekgineer Thermaplugg',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1035;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1035,
    `mapId` = 289,
    `difficulty` = 1,
    `name1` = 'Kirtonos the Herald',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1036;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1036,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Jandice Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1037;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1037,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Rattlegore',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1038;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1038,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Marduk Blackpool',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1039;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1039,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Vectus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1040;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1040,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Ras Frostwhisper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1041;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1041,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Instructor Malicia',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1042;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1042,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Doctor Theolen Krastinov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1043;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1043,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Lorekeeper Polkelt',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1044;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1044,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'The Ravenian',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1045;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1045,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Lord Alexei Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1046;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1046,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Lady Illucia Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1047;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1047,
    `mapId` = 289,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Darkmaster Gandling',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1048;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1048,
    `mapId` = 289,
    `difficulty` = 2,
    `name1` = 'Kirtonos the Herald',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1049;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1049,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Jandice Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1050;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1050,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Rattlegore',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1051;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1051,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Marduk Blackpool',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1052;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1052,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Vectus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1053;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1053,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Ras Frostwhisper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1054;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1054,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Instructor Malicia',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1055;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1055,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Doctor Theolen Krastinov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1056;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1056,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Lorekeeper Polkelt',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1057;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1057,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'The Ravenian',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1058;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1058,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Lord Alexei Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1059;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1059,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Lady Illucia Barov',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1060;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1060,
    `mapId` = 289,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Darkmaster Gandling',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1061;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1061,
    `mapId` = 230,
    `difficulty` = 1,
    `name1` = 'High Interrogator Gerstahn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1062;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1062,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lord Roccor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1063;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1063,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Houndmaster Grebmar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1064;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1064,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Ring of Law',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1065;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1065,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Pyromancer Loregrain',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1066;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1066,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Lord Incendius',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1067;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1067,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Warder Stilgiss',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1068;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1068,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Fineous Darkvire',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1069;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1069,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Bael''Gar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1070;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1070,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'General Angerforge',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1071;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1071,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Golem Lord Argelmach',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1072;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1072,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Hurley Blackbreath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1073;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1073,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Phalanx',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1074;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1074,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 13,
    `name1` = 'Ribbly Screwspigot',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1075;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1075,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 14000,
    `bit` = 14,
    `name1` = 'Plugger Spazzring',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1076;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1076,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 15000,
    `bit` = 15,
    `name1` = 'Ambassador Flamelash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1077;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1077,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 16000,
    `bit` = 16,
    `name1` = 'The Seven',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1078;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1078,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 17000,
    `bit` = 17,
    `name1` = 'Magmus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1079;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1079,
    `mapId` = 230,
    `difficulty` = 1,
    `orderIndex` = 18000,
    `bit` = 18,
    `name1` = 'Emperor Dagran Thaurissan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1080;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1080,
    `mapId` = 230,
    `difficulty` = 2,
    `name1` = 'High Interrogator Gerstahn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1081;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1081,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lord Roccor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1082;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1082,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Houndmaster Grebmar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1083;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1083,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Ring of Law',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1084;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1084,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Pyromancer Loregrain',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1085;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1085,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Lord Incendius',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1086;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1086,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Warder Stilgiss',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1087;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1087,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Fineous Darkvire',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1088;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1088,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Bael''Gar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1089;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1089,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'General Angerforge',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1090;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1090,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 18000,
    `bit` = 18,
    `name1` = 'Emperor Dagran Thaurissan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1091;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1091,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 17000,
    `bit` = 17,
    `name1` = 'Magmus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1092;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1092,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 16000,
    `bit` = 16,
    `name1` = 'The Seven',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1093;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1093,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 15000,
    `bit` = 15,
    `name1` = 'Ambassador Flamelash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1094;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1094,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 14000,
    `bit` = 14,
    `name1` = 'Plugger Spazzring',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1095;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1095,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 13,
    `name1` = 'Ribbly Screwspigot',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1096;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1096,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Phalanx',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1097;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1097,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Hurley Blackbreath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1098;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1098,
    `mapId` = 230,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Golem Lord Argelmach',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1099;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1099,
    `mapId` = 36,
    `difficulty` = 2,
    `name1` = 'Rhahk''zor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1100;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1100,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 500,
    `bit` = 1,
    `name1` = 'Sneed',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1101;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1101,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 750,
    `bit` = 2,
    `name1` = 'Gilnid',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1102;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1102,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 875,
    `bit` = 3,
    `name1` = 'Mr. Smite',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1103;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1103,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 937,
    `bit` = 4,
    `name1` = 'Cookie',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1104;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1104,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 968,
    `bit` = 5,
    `name1` = 'Captain Greenskin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1105;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1105,
    `mapId` = 36,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 6,
    `name1` = 'Edwin VanCleef',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1106;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1106,
    `mapId` = 36,
    `difficulty` = 1,
    `name1` = 'Rhahk''zor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1107;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1107,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 500,
    `bit` = 1,
    `name1` = 'Sneed',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1108;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1108,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 750,
    `bit` = 2,
    `name1` = 'Gilnid',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1109;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1109,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 875,
    `bit` = 3,
    `name1` = 'Mr. Smite',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1110;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1110,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 937,
    `bit` = 4,
    `name1` = 'Cookie',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1111;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1111,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 968,
    `bit` = 5,
    `name1` = 'Captain Greenskin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1112;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1112,
    `mapId` = 36,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 6,
    `name1` = 'Edwin VanCleef',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1113;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1113,
    `mapId` = 34,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Dextren Ward',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1114;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1114,
    `mapId` = 34,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 3,
    `name1` = 'Bazil Thredd',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1115;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1115,
    `mapId` = 34,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Hamhock',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1116;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1116,
    `mapId` = 34,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Kam Deepfury',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1117;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1117,
    `mapId` = 34,
    `difficulty` = 2,
    `name1` = 'Targorr the Dread',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1118;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1118,
    `mapId` = 33,
    `difficulty` = 2,
    `name1` = 'Rethilgore',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1119;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1119,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Razorclaw the Butcher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1120;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1120,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Baron Silverlaine',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1121;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1121,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Commander Springvale',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1122;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1122,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Odo the Blindwatcher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1123;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1123,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Fenrus the Devourer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1124;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1124,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Wolf Master Nandos',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1125;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1125,
    `mapId` = 33,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Archmage Arugal',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1126;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1126,
    `mapId` = 47,
    `difficulty` = 2,
    `name1` = 'Roogug',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1127;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1127,
    `mapId` = 47,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Aggem Thorncurse',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1128;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1128,
    `mapId` = 47,
    `difficulty` = 2,
    `orderIndex` = -1000,
    `bit` = 2,
    `name1` = 'Death Speaker Jargba',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1129;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1129,
    `mapId` = 47,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Overlord Ramtusk',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1130;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1130,
    `mapId` = 47,
    `difficulty` = 2,
    `orderIndex` = 3500,
    `bit` = 5,
    `name1` = 'Agathelos the Raging',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1131;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1131,
    `mapId` = 47,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Charlga Razorflank',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1132;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1132,
    `mapId` = 129,
    `difficulty` = 2,
    `name1` = 'Tuten''kash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1133;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1133,
    `mapId` = 129,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Mordresh Fire Eye',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1134;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1134,
    `mapId` = 129,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Glutton',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1135;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1135,
    `mapId` = 129,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Amnennar the Coldbringer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1136;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1136,
    `mapId` = 43,
    `difficulty` = 2,
    `name1` = 'Lady Anacondra',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1137;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1137,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lord Cobrahn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1138;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1138,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Kresh',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1139;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1139,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Lord Pythas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1140;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1140,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Skum',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1141;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1141,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Lord Serpentis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1142;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1142,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Verdan the Everliving',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1143;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1143,
    `mapId` = 43,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Mutanus the Devourer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1149;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1149,
    `mapId` = 389,
    `difficulty` = 2,
    `name1` = 'Oggleflint',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1150;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1150,
    `mapId` = 389,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Taragaman the Hungerer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1151;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1151,
    `mapId` = 389,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Jergosh the Invoker',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1152;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1152,
    `mapId` = 389,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Bazzalan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1153;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1153,
    `mapId` = 48,
    `difficulty` = 1,
    `name1` = 'Ghamoo-ra',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1154;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1154,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lady Sarevess',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1155;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1155,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Gelihast',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1156;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1156,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Lorgus Jett',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1157;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1157,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Old Serra''kis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1158;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1158,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Twilight Lord Kelris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1159;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1159,
    `mapId` = 48,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Aku''mai',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1160;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1160,
    `mapId` = 48,
    `difficulty` = 2,
    `name1` = 'Ghamoo-ra',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1161;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1161,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Lady Sarevess',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1162;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1162,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Gelihast',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1163;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1163,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Lorgus Jett',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1164;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1164,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Old Serra''kis',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1165;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1165,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Twilight Lord Kelris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1166;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1166,
    `mapId` = 48,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Aku''mai',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1167;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1167,
    `mapId` = 189,
    `difficulty` = 1,
    `name1` = 'Interrogator Vishas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1168;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1168,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Bloodmage Thalnos',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1169;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1169,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Houndmaster Loksey',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1170;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1170,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Arcanist Doan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1171;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1171,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Herod',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1172;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1172,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'High Inquisitor Fairbanks',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1173;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1173,
    `mapId` = 189,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'High Inquisitor Whitemane',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1174;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1174,
    `mapId` = 189,
    `difficulty` = 2,
    `name1` = 'Interrogator Vishas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1175;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1175,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Bloodmage Thalnos',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1176;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1176,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Houndmaster Loksey',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1177;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1177,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Arcanist Doan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1178;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1178,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Herod',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1179;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1179,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'High Inquisitor Fairbanks',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1180;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1180,
    `mapId` = 189,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'High Inquisitor Whitemane',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1181;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1181,
    `mapId` = 70,
    `difficulty` = 1,
    `name1` = 'Revelosh',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1182;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1182,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'The Lost Dwarves',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1183;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1183,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Ironaya',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1184;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1184,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Ancient Stone Keeper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1185;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1185,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Galgann Firehammer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1186;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1186,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Grimlok',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1187;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1187,
    `mapId` = 70,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Archaedas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1188;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1188,
    `mapId` = 70,
    `difficulty` = 2,
    `name1` = 'Revelosh',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1189;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1189,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'The Lost Dwarves',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1190;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1190,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Ironaya',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1191;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1191,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Ancient Stone Keeper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1192;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1192,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Galgann Firehammer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1193;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1193,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Grimlok',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1194;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1194,
    `mapId` = 70,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Archaedas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1195;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1195,
    `mapId` = 209,
    `difficulty` = 1,
    `name1` = 'Hydromancer Velratha',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1196;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1196,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Ghaz''rilla',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1197;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1197,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Antu''sul',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1198;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1198,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Theka the Martyr',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1199;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1199,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Witch Doctor Zum''rah',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1200;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1200,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Nekrum Gutchewer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1201;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1201,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Shadowpriest Sezz''ziz',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1202;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1202,
    `mapId` = 209,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Chief Ukorz Sandscalp',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1203;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1203,
    `mapId` = 209,
    `difficulty` = 2,
    `name1` = 'Hydromancer Velratha',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1204;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1204,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Ghaz''rilla',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1205;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1205,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Antu''sul',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1206;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1206,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Theka the Martyr',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1207;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1207,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Witch Doctor Zum''rah',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1208;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1208,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Nekrum Gutchewer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1209;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1209,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Shadowpriest Sezz''ziz',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1210;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1210,
    `mapId` = 209,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Chief Ukorz Sandscalp',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1211;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1211,
    `mapId` = 349,
    `difficulty` = 1,
    `name1` = 'Noxxion',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1212;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1212,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Razorlash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1213;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1213,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Lord Vyletongue',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1214;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1214,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Celebras the Cursed',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1215;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1215,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Landslide',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1216;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1216,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Tinkerer Gizlock',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1217;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1217,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Rotgrip',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1218;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1218,
    `mapId` = 349,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Princess Theradras',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1219;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1219,
    `mapId` = 349,
    `difficulty` = 2,
    `name1` = 'Noxxion',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1220;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1220,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Razorlash',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1221;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1221,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Lord Vyletongue',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1223;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1223,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Celebras the Cursed',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1224;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1224,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Landslide',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1225;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1225,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Tinkerer Gizlock',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1226;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1226,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Rotgrip',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1227;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1227,
    `mapId` = 349,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Princess Theradras',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1228;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1228,
    `mapId` = 109,
    `difficulty` = 1,
    `name1` = 'Atal''alarion',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1229;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1229,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Dreamscythe',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1230;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1230,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Weaver',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1231;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1231,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 500,
    `bit` = 3,
    `name1` = 'Jammal''an the Prophet',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1232;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1232,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Morphaz',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1233;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1233,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Hazzas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1234;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1234,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Avatar of Hakkar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1235;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1235,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Shade of Eranikus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1236;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1236,
    `mapId` = 109,
    `difficulty` = 2,
    `name1` = 'Atal''alarion',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1237;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1237,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Dreamscythe',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1238;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1238,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Weaver',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1239;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1239,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 500,
    `bit` = 3,
    `name1` = 'Jammal''an the Prophet',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1240;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1240,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Morphaz',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1241;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1241,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Hazzas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1242;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1242,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Avatar of Hakkar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1243;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1243,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Shade of Eranikus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1244;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1244,
    `mapId` = 229,
    `difficulty` = 1,
    `name1` = 'Highlord Omokk',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1245;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1245,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Shadow Hunter Vosh''gajin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1246;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1246,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'War Master Voone',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1247;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1247,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Mother Smolderweb',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1248;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1248,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Urok Doomhowl',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1249;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1249,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Quartermaster Zigris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1250;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1250,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Gizrul the Slavener',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1251;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1251,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 5500,
    `bit` = 7,
    `name1` = 'Halycon',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1252;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1252,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Overlord Wyrmthalak',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1253;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1253,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'Pyroguard Emberseer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1254;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1254,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Solakar Flamewreath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1255;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1255,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Warchief Rend Blackhand',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1256;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1256,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'The Beast',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1257;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1257,
    `mapId` = 229,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 13,
    `name1` = 'General Drakkisath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1258;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1258,
    `mapId` = 229,
    `difficulty` = 2,
    `name1` = 'Highlord Omokk',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1259;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1259,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Shadow Hunter Vosh''gajin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1260;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1260,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'War Master Voone',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1261;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1261,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Mother Smolderweb',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1262;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1262,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Urok Doomhowl',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1263;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1263,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Quartermaster Zigris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1264;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1264,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Gizrul the Slavener',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1265;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1265,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 5500,
    `bit` = 7,
    `name1` = 'Halycon',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1266;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1266,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Overlord Wyrmthalak',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1267;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1267,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'Pyroguard Emberseer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1268;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1268,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Solakar Flamewreath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1269;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1269,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Warchief Rend Blackhand',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1270;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1270,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'The Beast',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1271;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1271,
    `mapId` = 229,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 13,
    `name1` = 'General Drakkisath',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1272;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1272,
    `mapId` = 429,
    `difficulty` = 1,
    `name1` = 'Zevrim Thornhoof',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1273;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1273,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Hydrospawn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1274;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1274,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Lethtendris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1275;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1275,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Alzzin the Wildshaper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1276;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1276,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Illyanna Ravenoak',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1277;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1277,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Magister Kalendris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1278;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1278,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Immol''thar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1279;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1279,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 3500,
    `bit` = 7,
    `name1` = 'Tendris Warpwood',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1280;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1280,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 8,
    `name1` = 'Prince Tortheldrin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1281;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1281,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 9,
    `name1` = 'Guard Mol''dar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1282;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1282,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 10,
    `name1` = 'Stomper Kreeg',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1283;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1283,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 11,
    `name1` = 'Guard Fengus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1284;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1284,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 12,
    `name1` = 'Guard Slip''kik',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1285;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1285,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 13,
    `name1` = 'Captain Kromcrush',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1286;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1286,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 14,
    `name1` = 'Cho''Rush the Observer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1287;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1287,
    `mapId` = 429,
    `difficulty` = 1,
    `orderIndex` = 14000,
    `bit` = 15,
    `name1` = 'King Gordok',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1288;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1288,
    `mapId` = 429,
    `difficulty` = 2,
    `name1` = 'Zevrim Thornhoof',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1289;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1289,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Hydrospawn',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1290;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1290,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Lethtendris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1291;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1291,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Alzzin the Wildshaper',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1292;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1292,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Illyanna Ravenoak',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1293;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1293,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Magister Kalendris',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1294;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1294,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Immol''thar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1295;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1295,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 3500,
    `bit` = 7,
    `name1` = 'Tendris Warpwood',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1296;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1296,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 8,
    `name1` = 'Prince Tortheldrin',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1297;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1297,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 9,
    `name1` = 'Guard Mol''dar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1298;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1298,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 10,
    `name1` = 'Stomper Kreeg',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1299;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1299,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 11,
    `name1` = 'Guard Fengus',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1300;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1300,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 12,
    `name1` = 'Guard Slip''kik',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1301;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1301,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 13,
    `name1` = 'Captain Kromcrush',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1302;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1302,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 14,
    `name1` = 'Cho''Rush the Observer',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1303;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1303,
    `mapId` = 429,
    `difficulty` = 2,
    `orderIndex` = 14000,
    `bit` = 15,
    `name1` = 'King Gordok',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1304;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1304,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 6500,
    `name1` = 'The Unforgiven',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1305;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1305,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Hearthsinger Forresten',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1306;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1306,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Timmy the Cruel',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1307;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1307,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Cannon Master Willey',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1308;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1308,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Malor the Zealous',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1309;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1309,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Archivist Galford',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1310;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1310,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Balnazzar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1312;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1312,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Baroness Anastari',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1313;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1313,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Nerub''enkan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1314;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1314,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'Maleki the Pallid',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1315;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1315,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Magistrate Barthilas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1316;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1316,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Ramnstein the Gorger',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1317;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1317,
    `mapId` = 329,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Baron Rivendare',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1318;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1318,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 6500,
    `name1` = 'The Unforgiven',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1319;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1319,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name1` = 'Hearthsinger Forresten',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1320;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1320,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name1` = 'Timmy the Cruel',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1321;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1321,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name1` = 'Cannon Master Willey',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1322;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1322,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name1` = 'Malor the Zealous',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1323;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1323,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name1` = 'Archivist Galford',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1324;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1324,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name1` = 'Balnazzar',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1325;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1325,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name1` = 'Baroness Anastari',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1326;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1326,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name1` = 'Nerub''enkan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1327;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1327,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name1` = 'Maleki the Pallid',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1328;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1328,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name1` = 'Magistrate Barthilas',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1329;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1329,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name1` = 'Ramnstein the Gorger',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1330;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1330,
    `mapId` = 329,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name1` = 'Baron Rivendare',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1331;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1331,
    `mapId` = 109,
    `orderIndex` = 50,
    `bit` = 9,
    `name1` = 'Hukku',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1332;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1332,
    `mapId` = 109,
    `orderIndex` = 100,
    `bit` = 10,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1333;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1333,
    `mapId` = 109,
    `orderIndex` = 150,
    `bit` = 10,
    `name1` = 'Loro',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1334;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1334,
    `mapId` = 109,
    `orderIndex` = 200,
    `bit` = 11,
    `name1` = 'Mijan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1335;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1335,
    `mapId` = 109,
    `orderIndex` = 250,
    `bit` = 12,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1336;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1336,
    `mapId` = 109,
    `orderIndex` = 300,
    `bit` = 13,
    `name1` = 'Zul''Lor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1337;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1337,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 50,
    `bit` = 9,
    `name1` = 'Hukku',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1338;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1338,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 100,
    `bit` = 10,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1339;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1339,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 150,
    `bit` = 10,
    `name1` = 'Loro',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1340;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1340,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 200,
    `bit` = 11,
    `name1` = 'Mijan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1341;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1341,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 250,
    `bit` = 12,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1342;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1342,
    `mapId` = 109,
    `difficulty` = 1,
    `orderIndex` = 300,
    `bit` = 13,
    `name1` = 'Zul''Lor',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1343;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1343,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 50,
    `bit` = 9,
    `name1` = 'Hukku',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1344;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1344,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 100,
    `bit` = 10,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1345;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1345,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 150,
    `bit` = 10,
    `name1` = 'Loro',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1346;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1346,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 200,
    `bit` = 11,
    `name1` = 'Mijan',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1347;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1347,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 250,
    `bit` = 12,
    `name1` = 'Gasher',
    `nameFlags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `ID` = 1348;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `ID` = 1348,
    `mapId` = 109,
    `difficulty` = 2,
    `orderIndex` = 300,
    `bit` = 13,
    `name1` = 'Zul''Lor',
    `nameFlags` = 16712190;

