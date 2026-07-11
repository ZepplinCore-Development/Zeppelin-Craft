-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 Goblin Starting Zone — Lost Isles graveyard (server-side, non-disruptive)
-- Zone 4720 (The Lost Isles) on OA Kalimdor map 1.
-- Resurrection point: Gobber's inn (innkeeper/hub), verified on ground via MapHeightReader.
-- Coords = Gobber (38746) actual map-1 spawn; ground Z here = 22.7 (checked, not falling through).
-- (Previous 1080/-10470/51 was a bogus multi-spawn AVERAGE that sat ~140y underground.)
-- We OWN graveyard ID 4720 -> DELETE + INSERT (final state).

DELETE FROM game_graveyard WHERE ID = 4720;
INSERT INTO game_graveyard (ID, Map, x, y, z, Comment) VALUES
  (4720, 1, 1832.0, -10876.0, 24.0, 'Lost Isles - Gobber''s Inn hub (F-011)');

DELETE FROM graveyard_zone WHERE ID = 4720 AND GhostZone = 4720;
INSERT INTO graveyard_zone (ID, GhostZone, Faction, Comment) VALUES
  (4720, 4720, 0, 'Lost Isles -> Town-In-A-Box graveyard (F-011)');
