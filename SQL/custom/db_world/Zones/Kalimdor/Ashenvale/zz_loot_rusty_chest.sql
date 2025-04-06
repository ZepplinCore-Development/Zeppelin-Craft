-- Increased drop chance of the Iron Pommel
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 2971 AND `Item` = 5519;
INSERT INTO `gameobject_loot_template` SET
    `Entry` = 2971,
    `Item` = 5519,
    `Chance` = 50.0,
    `QuestRequired` = 1,
    `GroupId` = 1,
    `Comment` = 'Rusty Chest - Iron Pommel';