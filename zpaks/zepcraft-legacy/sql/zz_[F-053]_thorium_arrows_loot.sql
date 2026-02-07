-- Emperor Dagran Thaurissan - Thorium Headed Arrows schematic
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9019) AND (`Item` = 57206);

INSERT INTO `creature_loot_template` SET
    `Entry` = 9019,
    `Item` = 57206,
    `Comment` = 'Emperor Dagran Thaurissan - Schematic: Thorium Headed Arrows';
