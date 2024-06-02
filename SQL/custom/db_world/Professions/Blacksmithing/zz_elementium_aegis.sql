-- Plans: Elementium Aegis
    DELETE FROM `item_template` WHERE (`entry` = 902302);
    INSERT INTO `item_template`
    SET `entry` = 902302,
        `class` = 9, -- Recipe
        `name` = 'Plans: Elementium Aegis',
        `displayid` = 1301,
        `SellPrice` = 1000000, -- 100G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 164, -- Blacksmithing
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91076,
        `spelltrigger_2` = 6;

-- Elementium Aegis
    DELETE FROM `item_template` WHERE (`entry` = 902303);
    INSERT INTO `item_template`
    SET `entry` = 902303,
        `class` = 4, -- Armor
        `InventoryType` = 12, -- Trinket
        `SellPrice` = 1000000, -- 100G       
        `maxcount` = 1, -- Unique       
        `name` = 'Elementium Aegis',
        `displayid` = 64877,
        `Quality` = 4, -- Epic
        `ItemLevel` = 65,
        `RequiredLevel` = 60,
        `bonding` = 1, -- BOP
        `RequiredSkill` = 164, -- Blacksmithing
        `RequiredSkillRank` = 300,
        `stat_type1` = 7, -- Stamina
        `stat_value1` = 15,
        `spellid_1` = 91075,
        `spellcooldown_1` = 300000;