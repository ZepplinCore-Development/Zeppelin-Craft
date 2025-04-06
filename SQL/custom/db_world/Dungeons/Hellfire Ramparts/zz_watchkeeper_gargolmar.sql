-- Add Fel Iron Arrows schematic to Watchkeeper Gargolmar loot table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 17306 AND `Item` = 57207);
INSERT INTO `creature_loot_template` SET
    `Entry` = 17306,
    `Item` = 57207,
    `Comment` = 'Schematic: Fel Iron Arrows';
