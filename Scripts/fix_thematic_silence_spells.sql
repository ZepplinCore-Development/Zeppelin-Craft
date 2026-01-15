-- ============================================================================
-- THEMATIC SILENCING - DBC SPELL FIXES
-- ============================================================================
-- Fixes spell mechanics for thematic silencing abilities
-- Execute against DBC database, then run Patch Builder to regenerate
-- update_spell.sql and create client patches
--
-- Database: dbc
-- User: spell-editor
-- After execution: Run Patch Builder locally to regenerate files
-- ============================================================================

-- Mage Counterspell (ID: 2139)
-- Fix: Remove mana cost percentage (currently 9%)
-- Cooldown already fixed to 8s in existing update_spell.sql
UPDATE `spell` SET
    `ManaCostPercentage` = 0
WHERE `ID` = 2139;

-- Hunter Silencing Shot (ID: 34490)
-- Fix: Remove mana cost percentage (currently 6%)
-- Other mechanics already configured
UPDATE `spell` SET
    `ManaCostPercentage` = 0
WHERE `ID` = 34490;

-- Shaman Wind Shear (ID: 57994)
-- Fix: Remove mana cost percentage (currently 8%)
-- Cooldown already fixed to 8s in existing update_spell.sql
UPDATE `spell` SET
    `ManaCostPercentage` = 0
WHERE `ID` = 57994;

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================
-- Run these after executing updates to confirm changes:
--
-- SELECT ID, ManaCostPercentage, RecoveryTime, CategoryRecoveryTime
-- FROM spell
-- WHERE ID IN (2139, 34490, 57994);
--
-- Expected results:
-- ID    | ManaCostPercentage | RecoveryTime | CategoryRecoveryTime
-- ------|-------------------|--------------|---------------------
-- 2139  | 0                 | 0            | 8000
-- 34490 | 0                 | 8000         | 0
-- 57994 | 0                 | 0            | 8000
-- ============================================================================
