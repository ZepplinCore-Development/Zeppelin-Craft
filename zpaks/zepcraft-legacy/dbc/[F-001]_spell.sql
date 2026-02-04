-- F-001: Profession Tools - JC Simple Grinder totem category
-- Converts Totem1 (item requirement) to TotemCategory1 (tool category) for JC spells
-- Totem1 20815 is Simple Grinder item, TotemCategory1 191 is the tool category

UPDATE `dbc`.`spell`
SET `Totem1` = 0, `TotemCategory1` = 191
WHERE `Totem1` = 20815;
