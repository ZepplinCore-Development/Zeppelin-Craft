-- Added Pattern: Drums of the Nights Watch to the loot table for Sulfuron
DELETE FROM `creature_loot_template` WHERE (`Entry` = 12098 AND `Item` = 57606);
INSERT INTO `creature_loot_template` SET
    `Entry` = 12098,
    `Item` = 57606,
    `Comment` = 'Pattern: Drums of the Nights Watch';
