-- Schematic: Fel Iron Arrows
    DELETE FROM `item_template` WHERE (`entry` = 902331);
    INSERT INTO `item_template`
    SET `entry` = 902331,
        `class` = 9, -- Recipe
        `subclass` = 4, -- Engineering
        `name` = 'Schematic: Fel Iron Arrows',
        `displayid` = 6270,
        `SellPrice` = 100000, -- 10G 
        `Quality` = 3, -- UNCOMMON
        `Flags` = 64, -- PLAYERCAST 
        `bonding` = 1, -- BOP
        `RequiredSkill` = 202, -- Engineering
        `RequiredSkillRank` = 300,
        `spellid_1` = 483, -- Learn Spell
        `spellcharges_1` = -1,
        `spellid_2` = 91087,
        `spelltrigger_2` = 6;

-- Fel Iron Arrows
    DELETE FROM `item_template` WHERE (`entry` = 902332);
    INSERT INTO `item_template`
    SET `entry` = 902332,
        `class` = 6, -- Projectile
        `subclass` = 2, -- Arrow
        `name` = 'Fel Iron Arrows',
        `displayid` = 40521,
        `SellPrice` = 2, -- 2C
        `Quality` = 2, -- UNCOMMON
        `InventoryType` = 24, -- Ammo
        `bonding` = 1, -- BOP
        `BagFamily` = 1, -- Arrow
        `ItemLevel` = 96,
        `RequiredLevel` = 58,
        `stackable` = 1000,
        `dmg_min1` = 26,
        `dmg_max1` = 26,
        `delay` = 3000;