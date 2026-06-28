-- F-005: Riding Overhaul - SpellDescriptionVariables (RETIRED)
--
-- Variables 182/184/185/199 drove the in-tooltip mount/form speed text
-- ($<groundspeed>/$<flyingspeed>/$<swimspeed>/$<wolfspeed>/$<travelspeed>...).
-- They are now redundant: the ZepTooltips addon (F-190) computes and shows the
-- real Ground/Flight/Swim speed as its own lines, including riding-crop bonuses.
-- The mount/form descriptions have been reverted to stock (no $<...> tokens), so
-- these variable rows are unreferenced. DELETE-only retires them idempotently
-- (and strips any stale rows still present in a DBC).
DELETE FROM `spelldescriptionvariables` WHERE `id` IN (182, 184, 185, 199);
