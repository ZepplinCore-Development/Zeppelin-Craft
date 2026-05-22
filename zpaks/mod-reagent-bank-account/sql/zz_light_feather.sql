-- Make Light Feather a trade good for reagent bank compatibility
UPDATE `item_template` SET `class` = 7, `subclass` = 1 WHERE `entry` = 17056;
