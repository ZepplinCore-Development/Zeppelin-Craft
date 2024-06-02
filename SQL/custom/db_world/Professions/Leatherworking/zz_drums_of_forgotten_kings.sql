-- Pattern: Drums of Forgotten Kings
    DELETE FROM `item_template` WHERE (`entry` = 902315);
    INSERT INTO `item_template`
    SET `entry` = 902315,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of Forgotten Kings',
        `description` = 'Teaches you how to make Drums of Forgotten Kings',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 69386,
        `spelltrigger_2` = 6;

-- Drums of Forgotten Kings
    DELETE FROM `item_template` WHERE (`entry` = 902316);
    INSERT INTO `item_template`
    SET `entry` = 902316,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of Forgotten Kings',
        `description` = 'Here come the drums',
        `displayid` = 41061,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 67686,
        `spellcharges_1` = -50;