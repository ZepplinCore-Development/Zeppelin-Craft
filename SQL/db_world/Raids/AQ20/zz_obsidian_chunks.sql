-- Increase chance of finding Arcane Crystals inside Obsidian Chunks

-- Small Obsidian Chunk
    DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 17883);
    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 7076,
        `Chance` = 4.1,
        `Comment` = 'Small Obsidian Chunk - Essence of Earth';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 12363,
        `MaxCount` = 2,
        `Comment` = 'Small Obsidian Chunk - Arcane Crystal';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 12364,
        `Chance` = 0.8,
        `Comment` = 'Small Obsidian Chunk - Huge Emerald';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 12800,
        `Chance` = 1.0,
        `Comment` = 'Small Obsidian Chunk - Azerothian Diamond';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 22202,
        `Chance` = 90.0,
        `Comment` = 'Small Obsidian Chunk - Small Obsidian Shard';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17883,
        `Item` = 22203,
        `Chance` = 3.7,
        `Comment` = 'Small Obsidian Chunk - Large Obsidian Shard';

-- Large Obsidian Chunk
    DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 17884);

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17884,
        `Item` = 7076,
        `Chance` = 9.9,
        `Comment` = 'Large Obsidian Chunk - Essence of Earth';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17884,
        `Item` = 12363,
        `MaxCount` = 3,
        `Comment` = 'Large Obsidian Chunk - Arcane Crystal';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17884,
        `Item` = 12364,
        `Chance` = 1.4,
        `Comment` = 'Large Obsidian Chunk - Huge Emerald';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17884,
        `Item` = 22202,
        `Chance` = 50.5,
        `MinCount` = 2,
        `MaxCount` = 3,
        `Comment` = 'Large Obsidian Chunk - Small Obsidian Shard';

    INSERT INTO `gameobject_loot_template` SET
        `Entry` = 17884,
        `Item` = 22203,
        `Chance` = 37.8,
        `Comment` = 'Large Obsidian Chunk - Large Obsidian Shard';

