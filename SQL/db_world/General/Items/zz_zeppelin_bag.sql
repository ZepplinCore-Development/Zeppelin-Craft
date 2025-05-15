-- Zeppelin Bag - Item Template
    DELETE FROM `item_template` WHERE (`entry` = 902330);
    INSERT INTO `item_template`
    SET `entry` = 902330,
        `name` = 'Zeppelin Bag',
        `displayid` = 1244,
        `Quality` = 4, -- EPIC
        `class` = 1, -- CONTAINER
        `InventoryType` = 18, -- BAG
        `ContainerSlots` = 32,
        `bonding` = 1, -- BOP
        `description` = 'Full of Butts';   