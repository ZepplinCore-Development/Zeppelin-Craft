-- Make Shiny Fish Scales a trade good for reagent bank compatibility
UPDATE `item_template` SET `class` = 7, `subclass` = 0 WHERE `entry` = 17057;
