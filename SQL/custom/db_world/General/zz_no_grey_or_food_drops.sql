-- Removes all grey and food drops and deletes the reference table entries to reduce error count.

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

-- Remove Greys from Fishing Loot Table
DELETE FROM fishing_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Mail Loot Table
DELETE FROM mail_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Milling Loot Table
DELETE FROM milling_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from Pick Pocketing Loot Table
DELETE FROM pickpocketing_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from player Loot Table
DELETE FROM player_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from prospecting Loot Table
DELETE FROM prospecting_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from skinning Loot Table
DELETE FROM skinning_loot_template 
WHERE item IN (SELECT entry FROM item_template WHERE quality = 0);

-- Remove Greys from spell Loot Table
DELETE FROM spell_loot_template 
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

-- Delete empty Reference loot tables from Fishing Loot Table
DELETE FROM fishing_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from Mail Loot Table
DELETE FROM mail_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from Milling Loot Table
DELETE FROM milling_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from Pick Pocketing Loot Table
DELETE FROM pickpocketing_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from player Loot Table
DELETE FROM player_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from prospecting Loot Table
DELETE FROM prospecting_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from skinning Loot Table
DELETE FROM skinning_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- Delete empty Reference loot tables from spell Loot Table
DELETE FROM spell_loot_template 
WHERE Reference NOT IN (SELECT entry FROM reference_loot_template) AND Reference != 0;

-- EMPTY OBJECTS

UPDATE gameobject_template
SET Data1 = 0
WHERE Data1 NOT IN (SELECT entry FROM gameobject_loot_template) and Data1 != 0;

-- EMPTY CREATURES

UPDATE creature_template
SET lootid = 0
WHERE lootid NOT IN (SELECT entry FROM creature_loot_template) and lootid != 0;
