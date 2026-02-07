UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 1000 /* was 4000 */
WHERE `id` = 431;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 3000 /* was 2000 */,
    `bit` = 3 /* was 2 */
WHERE `id` = 432;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 2000 /* was 3000 */,
    `bit` = 2 /* was 3 */
WHERE `id` = 433;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 7000 /* was 6000 */,
    `bit` = 7 /* was 6 */
WHERE `id` = 591;

UPDATE `dbc`.`dungeonencounter` SET 
    `orderIndex` = 6000 /* was 7000 */,
    `bit` = 6 /* was 7 */
WHERE `id` = 592;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 990;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 990,
    `map_id` = 34,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Dextren Ward',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 991;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 991,
    `map_id` = 34,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 3,
    `name_1` = 'Bazil Thredd',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 992;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 992,
    `map_id` = 34,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Hamhock',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 993;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 993,
    `map_id` = 34,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Kam Deepfury',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 994;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 994,
    `map_id` = 34,
    `difficulty` = 1,
    `name_1` = 'Targorr the Dread',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 995;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 995,
    `map_id` = 33,
    `difficulty` = 1,
    `name_1` = 'Rethilgore',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 996;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 996,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Razorclaw the Butcher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 997;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 997,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Baron Silverlaine',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 998;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 998,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Commander Springvale',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 999;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 999,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Odo the Blindwatcher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1000;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1000,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Fenrus the Devourer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1001;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1001,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Wolf Master Nandos',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1002;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1002,
    `map_id` = 33,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Archmage Arugal',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1003;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1003,
    `map_id` = 47,
    `difficulty` = 1,
    `name_1` = 'Roogug',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1004;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1004,
    `map_id` = 47,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Aggem Thorncurse',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1005;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1005,
    `map_id` = 47,
    `difficulty` = 1,
    `orderIndex` = -1000,
    `bit` = 2,
    `name_1` = 'Death Speaker Jargba',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1006;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1006,
    `map_id` = 47,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Overlord Ramtusk',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1007;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1007,
    `map_id` = 47,
    `difficulty` = 1,
    `orderIndex` = 3500,
    `bit` = 5,
    `name_1` = 'Agathelos the Raging',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1008;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1008,
    `map_id` = 47,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Charlga Razorflank',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1009;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1009,
    `map_id` = 129,
    `difficulty` = 1,
    `name_1` = 'Tuten''kash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1010;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1010,
    `map_id` = 129,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Mordresh Fire Eye',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1011;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1011,
    `map_id` = 129,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Glutton',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1012;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1012,
    `map_id` = 129,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Amnennar the Coldbringer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1013;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1013,
    `map_id` = 43,
    `difficulty` = 1,
    `name_1` = 'Lady Anacondra',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1014;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1014,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lord Cobrahn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1015;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1015,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Kresh',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1016;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1016,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Lord Pythas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1017;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1017,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Skum',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1018;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1018,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Lord Serpentis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1019;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1019,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Verdan the Everliving',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1020;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1020,
    `map_id` = 43,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Mutanus the Devourer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1021;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1021,
    `map_id` = 389,
    `difficulty` = 1,
    `name_1` = 'Oggleflint',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1022;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1022,
    `map_id` = 389,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Taragaman the Hungerer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1023;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1023,
    `map_id` = 389,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Jergosh the Invoker',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1024;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1024,
    `map_id` = 389,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Bazzalan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1025;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1025,
    `map_id` = 90,
    `difficulty` = 2,
    `orderIndex` = 2500,
    `bit` = 1,
    `name_1` = 'Viscous Fallout',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1026;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1026,
    `map_id` = 90,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Grubbis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1027;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1027,
    `map_id` = 90,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Electrocutioner 6000',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1028;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1028,
    `map_id` = 90,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Crowd Pummeler 9-60',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1029;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1029,
    `map_id` = 90,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Mekgineer Thermaplugg',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1030;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1030,
    `map_id` = 90,
    `difficulty` = 1,
    `orderIndex` = 2500,
    `bit` = 1,
    `name_1` = 'Viscous Fallout',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1031;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1031,
    `map_id` = 90,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Grubbis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1032;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1032,
    `map_id` = 90,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Electrocutioner 6000',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1033;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1033,
    `map_id` = 90,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Crowd Pummeler 9-60',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1034;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1034,
    `map_id` = 90,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Mekgineer Thermaplugg',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1035;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1035,
    `map_id` = 289,
    `difficulty` = 1,
    `name_1` = 'Kirtonos the Herald',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1036;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1036,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Jandice Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1037;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1037,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Rattlegore',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1038;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1038,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Marduk Blackpool',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1039;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1039,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Vectus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1040;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1040,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Ras Frostwhisper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1041;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1041,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Instructor Malicia',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1042;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1042,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Doctor Theolen Krastinov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1043;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1043,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Lorekeeper Polkelt',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1044;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1044,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'The Ravenian',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1045;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1045,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Lord Alexei Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1046;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1046,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Lady Illucia Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1047;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1047,
    `map_id` = 289,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Darkmaster Gandling',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1048;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1048,
    `map_id` = 289,
    `difficulty` = 2,
    `name_1` = 'Kirtonos the Herald',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1049;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1049,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Jandice Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1050;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1050,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Rattlegore',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1051;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1051,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Marduk Blackpool',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1052;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1052,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Vectus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1053;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1053,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Ras Frostwhisper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1054;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1054,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Instructor Malicia',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1055;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1055,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Doctor Theolen Krastinov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1056;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1056,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Lorekeeper Polkelt',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1057;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1057,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'The Ravenian',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1058;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1058,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Lord Alexei Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1059;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1059,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Lady Illucia Barov',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1060;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1060,
    `map_id` = 289,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Darkmaster Gandling',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1061;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1061,
    `map_id` = 230,
    `difficulty` = 1,
    `name_1` = 'High Interrogator Gerstahn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1062;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1062,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lord Roccor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1063;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1063,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Houndmaster Grebmar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1064;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1064,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Ring of Law',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1065;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1065,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Pyromancer Loregrain',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1066;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1066,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Lord Incendius',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1067;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1067,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Warder Stilgiss',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1068;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1068,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Fineous Darkvire',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1069;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1069,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Bael''Gar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1070;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1070,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'General Angerforge',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1071;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1071,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Golem Lord Argelmach',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1072;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1072,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Hurley Blackbreath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1073;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1073,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Phalanx',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1074;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1074,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 13,
    `name_1` = 'Ribbly Screwspigot',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1075;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1075,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 14000,
    `bit` = 14,
    `name_1` = 'Plugger Spazzring',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1076;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1076,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 15000,
    `bit` = 15,
    `name_1` = 'Ambassador Flamelash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1077;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1077,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 16000,
    `bit` = 16,
    `name_1` = 'The Seven',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1078;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1078,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 17000,
    `bit` = 17,
    `name_1` = 'Magmus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1079;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1079,
    `map_id` = 230,
    `difficulty` = 1,
    `orderIndex` = 18000,
    `bit` = 18,
    `name_1` = 'Emperor Dagran Thaurissan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1080;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1080,
    `map_id` = 230,
    `difficulty` = 2,
    `name_1` = 'High Interrogator Gerstahn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1081;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1081,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lord Roccor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1082;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1082,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Houndmaster Grebmar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1083;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1083,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Ring of Law',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1084;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1084,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Pyromancer Loregrain',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1085;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1085,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Lord Incendius',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1086;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1086,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Warder Stilgiss',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1087;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1087,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Fineous Darkvire',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1088;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1088,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Bael''Gar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1089;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1089,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'General Angerforge',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1090;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1090,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 18000,
    `bit` = 18,
    `name_1` = 'Emperor Dagran Thaurissan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1091;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1091,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 17000,
    `bit` = 17,
    `name_1` = 'Magmus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1092;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1092,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 16000,
    `bit` = 16,
    `name_1` = 'The Seven',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1093;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1093,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 15000,
    `bit` = 15,
    `name_1` = 'Ambassador Flamelash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1094;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1094,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 14000,
    `bit` = 14,
    `name_1` = 'Plugger Spazzring',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1095;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1095,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 13,
    `name_1` = 'Ribbly Screwspigot',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1096;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1096,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Phalanx',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1097;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1097,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Hurley Blackbreath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1098;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1098,
    `map_id` = 230,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Golem Lord Argelmach',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1099;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1099,
    `map_id` = 36,
    `difficulty` = 2,
    `name_1` = 'Rhahk''zor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1100;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1100,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 500,
    `bit` = 1,
    `name_1` = 'Sneed',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1101;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1101,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 750,
    `bit` = 2,
    `name_1` = 'Gilnid',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1102;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1102,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 875,
    `bit` = 3,
    `name_1` = 'Mr. Smite',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1103;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1103,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 937,
    `bit` = 4,
    `name_1` = 'Cookie',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1104;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1104,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 968,
    `bit` = 5,
    `name_1` = 'Captain Greenskin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1105;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1105,
    `map_id` = 36,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 6,
    `name_1` = 'Edwin VanCleef',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1106;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1106,
    `map_id` = 36,
    `difficulty` = 1,
    `name_1` = 'Rhahk''zor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1107;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1107,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 500,
    `bit` = 1,
    `name_1` = 'Sneed',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1108;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1108,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 750,
    `bit` = 2,
    `name_1` = 'Gilnid',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1109;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1109,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 875,
    `bit` = 3,
    `name_1` = 'Mr. Smite',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1110;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1110,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 937,
    `bit` = 4,
    `name_1` = 'Cookie',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1111;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1111,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 968,
    `bit` = 5,
    `name_1` = 'Captain Greenskin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1112;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1112,
    `map_id` = 36,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 6,
    `name_1` = 'Edwin VanCleef',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1113;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1113,
    `map_id` = 34,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Dextren Ward',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1114;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1114,
    `map_id` = 34,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 3,
    `name_1` = 'Bazil Thredd',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1115;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1115,
    `map_id` = 34,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Hamhock',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1116;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1116,
    `map_id` = 34,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Kam Deepfury',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1117;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1117,
    `map_id` = 34,
    `difficulty` = 2,
    `name_1` = 'Targorr the Dread',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1118;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1118,
    `map_id` = 33,
    `difficulty` = 2,
    `name_1` = 'Rethilgore',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1119;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1119,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Razorclaw the Butcher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1120;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1120,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Baron Silverlaine',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1121;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1121,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Commander Springvale',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1122;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1122,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Odo the Blindwatcher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1123;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1123,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Fenrus the Devourer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1124;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1124,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Wolf Master Nandos',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1125;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1125,
    `map_id` = 33,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Archmage Arugal',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1126;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1126,
    `map_id` = 47,
    `difficulty` = 2,
    `name_1` = 'Roogug',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1127;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1127,
    `map_id` = 47,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Aggem Thorncurse',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1128;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1128,
    `map_id` = 47,
    `difficulty` = 2,
    `orderIndex` = -1000,
    `bit` = 2,
    `name_1` = 'Death Speaker Jargba',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1129;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1129,
    `map_id` = 47,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Overlord Ramtusk',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1130;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1130,
    `map_id` = 47,
    `difficulty` = 2,
    `orderIndex` = 3500,
    `bit` = 5,
    `name_1` = 'Agathelos the Raging',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1131;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1131,
    `map_id` = 47,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Charlga Razorflank',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1132;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1132,
    `map_id` = 129,
    `difficulty` = 2,
    `name_1` = 'Tuten''kash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1133;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1133,
    `map_id` = 129,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Mordresh Fire Eye',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1134;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1134,
    `map_id` = 129,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Glutton',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1135;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1135,
    `map_id` = 129,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Amnennar the Coldbringer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1136;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1136,
    `map_id` = 43,
    `difficulty` = 2,
    `name_1` = 'Lady Anacondra',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1137;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1137,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lord Cobrahn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1138;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1138,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Kresh',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1139;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1139,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Lord Pythas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1140;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1140,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Skum',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1141;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1141,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Lord Serpentis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1142;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1142,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Verdan the Everliving',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1143;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1143,
    `map_id` = 43,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Mutanus the Devourer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1149;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1149,
    `map_id` = 389,
    `difficulty` = 2,
    `name_1` = 'Oggleflint',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1150;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1150,
    `map_id` = 389,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Taragaman the Hungerer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1151;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1151,
    `map_id` = 389,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Jergosh the Invoker',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1152;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1152,
    `map_id` = 389,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Bazzalan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1153;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1153,
    `map_id` = 48,
    `difficulty` = 1,
    `name_1` = 'Ghamoo-ra',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1154;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1154,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lady Sarevess',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1155;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1155,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Gelihast',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1156;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1156,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Lorgus Jett',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1157;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1157,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Old Serra''kis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1158;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1158,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Twilight Lord Kelris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1159;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1159,
    `map_id` = 48,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Aku''mai',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1160;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1160,
    `map_id` = 48,
    `difficulty` = 2,
    `name_1` = 'Ghamoo-ra',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1161;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1161,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Lady Sarevess',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1162;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1162,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Gelihast',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1163;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1163,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Lorgus Jett',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1164;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1164,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Old Serra''kis',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1165;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1165,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Twilight Lord Kelris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1166;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1166,
    `map_id` = 48,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Aku''mai',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1167;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1167,
    `map_id` = 189,
    `difficulty` = 1,
    `name_1` = 'Interrogator Vishas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1168;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1168,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Bloodmage Thalnos',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1169;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1169,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Houndmaster Loksey',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1170;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1170,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Arcanist Doan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1171;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1171,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Herod',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1172;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1172,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'High Inquisitor Fairbanks',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1173;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1173,
    `map_id` = 189,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'High Inquisitor Whitemane',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1174;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1174,
    `map_id` = 189,
    `difficulty` = 2,
    `name_1` = 'Interrogator Vishas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1175;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1175,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Bloodmage Thalnos',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1176;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1176,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Houndmaster Loksey',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1177;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1177,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Arcanist Doan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1178;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1178,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Herod',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1179;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1179,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'High Inquisitor Fairbanks',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1180;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1180,
    `map_id` = 189,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'High Inquisitor Whitemane',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1181;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1181,
    `map_id` = 70,
    `difficulty` = 1,
    `name_1` = 'Revelosh',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1182;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1182,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'The Lost Dwarves',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1183;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1183,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Ironaya',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1184;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1184,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Ancient Stone Keeper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1185;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1185,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Galgann Firehammer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1186;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1186,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Grimlok',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1187;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1187,
    `map_id` = 70,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Archaedas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1188;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1188,
    `map_id` = 70,
    `difficulty` = 2,
    `name_1` = 'Revelosh',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1189;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1189,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'The Lost Dwarves',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1190;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1190,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Ironaya',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1191;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1191,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Ancient Stone Keeper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1192;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1192,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Galgann Firehammer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1193;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1193,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Grimlok',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1194;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1194,
    `map_id` = 70,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Archaedas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1195;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1195,
    `map_id` = 209,
    `difficulty` = 1,
    `name_1` = 'Hydromancer Velratha',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1196;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1196,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Ghaz''rilla',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1197;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1197,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Antu''sul',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1198;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1198,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Theka the Martyr',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1199;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1199,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Witch Doctor Zum''rah',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1200;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1200,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Nekrum Gutchewer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1201;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1201,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Shadowpriest Sezz''ziz',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1202;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1202,
    `map_id` = 209,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Chief Ukorz Sandscalp',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1203;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1203,
    `map_id` = 209,
    `difficulty` = 2,
    `name_1` = 'Hydromancer Velratha',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1204;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1204,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Ghaz''rilla',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1205;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1205,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Antu''sul',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1206;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1206,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Theka the Martyr',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1207;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1207,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Witch Doctor Zum''rah',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1208;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1208,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Nekrum Gutchewer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1209;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1209,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Shadowpriest Sezz''ziz',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1210;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1210,
    `map_id` = 209,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Chief Ukorz Sandscalp',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1211;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1211,
    `map_id` = 349,
    `difficulty` = 1,
    `name_1` = 'Noxxion',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1212;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1212,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Razorlash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1213;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1213,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Lord Vyletongue',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1214;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1214,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Celebras the Cursed',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1215;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1215,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Landslide',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1216;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1216,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Tinkerer Gizlock',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1217;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1217,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Rotgrip',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1218;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1218,
    `map_id` = 349,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Princess Theradras',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1219;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1219,
    `map_id` = 349,
    `difficulty` = 2,
    `name_1` = 'Noxxion',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1220;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1220,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Razorlash',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1221;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1221,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Lord Vyletongue',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1223;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1223,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Celebras the Cursed',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1224;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1224,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Landslide',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1225;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1225,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Tinkerer Gizlock',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1226;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1226,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Rotgrip',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1227;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1227,
    `map_id` = 349,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Princess Theradras',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1228;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1228,
    `map_id` = 109,
    `difficulty` = 1,
    `name_1` = 'Atal''alarion',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1229;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1229,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Dreamscythe',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1230;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1230,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Weaver',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1231;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1231,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 500,
    `bit` = 3,
    `name_1` = 'Jammal''an the Prophet',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1232;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1232,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Morphaz',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1233;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1233,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Hazzas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1234;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1234,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Avatar of Hakkar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1235;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1235,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Shade of Eranikus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1236;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1236,
    `map_id` = 109,
    `difficulty` = 2,
    `name_1` = 'Atal''alarion',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1237;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1237,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Dreamscythe',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1238;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1238,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Weaver',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1239;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1239,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 500,
    `bit` = 3,
    `name_1` = 'Jammal''an the Prophet',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1240;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1240,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Morphaz',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1241;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1241,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Hazzas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1242;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1242,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Avatar of Hakkar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1243;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1243,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Shade of Eranikus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1244;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1244,
    `map_id` = 229,
    `difficulty` = 1,
    `name_1` = 'Highlord Omokk',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1245;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1245,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Shadow Hunter Vosh''gajin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1246;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1246,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'War Master Voone',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1247;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1247,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Mother Smolderweb',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1248;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1248,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Urok Doomhowl',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1249;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1249,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Quartermaster Zigris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1250;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1250,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Gizrul the Slavener',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1251;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1251,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 5500,
    `bit` = 7,
    `name_1` = 'Halycon',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1252;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1252,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Overlord Wyrmthalak',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1253;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1253,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'Pyroguard Emberseer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1254;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1254,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Solakar Flamewreath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1255;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1255,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Warchief Rend Blackhand',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1256;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1256,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'The Beast',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1257;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1257,
    `map_id` = 229,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 13,
    `name_1` = 'General Drakkisath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1258;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1258,
    `map_id` = 229,
    `difficulty` = 2,
    `name_1` = 'Highlord Omokk',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1259;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1259,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Shadow Hunter Vosh''gajin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1260;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1260,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'War Master Voone',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1261;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1261,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Mother Smolderweb',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1262;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1262,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Urok Doomhowl',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1263;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1263,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Quartermaster Zigris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1264;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1264,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Gizrul the Slavener',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1265;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1265,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 5500,
    `bit` = 7,
    `name_1` = 'Halycon',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1266;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1266,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Overlord Wyrmthalak',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1267;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1267,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'Pyroguard Emberseer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1268;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1268,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Solakar Flamewreath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1269;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1269,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Warchief Rend Blackhand',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1270;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1270,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'The Beast',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1271;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1271,
    `map_id` = 229,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 13,
    `name_1` = 'General Drakkisath',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1272;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1272,
    `map_id` = 429,
    `difficulty` = 1,
    `name_1` = 'Zevrim Thornhoof',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1273;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1273,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Hydrospawn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1274;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1274,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Lethtendris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1275;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1275,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Alzzin the Wildshaper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1276;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1276,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Illyanna Ravenoak',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1277;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1277,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Magister Kalendris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1278;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1278,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Immol''thar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1279;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1279,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 3500,
    `bit` = 7,
    `name_1` = 'Tendris Warpwood',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1280;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1280,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 8,
    `name_1` = 'Prince Tortheldrin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1281;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1281,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 9,
    `name_1` = 'Guard Mol''dar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1282;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1282,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 10,
    `name_1` = 'Stomper Kreeg',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1283;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1283,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 11,
    `name_1` = 'Guard Fengus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1284;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1284,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 12,
    `name_1` = 'Guard Slip''kik',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1285;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1285,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 13,
    `name_1` = 'Captain Kromcrush',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1286;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1286,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 13000,
    `bit` = 14,
    `name_1` = 'Cho''Rush the Observer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1287;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1287,
    `map_id` = 429,
    `difficulty` = 1,
    `orderIndex` = 14000,
    `bit` = 15,
    `name_1` = 'King Gordok',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1288;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1288,
    `map_id` = 429,
    `difficulty` = 2,
    `name_1` = 'Zevrim Thornhoof',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1289;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1289,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Hydrospawn',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1290;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1290,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Lethtendris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1291;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1291,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Alzzin the Wildshaper',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1292;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1292,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Illyanna Ravenoak',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1293;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1293,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Magister Kalendris',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1294;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1294,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Immol''thar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1295;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1295,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 3500,
    `bit` = 7,
    `name_1` = 'Tendris Warpwood',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1296;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1296,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 8,
    `name_1` = 'Prince Tortheldrin',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1297;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1297,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 9,
    `name_1` = 'Guard Mol''dar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1298;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1298,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 10,
    `name_1` = 'Stomper Kreeg',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1299;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1299,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 11,
    `name_1` = 'Guard Fengus',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1300;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1300,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 12,
    `name_1` = 'Guard Slip''kik',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1301;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1301,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 13,
    `name_1` = 'Captain Kromcrush',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1302;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1302,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 13000,
    `bit` = 14,
    `name_1` = 'Cho''Rush the Observer',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1303;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1303,
    `map_id` = 429,
    `difficulty` = 2,
    `orderIndex` = 14000,
    `bit` = 15,
    `name_1` = 'King Gordok',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1304;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1304,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 6500,
    `name_1` = 'The Unforgiven',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1305;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1305,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Hearthsinger Forresten',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1306;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1306,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Timmy the Cruel',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1307;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1307,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Cannon Master Willey',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1308;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1308,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Malor the Zealous',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1309;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1309,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Archivist Galford',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1310;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1310,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Balnazzar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1312;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1312,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Baroness Anastari',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1313;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1313,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Nerub''enkan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1314;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1314,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'Maleki the Pallid',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1315;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1315,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Magistrate Barthilas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1316;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1316,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Ramnstein the Gorger',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1317;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1317,
    `map_id` = 329,
    `difficulty` = 1,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Baron Rivendare',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1318;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1318,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 6500,
    `name_1` = 'The Unforgiven',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1319;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1319,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 1000,
    `bit` = 1,
    `name_1` = 'Hearthsinger Forresten',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1320;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1320,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 2000,
    `bit` = 2,
    `name_1` = 'Timmy the Cruel',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1321;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1321,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 3000,
    `bit` = 3,
    `name_1` = 'Cannon Master Willey',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1322;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1322,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 4000,
    `bit` = 4,
    `name_1` = 'Malor the Zealous',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1323;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1323,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 5000,
    `bit` = 5,
    `name_1` = 'Archivist Galford',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1324;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1324,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 6000,
    `bit` = 6,
    `name_1` = 'Balnazzar',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1325;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1325,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 7000,
    `bit` = 7,
    `name_1` = 'Baroness Anastari',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1326;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1326,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 8000,
    `bit` = 8,
    `name_1` = 'Nerub''enkan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1327;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1327,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 9000,
    `bit` = 9,
    `name_1` = 'Maleki the Pallid',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1328;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1328,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 10000,
    `bit` = 10,
    `name_1` = 'Magistrate Barthilas',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1329;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1329,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 11000,
    `bit` = 11,
    `name_1` = 'Ramnstein the Gorger',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1330;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1330,
    `map_id` = 329,
    `difficulty` = 2,
    `orderIndex` = 12000,
    `bit` = 12,
    `name_1` = 'Baron Rivendare',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1331;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1331,
    `map_id` = 109,
    `orderIndex` = 50,
    `bit` = 9,
    `name_1` = 'Hukku',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1332;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1332,
    `map_id` = 109,
    `orderIndex` = 100,
    `bit` = 10,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1333;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1333,
    `map_id` = 109,
    `orderIndex` = 150,
    `bit` = 10,
    `name_1` = 'Loro',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1334;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1334,
    `map_id` = 109,
    `orderIndex` = 200,
    `bit` = 11,
    `name_1` = 'Mijan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1335;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1335,
    `map_id` = 109,
    `orderIndex` = 250,
    `bit` = 12,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1336;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1336,
    `map_id` = 109,
    `orderIndex` = 300,
    `bit` = 13,
    `name_1` = 'Zul''Lor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1337;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1337,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 50,
    `bit` = 9,
    `name_1` = 'Hukku',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1338;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1338,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 100,
    `bit` = 10,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1339;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1339,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 150,
    `bit` = 10,
    `name_1` = 'Loro',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1340;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1340,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 200,
    `bit` = 11,
    `name_1` = 'Mijan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1341;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1341,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 250,
    `bit` = 12,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1342;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1342,
    `map_id` = 109,
    `difficulty` = 1,
    `orderIndex` = 300,
    `bit` = 13,
    `name_1` = 'Zul''Lor',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1343;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1343,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 50,
    `bit` = 9,
    `name_1` = 'Hukku',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1344;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1344,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 100,
    `bit` = 10,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1345;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1345,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 150,
    `bit` = 10,
    `name_1` = 'Loro',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1346;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1346,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 200,
    `bit` = 11,
    `name_1` = 'Mijan',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1347;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1347,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 250,
    `bit` = 12,
    `name_1` = 'Gasher',
    `name_flags` = 16712190;

DELETE FROM `dbc`.`dungeonencounter` WHERE `id` = 1348;
INSERT INTO `dbc`.`dungeonencounter` SET 
    `id` = 1348,
    `map_id` = 109,
    `difficulty` = 2,
    `orderIndex` = 300,
    `bit` = 13,
    `name_1` = 'Zul''Lor',
    `name_flags` = 16712190;

