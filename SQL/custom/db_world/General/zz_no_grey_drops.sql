DELETE FROM creature_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

DELETE FROM reference_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);