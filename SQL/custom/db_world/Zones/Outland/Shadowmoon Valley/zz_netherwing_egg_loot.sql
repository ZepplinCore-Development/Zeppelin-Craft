-- disable the force group loot flag
UPDATE `gameobject_template` SET `Data15` = 0 WHERE (`entry` = 185915);
-- disable BOP on the egg
UPDATE `item_template` SET `bonding` = 0 WHERE (`entry` = 32506);