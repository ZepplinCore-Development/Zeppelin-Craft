-- Add Mark of Thrallmar and Mark of Honor Hold to the currency tab
UPDATE `item_template` SET `class` = 10, `BagFamily` = 8192, `maxcount` = 2147483647, `stackable` = 2147483647, `flags` = 2048 WHERE (`entry` = 24581);
UPDATE `item_template` SET `class` = 10, `BagFamily` = 8192, `maxcount` = 2147483647, `stackable` = 2147483647, `flags` = 2048 WHERE (`entry` = 24579);