-- F-174: Skinning Expanded
-- Add skinning to beasts that should logically be skinnable

-- Hellfire Peninsula riding wolves/worgs
-- Use Helboar skinloot 70160 (Knothide Leather Scraps, Knothide Leather, Fel Hide)
-- to match other Hellfire Peninsula beasts for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70160 WHERE entry IN (
  19640, -- Bleeding Hollow Riding Worg (level 60-61)
  18706  -- Bonechewer Riding Wolf (level 58-59)
);
