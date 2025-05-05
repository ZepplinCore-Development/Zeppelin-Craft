-- Item Template - Design: Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57502);
    INSERT INTO `item_template`
    SET `entry` = 57502,
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

-- Item Template - Black Diamond Dragonling
    DELETE FROM `item_template` WHERE (`entry` = 57503);
    INSERT INTO `item_template`
    SET `entry` = 57503,
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

-- Creature Template - Black Diamond Dragonling
    DELETE FROM `creature_template` 
    WHERE `entry` = 9102600;

    INSERT INTO `creature_template` SET
        `entry` = 9102600,
        `name` = 'Black Diamond Dragonling',
        `minlevel` = 60,
        `maxlevel` = 60,
        `faction` = 35,
        `speed_walk` = 1.11111,
        `speed_run` = 0.857143,
        `detection_range` = 18,
        `DamageModifier` = 3,
        `BaseAttackTime` = 2000,
        `RangeAttackTime` = 2000,
        `unit_class` = 1,
        `unit_flags2` = 2048,
        `type` = 9,
        `movementId` = 100,
        `mechanic_immune_mask` = 8405008,
        `ScriptName` = 'npc_arcanite_dragonling',
        `VerifiedBuild` = 12340;

-- Creature Template Model - Black Diamond Dragonling
    DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102600;

    INSERT INTO `creature_template_model` SET
        `CreatureID` = 9102600,
        `CreatureDisplayID` = 19295;