DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 17883);
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(17883, 7076, 0, 4.1, 0, 1, 0, 1, 1, 'Small Obsidian Chunk - Essence of Earth'),
(17883, 12363, 0, 100, 0, 1, 0, 1, 2, 'Small Obsidian Chunk - Arcane Crystal'),
(17883, 12364, 0, 0.8, 0, 1, 0, 1, 1, 'Small Obsidian Chunk - Huge Emerald'),
(17883, 12800, 0, 1, 0, 1, 0, 1, 1, 'Small Obsidian Chunk - Azerothian Diamond'),
(17883, 22202, 0, 90, 0, 1, 0, 1, 1, 'Small Obsidian Chunk - Small Obsidian Shard'),
(17883, 22203, 0, 3.7, 0, 1, 0, 1, 1, 'Small Obsidian Chunk - Large Obsidian Shard');

DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 17884);
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(17884, 7076, 0, 9.9, 0, 1, 0, 1, 1, 'Large Obsidian Chunk - Essence of Earth'),
(17884, 12363, 0, 100, 0, 1, 0, 1, 3, 'Large Obsidian Chunk - Arcane Crystal'),
(17884, 12364, 0, 1.4, 0, 1, 0, 1, 1, 'Large Obsidian Chunk - Huge Emerald'),
(17884, 22202, 0, 50.5, 0, 1, 0, 2, 3, 'Large Obsidian Chunk - Small Obsidian Shard'),
(17884, 22203, 0, 37.8, 0, 1, 0, 1, 1, 'Large Obsidian Chunk - Large Obsidian Shard');
