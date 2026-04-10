-- F-174: Skinning Expanded
-- Add skinning to beasts that should logically be skinnable

-- Bleeding Hollow Riding Worg (Hellfire Peninsula, level 60-61)
-- Uses Frostwolf skinloot 10981: Thick Leather, Knothide Leather Scraps, Knothide Leather
UPDATE creature_template SET skinloot = 10981 WHERE entry = 19640;
