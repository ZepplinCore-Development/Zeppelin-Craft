-- Journeyman Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57300);
    INSERT INTO `item_template`
    SET `entry` = 57300,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Journeyman Pruning Shears',
        `displayid` = 139508, -- AO_Pincers10Cheap
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 198,
        `spellid_1` = 91140,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Artisan Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57301);
    INSERT INTO `item_template`
    SET `entry` = 57301,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 90, -- 90C
        `ItemLevel` = 60,
        `name` = 'Artisan Pruning Shears',
        `displayid` = 139509, -- AO_Pincers10Expensive
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 199,
        `spellid_1` = 91141,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Master Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57302);
    INSERT INTO `item_template`
    SET `entry` = 57302,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 900, -- 9S
        `ItemLevel` = 70,
        `name` = 'Master Pruning Shears',
        `displayid` = 139510, -- AO_Pincers30Cheap
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 200,
        `spellid_1` = 91142,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Grand Master Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57303);
    INSERT INTO `item_template`
    SET `entry` = 57303,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool
        `SellPrice` = 9000, -- 90S
        `ItemLevel` = 80,
        `name` = 'Grand Master Pruning Shears',
        `displayid` = 139511, -- AO_Pincers30Expensive
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 201,
        `spellid_1` = 91143,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Spell group + ranks: Pruning Shears (EXCLUSIVE + rank-aware patch)
DELETE FROM `spell_group` WHERE `id` = 1116;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1116;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91140;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` SET `id` = 1116, `spell_id` = 91140; -- Journeyman (first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
    (1116, 1, 'Pruning Shears - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91140, 91140, 1),
(91140, 91141, 2),
(91140, 91142, 3),
(91140, 91143, 4);

