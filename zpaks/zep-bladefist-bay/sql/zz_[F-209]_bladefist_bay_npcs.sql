-- =============================================================================
-- F-209  Bladefist Bay — retail's own shore crew
--
-- Cataclysm built a dock in Durotar for the goblin arrival and staffed it. The
-- structures are placed in KALIMDOR_41_29.ADT from `adt_placements.json`; these
-- are the NPCs that stand on them, ported from tdb434 at Blizzard's own
-- positions.
--
-- Two adjustments, both forced:
--
--  * **Display IDs.** Every Cata display these NPCs use — 31486, 32170-32178,
--    32529 — is absent from our CreatureDisplayInfo, and a creature pointed at
--    a missing display row crashes the client
--    (feedback_creature_display_crash_cascade). Substituted with WotLK displays
--    of the same character, all verified present in the DBC *and* in
--    `creature_model_info`. The one Cata display that does exist, 29283
--    (Battleworg), is kept — it is already in service on Argent Battleworg.
--
--  * **Z.** Cataclysm raised this shore; WotLK's is 3-7 yards lower. Anything
--    standing on ground is re-sampled from our own heightmap. Anything standing
--    on the dock keeps the donor Z, because the surface it stands on is the
--    dock, which we now ship at the donor's height.
--
-- Levels 85 -> 80: this is a 3.3.5a server.
--
-- Guids 11960001-11960010, a hand-assigned block. `creature` has no
-- AUTO_INCREMENT default worth trusting here — a guid-less INSERT gets wiped
-- (reference_creature_guid_autoincrement_trap) — and the F-011 generator never
-- touches 119xxxxx, so these survive a regen.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Templates
-- -----------------------------------------------------------------------------
DELETE FROM `creature_template` WHERE `entry` IN (39609, 39610, 40891, 40892, 40893, 41621);

INSERT INTO `creature_template` SET
    `entry` = 39609,
    `name` = 'Kor''kron Loyalist',
    `minlevel` = 80,
    `maxlevel` = 80,
    `faction` = 29,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 7,
    `rank` = 1,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

INSERT INTO `creature_template` SET
    `entry` = 39610,
    `name` = 'Battleworg',
    `minlevel` = 80,
    `maxlevel` = 80,
    `faction` = 1074,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 1,
    `speed_run` = 1.57143,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

INSERT INTO `creature_template` SET
    `entry` = 40891,
    `name` = 'Dranosh''ar Laborer',
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 125,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 7,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

INSERT INTO `creature_template` SET
    `entry` = 40892,
    -- I-370: SmartAI for the supervising gestures at the bottom of this file.
    `AIName` = 'SmartAI',
    `name` = 'Dranosh''ar Overseer',
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 125,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 7,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

INSERT INTO `creature_template` SET
    `entry` = 40893,
    `name` = 'Dranosh''ar Fisherman',
    `minlevel` = 60,
    `maxlevel` = 60,
    `faction` = 125,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 32768,
    `unit_flags2` = 2048,
    `type` = 7,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

INSERT INTO `creature_template` SET
    `entry` = 41621,
    `name` = 'Commander Thorak',
    `minlevel` = 80,
    `maxlevel` = 80,
    `faction` = 85,
    `npcflag` = 0,
    `BaseAttackTime` = 2000,
    `RangeAttackTime` = 2000,
    `unit_class` = 1,
    `unit_flags` = 33536,
    `unit_flags2` = 2048,
    `type` = 7,
    `rank` = 1,
    `MovementType` = 0,
    `VerifiedBuild` = '12340';

-- -----------------------------------------------------------------------------
-- Models — WotLK stand-ins for the Cata displays, except the Battleworg's own
-- -----------------------------------------------------------------------------
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (39609, 39610, 40891, 40892, 40893, 41621);
INSERT INTO `creature_template_model`
    (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
    -- Cata 31486 -> Kor'kron Elite. 19016/19017 are the closer name match but both
    -- carry a 2.0 bounding radius in creature_model_info; 14360 is correctly sized.
    (39609, 0, 14360, 1, 1, 12340),
    -- The one Cata display we already have.
    (39610, 0, 29283, 1, 1, 12340),
    -- Cata 32170-32173, four labourer variants -> two orc peon models for variety.
    (40891, 0, 16310, 1, 1, 12340),
    (40891, 1, 10038, 1, 1, 12340),
    -- Cata 32174-32176 -> Orgrimmar Grunt, an orc with authority over peons.
    (40892, 0,  4259, 1, 1, 12340),
    -- Cata 32177-32178 -> peon models again; these are dockhands, not soldiers.
    (40893, 0, 10038, 1, 1, 12340),
    (40893, 1, 16310, 1, 1, 12340),
    -- Cata 32529 -> Kor'kron Defender, correctly sized unlike the Warrior row.
    (41621, 0, 20113, 1, 1, 12340);

-- -----------------------------------------------------------------------------
-- Spawns — Blizzard's x/y/orientation; z re-sampled on land, donor z on the dock
-- -----------------------------------------------------------------------------
-- I-370 (2026-09-19): the dock and ship WMOs were lowered 7 yards (5, then 2) in
-- adt_placements.json (uids 7900001/7900002). Everything standing on them follows
-- through this one knob; keep it equal to that recipe's drop. 0 = Blizzard's height.
SET @bay_drop := -7.0;

DELETE FROM `creature` WHERE `guid` BETWEEN 11960001 AND 11960010;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 11960001 AND 11960010;

INSERT INTO `creature`
    (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`,
     `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
     `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`,
     `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
    -- On the dock, at the head of the gangplank. Donor z + @bay_drop: the dock is now there.
    (11960001, 39609, 1, 0, 0, 1, 1, 0, 1463.83, -5010.76, 11.916 + @bay_drop, 6.0388, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960002, 39610, 1, 0, 0, 1, 1, 0, 1464.80, -5014.64, 11.901 + @bay_drop, 0.4363, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Fishermen along the dock rail. equipment_id 1 = the fishing pole (I-370).
    (11960003, 40893, 1, 0, 0, 1, 1, 1, 1428.22, -5021.05, 12.841 + @bay_drop, 4.7822, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960004, 40893, 1, 0, 0, 1, 1, 1, 1424.85, -5021.31, 12.914 + @bay_drop, 4.8346, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960005, 40893, 1, 0, 0, 1, 1, 1, 1411.69, -5022.63, 13.170 + @bay_drop, 4.8695, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Shore camp behind the barricades. Donor z 11.42/11.81; ours re-sampled.
    (11960006, 40891, 1, 0, 0, 1, 1, 0, 1415.03, -4914.41,  5.045, 0.7330, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960007, 40891, 1, 0, 0, 1, 1, 0, 1388.80, -4909.51,  8.615, 2.8798, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960008, 40891, 1, 0, 0, 1, 1, 0, 1407.70, -4897.56,  9.676, 3.1590, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Overseer re-sampled after the I-370 terrain raise around the tower (was 7.952).
    (11960009, 40892, 1, 0, 0, 1, 1, 0, 1397.99, -4910.35,  8.126, 2.9671, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Thorak stands in the middle of the tower on its own floor (I-370): Blizzard's
    -- spot put him inside the tower wall. z is the WMO floor at the tower origin with
    -- the tower at z 8.5 (6.91 + the 2.0 lift), 0.66 above our terrain there (8.25).
    -- He faces the main door (local +x, world -12 deg).
    (11960010, 41621, 1, 0, 0, 1, 1, 0, 1375.65, -4912.77,  8.910, 6.0737, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340);

-- -----------------------------------------------------------------------------
-- Poses and gear (I-370) — they stood frozen because F-209 built these templates
-- from scratch and emitted no addon rows at all.
--
-- A guid-keyed creature_addon REPLACES the template's row rather than merging
-- with it (Creature::GetCreatureAddon), so every per-guid row below repeats the
-- template's bytes2.
-- -----------------------------------------------------------------------------
DELETE FROM `creature_template_addon` WHERE `entry` IN (39609, 39610, 40891, 40892, 40893, 41621);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
    -- bytes1/bytes2 exactly as both donors carry them (tdb434 and Neltharion agree).
    (39609, 0, 0, 0,   1, 0, 0, ''),   -- Kor'kron Loyalist
    (39610, 0, 0, 0,   1, 0, 0, ''),   -- Battleworg
    (40891, 0, 0, 8, 257, 0, 0, ''),   -- Dranosh'ar Laborer: stand state 8, as donor
    (40892, 0, 0, 0, 257, 0, 0, ''),   -- Dranosh'ar Overseer
    (40893, 0, 0, 0,   1, 0, 0, ''),   -- Dranosh'ar Fisherman
    (41621, 0, 0, 0,   1, 0, 0, '');   -- Commander Thorak

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 11960001 AND 11960010;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
    -- Fishermen: our own choice, not the donor's. tdb434 gives Blizzard's three
    -- dock spawns (310638/39/40) no addon row at all, so in retail they just
    -- stand there. They are called fishermen and they stand on a dock, so they
    -- get EMOTE_STATE_FISHING (379) and a fishing pole.
    (11960003, 0, 0, 0, 1, 379, 0, ''),
    (11960004, 0, 0, 0, 1, 379, 0, ''),
    (11960005, 0, 0, 0, 1, 379, 0, ''),
    -- Laborers: the donor's own pose for these exact spawns. tdb434 guids
    -- 310678 (1415.0,-4914.4), 310680 (1388.8,-4909.5) and 310682 (1407.7,-4897.6)
    -- are our 11960006/7/8 position for position, and all three carry
    -- emote 69 = EMOTE_STATE_USE_STANDING with bytes1 back to 0.
    (11960006, 0, 0, 0, 257, 69, 0, ''),
    (11960007, 0, 0, 0, 257, 69, 0, ''),
    (11960008, 0, 0, 0, 257, 69, 0, '');
    -- No row for the Overseer (11960009) or Thorak (11960010): they take the
    -- template row above. The donor Overseer (310679) has no addon row either.

-- The fishing pole. Item 6256 is already equipped this way by creature 29325.
DELETE FROM `creature_equip_template` WHERE `CreatureID` = 40893;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES
    (40893, 1, 6256, 0, 0, 12340);

-- The Overseer is a statue in the donor data too (no addon row, MovementType 0).
-- He is the one NPC here whose job is to be seen supervising, so he gets an
-- idle gesture loop. This is ours, not Blizzard's.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 40892 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
    `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`,
    `target_type`, `comment`) VALUES
    -- SMART_EVENT_UPDATE_OOC every 12-24s -> SMART_ACTION_RANDOM_EMOTE
    -- (25 point, 1 talk, 5 exclamation) on self.
    (40892, 0, 0, 0, 1, 0, 100, 0, 12000, 24000, 12000, 24000, 10, 25, 1, 5, 1, 'Dranosh''ar Overseer - OOC - Random supervising gesture');
