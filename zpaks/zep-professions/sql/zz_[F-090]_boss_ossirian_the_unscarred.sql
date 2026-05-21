-- Add drums of intellect to the loot table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 15339 AND `Item` = 57604);
INSERT INTO `creature_loot_template` SET
    `Entry` = 15339,
    `Item` = 57604,
    `Comment` = 'Pattern: Drums of Intellect';

