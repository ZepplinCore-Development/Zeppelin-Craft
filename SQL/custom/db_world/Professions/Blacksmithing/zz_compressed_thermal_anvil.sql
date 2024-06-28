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

-- Thermal Anvil Game Object
DELETE FROM `gameobject_template` WHERE (`entry` = 21270);
INSERT INTO `gameobject_template`
SET `entry` = 21270,
    `type` = 8,
    `displayId` = 2092,
    `name` = 'Thermal Anvil',
    `size` = 0.2,
    `Data0` = 1,
    `Data1` = 8,
    `VerifiedBuild` = 1337;

-- Thermal Forge Game Object
DELETE FROM `gameobject_template` WHERE (`entry` = 21271);
INSERT INTO `gameobject_template`
SET `entry` = 21271,
    `type` = 8,
    `displayId` = 209,
    `name` = 'Thermal Forge',
    `size` = 0.01,
    `Data0` = 3,
    `Data1` = 15,
    `Data6` = -1,    
    `VerifiedBuild` = 1337;