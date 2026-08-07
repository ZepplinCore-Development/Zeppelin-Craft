-- [I-319] Landing Site (area 4870) NPCs standing below the terrain surface.
-- Reported in-game at 379.71 / -10470.49 / 5.06 (phase 2048): the Oomlot Warrior raid on
-- the crash camp, Hobart Grapplehammer, Gobber, Grimy Greasefingers and a couple of others
-- are buried 0.5-1.8y deep. GM vision shows every phase at once, hence "a heap of NPCs".
--
-- Measured, not guessed. Every spawn in a 400x400 box was probed against both the navmesh
-- (cli/lib/navmesh_checker/mmap_query) and the .map heightmap (cli/lib/terrain_reader):
--   * 20 spawns sit 0.5-1.8y BELOW the heightmap.
--   * all 20 report ON_MESH, dist 0.65-2.30 -- inside F-170's 3.0y ON_MESH tolerance.
--   * the other 356 spawns in the box cluster at a median dz of +0.08.
-- So `zep world terrain check/fix` reports this region clean and would change none of them;
-- it is built to catch spawns stranded on cliffs or floating in air, not gentle sink. Worse,
-- the same box holds 40 genuinely OFF_MESH spawns that MUST stay off-mesh (12 Ravenous
-- Lurkers underwater, 9 Lost Isles Mail Birds flying) -- a zone-wide terrain fix would
-- relocate those onto the shore while leaving every buried NPC exactly where it is.
--
-- Not a port defect: goblin_gen/creatures.py passes the source z through verbatim (x/y get
-- the map-648 offset, z does not), and the Neltharion rows carry these z values. The OA
-- terrain at the crash camp simply sits ~1-1.7y higher than the coords Cata authored.
-- Same class as I-269, different mechanism -- there GroundZ != FloorZ because Kezan's roads
-- are raised vmap decks; here in-game .gps reports GroundZ == FloorZ == 5.063, plain terrain.
--
-- Target z = .map heightmap + 0.05. The heightmap equals the client's GroundZ exactly
-- (calibrated in I-228), and healthy spawns of these same entries sit at dz +0.00..+0.09,
-- so +0.05 is the centre of the measured healthy band -- not an invented lift.
--
-- Keyed by entry + ORIGINAL position, never by guid: the AUTO creature guids are sequential
-- and renumber on every `zep goblin gen` sweep. Rows are one per position CLUSTER, so phase
-- twins standing on the same spot move together (2 spawns here were only 0.3-0.5y low but
-- share a cluster with a buried twin; leaving them behind would split the group). Generated
-- and guard-checked so that the 0.5 match box around each row selects exactly its intended
-- spawns -- no spawn missed, none swept in, and no two rows able to match the same creature.
--
-- Excluded deliberately:
--   * guid 11002201 (Oomlot Warrior 38531, Raptor Rise) -- sunk 0.55y but on a slope, where
--     a single-point heightmap sample is unreliable. Needs an in-game eyeball, not this file.
--   * 131 zone-wide spawns reading |dz| > 10 (Lost Peak, Vicious Vale, Sky Falls) -- that is
--     the known heightmap-on-steep-cliffs failure mode, not real burial.
UPDATE creature c
JOIN (
            SELECT  38120 AS id,   384.6403 AS x, -10463.6667 AS y,   5.0856 AS z  -- Hobart Grapplehammer: was 3.2929, 4.7220, 3.2373 (guid 11001876, 11001879, 11001880)
  UNION ALL SELECT  38409,         396.6670,       -10454.5000,         5.7109       -- Goblin Survivor: was 5.0635 (guid 11002065)
  UNION ALL SELECT  38746,         384.4605,       -10470.6500,         5.0767       -- Gobber: was 4.4420, 4.4389 (guid 11002359, 11002361)
  UNION ALL SELECT  38753,         431.3570,       -10497.0000,         7.9147       -- Goblin Zombie: was 6.9009 (guid 11002486)
  UNION ALL SELECT  42473,         380.0745,       -10445.3500,         5.9640       -- Grimy Greasefingers: was 5.4406, 5.3635 (guid 11003508, 11003509)
  UNION ALL SELECT  75116,         376.1560,       -10463.6000,         5.1153       -- Oomlot Warrior: was 4.1875 (guid 11003236)
  UNION ALL SELECT  75116,         377.2370,       -10460.6000,         5.1427       -- Oomlot Warrior: was 4.0481 (guid 11003413)
  UNION ALL SELECT  75116,         378.3690,       -10466.3000,         5.0966       -- Oomlot Warrior: was 3.9495 (guid 11003302)
  UNION ALL SELECT  75116,         379.8840,       -10458.3000,         5.1360       -- Oomlot Warrior: was 3.8308 (guid 11003418)
  UNION ALL SELECT  75116,         381.0030,       -10463.8000,         5.0955       -- Oomlot Warrior: was 3.3183 (guid 11001860)
  UNION ALL SELECT  75116,         381.1020,       -10468.2000,         5.0911       -- Oomlot Warrior: was 4.1230 (guid 11001875)
  UNION ALL SELECT  75116,         383.7590,       -10456.5000,         5.1240       -- Oomlot Warrior: was 4.0919 (guid 11003280)
  UNION ALL SELECT  75116,         384.4930,       -10461.1000,         5.0986       -- Oomlot Warrior: was 3.4466 (guid 11001793)
  UNION ALL SELECT  75116,         385.0920,       -10468.5000,         5.0769       -- Oomlot Warrior: was 3.8736 (guid 11003308)
  UNION ALL SELECT  75116,         387.7720,       -10468.8000,         5.0720       -- Oomlot Warrior: was 3.8265 (guid 11002103)
  UNION ALL SELECT  75116,         387.8050,       -10463.9000,         5.0796       -- Oomlot Warrior: was 3.6009 (guid 11001807)
  UNION ALL SELECT  75116,         389.1350,       -10459.0000,         5.1100       -- Oomlot Warrior: was 4.3052 (guid 11001898)
  UNION ALL SELECT  75116,         391.1370,       -10462.0000,         5.0786       -- Oomlot Warrior: was 4.0259 (guid 11001815)
) f ON c.id = f.id
   AND ABS(c.position_x - f.x) < 0.5
   AND ABS(c.position_y - f.y) < 0.5
SET c.position_z = f.z
WHERE c.map = 1;
