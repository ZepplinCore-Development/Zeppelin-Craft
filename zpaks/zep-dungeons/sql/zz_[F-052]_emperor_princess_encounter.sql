-- Emperor Dagran Thaurissan & Princess Moira Bronzebeard encounter loot adjustments
-- I-056: Multi-boss encounter audit - bump Dark Iron Fanny Pack to 100% for cleaner AtlasLoot layout

-- Bump Dark Iron Fanny Pack (11468) from 80% to 100% for both bosses
-- This consolidates the item into "Guaranteed" category instead of "Variable"
UPDATE `creature_loot_template` SET `Chance` = 100 WHERE `Entry` = 9019 AND `Item` = 11468;
UPDATE `creature_loot_template` SET `Chance` = 100 WHERE `Entry` = 8929 AND `Item` = 11468;
