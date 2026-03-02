-- =============================================================================
-- AzerothCore stock orphan cleanup
-- =============================================================================

-- Stale creature_loot_template entry 19759 - no creature uses this lootid
DELETE FROM `creature_loot_template` WHERE `Entry` = 19759;

-- Orphaned reference_loot_template from AC update 2026_02_15_07
DELETE FROM `reference_loot_template` WHERE `Entry` IN (34026, 34104, 34105, 34117, 34214);

-- Orphaned achievement_criteria_data for non-existent DBC criteria
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (5123, 5124, 5125);
