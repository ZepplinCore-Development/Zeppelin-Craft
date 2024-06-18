-- Removes all grey and food drops and deletes the reference table entries to reduce error count.

-- FOOD

-- Remove Food from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5)) AND Reference = 0;

-- Remove Food from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5)) AND Reference = 0;

-- Remove Food from Item Loot Table
DELETE FROM item_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5)) AND Reference = 0;

-- Remove Food from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE (class = 0 AND subclass = 5)) AND Reference = 0;

-- Remove food related conditions?
DELETE FROM conditions
WHERE SourceEntry IN (27854, 13755);

-- GREYS

-- Remove Greys from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from Game Object Loot Table
DELETE FROM gameobject_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from Fishing Loot Table
DELETE FROM fishing_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from Pick Pocketing Loot Table
DELETE FROM pickpocketing_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from prospecting Loot Table
DELETE FROM prospecting_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from skinning Loot Table
DELETE FROM skinning_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from Item Loot Table
DELETE FROM item_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- Remove Greys from Reference Loot Table
DELETE FROM reference_loot_template 
WHERE Item IN (SELECT entry FROM item_template WHERE quality = 0) AND Reference = 0;

-- EMPTY REFERENCE

-- Remove EMPTY REFERENCE from REFERENCE Table
CREATE TEMPORARY TABLE tmp_reference_entries
SELECT entry FROM reference_loot_template;

DELETE FROM reference_loot_template
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM tmp_reference_entries);

DROP TEMPORARY TABLE tmp_reference_entries;

-- Remove EMPTY REFERENCE from Creature Loot Table
DELETE FROM creature_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove EMPTY REFERENCE from Gameobject Loot Table
DELETE FROM gameobject_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove Greys from Fishing Loot Table
DELETE FROM fishing_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove Greys from Pick Pocketing Loot Table
DELETE FROM pickpocketing_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove Greys from prospecting Loot Table
DELETE FROM prospecting_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove Greys from skinning Loot Table
DELETE FROM skinning_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Remove Greys from Item Loot Table
DELETE FROM item_loot_template 
WHERE Reference != 0 AND Reference NOT IN (SELECT entry FROM reference_loot_template);

-- Creature and object Templates

-- Remove empty Skinning entry from Creatures
UPDATE creature_template
SET skinloot = 0
WHERE skinloot NOT IN (SELECT Entry FROM skinning_loot_template);

-- Remove empty pickpocket entry from Creatures
UPDATE creature_template
SET pickpocketloot = 0
WHERE pickpocketloot NOT IN (SELECT Entry FROM pickpocketing_loot_template);

-- Remove empty loot entry from Game Objects
UPDATE gameobject_template
SET Data1 = 0,
    Data0 = 0,
    Data3 = 0
WHERE `type` = 3 AND Data1 NOT IN (SELECT Entry FROM gameobject_loot_template);
