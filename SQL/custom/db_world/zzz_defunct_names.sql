UPDATE `item_template` 
SET `name` = CONCAT(`name`, ' - defunct') 
WHERE `entry` BETWEEN 900100 AND 901000;