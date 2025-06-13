-- Making Chipped Power Core to no longer be unique
UPDATE `item_template` SET `maxcount` = 0 WHERE (`entry` = 23381);