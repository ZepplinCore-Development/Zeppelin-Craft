-- Fix Divino-matic Rod item class
-- Item was incorrectly classified as class 0 (Consumable) instead of class 12 (Quest)
-- This is a 100% drop quest item from Sergeant Bly in Zul'Farrak

UPDATE `item_template` SET `class` = 12 WHERE `entry` = 8548;
