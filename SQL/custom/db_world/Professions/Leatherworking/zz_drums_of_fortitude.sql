-- Pattern: Drums of Fortitude
    DELETE FROM `item_template` WHERE (`entry` = 902317);
    INSERT INTO `item_template`
    SET `entry` = 902317,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of Fortitude',
        `description` = 'Teaches you how to make Drums of Fortitude',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 80818,
        `spelltrigger_2` = 6;

-- Drums of Fortitude
    DELETE FROM `item_template` WHERE (`entry` = 902318);
    INSERT INTO `item_template`
    SET `entry` = 902318,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of Fortitude',
        `description` = 'The perfect way to drown out insults.',
        `displayid` = 41062,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 80813,
        `spellcharges_1` = -50;