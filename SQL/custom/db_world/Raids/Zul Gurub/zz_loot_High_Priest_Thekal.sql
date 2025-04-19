-- Added Pattern: Drums of Fortitude to the loot table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 14509 AND `Item` = 57602);
INSERT INTO `creature_loot_template` SET
    `Entry` = 14509,
    `Item` = 57602,
    `Comment` = 'Pattern: Drums of Fortitude';
