
-- FOOD

-- Remove Food from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Item Loot Table
DELETE FROM item_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- GREYS

-- Remove Greys from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Item Loot Table
DELETE FROM item_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- EMPTY REFERENCES

-- Delete empty Reference loot tables from creature loot tables
DELETE FROM creature_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from gameobject loot tables
DELETE FROM gameobject_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from item_loot_template loot tables
DELETE FROM item_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;
