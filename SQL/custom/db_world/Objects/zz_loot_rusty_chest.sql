DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 2971);
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(2971, 2592, 0, 0, 0, 1, 0, 1, 1, 'Rusty Chest - Wool Cloth'),
(2971, 4306, 0, 0, 0, 1, 0, 1, 1, 'Rusty Chest - Silk Cloth'),
(2971, 5519, 0, 50, 1, 1, 1, 1, 1, 'Rusty Chest - Iron Pommel'),
(2971, 6712, 0, 0, 0, 1, 0, 1, 1, 'Rusty Chest - Practice Lock'),
(2971, 16747, 0, 0, 0, 1, 0, 1, 1, 'Rusty Chest - Broken Lock'),
(2971, 16748, 0, 0, 0, 1, 0, 1, 1, 'Rusty Chest - Padded Lining');
