-- Make Pristine Black Diamonds a JC trade good
UPDATE `item_template` SET `class` = 7, `subclass` = 4 WHERE (`entry` = 18335);

-- Make Regular Black Diamonds a JC trade good
UPDATE `item_template` SET `class` = 7, `subclass` = 4 WHERE (`entry` = 11754);