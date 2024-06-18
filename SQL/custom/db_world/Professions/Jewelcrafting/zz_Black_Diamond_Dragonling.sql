-- Design: Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57202);
    INSERT INTO `item_template`
    SET `entry` = 57202,
        `class` = 9, -- Recipe
        `subclass` = 10, -- Jewelcrafting
        `name` = 'Design: Black Diamond Dragonling',
        `displayid` = 6270,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- Rare
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91085,
        `spelltrigger_2` = 6;

-- Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57203);
    INSERT INTO `item_template`
    SET `entry` = 57203,
        `class` = 4, -- Armor
        `InventoryType` = 12, -- Trinket
        `SellPrice` = 100000, -- 10G       
        `maxcount` = 1, -- Unique       
        `name` = 'Black Diamond Dragonling',
        `displayid` = 136390,
        `Quality` = 3, -- Rare
        `Flags` = 524352, -- PLAYERCAST + UNIQUE EQUIPPED
        `ItemLevel` = 60,
        `RequiredLevel` = 50,
        `bonding` = 2, -- BOE
        `RequiredSkill` = 755, -- Jewelcrafting
        `RequiredSkillRank` = 300,
        `stat_type1` = 38, -- Attack Power
        `stat_value1` = 48,
        `spellid_1` = 91008,
        `spellcooldown_1` = 300000;