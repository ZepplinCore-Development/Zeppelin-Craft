-- Emperor Dagran Thaurissan - Black Diamond Dragonling design
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9019) AND (`Item` = 57502);

INSERT INTO `creature_loot_template` SET
    `Entry` = 9019,
    `Item` = 57502,
    `Comment` = 'Emperor Dagran Thaurissan - Design: Black Diamond Dragonling';
