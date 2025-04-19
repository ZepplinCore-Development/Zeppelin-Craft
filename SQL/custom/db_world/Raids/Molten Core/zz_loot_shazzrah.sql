-- Added Formula: Mystic Resonator to the loot table for Shazzrah
DELETE FROM `creature_loot_template` WHERE (`Entry` = 12264);
INSERT INTO `creature_loot_template` SET
    `Entry` = 12264,
    `Item` = 57100,
    `GroupId` = 1,
    `Comment` = 'Formula: Mystic Resonator';
