-- Pattern: Drums of the Wild
    DELETE FROM `item_template` WHERE (`entry` = 57608);
    INSERT INTO `item_template`
    SET `entry` = 57608,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of the Wild',
        `description` = 'Teaches you how to make Drums of the Wild',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 69388,
        `spelltrigger_2` = 6;

-- Drums of the Wild
    DELETE FROM `item_template` WHERE (`entry` = 57609);
    INSERT INTO `item_template`
    SET `entry` = 57609,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of the Wild',
        `description` = 'When bongos go bananas.',
        `displayid` = 41059,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 80814,
        `spellcharges_1` = -50;