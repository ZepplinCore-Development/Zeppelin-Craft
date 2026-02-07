-- F-001: Profession Tools - JC Simple Grinder totem category
-- Converts totem_1 (item requirement) to totem_category_1 (tool category) for JC spells
-- totem_1 20815 is Simple Grinder item, totem_category_1 191 is the tool category

UPDATE `dbc`.`spell`
SET `totem_1` = 0, `totem_category_1` = 191
WHERE `totem_1` = 20815;
