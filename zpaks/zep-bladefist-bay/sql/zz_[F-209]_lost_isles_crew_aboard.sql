-- =============================================================================
-- F-209  The Lost Isles crew, aboard the ship at Bladefist Bay
--
-- Justin's call: goblins who finish the Lost Isles arrive on a ship that stays
-- moored in Durotar, with the crew they sailed with still aboard.
--
-- These are COPIES. The Lost Isles spawns (phaseMask 1024, around
-- 1855/-10338) are untouched, because every new goblin still needs them. The
-- copies stand on the ship placed by `adt_placements.json`, at phaseMask 1 so
-- everyone sees them.
--
-- Positions are not guesses. The ship's four group files were parsed, upward
-- facing triangles collected, and the two deck planes found at model-local
-- z 0-2 and z 6-8. Those transform to world z 10.8-12.8 and 17.3-18.4 through
-- the placement (yaw = MODF rot.y - 180), and the transform was checked against
-- the bounding box Blizzard stored in the MODF entry. World z 11.8 is also
-- exactly where retail's own teleport put the player, which is the independent
-- confirmation that the main deck is where this says it is.
--
-- Deck assignment: the command group - Gallywix, Thrall and the orc delegation,
-- plus Gallywix's Warrior-Matic - stand on the upper deck. The other 30 are
-- spread over the main deck, no two closer than 2.7 yards, each facing the
-- middle of the crowd.
--
-- **The questgiver bit is stripped from every copy.** Their templates are
-- shared with the Lost Isles originals, so a copy would otherwise offer Lost
-- Isles quests from a Durotar dock. `ObjectMgr::ChooseCreatureFlags` lets a
-- non-zero `creature.npcflag` replace the template value, so each spawn carries
-- its own flags minus UNIT_NPC_FLAG_QUESTGIVER. Gossip, trainer and vendor
-- flags are kept - that is the point of bringing them.
--
-- Guids 11961001-11961037, hand-assigned; the F-011 generator never emits
-- 119xxxxx (reference_creature_guid_autoincrement_trap).
-- =============================================================================

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 11961001 AND 11961037;
DELETE FROM `creature` WHERE `guid` BETWEEN 11961001 AND 11961037;

INSERT INTO `creature`
    (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`,
     `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
     `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`,
     `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
    (11961001, 39065, 1, 0, 0, 1, 1, 1, 1483.976, -4994.315, 17.887, 0.1313, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Aggra (copy of guid 11002931)
    (11961002, 39147, 1, 0, 0, 1, 1, 0, 1485.94, -4979.177, 17.964, 4.8014, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Bastia (copy of guid 11002984)
    (11961003, 39066, 1, 0, 0, 1, 1, 1, 1495.244, -5002.892, 17.864, 2.2964, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Kilag Gorefang (copy of guid 11002932)
    (11961004, 39067, 1, 0, 0, 1, 1, 1, 1495.959, -4989.121, 18.36, 3.6421, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Scout Brax (copy of guid 11002936)
    (11961005, 38935, 1, 0, 0, 1, 1, 0, 1483.324, -5005.256, 17.265, 1.2383, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Thrall (copy of guid 11002845)
    (11961006, 39615, 1, 0, 0, 1, 1, 0, 1480.557, -4985.73, 17.965, 5.4, 300, 0, 0, 1, 0, 0, 0, 134250496, 0, 12340),  -- Trade Prince Gallywix (copy of guid 11003230)
    (11961007, 38518, 1, 0, 0, 1, 1, 0, 1478.136, -4999.284, 17.603, 0.5349, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Warrior-Matic NX-01 (copy of guid 11002160)
    (11961008, 38441, 1, 0, 0, 1, 1, 0, 1500.697, -5003.223, 12.255, 3.5865, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Ace (copy of guid 11002126)
    (11961009, 38124, 1, 0, 0, 1, 1, 1, 1485.321, -5025.646, 11.011, 1.2967, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Assistant Greely (copy of guid 11001911)
    (11961010, 38122, 1, 0, 0, 1, 1, 0, 1484.742, -4984.476, 12.68, 4.9393, 300, 0, 0, 1, 0, 0, 49, 0, 0, 12340),  -- Bamm Megabomb (copy of guid 11001906)
    (11961011, 38381, 1, 0, 0, 1, 1, 0, 1480.329, -5002.517, 12.097, 5.7605, 300, 0, 0, 1, 0, 0, 641, 0, 0, 12340),  -- Brett "Coins" McQuid (copy of guid 11002043)
    (11961012, 39063, 1, 0, 0, 1, 1, 1, 1493.962, -5014.926, 11.412, 2.0793, 300, 0, 0, 1, 0, 0, 4225, 0, 0, 12340),  -- Chawg (copy of guid 11002914)
    (11961013, 38738, 1, 0, 0, 1, 1, 1, 1480.624, -5014.468, 11.889, 0.5773, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Coach Crosscheck (copy of guid 11002319)
    (11961014, 36615, 1, 0, 0, 1, 1, 0, 1496.459, -5025.404, 10.777, 1.9188, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Doc Zapnozzle (copy of guid 11001665)
    (11961015, 38513, 1, 0, 0, 1, 1, 1, 1490.487, -5001.663, 12.187, 4.6721, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Evol Fingers (copy of guid 11002139)
    (11961016, 38514, 1, 0, 0, 1, 1, 1, 1495.923, -4996.902, 12.229, 4.2457, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Fizz Lighter (copy of guid 11002140)
    (11961017, 36471, 1, 0, 0, 1, 1, 1, 1488.072, -5008.17, 11.796, 6.2615, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Foreman Dampwick (copy of guid 11001584)
    (11961018, 36600, 1, 0, 0, 1, 1, 1, 1497.754, -5009.35, 12.02, 2.9922, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Geargrinder Gizmo (copy of guid 11001660)
    (11961019, 38746, 1, 0, 0, 1, 1, 0, 1487.074, -5015.955, 11.412, 1.1844, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Gobber (copy of guid 11002386)
    (11961020, 38409, 1, 0, 0, 1, 1, 1, 1495.868, -5020.069, 11.157, 2.0153, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002094)
    (11961021, 38409, 1, 0, 0, 1, 1, 1, 1488.483, -5021.133, 11.095, 1.4369, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002095)
    (11961022, 38409, 1, 0, 0, 1, 1, 1, 1484.952, -5000.129, 12.305, 5.2899, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002096)
    (11961023, 38409, 1, 0, 0, 1, 1, 1, 1484.444, -5011.799, 11.78, 0.5548, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002097)
    (11961024, 38409, 1, 0, 0, 1, 1, 1, 1487.679, -4987.601, 12.808, 4.8352, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002098)
    (11961025, 38409, 1, 0, 0, 1, 1, 1, 1484.969, -5005.417, 12.097, 5.7935, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Goblin Survivor (copy of guid 11002099)
    (11961026, 38510, 1, 0, 0, 1, 1, 1, 1481.437, -4998.099, 12.274, 5.4274, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Grimy Greasefingers (copy of guid 11002129)
    (11961027, 38120, 1, 0, 0, 1, 1, 1, 1494.179, -5001.275, 12.059, 4.1944, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Hobart Grapplehammer (copy of guid 11001905)
    (11961028, 38647, 1, 0, 0, 1, 1, 0, 1494.12, -5011.228, 11.768, 2.4839, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Izzy (copy of guid 11002313)
    (11961029, 38745, 1, 0, 0, 1, 1, 1, 1490.832, -5005.259, 11.911, 4.5092, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Kezan Citizen (copy of guid 11002322)
    (11961030, 38745, 1, 0, 0, 1, 1, 1, 1487.754, -5003.121, 11.987, 5.1636, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Kezan Citizen (copy of guid 11002323)
    (11961031, 45286, 1, 0, 0, 1, 1, 0, 1494.294, -5023.225, 10.77, 1.8357, 300, 0, 0, 1, 0, 0, 4305, 0, 0, 12340),  -- KTC Train-a-Tron Deluxe (copy of guid 11003581)
    (11961032, 38515, 1, 0, 0, 1, 1, 0, 1499.661, -5011.623, 11.889, 2.7953, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Maxx Avalanche (copy of guid 11002149)
    (11961033, 38432, 1, 0, 0, 1, 1, 0, 1492.72, -4998.716, 12.319, 4.4554, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Megs Dreadshredder (copy of guid 11002119)
    (11961034, 38511, 1, 0, 0, 1, 1, 1, 1489.184, -5023.989, 10.77, 1.505, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Sally "Salvager" Sandscrew (copy of guid 11002130)
    (11961035, 383870, 1, 0, 0, 1, 1, 0, 1483.674, -5002.886, 12.048, 5.5999, 300, 0, 0, 1, 0, 0, 1, 0, 0, 12340),  -- Sassy Hardwrench (copy of guid 11003625)
    (11961036, 38516, 1, 0, 0, 1, 1, 1, 1502.951, -5004.825, 12.321, 3.4021, 300, 0, 0, 1, 0, 0, 0, 0, 0, 12340),  -- Sister Goldskimmer (copy of guid 11002150)
    (11961037, 38517, 1, 0, 0, 1, 1, 0, 1488.04, -5013.416, 11.574, 1.1732, 300, 0, 0, 1, 0, 0, 49, 0, 0, 12340);  -- Slinky Sharpshiv (copy of guid 11002159)

-- Addon rows are guid-keyed and are NOT merged with the template's own row
-- (Creature::GetCreatureAddon returns one or the other), so each copy needs its
-- own. path_id is 0: these stand still, the waypoint paths belong to the isles.
INSERT INTO `creature_addon`
    (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
    (11961007, 0, 0, 0, 285212673, 0, 0, '7165'),  -- Warrior-Matic NX-01
    (11961011, 0, 0, 0, 4097, 10, 0, ''),  -- Brett "Coins" McQuid
    (11961013, 0, 0, 0, 4097, 4, 0, ''),  -- Coach Crosscheck
    (11961015, 0, 0, 0, 1, 0, 0, '74036 13787'),  -- Evol Fingers
    (11961016, 0, 0, 0, 1, 0, 0, '74038 79058'),  -- Fizz Lighter
    (11961018, 0, 0, 1, 0, 0, 0, '68327 49414 49416'),  -- Geargrinder Gizmo
    (11961019, 0, 0, 0, 4097, 10, 0, ''),  -- Gobber
    (11961028, 0, 0, 65536, 4097, 4, 0, ''),  -- Izzy
    (11961031, 0, 0, 0, 285212673, 0, 0, '7165'),  -- KTC Train-a-Tron Deluxe
    (11961032, 0, 0, 0, 1, 0, 0, '12550 78273 79058'),  -- Maxx Avalanche
    (11961033, 0, 0, 65536, 1, 0, 0, '68327'),  -- Megs Dreadshredder
    (11961036, 0, 0, 0, 1, 0, 0, '13864');  -- Sister Goldskimmer
