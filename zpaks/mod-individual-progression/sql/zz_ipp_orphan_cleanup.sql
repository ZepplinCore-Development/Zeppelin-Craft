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

-- [I-383] Pool 1072 "Mirelow (14424)": IPP zone_wetlands.sql deletes all its
-- pool_creature rows (Mirelow now patrols a waypoint path from one spawn, guid
-- 91113) but leaves the pool_template row -> "Pool Id 1072 is empty" at startup.
DELETE FROM `pool_template` WHERE `entry` = 1072
    AND `entry` NOT IN (SELECT `pool_entry` FROM `pool_creature`)
    AND `entry` NOT IN (SELECT `pool_entry` FROM `pool_gameobject`)
    AND `entry` NOT IN (SELECT `pool_id` FROM `pool_pool`);

-- [I-383] BRD Anvilrage Officer patrols 45875 / 47799: IPP dungeon_blackrock_depths.sql
-- re-creates both groups with creature_formations; upstream 2026_09_24_09 (Bael'Gar
-- corridor patrols from sniff) then deletes those creatures but not IPP's formation
-- rows -> "creature_formations table leader guid ... does not exist" (5 rows each).
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (45875, 47799)
    AND `leaderGUID` NOT IN (SELECT `guid` FROM `creature`);
