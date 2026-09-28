-- I-374: Battle/Guardian elixirs and flasks share stock category cooldown 79 (3s).
-- Match scrolls instead: own 1s item cooldown, no shared category.
-- Scoped to elixirs (subclass 2) and flasks (subclass 3): 120 stock items.
-- Other cat-79 items (Potion of Curing, Zanza, Scourgebane, etc.) are left stock.
UPDATE item_template SET
  spellcooldown_1 = 1000,
  spellcategory_1 = 0,
  spellcategorycooldown_1 = -1
WHERE class = 0
  AND subclass IN (2, 3)
  AND spellcategory_1 = 79;
