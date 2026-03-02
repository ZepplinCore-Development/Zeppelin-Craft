-- =============================================================================
-- Fix TBC-era mounts with stale RequiredLevel=30 (should be 20 for WotLK 3.3.5)
--
-- These mounts were added in TBC when the apprentice riding level was 30.
-- WotLK lowered it to 20, but AzerothCore kept the old TBC values.
-- All other 75-riding-skill mounts correctly use RequiredLevel=20.
-- The mount spells themselves already have base_level=20.
--
-- Ref: I-151
-- =============================================================================
UPDATE `item_template` SET `RequiredLevel` = 20
    WHERE `entry` IN (13325, 28481, 28927, 29220, 29221, 29222, 29743, 29744)
    AND `RequiredLevel` = 30;
