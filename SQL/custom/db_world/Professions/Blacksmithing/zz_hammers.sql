-- Smithing Hammer
UPDATE `item_template`
SET `class` = 15, -- Miscellaneous
    `subclass` = 1, -- Reagent 
    `name` = 'Smithing Hammer',
    `InventoryType` = 0,
    `dmg_min1` = 0,
    `dmg_max1` = 0,
    `delay` = 0
WHERE (`entry` = 5956);

-- Bronze Smithing Hammer ITEM TEMPLATE
DELETE FROM `item_template` WHERE (`entry` = 57003);
INSERT INTO `item_template`
SET `entry` = 57003,
    `class` = 15, -- Miscellaneous
    `subclass` = 1, -- Reagent 
    `SellPrice` = 30, -- 30C
    `ItemLimitCategory` = 87,
    `ItemLevel` = 20,
    `name` = 'Bronze Smithing Hammer',
    `displayid` = 142061,
    `Quality` = 1, -- Common
    `BagFamily` = 1152, -- Mining + Engineering
    `TotemCategory` = 162,
    `spellid_1` = 91120,
    `spelltrigger_1` = 5,
    `bonding` = 1; -- BOP

-- Bronze Smithing Hammer TRAINER
DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91121);
INSERT INTO `npc_trainer`
SET `ID` = 201004,
    `SpellID` = 91121,
    `MoneyCost` = 500, -- 5S 
    `ReqSkillLine` = 164, -- Blacksmithing
    `ReqSkillRank` = 100;
