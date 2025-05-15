-- Increased drop chance of Galaens Amulet
DELETE FROM `creature_loot_template` WHERE (`Entry` = 17606 AND `Item` = 23873);
INSERT INTO `creature_loot_template` SET
    `Entry` = 17606,
    `Item` = 23873,
    `Chance` = 10,
    `QuestRequired` = 1,
    `Comment` = 'Sunhawk Reclaimer - Galaens Amulet';

