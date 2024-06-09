-- Azerite Shard
DELETE FROM `item_template` WHERE (`entry` = 901203);
INSERT INTO `item_template`
SET `entry` = 901203,
    `name` = 'Azerite Shard',
    `displayid` = 136034,
    `Quality` = 3, -- RARE
    `bonding` = 1, -- BOP
    `class` = 0, -- Consumable
    `subclass` = 8, -- Other
    `SellPrice` = 50000, -- 5G
    `BagFamily` = 8192, -- Currency
    `maxcount` = 10,
    `stackable` = 10,
    `flags` = 134217728, -- Bound to Account
    `spellid_1` = 91006,
    `spellcharges_1` = -1;