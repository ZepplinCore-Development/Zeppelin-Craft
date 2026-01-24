-- =============================================================================
-- F-025: Fix Shazzrah Missing T1 Loot
--
-- Refs 30367 (boots + epics) and 30368 (gloves) were orphaned, likely removed
-- during custom content changes. This restores them to Shazzrah's loot table.
-- =============================================================================

-- Add missing reference loot tables to Shazzrah (Entry 12264)
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(12264, 30367, 30367, 100, 0, 1, 0, 1, 1, 'Shazzrah - T1 Boots + Epics (restored F-025)'),
(12264, 30368, 30368, 100, 0, 1, 0, 1, 1, 'Shazzrah - T1 Gloves (restored F-025)');
