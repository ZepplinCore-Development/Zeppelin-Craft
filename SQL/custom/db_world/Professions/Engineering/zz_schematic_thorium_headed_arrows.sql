-- Schematic: Thorium Headed Arrows
    DELETE FROM `item_template` WHERE (`entry` = 57206);
    INSERT INTO `item_template`
    SET `entry` = 57206,
        `class` = 9, -- Recipe
        `subclass` = 4, -- Engineering
        `name` = 'Schematic: Thorium Headed Arrows',
        `displayid` = 6270,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- Rare
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 285,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91079,
        `spelltrigger_2` = 6;