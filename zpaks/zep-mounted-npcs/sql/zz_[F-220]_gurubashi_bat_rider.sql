-- F-220 ship-time: Gurubashi Bat Rider (14750) = rider 900401 (zep-models dbc) on
-- mount 15303 (this zpak's dbc: the fused BatRider display turned into the riderless bat).
-- Applies only when zep-mounted-npcs is enabled, together with that DBC row.
--
-- - type_flags 8 (DO_NOT_PLAY_WOUND_ANIM) + 0x800 ALLOW_MOUNTED_COMBAT: Creature::AtEngage
--   dismounts otherwise.
-- - 8 of the 16 ZG spawns have creature_addon rows, which replace the template addon
--   whole: they need the mount too.
-- - The core dismounts at death: the corpse is the troll alone.
-- Jeklik's summoned riders are the same entry (npc_batrider boss mode) and fly mounted.

-- type_flags was 8
UPDATE creature_template SET type_flags = 2056 WHERE entry = 14750;

-- CreatureDisplayID was 15303 (fused BatRider; 15303 is now the mount)
UPDATE creature_template_model SET CreatureDisplayID = 900401 WHERE CreatureID = 14750 AND Idx = 0;

DELETE FROM creature_template_addon WHERE entry = 14750;
INSERT INTO creature_template_addon SET
  entry = 14750,
  path_id = 0,
  mount = 15303,
  bytes1 = 0,
  bytes2 = 1,
  emote = 0,
  visibilityDistanceType = 0,
  auras = NULL;

-- mount was 0 on all 8 stock spawn addons
UPDATE creature_addon SET mount = 15303
WHERE guid IN (49129, 49130, 49147, 49154, 49155, 49167, 49185, 49189);
