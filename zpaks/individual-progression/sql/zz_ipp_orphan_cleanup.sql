-- =============================================================================
-- IPP Orphan Cleanup
-- =============================================================================
-- Clean up orphaned records left behind by mod-individual-progression
-- =============================================================================

-- Orphaned creature_addon records (creatures no longer exist)
DELETE FROM `creature_addon` WHERE `guid` IN (4770, 92235, 137933)
    AND `guid` NOT IN (SELECT `guid` FROM `creature`);

-- SmartAI scripts referencing spells removed by IPP
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1563 AND `action_param1` = 1768;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 4845 AND `action_param1` = 1767;
