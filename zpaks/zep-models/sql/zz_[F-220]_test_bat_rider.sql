-- F-220 test entry: 902201 "F-220 Test Bat Rider" = GM-spawn clone of Gurubashi Bat Rider
-- 14750 (same ScriptName npc_batrider, trash mode for any entry not summoned by Jeklik).
-- Unspawned; spawn with `.npc add 902201`. It is also the live DB link the F-216 picker
-- reads to seat the real rider on the mount: creature 902201 = rider 900401 on mount 15303.
--
-- Rider 900401 (zep-models dbc) ships now; mount 15303's bat repoint lives in the DISABLED
-- zpak zep-mounted-npcs, so in game until that ships this troll sits on the fused BatRider.
-- The ship-time 14750 rows are zep-mounted-npcs/sql/zz_[F-220]_gurubashi_bat_rider.sql.
-- type_flags 8 (DO_NOT_PLAY_WOUND_ANIM) + 0x800 ALLOW_MOUNTED_COMBAT: without it
--   Creature::AtEngage dismounts on pull.
-- creature_template_model is read at startup only: worldserver restart.

DELETE FROM creature_template WHERE entry = 902201;
INSERT INTO creature_template SET
  `entry` = 902201,
  `difficulty_entry_1` = 0,
  `difficulty_entry_2` = 0,
  `difficulty_entry_3` = 0,
  `KillCredit1` = 0,
  `KillCredit2` = 0,
  `name` = 'F-220 Test Bat Rider',
  `subname` = 'Gurubashi Bat Rider prototype',
  `IconName` = NULL,
  `gossip_menu_id` = 0,
  `minlevel` = 61,
  `maxlevel` = 61,
  `exp` = 0,
  `faction` = 28,
  `npcflag` = 0,
  `speed_walk` = 2,
  `speed_run` = 2.14286,
  `speed_swim` = 1,
  `speed_flight` = 1,
  `detection_range` = 20,
  `rank` = 1,
  `dmgschool` = 0,
  `DamageModifier` = 10,
  `BaseAttackTime` = 2000,
  `RangeAttackTime` = 2000,
  `BaseVariance` = 1,
  `RangeVariance` = 1,
  `unit_class` = 1,
  `unit_flags` = 64,
  `unit_flags2` = 2048,
  `dynamicflags` = 0,
  `family` = 0,
  `type` = 7,
  `type_flags` = 2056,
  `lootid` = 14750,
  `pickpocketloot` = 0,
  `skinloot` = 14750,
  `PetSpellDataId` = 0,
  `VehicleId` = 0,
  `mingold` = 0,
  `maxgold` = 0,
  `AIName` = '',
  `MovementType` = 1,
  `HoverHeight` = 1,
  `HealthModifier` = 10,
  `ManaModifier` = 1,
  `ArmorModifier` = 1,
  `ExperienceModifier` = 1.25,
  `RacialLeader` = 0,
  `movementId` = 191,
  `RegenHealth` = 1,
  `CreatureImmunitiesId` = -10184,
  `flags_extra` = 0,
  `ScriptName` = 'npc_batrider',
  `VerifiedBuild` = 0;

DELETE FROM creature_template_model WHERE CreatureID = 902201;
INSERT INTO creature_template_model SET
  CreatureID = 902201,
  Idx = 0,
  CreatureDisplayID = 900401,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;

DELETE FROM creature_template_addon WHERE entry = 902201;
INSERT INTO creature_template_addon SET
  entry = 902201,
  path_id = 0,
  mount = 15303,
  bytes1 = 0,
  bytes2 = 1,
  emote = 0,
  visibilityDistanceType = 0,
  auras = NULL;

-- rider display 900401 = copy of 4609's model info
DELETE FROM creature_model_info WHERE DisplayID = 900401;
INSERT INTO creature_model_info SET
  DisplayID = 900401,
  BoundingRadius = 0.306,
  CombatReach = 1.5,
  Gender = 0,
  DisplayID_Other_Gender = 0;
