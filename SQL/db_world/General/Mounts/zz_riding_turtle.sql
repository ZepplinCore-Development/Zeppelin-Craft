-- Riding Turtle
UPDATE `item_template` 
SET `Quality` = 3,
    `RequiredLevel` = 10
WHERE (`entry` = 23720);

-- Ghamoo-ra (BFD) drop of the Riding Turtle
DELETE FROM `creature_loot_template` WHERE (`Entry` = 4887) AND (`Item` IN (23720));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(4887, 23720, 0, 50, 0, 1, 2, 1, 1, 'Ghamoo-ra - Riding Turtle');
