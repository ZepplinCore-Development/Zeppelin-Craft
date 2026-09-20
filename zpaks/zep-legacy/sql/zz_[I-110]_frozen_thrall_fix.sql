-- I-110  Thrall, Warchief (creature_template 4949) - Grommash Hold, Orgrimmar
--
-- History
--   1) A weird bug was causing Thrall to be frozen. Deleting and reinserting the
--      creature entry fixed it (HD Creature model swap fallout).
--   2) He no longer sits on the throne. He now stands at the front of the throne
--      dais facing down the hall, so his gossip / quest RP emotes are actually
--      visible (a seated stand state swallows one-shot emotes).
--
-- Placement was derived from geometry, not guessed:
--   Grommash Hold floor  = OGRIMMAR.WMO group 123, flat z 43.144 from
--                          y -4123.0 through y -4130.5 (one tier).
--   Throne               = doodad THRALLS_THRONE.MDX, world (1919.79, -4122.92),
--                          footprint y -4119.81 .. -4125.63, seat top z ~44.38.
--   Standing spot        = x 1919.80 (throne centre line), y -4126.80
--                          (1.17 yd clear of the front step), z 43.15 (floor).
--   Orientation 4.77722  = unchanged; matches the throne doodad yaw (273.5 deg).

DELETE FROM `creature` WHERE `id` = 4949;
INSERT INTO `creature` SET
    `guid` = 3110629,
    `id` = 4949,
    `map` = 1,
    `equipment_id` = 1,
    `position_x` = 1919.80,
    `position_y` = -4126.80,
    `position_z` = 43.15,
    `orientation` = 4.77722,
    `spawntimesecs` = 300,
    `curhealth` = 1857300,
    `curmana` = 39300,
    `VerifiedBuild` = NULL,
    `Comment` = NULL;

-- creature addon
-- bytes1 = 0 (UNIT_STAND_STATE_STAND). Was 1 (SIT), which parked him in the
-- throne and suppressed every one-shot emote sent to him.
DELETE FROM `creature_addon` WHERE `guid` IN (4770, 3110629);
INSERT INTO `creature_addon` SET
    `guid` = 3110629,
    `bytes1` = 0,
    `emote` = 0,
    `auras` = NULL;
