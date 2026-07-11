-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 Kezan (zone 4737) graveyard — verified on ground via MapHeightReader (Bilgewater hub).
DELETE FROM game_graveyard WHERE ID = 4737;
INSERT INTO game_graveyard (ID, Map, x, y, z, Comment) VALUES
  (4737, 1, -8847.5, -11067.2, 51.5, 'Kezan - Bilgewater hub (F-011)');
DELETE FROM graveyard_zone WHERE ID = 4737 AND GhostZone = 4737;
INSERT INTO graveyard_zone (ID, GhostZone, Faction, Comment) VALUES
  (4737, 4737, 0, 'Kezan -> Bilgewater graveyard (F-011)');
