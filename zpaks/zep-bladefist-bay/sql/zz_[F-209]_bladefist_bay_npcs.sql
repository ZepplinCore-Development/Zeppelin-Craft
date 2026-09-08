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
DELETE FROM `creature` WHERE `guid` BETWEEN 11960001 AND 11960010;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 11960001 AND 11960010;

INSERT INTO `creature`
    (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`,
     `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
     `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`,
     `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
    -- On the dock, at the head of the gangplank. Donor z kept: the dock is now there.
    (11960001, 39609, 1, 0, 0, 1, 1, 0, 1463.83, -5010.76, 11.916, 6.0388, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960002, 39610, 1, 0, 0, 1, 1, 0, 1464.80, -5014.64, 11.901, 0.4363, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Fishermen along the dock rail.
    (11960003, 40893, 1, 0, 0, 1, 1, 0, 1428.22, -5021.05, 12.841, 4.7822, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960004, 40893, 1, 0, 0, 1, 1, 0, 1424.85, -5021.31, 12.914, 4.8346, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960005, 40893, 1, 0, 0, 1, 1, 0, 1411.69, -5022.63, 13.170, 4.8695, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    -- Shore camp behind the barricades. Donor z 11.42/11.81; ours re-sampled.
    (11960006, 40891, 1, 0, 0, 1, 1, 0, 1415.03, -4914.41,  5.045, 0.7330, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960007, 40891, 1, 0, 0, 1, 1, 0, 1388.80, -4909.51,  8.615, 2.8798, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960008, 40891, 1, 0, 0, 1, 1, 0, 1407.70, -4897.56,  9.676, 3.1590, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960009, 40892, 1, 0, 0, 1, 1, 0, 1397.99, -4910.35,  7.952, 2.9671, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),
    (11960010, 41621, 1, 0, 0, 1, 1, 0, 1373.84, -4917.97,  7.829, 1.2741, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340);
