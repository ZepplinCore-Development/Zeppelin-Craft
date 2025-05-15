-- Pattern: Drums of the Raid Leader
    DELETE FROM `item_template` WHERE (`entry` = 57610);
    INSERT INTO `item_template`
    SET `entry` = 57610,
        `class` = 9, -- Recipe
        `subclass` = 1, -- Leatherworking
        `name` = 'Pattern: Drums of the Raid Leader',
        `description` = 'Teaches you how to make Drums of the Raid Leader',
        `displayid` = 1102,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- RARE
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 80819,
        `spelltrigger_2` = 6;

-- Drums of the Raid Leader
    DELETE FROM `item_template` WHERE (`entry` = 57611);
    INSERT INTO `item_template`
    SET `entry` = 57611,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Drums of the Raid Leader',
        `description` = 'March to the beat... or else.',
        `displayid` = 67328,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `RequiredSkill` = 165, -- Leatherworking
        `RequiredSkillRank` = 300,
        `spellid_1` = 80820,
        `spellcharges_1` = -50;