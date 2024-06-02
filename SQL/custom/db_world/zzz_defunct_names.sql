UPDATE `item_template` 
SET `name` = CONCAT(`name`, ' - defunct') 
WHERE `entry` BETWEEN 901000 AND 901000;