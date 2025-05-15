-- Badge of Heroism
DELETE FROM `item_template` WHERE (`entry` = 58200);
INSERT INTO `item_template`
SET `entry` = 58200,
    `name` = 'Badge of Heroism',
    `description` = 'Trade for Classical Lute',
    `displayid` = 140193,
    `Quality` = 4, -- EPIC
    `bonding` = 1, -- BOP
    `class` = 10, -- Currency
    `BagFamily` = 8192, -- Currency
    `maxcount` = 2147483647,
    `stackable` = 2147483647,
    `flags` = 2048;