-- Pattern: Drums of Intellect
    DELETE FROM `item_template` WHERE (`entry` = 902319);
    INSERT INTO `item_template`
    SET `entry` = 902319,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of Intellect',
        `description` = 'Teaches you how to make Drums of Intellect',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 80817,
        `spelltrigger_2` = 6;

-- Drums of Intellect
    DELETE FROM `item_template` WHERE (`entry` = 902320);
    INSERT INTO `item_template`
    SET `entry` = 902320,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of Intellect',
        `description` = 'Guaranteed to make your brain cells dance.',
        `displayid` = 41060,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 80815,
        `spellcharges_1` = -50;