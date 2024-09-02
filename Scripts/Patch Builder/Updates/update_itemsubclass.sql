DELETE FROM `dbc`.`itemsubclass` WHERE `Class` = 5 AND `subClass` = 1;
INSERT INTO `dbc`.`itemsubclass` SET 
    `Class` = 5,
    `subClass` = 1,
    `prerequisiteProficiency` = 4294967295,
    `postrequisiteProficiency` = 4294967295,
    `displayFlags` = 1,
    `weaponParrySeq` = 3,
    `weaponReadySeq` = 2,
    `weaponAttackSeq` = 3,
    `displayName1` = 'Tool',
    `displayNameFlag` = 16712190,
    `verboseNameFlag` = 16712188;

