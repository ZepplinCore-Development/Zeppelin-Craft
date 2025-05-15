-- Schematic: Skill Injector
    DELETE FROM `item_template` WHERE (`entry` = 57200);
    INSERT INTO `item_template`
    SET `entry` = 57200,
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
    DELETE FROM `item_template` WHERE (`entry` = 57201);
    INSERT INTO `item_template`
    SET `entry` = 57201,
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other        
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Skill Injector',
        `description` = 'Don''t forget the capsule',
        `displayid` = 139060,
        `Quality` = 4, -- Epic
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `FlagsExtra` = 8192,        
        `spellid_1` = 80809,
        `spellcooldown_1` = 1800000;