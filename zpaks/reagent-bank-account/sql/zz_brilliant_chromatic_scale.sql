-- Set Brilliant Chromatic Scale as a Leatherworking trade good instead of a quest item
UPDATE `item_template` SET `class` = 7, `subclass` = 6 WHERE (`entry` = 12607);