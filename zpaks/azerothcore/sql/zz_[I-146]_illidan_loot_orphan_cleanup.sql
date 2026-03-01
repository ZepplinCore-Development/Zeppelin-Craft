-- =============================================================================
-- Cleanup: Orphaned Illidan reference_loot_template entries
-- =============================================================================
-- AC update 2026_02_15_07 migrated Illidan's loot from references 36137/36138/36139
-- to consolidated references 34077/34117, but never deleted the old entries.
-- This removes the orphaned rows to suppress startup warnings.
-- =============================================================================

DELETE FROM `reference_loot_template` WHERE `Entry` IN (36137, 36138, 36139);
