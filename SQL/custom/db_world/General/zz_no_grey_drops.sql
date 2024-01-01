DELETE FROM creature_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

DELETE FROM reference_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

DELETE FROM creature_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;
