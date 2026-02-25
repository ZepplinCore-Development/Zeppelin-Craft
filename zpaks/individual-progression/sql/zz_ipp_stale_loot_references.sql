-- =============================================================================
-- IPP Stale Loot Reference Cleanup
-- =============================================================================
-- mod-individual-progression tbc_loot_fixes.sql inserts creature_loot_template
-- rows referencing old reference_loot_template entries (34093, 34024, etc.)
-- that were removed by AC updates 2026_02_02_00 and 2026_02_15_07.
-- AC replaced these with new reference entries (1564000-1564002).
-- The IPP module hasn't been updated to match, so the old references break.
-- This cleanup removes the orphaned creature_loot_template rows.
-- =============================================================================

DELETE FROM `creature_loot_template`
WHERE `Reference` IN (34024, 34025, 34056, 34062, 34064, 34065, 34066,
                       34067, 34070, 34071, 34072, 34073, 34076, 34093)
  AND `Reference` NOT IN (SELECT `Entry` FROM `reference_loot_template`);
