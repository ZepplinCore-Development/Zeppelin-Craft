-- F-005: Riding Overhaul - Azeroth Flying (Phase 3)
-- Enable flying in Eastern Kingdoms (map 0) and Kalimdor (map 1)
--
-- Flying flag = bit 14 (0x4000 = 16384)
-- Outland/Northrend zones already have this flag; EK/Kalimdor zones do not.
-- This adds the flag to all EK/Kalimdor zones and subzones, including capitals.
--
-- Exclusions (by top-level zone ID):
--   876  - GM Island
--   2159 - Onyxia's Lair (instance)
--   2917 - Hall of Legends (PvP instance)
--   3459 - "City" (placeholder)
--   3478 - Gates of Ahn'Qiraj (instance)
--   5095 - Tol Barad (Cataclysm BG zone, has subzones)

-- ============================================================================
-- TOP-LEVEL ZONES: Add flying flag to all EK/Kalimdor parent zones
-- ============================================================================
UPDATE `areatable`
SET `flags` = `flags` | 0x4000
WHERE `map_id` IN (0, 1)
  AND `zone_id` = 0
  AND (`flags` & 0x4000) = 0
  AND `id` NOT IN (876, 2159, 2917, 3459, 3478, 5095);

-- ============================================================================
-- SUBZONES: Add flying flag to all EK/Kalimdor subzones
-- Subzones carry independent flags (do not inherit from parent).
-- Exclude subzones whose parent is an excluded zone.
-- ============================================================================
UPDATE `areatable`
SET `flags` = `flags` | 0x4000
WHERE `map_id` IN (0, 1)
  AND `zone_id` != 0
  AND (`flags` & 0x4000) = 0
  AND `zone_id` NOT IN (876, 2159, 2917, 3459, 3478, 5095);
