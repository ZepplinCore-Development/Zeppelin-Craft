-- Azerite Shard
    DELETE FROM `item_template` WHERE (`entry` = 58302);
    INSERT INTO `item_template`
    SET `entry` = 58302,
        `name` = 'Azerite Shard',
        `displayid` = 136124,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 10000, -- 1G
        `stackable` = 100,
        `flags` = 134217728, -- Bound to Account
        `spellid_1` = 91138,
        `spellcharges_1` = -1;

-- Azerite Crystal
    DELETE FROM `item_template` WHERE (`entry` = 58303);
    INSERT INTO `item_template`
    SET `entry` = 58303,
        `name` = 'Azerite Crystal',
        `displayid` = 136034,
        `Quality` = 3, -- RARE
        `bonding` = 1, -- BOP
        `class` = 0, -- Consumable
        `subclass` = 8, -- Other
        `SellPrice` = 50000, -- 5G
        `stackable` = 100,
        `flags` = 134217728, -- Bound to Account
        `spellid_1` = 91006,
        `spellcharges_1` = -1;