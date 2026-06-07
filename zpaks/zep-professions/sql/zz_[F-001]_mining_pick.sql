-- Basic Mining Pick (starter item, no quest required, no bonus)
    UPDATE `item_template`
    SET `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `name` = 'Basic Mining Pick',
        `description` = 'Allows you to mine mineral veins.',
        `displayid` = 139496, -- AO_Pick_01
        `Quality` = 6, -- Artifact
        `BagFamily` = 128, -- Mining
        `TotemCategory` = 165, -- Mining tool
        `bonding` = 1, -- BOP
        `InventoryType` = 0,
        `dmg_min1` = 0,
        `dmg_max1` = 0,
        `delay` = 0
    WHERE (`entry` = 2901);

-- Journeyman Mining Pick ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57700);
    INSERT INTO `item_template`
    SET `entry` = 57700,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Journeyman Mining Pick',
        `description` = 'Allows you to mine mineral veins.',
        `displayid` = 139497, -- AO_Pick_02
        `Quality` = 6, -- Artifact
        `BagFamily` = 128, -- Mining
        `TotemCategory` = 165, -- Mining tool
        `spellid_1` = 91158,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Artisan Mining Pick ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57701);
    INSERT INTO `item_template`
    SET `entry` = 57701,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 90, -- 90C
        `ItemLevel` = 60,
        `name` = 'Artisan Mining Pick',
        `description` = 'Allows you to mine mineral veins.',
        `displayid` = 139498, -- AO_Pick_03
        `Quality` = 6, -- Artifact
        `BagFamily` = 128, -- Mining
        `TotemCategory` = 165, -- Mining tool
        `spellid_1` = 91159,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Master Mining Pick ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57702);
    INSERT INTO `item_template`
    SET `entry` = 57702,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 900, -- 9S
        `ItemLevel` = 70,
        `name` = 'Master Mining Pick',
        `description` = 'Allows you to mine mineral veins.',
        `displayid` = 139499, -- AO_Pick_04
        `Quality` = 6, -- Artifact
        `BagFamily` = 128, -- Mining
        `TotemCategory` = 165, -- Mining tool
        `spellid_1` = 91160,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Grand Master Mining Pick ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57703);
    INSERT INTO `item_template`
    SET `entry` = 57703,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 9000, -- 90S
        `ItemLevel` = 80,
        `name` = 'Grand Master Mining Pick',
        `description` = 'Allows you to mine mineral veins.',
        `displayid` = 139500, -- AO_Pick_05
        `Quality` = 6, -- Artifact
        `BagFamily` = 128, -- Mining
        `TotemCategory` = 165, -- Mining tool
        `spellid_1` = 91161,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Spell group + ranks: Mining Picks (EXCLUSIVE + rank-aware patch)
DELETE FROM `spell_group` WHERE `id` = 2017;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2017;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91158;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` SET `id` = 2017, `spell_id` = 91158; -- Journeyman (first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
    (2017, 1, 'Mining Picks - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91158, 91158, 1),
(91158, 91159, 2),
(91158, 91160, 3),
(91158, 91161, 4);
