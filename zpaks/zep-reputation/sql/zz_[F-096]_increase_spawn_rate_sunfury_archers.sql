-- F-096: slow the Sunfury Archer respawn so the rep grind is not a treadmill.
--
-- `creature.id1` was renamed to `id` upstream by AzerothCore commit cf0d86a9f
-- ("normalize creature table by extracting multi-ID spawns", #25197), applied here
-- by migration data/sql/updates/db_world/2026_06_16_00.sql. This file predates that
-- rename, applied once while `id1` still existed, and was never re-run — so the
-- breakage stayed invisible until the F-205 universal cascade replayed it.
--
-- NOTE this is the opposite case to a failing AC migration reporting the same
-- `Unknown column 'id1'`: those are one-shot historical files that must NOT be
-- rewritten. This one is ours, idempotent, and simply needed the current column.
UPDATE creature
SET spawntimesecs = 200
WHERE id = 19707;
