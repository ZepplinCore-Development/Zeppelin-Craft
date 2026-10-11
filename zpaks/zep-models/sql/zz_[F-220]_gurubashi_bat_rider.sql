-- F-220 prototype: Gurubashi Bat Rider (14750) as a troll NPC on a bat mount,
-- replacing the fused rider model (display 15303, Creature\FelBat\BatRider).
--
-- Rider = 4609 (Lau'Tiki): Character\Troll\Male, blue skin, bare chest, dark
--   leather legs - closest shipped bake (_HD) to the old rider skin. The shipped
--   TrollMale.m2 has the Mount anim (91) embedded.
-- Mount = 900401 (ZG brown taxi bat, zep-models dbc/[F-220]_creaturedisplayinfo.sql).
--
-- Traps:
-- - Creature::AtEngage dismounts unless type_flags has
--   CREATURE_TYPE_FLAG_ALLOW_MOUNTED_COMBAT (0x800) - without it the bat vanishes on pull.
-- - A spawn's creature_addon row replaces the template addon whole, so the 8 ZG
--   spawns that have one need the mount there too.
-- - The core dismounts at death (Creature::setDeathState): the corpse is the troll alone.
-- - creature_template_model is read at startup only: worldserver restart.
-- Display 15303 is left in the DBC (Bat Rider Guard 15242 still uses it).

-- type_flags was 8 (DO_NOT_PLAY_WOUND_ANIM, kept); + 0x800 ALLOW_MOUNTED_COMBAT
UPDATE creature_template SET type_flags = 2056 WHERE entry = 14750;

-- CreatureDisplayID was 15303 (fused BatRider)
UPDATE creature_template_model SET CreatureDisplayID = 4609 WHERE CreatureID = 14750 AND Idx = 0;

DELETE FROM creature_template_addon WHERE entry = 14750;
INSERT INTO creature_template_addon SET
  entry = 14750,
  path_id = 0,
  mount = 900401,
  bytes1 = 0,
  bytes2 = 1,
  emote = 0,
  visibilityDistanceType = 0,
  auras = NULL;

-- mount was 0 on all 8 stock spawn addons
UPDATE creature_addon SET mount = 900401
WHERE guid IN (49129, 49130, 49147, 49154, 49155, 49167, 49185, 49189);
