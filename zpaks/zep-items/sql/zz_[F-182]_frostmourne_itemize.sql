-- =====================================================================
-- F-182 Itemize Frostmourne (33475) into a wieldable Legendary 2H sword.
-- Stock 33475 is the ICC cinematic prop: 0 weapon damage and a filler
-- stat line (Str/Int/Stam). This gives it real 2H damage and a coherent
-- melee-legendary stat budget tuned just above Shadowmourne (ilvl 296).
-- Equip spell 43827 ("Frostmourne") is left intact.
-- This edits a STOCK item, so UPDATE SET is the correct pattern.
-- =====================================================================

UPDATE `item_template` SET
    `dmg_min1`    = 1000,
    `dmg_max1`    = 1650,
    `dmg_type1`   = 0,        -- physical
    `delay`       = 3600,
    `stat_type1`  = 4,   `stat_value1` = 230,   -- Strength
    `stat_type2`  = 7,   `stat_value2` = 205,   -- Stamina
    `stat_type3`  = 32,  `stat_value3` = 120,   -- Critical Strike rating
    `stat_type4`  = 44,  `stat_value4` = 120,   -- Armor Penetration rating
    `stat_type5`  = 0,   `stat_value5` = 0
WHERE `entry` = 33475;
