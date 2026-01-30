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
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91121);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91121, 500, 164, 75, 0, 0, 0, 0);

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
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91123);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91123, 500, 164, 150, 0, 0, 0, 0);

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
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91125);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91125, 500, 164, 225, 0, 0, 0, 0);

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
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91127);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91127, 500, 164, 300, 0, 0, 0, 0);

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
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91129);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91129, 500, 164, 375, 0, 0, 0, 0);

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
        `spellid_1` = 91130,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Titanium Smithing Hammer TRAINER
    DELETE FROM `trainer_spell` WHERE (`TrainerId` = 201004 AND `SpellId` = 91131);
    INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
    VALUES (201004, 91131, 500, 164, 450, 0, 0, 0, 0);

-- Place all the hammer spell auras into the spell group table so they can be made exclusive
-- Priority now handled via spell_group_stack_rules (special_flag column removed from spell_group)
DELETE FROM `spell_group` WHERE `id` = 1114;

INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91130; -- Titanium
INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91128; -- Felsteel
INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91126; -- Thorium
INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91124; -- Mithril
INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91122; -- Iron
INSERT INTO `spell_group` SET `id` = 1114, `spell_id` = 91120; -- Bronze

-- Apply the exclusivity flag to the spell group for hammers
    DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1114;
    INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,description) VALUES
        (1114,8,'Group of smithing hammers');
