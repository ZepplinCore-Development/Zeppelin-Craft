-- I-338 "Free the Captives" (24925) — the five Oomlot Shamans the quest asks you to kill
-- drop nothing at all.
--
-- There are TWO Oomlot Shaman templates in the donor data:
--   38574 — the ambient shamans wandering the village. lootid 38574 / pickpocketloot 38574,
--           83 loot rows, ~66% total chance. Fine.
--   38644 — the guard summoned next to each Goblin Captive (38643) by spell 72243, and the
--           quest's RequiredNpcOrGo1. lootid 0, pickpocketloot 0.
--
-- The gen only ported creature_loot_template for the 44 entries that carried loot in the
-- donor dump, and 38644 was not one of them, so the only shamans a player actually kills for
-- this quest are the ones with no loot table. They are the same creature at the same level
-- (7-8, unit_class 8) as 38574, so point them at the same tables rather than duplicating
-- 83 rows under a second entry.
--
-- 38644 is an [AUTO,F-011]-owned row (DELETE+INSERT in zz_[AUTO,F-011]_10_creature_template.sql),
-- so this is an UPDATE, and it lives in this zpak so the F-205 cascade replays it after a regen.

UPDATE creature_template SET
  `lootid` = 38574,
  `pickpocketloot` = 38574
WHERE `entry` = 38644;
