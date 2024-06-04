-- Emblem of Adventure
    DELETE FROM `item_template` WHERE (`entry` = 901200);
    INSERT INTO `item_template`
    SET `entry` = 901200,
        `name` = 'Emblem of Adventure',
        `description` = 'Trade for Classical Lute',
        `displayid` = 35274,
        `Quality` = 4, -- EPIC
        `bonding` = 1, -- BOP
        `class` = 10, -- Currency
        `BagFamily` = 8192, -- Currency
        `maxcount` = 2147483647,
        `stackable` = 2147483647,
        `flags` = 2048;