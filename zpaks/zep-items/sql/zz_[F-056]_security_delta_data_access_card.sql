-- F-056: Item Balancing
-- Remove unique restriction from Security DELTA Data Access Card
UPDATE `item_template` SET `maxcount` = 0 WHERE `entry` = 9327;
