-- This Item has no recipe yet, this should be added as a drop from Deadmines?

-- Compressed Thermal Anvil
    DELETE FROM `item_template` WHERE (`entry` = 902311);
    INSERT INTO `item_template`
    SET `entry` = 902311,
        `class` = 7, -- Trade Goods
        `subclass` = 3, -- Devices
        `SellPrice` = 100000, -- 1G       
        `maxcount` = 1, -- Unique       
        `name` = 'Compressed Thermal Anvil',
        `description` = 'Can also be used as a forge',
        `displayid` = 59082,
        `Quality` = 4, -- Epic
        `Flags` = 64, -- PLAYERCAST
        `bonding` = 1, -- BOP
        `RequiredSkill` = 164, -- Blacksmithing
        `RequiredSkillRank` = 25,
        `spellid_1` = 40530,
        `spellcooldown_1` = 900000;