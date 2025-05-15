SELECT *
FROM dbc.spell
WHERE Totem1 = 20815;

-- Totem1 20824 is simple grinder used for cutting gems

UPDATE dbc.spell
SET Totem1 = 0, TotemCategory1 = 191
WHERE Totem1 = 20815;
