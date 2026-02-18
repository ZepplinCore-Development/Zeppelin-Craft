-- F-006 Phase 2: Reclassify Enchanting Rods as Reagent/Tool
-- Moves rods from Trade Goods/Enchanting (class=7, sub=12) to Reagent/Tool (class=5, sub=1)
-- Aligns with all other profession tools (hammers, picks, crops, kits, etc.)
-- BagFamily preserved so rods still fit in Enchanting bags

UPDATE `item_template` SET `class` = 5, `subclass` = 1 WHERE `entry` IN (
    6218,   -- Runed Copper Rod
    6339,   -- Runed Silver Rod
    11130,  -- Runed Golden Rod
    11145,  -- Runed Truesilver Rod
    16207,  -- Runed Arcanite Rod
    22461,  -- Runed Fel Iron Rod
    22462,  -- Runed Adamantite Rod
    22463,  -- Runed Eternium Rod
    44451,  -- Runed Cobalt Rod
    44452   -- Runed Titanium Rod
);
