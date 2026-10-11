-- F-220 prototype: Gurubashi Bat Rider as a troll NPC on a bat mount, replacing the
-- fused rider model (display 15303, Creature\FelBat\BatRider).
--
-- TEST ENTRY ONLY: 902201 is a GM-spawn clone of 14750 (same ScriptName npc_batrider,
-- which runs in trash mode for any entry that is not Jeklik's summon). The live 14750
-- stays stock until the F-216 viewer shows rider-on-mount properly. To ship, move the
-- model/addon/type_flags rows below onto 14750 and set mount on its 8 spawn addons
-- (guids 49129 49130 49147 49154 49155 49167 49185 49189 have creature_addon rows,
-- which replace the template addon whole).
--
-- Rider = 4609 (Lau'Tiki): Character\Troll\Male, blue skin, bare chest, dark leather
--   legs, _HD bake shipped. Shipped TrollMale.m2 has the Mount anim (91) embedded.
-- Mount = 900401 (ZG brown taxi bat, zep-models dbc/[F-220]_creaturedisplayinfo.sql).
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
  CreatureDisplayID = 4609,
  DisplayScale = 1,
  Probability = 1,
  VerifiedBuild = 0;

DELETE FROM creature_template_addon WHERE entry = 902201;
INSERT INTO creature_template_addon SET
  entry = 902201,
  path_id = 0,
  mount = 900401,
  bytes1 = 0,
  bytes2 = 1,
  emote = 0,
  visibilityDistanceType = 0,
  auras = NULL;
