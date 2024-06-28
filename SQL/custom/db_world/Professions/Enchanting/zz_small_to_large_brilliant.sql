-- Formula: Arcane Transmutation: Large Brilliant Shard to Nexus
    DELETE FROM `item_template` WHERE (`entry` = 57100);
    INSERT INTO `item_template`
    SET `entry` = 57100,
        `class` = 9, -- Recipe
        `subclass` = 8, -- Enchanting
        `name` = 'Formula: Large Brilliant Shard',
        `description` = 'Allows you to transform those pesky Small Brilliant Shards',
        `displayid` = 1301,
        `SellPrice` = 50000, -- 5G 
        `Quality` = 3, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 333, -- Enchanting
        `RequiredSkillRank` = 295,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91117,
        `spelltrigger_2` = 6;
