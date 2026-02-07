-- Make Fish Oil a trade good for reagent bank compatibility
UPDATE `item_template` SET `class` = 7, `subclass` = 0 WHERE `entry` = 17058;
