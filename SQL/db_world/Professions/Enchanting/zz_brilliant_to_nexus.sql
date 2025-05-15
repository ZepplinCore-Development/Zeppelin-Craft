-- Formula: Nexus Shard
    DELETE FROM `item_template` WHERE (`entry` = 57101);
    INSERT INTO `item_template`
    SET `entry` = 57101,
        `class` = 9, -- Recipe
        `subclass` = 8, -- Enchanting
        `name` = 'Formula: Nexus Shard',
        `description` = 'Allows you to transform those pesky Large Brilliant Shards',
        `displayid` = 1301,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 333, -- Enchanting
        `RequiredSkillRank` = 295,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91000,
        `spelltrigger_2` = 6;
