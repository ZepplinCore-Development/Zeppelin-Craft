-- Design: Elementium Talisman
    DELETE FROM `item_template` WHERE (`entry` = 902300);
    INSERT INTO `item_template`
    SET `entry` = 902300,
        `class` = 9, -- Recipe
        `name` = 'Design: Elementium Talisman',
        `displayid` = 1102,
        `SellPrice` = 1000000, -- 100G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91076,
        `spelltrigger_2` = 6;

-- Elementium Talisman
    DELETE FROM `item_template` WHERE (`entry` = 902301);
    INSERT INTO `item_template`
    SET `entry` = 902301,
        `class` = 4, -- Armor
        `InventoryType` = 12, -- Trinket
        `SellPrice` = 1000000, -- 100G       
        `maxcount` = 1, -- Unique       
        `name` = 'Elementium Talisman',
        `displayid` = 35130,
        `Quality` = 4, -- Epic
        `ItemLevel` = 65,
        `RequiredLevel` = 60,
        `bonding` = 1, -- BOP
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `stat_type1` = 32, -- crit rating
        `stat_value1` = 14,
        `spellid_1` = 91077,
        `spelltrigger_1` = 1;