-- =====================================================================
-- F-182 Broll Bearmantle quest-giver spawn (Argent Tournament Grounds)
-- Broll (32376) already has npcflag=2 and an existing event spawn at the
-- Ruins of Lordaeron (Battle for the Undercity, guid 3109766) -- that one
-- is LEFT UNTOUCHED. This adds a reachable spawn at the Argent Tournament
-- Grounds in Icecrown so players can pick up "The Cursed Runeblade".
-- Fixed guid (custom 3110xxx block) for idempotency.
-- =====================================================================

SET @BROLL      := 32376;
SET @BROLL_GUID := 3110700;

DELETE FROM `creature` WHERE `guid` = @BROLL_GUID;
INSERT INTO `creature` SET
    `guid`           = @BROLL_GUID,
    `id`            = @BROLL,
    `map`            = 571,        -- Icecrown
    `zoneId`         = 0,
    `areaId`         = 0,
    `spawnMask`      = 1,
    `phaseMask`      = 1,
    `position_x`     = 8465.0,
    `position_y`     = 1080.0,
    `position_z`     = 554.6,
    `orientation`    = 4.97,
    `spawntimesecs`  = 300,
    `MovementType`   = 0,
    `VerifiedBuild`  = 0;
