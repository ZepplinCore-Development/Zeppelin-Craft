-- ============================================================================
-- Remove IPP Spell Book Drops from AQ20 Bosses
-- ============================================================================
-- Partial fix for I-072: AtlasLoot Overflow
--
-- IPP adds spell rank upgrade books (Tomes, Codexes, Librams, etc.) to AQ20
-- boss loot tables. This gates max-rank spells behind raid content, which is
-- the vanilla design but undesirable for Zeppelin.
--
-- With zz_optional_class_trainers.sql moved to optional/, these spells are
-- now available at class trainers. This SQL removes the redundant boss drops.
--
-- Reference templates removed:
--   30420 - Spell books (9 items): Mage, Warlock, Paladin, Shaman, Warrior
--   30421 - Spell books (9 items): Priest, Shaman, Druid, Warrior
--   30424 - Spell books (8 items): Paladin, Rogue, Hunter, Warrior
--   30426 - Spell books (25 items): ALL classes combined
--   30427 - Spell books (25 items): ALL classes combined (duplicate pool)
--
-- Keeps intact:
--   30411 - Enchanting formulas (Shadow/Frost/Fire Power, etc.)
--   30422, 30423 - Ossirian epic gear
--   30425, 30428, 30431, 30434 - Qiraji crafting materials (hilts, rings, drapes)
--   30429, 30430, 30432, 30433, 30435, 30436 - Boss epic gear
-- ============================================================================

-- Remove spell book references from boss loot tables
-- Ossirian the Unscarred (15339): remove 30420, 30421, 30424
DELETE FROM `creature_loot_template` WHERE `Entry` = 15339 AND `Reference` IN (30420, 30421, 30424);

-- Moam (15340): remove 30426, 30427
DELETE FROM `creature_loot_template` WHERE `Entry` = 15340 AND `Reference` IN (30426, 30427);

-- General Rajaxx (15341): remove 30426, 30427
DELETE FROM `creature_loot_template` WHERE `Entry` = 15341 AND `Reference` IN (30426, 30427);

-- Kurinnaxx (15348): remove 30426
DELETE FROM `creature_loot_template` WHERE `Entry` = 15348 AND `Reference` IN (30426);

-- Ayamiss the Hunter (15369): remove 30426, 30427
DELETE FROM `creature_loot_template` WHERE `Entry` = 15369 AND `Reference` IN (30426, 30427);

-- Buru the Gorger (15370): remove 30426, 30427
DELETE FROM `creature_loot_template` WHERE `Entry` = 15370 AND `Reference` IN (30426, 30427);

-- Clean up the now-unused reference loot templates
DELETE FROM `reference_loot_template` WHERE `Entry` IN (30420, 30421, 30424, 30426, 30427);
