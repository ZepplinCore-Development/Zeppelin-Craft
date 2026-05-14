-- Pattern: Drums of the Raid Leader drop from Prophet Skeram
DELETE FROM `creature_loot_template` WHERE (`Entry` = 15263 AND `Item` = 57610);
INSERT INTO `creature_loot_template` SET
    `Entry` = 15263,
    `Item` = 57610,
    `Comment` = 'Pattern: Drums of the Raid Leader';
