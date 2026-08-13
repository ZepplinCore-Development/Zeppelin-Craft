-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 Goblin Starting Zone -- Lost Isles graveyards (server-side, non-disruptive)
-- Zone 4720 (The Lost Isles) on OA Kalimdor map 1.
-- I-252 rework (2026-08-04): graveyards covering the zone's hubs, IDs = their
-- area IDs, positions from in-game .gps ground readings. Nearest-graveyard selection
-- picks the right one per death location; Faction 0 = both factions.
-- Legacy single graveyard ID 4720 (Gobber's Inn hub) retired -- superseded by 4952.
-- 2026-08-13: added 4876 (Ruins of Vashj'elan). Deaths there were resolving to the
-- Horde Base Camp stone 754yd away and 93yd up a cliff -- the worst run in the zone.
-- Spirit Healers (6491) for these live in cli/data/goblin/fixtures/manual_spawns.json
-- (guids 11900001/04/05/06/07 -- 03 is hand-claimed by zz_[I-310]), emitted via
-- `zep goblin gen creatures`.
-- (`game_graveyard` has no orientation column.)

DELETE FROM game_graveyard WHERE ID IN (4720, 4721, 4779, 4783, 4876, 4952);
INSERT INTO game_graveyard (ID, Map, x, y, z, Comment) VALUES
  (4721, 1, 100.939926, -9683.685, 3.2355766, 'Lost Isles - Shipwreck Shore (F-011)'),
  (4779, 1, -15.813403, -10093.472, 105.8947, 'Lost Isles - Horde Base Camp (F-011)'),
  (4783, 1, 473.76096, -9490.309, 3.305902, 'Lost Isles - Alliance Beachhead (F-011)'),
  (4876, 1, 87.629654, -10840.065, 12.774312, 'Lost Isles - Ruins of Vashj''elan (F-011)'),
  (4952, 1, 1885.7053, -10898.985, 13.47201, 'Lost Isles - KTC Oil Platform (F-011)');

DELETE FROM graveyard_zone WHERE GhostZone = 4720;
INSERT INTO graveyard_zone (ID, GhostZone, Faction, Comment) VALUES
  (4721, 4720, 0, 'Lost Isles -> Shipwreck Shore graveyard (F-011)'),
  (4779, 4720, 0, 'Lost Isles -> Horde Base Camp graveyard (F-011)'),
  (4783, 4720, 0, 'Lost Isles -> Alliance Beachhead graveyard (F-011)'),
  (4876, 4720, 0, 'Lost Isles -> Ruins of Vashj''elan graveyard (F-011)'),
  (4952, 4720, 0, 'Lost Isles -> KTC Oil Platform graveyard (F-011)');
