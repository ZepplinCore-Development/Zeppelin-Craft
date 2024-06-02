-- Formula: Arcane Transmutation: Large Brilliant Shard to Nexus
    DELETE FROM `item_template` WHERE (`entry` = 902314);
    INSERT INTO `item_template`
    SET `entry` = 902314,
        `class` = 9, -- Recipe
        `subclass` = 8, -- Enchanting
        `name` = 'Formula: Arcane Transmutation: Large Brilliant Shard to Nexus',
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
