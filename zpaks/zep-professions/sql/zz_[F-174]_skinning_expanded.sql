-- F-174: Skinning Expanded
-- Add skinning to beasts that should logically be skinnable

-- Bleeding Hollow Riding Worg (Hellfire Peninsula, level 60-61)
-- Uses Helboar skinloot 70160: Knothide Leather Scraps, Knothide Leather, Fel Hide
-- (matches other Hellfire Peninsula beasts for consistency)
UPDATE creature_template SET skinloot = 70160 WHERE entry = 19640;
