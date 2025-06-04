-- Journeyman Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57300);
    INSERT INTO `item_template`
    SET `entry` = 57300,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Journeyman Pruning Shears',
        `displayid` = 140276, -- AO_Scissors10Cheap
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
        `displayid` = 140277, -- AO_Scissors20Cheap
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
        `displayid` = 140278, -- AO_Scissors30Cheap
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
        `displayid` = 140279, -- AO_Scissors30Expensive
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 201,
        `spellid_1` = 91143,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Place all the hammer spell auras into the spell group table so they can be made exclusive
    DELETE FROM `spell_group` WHERE `id` = 1116;
    INSERT INTO `spell_group` (`id`,`spell_id`,`special_flag`) VALUES
        (1116,91140,0), -- Journeyman
        (1116,91141,0), -- Artisan
        (1116,91142,0), -- Master
        (1116,91143,0); -- Grand Master

-- Apply the exclusivity flag to the spell group for hammers
    DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1116;
    INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
        (1116,1,'Group of Pruning Shears');
