-- F-174: Skinning Expanded
-- Add skinning to beasts that should logically be skinnable

-- Hellfire Peninsula beasts
-- Use Helboar skinloot 70160 (Knothide Leather Scraps, Knothide Leather, Fel Hide)
-- to match other Hellfire Peninsula beasts for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70160 WHERE entry IN (
  19640, -- Bleeding Hollow Riding Worg (level 60-61)
  18706, -- Bonechewer Riding Wolf (level 58-59)
  16844, -- Crust Burster (level 59-60)
  16857  -- Marauding Crust Burster (level 59-60)
);

-- Nagrand beasts
-- Use generic Outland 65-67 skinloot 70063 (Knothide Leather)
-- matching other Nagrand wildlife for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70063 WHERE entry IN (
  21381, -- Young Crust Burster (level 66-67)
  21380  -- Greater Crust Burster (level 67)
);
