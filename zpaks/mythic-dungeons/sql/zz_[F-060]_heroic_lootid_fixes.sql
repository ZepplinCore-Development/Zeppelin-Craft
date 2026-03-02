-- Fix heroic/mythic creatures that inherit lootid from base creatures with no loot

-- Cadaverous Worm (14370) has lootid=0, clones incorrectly inherit lootid=14370
UPDATE `creature_template` SET `lootid` = 0 WHERE `entry` IN (9102483, 9102580);
