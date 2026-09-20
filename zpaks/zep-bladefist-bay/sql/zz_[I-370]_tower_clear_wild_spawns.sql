-- =============================================================================
-- I-370  Clear the Bladefist Bay tower of wandering wildlife
--
-- ORCTOWERORGRIMMAR.WMO (F-209, uid 7900003, origin 1375.65 -4912.77) was placed
-- on top of four stock Durotar spawns. Its ground-level footprint reaches 17.6 yd
-- from the origin (parsed from the WMO groups), and each of these either spawned
-- inside it or wandered into it:
--
--   12371 Venomtail Scorpid    8.1 yd out, wander 10
--    4745 Bloodtalon Scythemaw  9.8 yd out, wander 10
--    7361 Hare                 12.6 yd out, wander 5
--   11995 Elder Mottled Boar   25.8 yd out, wander 10 (15.8 inner reach)
--
-- None is in a pool, formation, SAI script or other zpak's SQL, so each is simply
-- moved inland (west/north-west - the sea and dock are east/south). Each new spot
-- keeps the whole wander circle at least 4 yd outside the tower footprint, on dry
-- ground (every point of the circle z >= 2), at least wander+8 yd from the F-209
-- shore camp, dock head and barricades, and 20 yd from any other spawn of the
-- same species. z is sampled from our KALIMDOR_41_29.ADT heightmap. Wander
-- distance and orientation are unchanged; none needed deleting.
-- =============================================================================

-- Venomtail Scorpid (3127): moved 30.0 yd, now 31.6 yd from the tower origin
UPDATE `creature` SET
  `position_x` = 1365.65,
  `position_y` = -4942.77,
  `position_z` = 3.70
WHERE `guid` = 12371;

-- Bloodtalon Scythemaw (3123): moved 27.2 yd, now 32.2 yd from the tower origin
UPDATE `creature` SET
  `position_x` = 1391.65,
  `position_y` = -4884.77,
  `position_z` = 11.75
WHERE `guid` = 4745;

-- Hare (5951): moved 14.2 yd, now 26.8 yd from the tower origin
UPDATE `creature` SET
  `position_x` = 1351.65,
  `position_y` = -4900.77,
  `position_z` = 10.90
WHERE `guid` = 7361;

-- Elder Mottled Boar (3100): moved 15.4 yd, now 31.6 yd from the tower origin
UPDATE `creature` SET
  `position_x` = 1357.65,
  `position_y` = -4886.77,
  `position_z` = 12.48
WHERE `guid` = 11995;
