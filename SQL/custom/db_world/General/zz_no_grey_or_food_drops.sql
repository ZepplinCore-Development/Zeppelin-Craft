-- Removes all grey and food drops and deletes the reference table entries to reduce error count.

-- FOOD

-- Remove Food from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Item Loot Table
DELETE FROM item_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- Remove Food from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5));

-- GREYS

-- Remove Greys from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Fishing Loot Table
DELETE FROM fishing_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Pick Pocketing Loot Table
DELETE FROM pickpocketing_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from prospecting Loot Table
DELETE FROM prospecting_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from skinning Loot Table
DELETE FROM skinning_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Item Loot Table
DELETE FROM item_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0);

