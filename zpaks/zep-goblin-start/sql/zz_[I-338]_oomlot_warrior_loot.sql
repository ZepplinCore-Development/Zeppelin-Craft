-- I-338 (cont.) — Oomlot Warrior drops nothing.
--
-- Same collector gap as 38644: `zep goblin gen` only wrote creature_loot_template for the 44
-- donor entries that carried loot rows in the dump. Of the Oomlot tribe only the Shaman
-- (38574) and the Tribesman (38575) were in that set, and they are the two RAREST spawns in
-- the zone — 9 and 6. The mob a player actually fights over and over is the Warrior:
--
--   38531  Oomlot Warrior   72 spawns   lootid 0
--   75116  Oomlot Warrior   45 spawns   lootid 0   (emote variant, same template otherwise)
--
-- Both are level 7-8 hostile humanoids (type 7, faction 2228, unit_flags 0), the same shape as
-- stock trash that always carries loot — Razormane Scout 3112 (level 7-8) has lootid 3112 and
-- pickpocketloot 3112.
--
-- Point them at 38575's tables rather than inventing a third: same tribe, same level, same
-- unit_class 1, and 38575 already carries the right profile for a low-level humanoid —
-- Linen Cloth 2589 at ~42% (1-2) plus a long sub-1% trash tail, all 79 rows resolving to real
-- item_template entries, no conditions. Matches the F-199 precedent for the Kezan humanoids.
--
-- NOT included: 385310 Oomlot Warrior (78 spawns). It is scenery, not a mob — dynamicflags 32
-- (DEAD), unit_flags 33555200 (NOT_SELECTABLE | IMMUNE_TO_PC | IMMUNE_TO_NPC) and
-- creature_template_addon auras 29266 (Permanent Feign Death) + 71333. It cannot be attacked.
--
-- 38531/75116 are [AUTO,F-011]-owned rows, so UPDATE, and this file sits in the same zpak so
-- the F-205 cascade replays it after a goblin gen.

UPDATE creature_template SET
  `lootid` = 38575,
  `pickpocketloot` = 38575
WHERE `entry` IN (38531, 75116);
