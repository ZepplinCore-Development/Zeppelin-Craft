-- Schematic: Skill Injector
    DELETE FROM `item_template` WHERE (`entry` = 902306);
    INSERT INTO `item_template`
    SET `entry` = 902306,
        `class` = 9, -- Recipe
        `name` = 'Schematic: Skill Injector',
        `displayid` = 1301,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 80810,
        `spelltrigger_2` = 6;

-- Skill Injector
    DELETE FROM `item_template` WHERE (`entry` = 902307);
    INSERT INTO `item_template`
    SET `entry` = 902307,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other        
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Skill Injector',
        `description` = 'Don''t forget the capsule',
        `displayid` = 64140,
        `Quality` = 4, -- Epic
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `FlagsExtra` = 8192,        
        `spellid_1` = 80809,
        `spellcooldown_1` = 1800000;