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
    DELETE FROM `item_template` WHERE (`entry` = 57400);
    INSERT INTO `item_template`
    SET `entry` = 57400,
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
    DELETE FROM `item_template` WHERE (`entry` = 57401);
    INSERT INTO `item_template`
    SET `entry` = 57401,
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
    DELETE FROM `item_template` WHERE (`entry` = 57402);
    INSERT INTO `item_template`
    SET `entry` = 57402,
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
    DELETE FROM `item_template` WHERE (`entry` = 57403);
    INSERT INTO `item_template`
    SET `entry` = 57403,
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
DELETE FROM `spell_group` WHERE `id` = 1117;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1117;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91158;

INSERT INTO `spell_group` SET `id` = 1117, `spell_id` = 91161; -- Grand Master
INSERT INTO `spell_group` SET `id` = 1117, `spell_id` = 91160; -- Master
INSERT INTO `spell_group` SET `id` = 1117, `spell_id` = 91159; -- Artisan
INSERT INTO `spell_group` SET `id` = 1117, `spell_id` = 91158; -- Journeyman

INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
    (1117, 1, 'Mining Picks - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91158, 91158, 1),
(91158, 91159, 2),
(91158, 91160, 3),
(91158, 91161, 4);
