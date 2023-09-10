SELECT *
FROM dbc.spell
WHERE Totem1 = 20815;

UPDATE dbc.spell
SET Totem1 = 0, TotemCategory1 = 191
WHERE Totem1 = 20815;