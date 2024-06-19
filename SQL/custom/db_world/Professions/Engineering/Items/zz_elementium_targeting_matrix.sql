-- Schematic: Elementium Targeting Matrix
    DELETE FROM `item_template` WHERE (`entry` = 57204);
    INSERT INTO `item_template`
    SET `entry` = 57204,
        `class` = 9, -- Recipe
        `name` = 'Schematic: Elementium Targeting Matrix',
        `displayid` = 1301,
        `SellPrice` = 1000000, -- 100G 
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91081,
        `spelltrigger_2` = 6;

-- Elementium Targeting Matrix
    DELETE FROM `item_template` WHERE (`entry` = 57205);
    INSERT INTO `item_template`
    SET `entry` = 57205,
        `class` = 4, -- Armor
        `InventoryType` = 12, -- Trinket
        `SellPrice` = 1000000, -- 100G       
        `maxcount` = 1, -- Unique       
        `name` = 'Elementium Targeting Matrix',
        `displayid` = 135270,
        `Quality` = 4, -- Epic
        `ItemLevel` = 65,
        `RequiredLevel` = 60,
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `stat_type1` = 36, -- Haste Rating
        `stat_value1` = 14,
        `spellid_1` = 91082,
        `spelltrigger_1` = 1;