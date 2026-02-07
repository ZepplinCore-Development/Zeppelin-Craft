-- King Gordok Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 11501) AND (`Item` IN (57101));
INSERT INTO `creature_loot_template` SET
    `Entry` = 11501,
    `Item` = 57101,
    `Chance` = 10,
    `GroupId` = 1,
    `Comment` = 'Formula: Nexus Shard';

-- Tribute Loot
DELETE FROM `reference_loot_template` WHERE (`Entry` = 12007) AND (`Item` IN (57101));
INSERT INTO `reference_loot_template` SET
    `Entry` = 12007,
    `Item` = 57101,
    `LootMode` = 32,
    `GroupId` = 2,
    `Comment` = 'Formula: Nexus Shard';