-- Changed Slime Maggot to the monster faction to aggro
UPDATE `creature_template` SET `faction` = 14 WHERE (`entry` = 8311);
-- Also fix heroic/mythic clones which inherit the stock faction
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` IN (9101344, 9101389);