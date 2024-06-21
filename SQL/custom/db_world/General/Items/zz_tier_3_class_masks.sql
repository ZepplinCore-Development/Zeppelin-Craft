UPDATE `item_template` 
SET `AllowableClass` = 1 -- Warrior
WHERE `entry` BETWEEN 22416 AND 22423;

UPDATE `item_template` 
SET `AllowableClass` = 1024 -- Druid
WHERE `entry` BETWEEN 22488 AND 22495;

UPDATE `item_template` 
SET `AllowableClass` = 4 -- Hunter
WHERE `entry` BETWEEN 22438 AND 22443;

UPDATE `item_template` 
SET `AllowableClass` = 8 -- Rogue
WHERE `entry` BETWEEN 22476 AND 22483;

UPDATE `item_template` 
SET `AllowableClass` = 16 -- Priest
WHERE `entry` BETWEEN 22512 AND 22519;

UPDATE `item_template` 
SET `AllowableClass` = 64 -- Shaman
WHERE `entry` BETWEEN 22464 AND 22471;

UPDATE `item_template` 
SET `AllowableClass` = 128 -- Mage
WHERE `entry` BETWEEN 22496 AND 22503;

UPDATE `item_template` 
SET `AllowableClass` = 256 -- Warlock
WHERE `entry` BETWEEN 22504 AND 22511;

UPDATE `item_template` 
SET `AllowableClass` = 2 -- Paladin
WHERE `entry` BETWEEN 22424 AND 22431;