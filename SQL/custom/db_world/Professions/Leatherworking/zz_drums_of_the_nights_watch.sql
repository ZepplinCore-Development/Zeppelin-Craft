-- Pattern: Drums of the Nights Watch
    DELETE FROM `item_template` WHERE (`entry` = 902321);
    INSERT INTO `item_template`
    SET `entry` = 902321,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of the Nights Watch',
        `description` = 'Teaches you how to make Drums of the Nights Watch',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 80816,
        `spelltrigger_2` = 6;

-- Drums of the Nights Watch
    DELETE FROM `item_template` WHERE (`entry` = 902322);
    INSERT INTO `item_template`
    SET `entry` = 902322,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of the Nights Watch',
        `description` = 'Night gathers, and now my beat begins.',
        `displayid` = 41050,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 80811,
        `spellcharges_1` = -50;