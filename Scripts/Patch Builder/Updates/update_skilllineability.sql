UPDATE `dbc`.`skilllineability` SET 
    `chrRaces` = 3149 /* was 1101 */
WHERE `id` = 590;

UPDATE `dbc`.`skilllineability` SET 
    `chrRaces` = 946 /* was 690 */
WHERE `id` = 592;

UPDATE `dbc`.`skilllineability` SET 
    `requiredSkillValue` = 0 /* was 1 */
WHERE `id` = 610;

UPDATE `dbc`.`skilllineability` SET 
    `chrClasses` = 195 /* was 67 */
WHERE `id` = 5006;

UPDATE `dbc`.`skilllineability` SET 
    `chrClasses` = 0 /* was 8 */
WHERE `id` = 8439;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 593 /* was 189 */,
    `chrClasses` = 256 /* was 0 */
WHERE `id` = 11180;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 12042;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 12043;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 573 */,
    `chrClasses` = 0 /* was 1024 */
WHERE `id` = 12096;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 573 */,
    `chrClasses` = 0 /* was 1024 */
WHERE `id` = 12097;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 237 */,
    `chrClasses` = 0 /* was 128 */
WHERE `id` = 12397;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 13256;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 267 */,
    `chrClasses` = 0 /* was 2 */
WHERE `id` = 13456;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 573 */,
    `chrClasses` = 0 /* was 1024 */
WHERE `id` = 13575;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 237 */,
    `chrClasses` = 0 /* was 128 */
WHERE `id` = 13659;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 13809;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 14939;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 237 */,
    `chrClasses` = 0 /* was 128 */
WHERE `id` = 15955;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */,
    `chrClasses` = 0 /* was 16 */
WHERE `id` = 16529;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 792 /* was 613 */
WHERE `id` = 16578;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17454;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17811;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17812;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17813;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17814;

UPDATE `dbc`.`skilllineability` SET 
    `skillId` = 270 /* was 212 */
WHERE `id` = 17815;

UPDATE `dbc`.`skilllineability` SET 
    `skillGreyLevel` = 315 /* was 375 */,
    `skillGreenLevel` = 265 /* was 350 */
WHERE `id` = 20659;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21981;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21981,
    `skillId` = 789,
    `spellId` = 68975,
    `chrRaces` = 2048,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21982;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21982,
    `skillId` = 789,
    `spellId` = 68976,
    `chrRaces` = 2048,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21983;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21983,
    `skillId` = 789,
    `spellId` = 68978,
    `chrRaces` = 2048,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21984;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21984,
    `skillId` = 789,
    `spellId` = 68992,
    `chrRaces` = 2048,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21985;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21985,
    `skillId` = 790,
    `spellId` = 69042,
    `chrRaces` = 256,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21986;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21986,
    `skillId` = 790,
    `spellId` = 69045,
    `chrRaces` = 256,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21987;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21987,
    `skillId` = 790,
    `spellId` = 69046,
    `chrRaces` = 256,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21988;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21988,
    `skillId` = 790,
    `spellId` = 69070,
    `chrRaces` = 256,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 21989;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 21989,
    `skillId` = 790,
    `spellId` = 69041,
    `chrRaces` = 256,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31439;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31439,
    `skillId` = 50,
    `spellId` = 36613,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31441;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31441,
    `skillId` = 900,
    `spellId` = 56992,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31442;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31442,
    `skillId` = 900,
    `spellId` = 61199,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31443;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31443,
    `skillId` = 900,
    `spellId` = 17253,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17255,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31444;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31444,
    `skillId` = 900,
    `spellId` = 58598,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31445;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31445,
    `skillId` = 900,
    `spellId` = 17255,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17256,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31446;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31446,
    `skillId` = 900,
    `spellId` = 17256,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17257,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31447;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31447,
    `skillId` = 900,
    `spellId` = 17257,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17258,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31448;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31448,
    `skillId` = 900,
    `spellId` = 17258,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17259,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31449;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31449,
    `skillId` = 900,
    `spellId` = 17259,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17260,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31450;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31450,
    `skillId` = 900,
    `spellId` = 17260,
    `requiredSkillValue` = 1,
    `spellIdParent` = 17261,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31451;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31451,
    `skillId` = 900,
    `spellId` = 17261,
    `requiredSkillValue` = 1,
    `spellIdParent` = 27050,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31452;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31452,
    `skillId` = 900,
    `spellId` = 27050,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52473,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31453;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31453,
    `skillId` = 900,
    `spellId` = 52473,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52474,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31454;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31454,
    `skillId` = 900,
    `spellId` = 52474,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31455;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31455,
    `skillId` = 212,
    `spellId` = 6580,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31456;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31456,
    `skillId` = 270,
    `spellId` = 22683,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31457;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31457,
    `skillId` = 900,
    `spellId` = 50433,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52395,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31458;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31458,
    `skillId` = 900,
    `spellId` = 52395,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52396,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31459;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31459,
    `skillId` = 900,
    `spellId` = 52396,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52397,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31460;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31460,
    `skillId` = 900,
    `spellId` = 52397,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52398,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31461;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31461,
    `skillId` = 900,
    `spellId` = 52398,
    `requiredSkillValue` = 1,
    `spellIdParent` = 52399,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31462;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31462,
    `skillId` = 900,
    `spellId` = 52399,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31463;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31463,
    `skillId` = 900,
    `spellId` = 24394,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31464;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31464,
    `skillId` = 900,
    `spellId` = 19577,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31465;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31465,
    `skillId` = 900,
    `spellId` = 1742,
    `requiredSkillValue` = 1,
    `spellIdParent` = 1753,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31466;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31466,
    `skillId` = 900,
    `spellId` = 2649,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14916,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31467;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31467,
    `skillId` = 900,
    `spellId` = 14916,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14917,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31468;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31468,
    `skillId` = 900,
    `spellId` = 14917,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14918,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31469;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31469,
    `skillId` = 900,
    `spellId` = 14918,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14919,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31470;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31470,
    `skillId` = 900,
    `spellId` = 14919,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14920,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31471;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31471,
    `skillId` = 900,
    `spellId` = 14920,
    `requiredSkillValue` = 1,
    `spellIdParent` = 14921,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31472;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31472,
    `skillId` = 900,
    `spellId` = 14921,
    `requiredSkillValue` = 1,
    `spellIdParent` = 27047,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31473;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31473,
    `skillId` = 900,
    `spellId` = 27047,
    `requiredSkillValue` = 1,
    `spellIdParent` = 61676,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31474;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31474,
    `skillId` = 900,
    `spellId` = 34666,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31475;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31475,
    `skillId` = 900,
    `spellId` = 34667,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31476;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31476,
    `skillId` = 900,
    `spellId` = 34675,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31477;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31477,
    `skillId` = 900,
    `spellId` = 20782,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31478;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31478,
    `skillId` = 900,
    `spellId` = 8875,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31479;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31479,
    `skillId` = 900,
    `spellId` = 19580,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31480;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31480,
    `skillId` = 900,
    `spellId` = 19581,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31481;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31481,
    `skillId` = 900,
    `spellId` = 19582,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31482;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31482,
    `skillId` = 900,
    `spellId` = 19589,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31483;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31483,
    `skillId` = 900,
    `spellId` = 19591,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31484;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31484,
    `skillId` = 900,
    `spellId` = 20784,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31485;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31485,
    `skillId` = 900,
    `spellId` = 34902,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31486;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31486,
    `skillId` = 900,
    `spellId` = 34903,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31487;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31487,
    `skillId` = 900,
    `spellId` = 34904,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31488;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31488,
    `skillId` = 900,
    `spellId` = 53175,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31489;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31489,
    `skillId` = 900,
    `spellId` = 53176,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31490;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31490,
    `skillId` = 900,
    `spellId` = 53178,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31491;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31491,
    `skillId` = 900,
    `spellId` = 53179,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31492;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31492,
    `skillId` = 900,
    `spellId` = 53180,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31493;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31493,
    `skillId` = 900,
    `spellId` = 53181,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31494;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31494,
    `skillId` = 900,
    `spellId` = 53182,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31495;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31495,
    `skillId` = 900,
    `spellId` = 53183,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31496;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31496,
    `skillId` = 900,
    `spellId` = 53184,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31497;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31497,
    `skillId` = 900,
    `spellId` = 53186,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31498;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31498,
    `skillId` = 900,
    `spellId` = 53187,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31499;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31499,
    `skillId` = 900,
    `spellId` = 53203,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31500;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31500,
    `skillId` = 900,
    `spellId` = 53204,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31501;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31501,
    `skillId` = 900,
    `spellId` = 53205,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31502;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31502,
    `skillId` = 900,
    `spellId` = 53397,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31503;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31503,
    `skillId` = 900,
    `spellId` = 53401,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31504;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31504,
    `skillId` = 900,
    `spellId` = 53409,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31505;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31505,
    `skillId` = 900,
    `spellId` = 53411,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31506;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31506,
    `skillId` = 900,
    `spellId` = 53426,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31507;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31507,
    `skillId` = 900,
    `spellId` = 53427,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31508;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31508,
    `skillId` = 900,
    `spellId` = 53429,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31509;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31509,
    `skillId` = 900,
    `spellId` = 53430,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31510;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31510,
    `skillId` = 900,
    `spellId` = 19596,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31511;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31511,
    `skillId` = 900,
    `spellId` = 53434,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31512;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31512,
    `skillId` = 900,
    `spellId` = 53450,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31513;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31513,
    `skillId` = 900,
    `spellId` = 53451,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31514;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31514,
    `skillId` = 900,
    `spellId` = 52858,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31515;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31515,
    `skillId` = 900,
    `spellId` = 53476,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31516;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31516,
    `skillId` = 900,
    `spellId` = 53477,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31517;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31517,
    `skillId` = 900,
    `spellId` = 53478,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31518;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31518,
    `skillId` = 900,
    `spellId` = 53480,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31519;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31519,
    `skillId` = 900,
    `spellId` = 53481,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31520;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31520,
    `skillId` = 900,
    `spellId` = 53482,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31521;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31521,
    `skillId` = 900,
    `spellId` = 53490,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31522;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31522,
    `skillId` = 900,
    `spellId` = 52234,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31523;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31523,
    `skillId` = 900,
    `spellId` = 53497,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31524;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31524,
    `skillId` = 900,
    `spellId` = 53508,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31525;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31525,
    `skillId` = 900,
    `spellId` = 53511,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31526;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31526,
    `skillId` = 900,
    `spellId` = 53512,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31527;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31527,
    `skillId` = 900,
    `spellId` = 53514,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31528;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31528,
    `skillId` = 900,
    `spellId` = 53516,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31529;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31529,
    `skillId` = 900,
    `spellId` = 53517,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31530;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31530,
    `skillId` = 900,
    `spellId` = 54044,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31531;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31531,
    `skillId` = 900,
    `spellId` = 53483,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31532;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31532,
    `skillId` = 900,
    `spellId` = 53485,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31533;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31533,
    `skillId` = 900,
    `spellId` = 53554,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31534;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31534,
    `skillId` = 900,
    `spellId` = 53555,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31535;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31535,
    `skillId` = 900,
    `spellId` = 55566,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31536;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31536,
    `skillId` = 900,
    `spellId` = 55709,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31537;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31537,
    `skillId` = 900,
    `spellId` = 61017,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31538;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31538,
    `skillId` = 900,
    `spellId` = 61676,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31539;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31539,
    `skillId` = 900,
    `spellId` = 61680,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31540;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31540,
    `skillId` = 900,
    `spellId` = 61681,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31541;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31541,
    `skillId` = 900,
    `spellId` = 61682,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31542;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31542,
    `skillId` = 900,
    `spellId` = 61683,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31543;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31543,
    `skillId` = 900,
    `spellId` = 61689,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31544;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31544,
    `skillId` = 900,
    `spellId` = 61690,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31545;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31545,
    `skillId` = 900,
    `spellId` = 61686,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31546;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31546,
    `skillId` = 900,
    `spellId` = 61687,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31547;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31547,
    `skillId` = 900,
    `spellId` = 61688,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31548;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31548,
    `skillId` = 900,
    `spellId` = 62758,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31549;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31549,
    `skillId` = 900,
    `spellId` = 62759,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31550;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31550,
    `skillId` = 900,
    `spellId` = 62760,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31551;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31551,
    `skillId` = 900,
    `spellId` = 62762,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31552;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31552,
    `skillId` = 900,
    `spellId` = 62764,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31553;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31553,
    `skillId` = 900,
    `spellId` = 62765,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31554;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31554,
    `skillId` = 900,
    `spellId` = 63900,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31555;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31555,
    `skillId` = 900,
    `spellId` = 65220,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31556;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31556,
    `skillId` = 900,
    `spellId` = 75446,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31557;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31557,
    `skillId` = 900,
    `spellId` = 75447,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31558;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31558,
    `skillId` = 900,
    `spellId` = 75593,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31559;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31559,
    `skillId` = 900,
    `spellId` = 22683,
    `requiredSkillValue` = 1,
    `acquireMethod` = 2;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31560;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31560,
    `skillId` = 202,
    `spellId` = 91079,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 305,
    `skillGreenLevel` = 295;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31561;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31561,
    `skillId` = 755,
    `spellId` = 91085,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31562;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31562,
    `skillId` = 755,
    `spellId` = 91076,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31563;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31563,
    `skillId` = 202,
    `spellId` = 91081,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31565;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31565,
    `skillId` = 164,
    `spellId` = 91074,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31569;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31569,
    `skillId` = 202,
    `spellId` = 80810,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31570;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31570,
    `skillId` = 165,
    `spellId` = 80819,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31571;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31571,
    `skillId` = 165,
    `spellId` = 80816,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31572;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31572,
    `skillId` = 165,
    `spellId` = 80817,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31573;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31573,
    `skillId` = 165,
    `spellId` = 69388,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31574;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31574,
    `skillId` = 165,
    `spellId` = 69386,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31575;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31575,
    `skillId` = 165,
    `spellId` = 80818,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31576;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31576,
    `skillId` = 333,
    `spellId` = 72559,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31577;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31577,
    `skillId` = 26,
    `spellId` = 91001,
    `chrClasses` = 1,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31578;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31578,
    `skillId` = 184,
    `spellId` = 91002,
    `chrClasses` = 2,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31579;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31579,
    `skillId` = 333,
    `spellId` = 91000,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 310,
    `skillGreenLevel` = 275;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31580;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31580,
    `skillId` = 773,
    `spellId` = 91009,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31581;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31581,
    `skillId` = 773,
    `spellId` = 91010,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31582;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31582,
    `skillId` = 773,
    `spellId` = 91012,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31583;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31583,
    `skillId` = 773,
    `spellId` = 91013,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31584;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31584,
    `skillId` = 773,
    `spellId` = 91014,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31585;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31585,
    `skillId` = 773,
    `spellId` = 91015,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31586;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31586,
    `skillId` = 773,
    `spellId` = 91016,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31587;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31587,
    `skillId` = 773,
    `spellId` = 91017,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 160,
    `skillGreenLevel` = 150;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31588;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31588,
    `skillId` = 773,
    `spellId` = 91080,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 325,
    `skillGreenLevel` = 315;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 31589;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 31589,
    `skillId` = 333,
    `spellId` = 91117,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 265,
    `skillGreenLevel` = 250;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32000;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32000,
    `skillId` = 237,
    `spellId` = 91058,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32001;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32001,
    `skillId` = 237,
    `spellId` = 91059,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32002;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32002,
    `skillId` = 237,
    `spellId` = 91060,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32003;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32003,
    `skillId` = 237,
    `spellId` = 91061,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32004;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32004,
    `skillId` = 237,
    `spellId` = 91062,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32005;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32005,
    `skillId` = 237,
    `spellId` = 91063,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32006;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32006,
    `skillId` = 237,
    `spellId` = 91064,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32007;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32007,
    `skillId` = 237,
    `spellId` = 91065,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32008;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32008,
    `skillId` = 237,
    `spellId` = 91066,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 32009;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 32009,
    `skillId` = 202,
    `spellId` = 91087,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 330,
    `skillGreenLevel` = 310;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99970;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99970,
    `skillId` = 333,
    `spellId` = 91144,
    `requiredSkillValue` = 125,
    `skillGreyLevel` = 165,
    `skillGreenLevel` = 145;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99971;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99971,
    `skillId` = 333,
    `spellId` = 91145,
    `requiredSkillValue` = 125,
    `skillGreyLevel` = 165,
    `skillGreenLevel` = 145;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99972;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99972,
    `skillId` = 333,
    `spellId` = 91146,
    `requiredSkillValue` = 175,
    `skillGreyLevel` = 215,
    `skillGreenLevel` = 195;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99973;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99973,
    `skillId` = 333,
    `spellId` = 91147,
    `requiredSkillValue` = 175,
    `skillGreyLevel` = 215,
    `skillGreenLevel` = 195;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99974;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99974,
    `skillId` = 333,
    `spellId` = 91148,
    `requiredSkillValue` = 175,
    `skillGreyLevel` = 215,
    `skillGreenLevel` = 195;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99975;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99975,
    `skillId` = 333,
    `spellId` = 91149,
    `requiredSkillValue` = 225,
    `skillGreyLevel` = 265,
    `skillGreenLevel` = 245;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99976;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99976,
    `skillId` = 333,
    `spellId` = 91150,
    `requiredSkillValue` = 225,
    `skillGreyLevel` = 265,
    `skillGreenLevel` = 245;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99977;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99977,
    `skillId` = 333,
    `spellId` = 91151,
    `requiredSkillValue` = 225,
    `skillGreyLevel` = 265,
    `skillGreenLevel` = 245;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99978;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99978,
    `skillId` = 333,
    `spellId` = 91152,
    `requiredSkillValue` = 275,
    `skillGreyLevel` = 315,
    `skillGreenLevel` = 295;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99979;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99979,
    `skillId` = 333,
    `spellId` = 91153,
    `requiredSkillValue` = 275,
    `skillGreyLevel` = 315,
    `skillGreenLevel` = 295;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99980;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99980,
    `skillId` = 333,
    `spellId` = 91154,
    `requiredSkillValue` = 300,
    `skillGreyLevel` = 340,
    `skillGreenLevel` = 320;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99981;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99981,
    `skillId` = 333,
    `spellId` = 91155,
    `requiredSkillValue` = 350,
    `skillGreyLevel` = 390,
    `skillGreenLevel` = 370;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99982;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99982,
    `skillId` = 333,
    `spellId` = 91156,
    `requiredSkillValue` = 400,
    `skillGreyLevel` = 440,
    `skillGreenLevel` = 420;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99983;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99983,
    `skillId` = 333,
    `spellId` = 91157,
    `requiredSkillValue` = 400,
    `skillGreyLevel` = 440,
    `skillGreenLevel` = 420;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99986;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99986,
    `skillId` = 773,
    `spellId` = 91139,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 275,
    `skillGreenLevel` = 265;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99987;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99987,
    `skillId` = 164,
    `spellId` = 91131,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 475,
    `skillGreenLevel` = 465;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99988;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99988,
    `skillId` = 164,
    `spellId` = 91129,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 400,
    `skillGreenLevel` = 390;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99989;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99989,
    `skillId` = 164,
    `spellId` = 91127,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 325,
    `skillGreenLevel` = 315;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99990;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99990,
    `skillId` = 164,
    `spellId` = 91125,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 250,
    `skillGreenLevel` = 240;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99991;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99991,
    `skillId` = 237,
    `spellId` = 91057,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99992;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99992,
    `skillId` = 237,
    `spellId` = 91056,
    `chrClasses` = 128,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99993;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99993,
    `skillId` = 164,
    `spellId` = 91123,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 175,
    `skillGreenLevel` = 165;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99994;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99994,
    `skillId` = 164,
    `spellId` = 91121,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 100,
    `skillGreenLevel` = 90;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99995;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99995,
    `skillId` = 163,
    `spellId` = 91119,
    `chrClasses` = 4,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99996;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99996,
    `skillId` = 792,
    `spellId` = 8690;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99997;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99997,
    `skillId` = 792,
    `spellId` = 42766;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99998;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99998,
    `skillId` = 792,
    `spellId` = 75136;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 99999;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 99999,
    `skillId` = 791,
    `spellId` = 91118,
    `requiredSkillValue` = 1;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100000;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100000,
    `skillId` = 613,
    `spellId` = 103246;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100001;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100001,
    `skillId` = 184,
    `spellId` = 103247;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100002;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100002,
    `skillId` = 574,
    `spellId` = 103248;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100003;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100003,
    `skillId` = 773,
    `spellId` = 103300,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 55,
    `skillGreenLevel` = 45;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100004;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100004,
    `skillId` = 773,
    `spellId` = 103301,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 60,
    `skillGreenLevel` = 50;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100005;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100005,
    `skillId` = 773,
    `spellId` = 103302,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 65,
    `skillGreenLevel` = 55;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100006;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100006,
    `skillId` = 773,
    `spellId` = 103303,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 70,
    `skillGreenLevel` = 60;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100007;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100007,
    `skillId` = 773,
    `spellId` = 103304,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 75,
    `skillGreenLevel` = 65;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100008;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100008,
    `skillId` = 773,
    `spellId` = 103305,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 80,
    `skillGreenLevel` = 70;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100009;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100009,
    `skillId` = 773,
    `spellId` = 103306,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 110,
    `skillGreenLevel` = 100;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100010;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100010,
    `skillId` = 773,
    `spellId` = 103307,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 115,
    `skillGreenLevel` = 105;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100011;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100011,
    `skillId` = 773,
    `spellId` = 103308,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 120,
    `skillGreenLevel` = 110;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100012;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100012,
    `skillId` = 773,
    `spellId` = 103309,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 125,
    `skillGreenLevel` = 115;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100013;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100013,
    `skillId` = 773,
    `spellId` = 103310,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 130,
    `skillGreenLevel` = 120;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100014;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100014,
    `skillId` = 773,
    `spellId` = 103311,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 135,
    `skillGreenLevel` = 125;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100015;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100015,
    `skillId` = 773,
    `spellId` = 103312,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 185,
    `skillGreenLevel` = 175;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100016;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100016,
    `skillId` = 773,
    `spellId` = 103313,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 190,
    `skillGreenLevel` = 180;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100017;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100017,
    `skillId` = 773,
    `spellId` = 103314,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 195,
    `skillGreenLevel` = 185;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100018;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100018,
    `skillId` = 773,
    `spellId` = 103315,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 200,
    `skillGreenLevel` = 190;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100019;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100019,
    `skillId` = 773,
    `spellId` = 103316,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 205,
    `skillGreenLevel` = 195;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100020;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100020,
    `skillId` = 773,
    `spellId` = 103317,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 210,
    `skillGreenLevel` = 200;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100021;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100021,
    `skillId` = 773,
    `spellId` = 103318,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 255,
    `skillGreenLevel` = 245;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100022;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100022,
    `skillId` = 773,
    `spellId` = 103319,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 260,
    `skillGreenLevel` = 250;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100023;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100023,
    `skillId` = 773,
    `spellId` = 103320,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 265,
    `skillGreenLevel` = 255;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100024;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100024,
    `skillId` = 773,
    `spellId` = 103321,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 270,
    `skillGreenLevel` = 260;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100025;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100025,
    `skillId` = 773,
    `spellId` = 103322,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 275,
    `skillGreenLevel` = 265;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100026;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100026,
    `skillId` = 773,
    `spellId` = 103323,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 280,
    `skillGreenLevel` = 270;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100027;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100027,
    `skillId` = 773,
    `spellId` = 103324,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 340,
    `skillGreenLevel` = 330;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100028;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100028,
    `skillId` = 773,
    `spellId` = 103325,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 345,
    `skillGreenLevel` = 335;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100029;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100029,
    `skillId` = 773,
    `spellId` = 103326,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 350,
    `skillGreenLevel` = 340;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100030;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100030,
    `skillId` = 773,
    `spellId` = 103327,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 355,
    `skillGreenLevel` = 345;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100031;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100031,
    `skillId` = 773,
    `spellId` = 103328,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 360,
    `skillGreenLevel` = 350;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100032;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100032,
    `skillId` = 773,
    `spellId` = 103329,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 365,
    `skillGreenLevel` = 355;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100033;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100033,
    `skillId` = 773,
    `spellId` = 103330,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 390,
    `skillGreenLevel` = 380;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100034;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100034,
    `skillId` = 773,
    `spellId` = 103331,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 395,
    `skillGreenLevel` = 385;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100035;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100035,
    `skillId` = 773,
    `spellId` = 103332,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 400,
    `skillGreenLevel` = 390;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100036;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100036,
    `skillId` = 773,
    `spellId` = 103333,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 405,
    `skillGreenLevel` = 395;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100037;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100037,
    `skillId` = 773,
    `spellId` = 103334,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 410,
    `skillGreenLevel` = 400;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100038;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100038,
    `skillId` = 773,
    `spellId` = 103335,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 415,
    `skillGreenLevel` = 405;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100039;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100039,
    `skillId` = 773,
    `spellId` = 103336,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 430,
    `skillGreenLevel` = 420;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100040;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100040,
    `skillId` = 773,
    `spellId` = 103337,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 435,
    `skillGreenLevel` = 425;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100041;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100041,
    `skillId` = 773,
    `spellId` = 103338,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 440,
    `skillGreenLevel` = 430;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100042;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100042,
    `skillId` = 773,
    `spellId` = 103339,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 445,
    `skillGreenLevel` = 435;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100043;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100043,
    `skillId` = 773,
    `spellId` = 103340,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 450,
    `skillGreenLevel` = 440;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100044;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100044,
    `skillId` = 773,
    `spellId` = 103341,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 450,
    `skillGreenLevel` = 445;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100045;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100045,
    `skillId` = 773,
    `spellId` = 103342,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 470,
    `skillGreenLevel` = 460;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100046;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100046,
    `skillId` = 773,
    `spellId` = 103343,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 472,
    `skillGreenLevel` = 462;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100047;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100047,
    `skillId` = 773,
    `spellId` = 103344,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 474,
    `skillGreenLevel` = 464;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100048;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100048,
    `skillId` = 773,
    `spellId` = 103345,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 476,
    `skillGreenLevel` = 466;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100049;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100049,
    `skillId` = 773,
    `spellId` = 103346,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 478,
    `skillGreenLevel` = 468;

DELETE FROM `dbc`.`skilllineability` WHERE `id` = 100050;
INSERT INTO `dbc`.`skilllineability` SET 
    `id` = 100050,
    `skillId` = 773,
    `spellId` = 103347,
    `requiredSkillValue` = 1,
    `skillGreyLevel` = 480,
    `skillGreenLevel` = 470;

