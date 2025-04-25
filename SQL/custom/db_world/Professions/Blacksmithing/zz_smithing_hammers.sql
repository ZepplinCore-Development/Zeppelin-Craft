-- Smithing Hammer
    UPDATE `item_template`
    SET `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `name` = 'Basic Smithing Hammer',
        `InventoryType` = 0,
        `Quality` = 6, -- Artifact
        `dmg_min1` = 0,
        `dmg_max1` = 0,
        `delay` = 0
    WHERE (`entry` = 5956);

-- Bronze Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57003);
    INSERT INTO `item_template`
    SET `entry` = 57003,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Bronze Smithing Hammer',
        `displayid` = 142061, -- RoM_durability_hammer_07
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 192,
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
        `ReqSkillRank` = 75;

-- Iron Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57004);
    INSERT INTO `item_template`
    SET `entry` = 57004,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Iron Smithing Hammer',
        `displayid` = 137284, -- AO_Hammer02
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 193,
        `spellid_1` = 91122,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Iron Smithing Hammer TRAINER
    DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91123);
    INSERT INTO `npc_trainer`
    SET `ID` = 201004,
        `SpellID` = 91123,
        `MoneyCost` = 500, -- 5S 
        `ReqSkillLine` = 164, -- Blacksmithing
        `ReqSkillRank` = 150;

-- Mithril Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57005);
    INSERT INTO `item_template`
    SET `entry` = 57005,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Mithril Smithing Hammer',
        `displayid` = 148461, -- RoM_quest_hammer05
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 193,
        `spellid_1` = 91124,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Mithril Smithing Hammer TRAINER
    DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91125);
    INSERT INTO `npc_trainer`
    SET `ID` = 201004,
        `SpellID` = 91125,
        `MoneyCost` = 500, -- 5S 
        `ReqSkillLine` = 164, -- Blacksmithing
        `ReqSkillRank` = 225;

-- Thorium Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57006);
    INSERT INTO `item_template`
    SET `entry` = 57006,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Thorium Smithing Hammer',
        `displayid` = 137288, -- AO_HammerT1
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 193,
        `spellid_1` = 91126,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Thorium Smithing Hammer TRAINER
    DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91127);
    INSERT INTO `npc_trainer`
    SET `ID` = 201004,
        `SpellID` = 91127,
        `MoneyCost` = 500, -- 5S 
        `ReqSkillLine` = 164, -- Blacksmithing
        `ReqSkillRank` = 300;

-- Felsteel Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57007);
    INSERT INTO `item_template`
    SET `entry` = 57007,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Felsteel Smithing Hammer',
        `displayid` = 142058, -- RoM_durability_hammer_04
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 193,
        `spellid_1` = 91128,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Felsteel Smithing Hammer TRAINER
    DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91129);
    INSERT INTO `npc_trainer`
    SET `ID` = 201004,
        `SpellID` = 91129,
        `MoneyCost` = 500, -- 5S 
        `ReqSkillLine` = 164, -- Blacksmithing
        `ReqSkillRank` = 375;

-- Titanium Smithing Hammer ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57008);
    INSERT INTO `item_template`
    SET `entry` = 57008,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Titanium Smithing Hammer',
        `displayid` = 137287, -- AO_Hammer05
        `Quality` = 6, -- Artifact
        `BagFamily` = 1152, -- Mining + Engineering
        `TotemCategory` = 193,
        `spellid_1` = 911230,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Titanium Smithing Hammer TRAINER
    DELETE FROM `npc_trainer` WHERE (`ID` = 201004 AND `SpellID` = 91131);
    INSERT INTO `npc_trainer`
    SET `ID` = 201004,
        `SpellID` = 91131,
        `MoneyCost` = 500, -- 5S 
        `ReqSkillLine` = 164, -- Blacksmithing
        `ReqSkillRank` = 450;

-- Place all the hammer spell auras into the spell group table so they can be made exclusive
    DELETE FROM `spell_group` WHERE `id` = 1114;
    INSERT INTO `spell_group` (`id`,`spell_id`,`special_flag`) VALUES
        (1114,91120,0), -- Bronze
        (1114,91122,0), -- Iron
        (1114,91124,0), -- Mithril
        (1114,91126,0), -- Thorium
        (1114,91128,0), -- Felsteel
        (1114,91130,0); -- Titanium

-- Apply the exclusivity flag to the spell group for hammers
    DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1114;
    INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,description) VALUES
        (1114,1,'Group of smithing hammers');
