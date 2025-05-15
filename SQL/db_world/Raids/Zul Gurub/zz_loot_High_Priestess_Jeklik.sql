-- Added Pattern: Drums of the Wild to the loot table
DELETE FROM `creature_loot_template` WHERE (`Entry` = 14517 AND `Item` = 57608);
INSERT INTO `creature_loot_template` SET
    `Entry` = 14517,
    `Item` = 57608,
    `Comment` = 'Pattern: Drums of the Wild';
