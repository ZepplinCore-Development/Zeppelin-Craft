-- ============================================================
-- Waypoint Z-Coordinate Updates for Pao'ka Swiftmountain Entry 10427
-- Fix for Project OpenAzeroth terrain height changes
-- Preserves original X/Y coordinates, updates only Z values
-- ============================================================

UPDATE `script_waypoint` SET `location_z` = 44.75 WHERE `entry` = 10427 AND `pointid` = 1;
UPDATE `script_waypoint` SET `location_z` = 49.82 WHERE `entry` = 10427 AND `pointid` = 5;
UPDATE `script_waypoint` SET `location_z` = -10.07 WHERE `entry` = 10427 AND `pointid` = 18;
UPDATE `script_waypoint` SET `location_z` = -24.37 WHERE `entry` = 10427 AND `pointid` = 19;
UPDATE `script_waypoint` SET `location_z` = -33.47 WHERE `entry` = 10427 AND `pointid` = 20;
UPDATE `script_waypoint` SET `location_z` = -53.01 WHERE `entry` = 10427 AND `pointid` = 24;
UPDATE `script_waypoint` SET `location_z` = 4.21 WHERE `entry` = 10427 AND `pointid` = 10;
UPDATE `script_waypoint` SET `location_z` = 0.89 WHERE `entry` = 10427 AND `pointid` = 11;
UPDATE `script_waypoint` SET `location_z` = 0.99 WHERE `entry` = 10427 AND `pointid` = 12;
UPDATE `script_waypoint` SET `location_z` = 0.34 WHERE `entry` = 10427 AND `pointid` = 13;
UPDATE `script_waypoint` SET `location_z` = -0.40 WHERE `entry` = 10427 AND `pointid` = 14;
UPDATE `script_waypoint` SET `location_z` = -0.62 WHERE `entry` = 10427 AND `pointid` = 15;
UPDATE `script_waypoint` SET `location_z` = -1.55 WHERE `entry` = 10427 AND `pointid` = 16;

-- ============================================================
-- Creature Spawn Z-Coordinate Fixes for Wyverns IDs 4107, 4109, 4110
-- Fix for Project OpenAzeroth terrain height changes
-- ============================================================

UPDATE `creature` SET `position_z` = 42.371780 WHERE `guid` = 21127; -- ID 4107, adjustment: -7.42y
UPDATE `creature` SET `position_z` = 1.357602 WHERE `guid` = 21129; -- ID 4107, adjustment: +6.65y
UPDATE `creature` SET `position_z` = 1.207779 WHERE `guid` = 21131; -- ID 4107, adjustment: +6.03y
UPDATE `creature` SET `position_z` = -0.619190 WHERE `guid` = 21132; -- ID 4107, adjustment: +4.36y
UPDATE `creature` SET `position_z` = 42.806018 WHERE `guid` = 21133; -- ID 4107, adjustment: -5.54y
UPDATE `creature` SET `position_z` = -1.000450 WHERE `guid` = 21135; -- ID 4107, adjustment: +4.49y
UPDATE `creature` SET `position_z` = -0.793962 WHERE `guid` = 21136; -- ID 4107, adjustment: +4.09y
UPDATE `creature` SET `position_z` = -0.443362 WHERE `guid` = 21137; -- ID 4107, adjustment: +5.39y
UPDATE `creature` SET `position_z` = 0.466658 WHERE `guid` = 21138; -- ID 4107, adjustment: +5.35y
UPDATE `creature` SET `position_z` = 7.862337 WHERE `guid` = 21139; -- ID 4107, adjustment: +13.37y
UPDATE `creature` SET `position_z` = 1.645123 WHERE `guid` = 21140; -- ID 4107, adjustment: +6.81y
UPDATE `creature` SET `position_z` = -0.348309 WHERE `guid` = 21141; -- ID 4107, adjustment: +4.93y
UPDATE `creature` SET `position_z` = -0.402215 WHERE `guid` = 21142; -- ID 4107, adjustment: +5.33y
UPDATE `creature` SET `position_z` = -0.373770 WHERE `guid` = 21143; -- ID 4107, adjustment: +5.41y
UPDATE `creature` SET `position_z` = -0.233897 WHERE `guid` = 21147; -- ID 4109, adjustment: +5.46y
UPDATE `creature` SET `position_z` = -11.127491 WHERE `guid` = 21149; -- ID 4109, adjustment: -5.66y
UPDATE `creature` SET `position_z` = 0.076062 WHERE `guid` = 21150; -- ID 4109, adjustment: +5.51y
UPDATE `creature` SET `position_z` = 0.739410 WHERE `guid` = 21151; -- ID 4109, adjustment: +5.70y
UPDATE `creature` SET `position_z` = -0.754499 WHERE `guid` = 21153; -- ID 4110, adjustment: +4.37y
UPDATE `creature` SET `position_z` = -0.428943 WHERE `guid` = 21154; -- ID 4110, adjustment: +5.26y
UPDATE `creature` SET `position_z` = 1.704789 WHERE `guid` = 21128; -- ID 4107, adjustment: -0.84y
UPDATE `creature` SET `position_z` = 44.290489 WHERE `guid` = 21130; -- ID 4107, adjustment: -1.22y
UPDATE `creature` SET `position_z` = 45.645166 WHERE `guid` = 21134; -- ID 4107, adjustment: -2.12y
UPDATE `creature` SET `position_z` = 44.691765 WHERE `guid` = 21148; -- ID 4109, adjustment: -2.50y

-- ============================================================
-- Gameobject Navmesh Fixes — Highperch wyvern area (mining nodes, eggs, shells)
-- Generated via F-170 navmesh (mmap_query) snap, scoped to wyvern bbox.
-- OFF_MESH spawns only; X/Y/Z snapped to nearest flat walkable point +0.5z.
-- ============================================================

-- Gold Vein (guid 215922, entry 1734) — moved 4.8 yds
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 215922;
-- Gold Vein (guid 215973, entry 1734) — moved 6.4 yds
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 215973;
-- Gold Vein (guid 215985, entry 1734) — moved 4.5 yds
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 215985;
-- Gold Vein (guid 215987, entry 1734) — moved 4.9 yds
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 215987;
-- Gold Vein (guid 215992, entry 1734) — moved 8.6 yds
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 215992;
-- Gold Vein (guid 216110, entry 1734) — moved 4.7 yds
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216110;
-- Gold Vein (guid 216111, entry 1734) — moved 6.3 yds
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216111;
-- Gold Vein (guid 216116, entry 1734) — moved 5.7 yds
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216116;
-- Highperch Wyvern Egg (guid 16667, entry 175384) — moved 4.7 yds
UPDATE `gameobject` SET `position_x` = -4979.819800, `position_y` = -922.367000, `position_z` = 0.103700 WHERE `guid` = 16667;
-- Highperch Wyvern Egg (guid 16668, entry 175384) — moved 6.5 yds
UPDATE `gameobject` SET `position_x` = -4941.669900, `position_y` = -932.740000, `position_z` = 1.299100 WHERE `guid` = 16668;
-- Highperch Wyvern Egg (guid 16669, entry 175384) — moved 5.7 yds
UPDATE `gameobject` SET `position_x` = -4940.000000, `position_y` = -953.809000, `position_z` = 0.709900 WHERE `guid` = 16669;
-- Highperch Wyvern Egg (guid 16671, entry 175384) — moved 7.7 yds
UPDATE `gameobject` SET `position_x` = -5062.779800, `position_y` = -981.333300, `position_z` = 1.579000 WHERE `guid` = 16671;
-- Iron Deposit (guid 215834, entry 1735) — moved 4.8 yds
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 215834;
-- Iron Deposit (guid 215885, entry 1735) — moved 6.4 yds
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 215885;
-- Iron Deposit (guid 215897, entry 1735) — moved 4.5 yds
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 215897;
-- Iron Deposit (guid 215899, entry 1735) — moved 4.9 yds
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 215899;
-- Iron Deposit (guid 215904, entry 1735) — moved 8.6 yds
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 215904;
-- Mithril Deposit (guid 216099, entry 2040) — moved 4.7 yds
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216099;
-- Mithril Deposit (guid 216100, entry 2040) — moved 6.3 yds
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216100;
-- Mithril Deposit (guid 216105, entry 2040) — moved 5.7 yds
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216105;
-- Silver Vein (guid 216010, entry 1733) — moved 4.8 yds
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 216010;
-- Silver Vein (guid 216061, entry 1733) — moved 6.4 yds
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 216061;
-- Silver Vein (guid 216073, entry 1733) — moved 4.5 yds
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 216073;
-- Silver Vein (guid 216075, entry 1733) — moved 4.9 yds
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 216075;
-- Silver Vein (guid 216080, entry 1733) — moved 8.6 yds
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 216080;
-- Sunscorched Shell (guid 16674, entry 89635) — moved 6.0 yds
UPDATE `gameobject` SET `position_x` = -5056.000000, `position_y` = -1023.999900, `position_z` = 3.445600 WHERE `guid` = 16674;
-- Sunscorched Shell (guid 16710, entry 89635) — moved 6.3 yds
UPDATE `gameobject` SET `position_x` = -5056.000000, `position_y` = -952.189000, `position_z` = 1.702800 WHERE `guid` = 16710;
-- Sunscorched Shell (guid 16712, entry 89635) — moved 4.8 yds
UPDATE `gameobject` SET `position_x` = -5156.669900, `position_y` = -908.675000, `position_z` = -0.011800 WHERE `guid` = 16712;
-- Sunscorched Shell (guid 16714, entry 89635) — moved 6.0 yds
UPDATE `gameobject` SET `position_x` = -4928.000000, `position_y` = -907.382000, `position_z` = -0.077700 WHERE `guid` = 16714;
-- Truesilver Deposit (guid 216121, entry 2047) — moved 4.7 yds
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216121;
-- Truesilver Deposit (guid 216122, entry 2047) — moved 6.3 yds
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216122;
-- Truesilver Deposit (guid 216127, entry 2047) — moved 5.7 yds
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216127;

-- ------------------------------------------------------------
-- MANUAL TODO — F-170 found no navmesh within range (over gap / under geometry),
-- so these 3 need in-game hand placement. In-game GM workflow per object:
--   1. .go xyz <x> <y> <z> 1      → teleport to its current spawn
--   2. stand where it should rest on the new OA terrain
--   3. .gobject move <guid>        → relocates the object to your feet
--   4. read back coords with: SELECT position_x,position_y,position_z FROM gameobject WHERE guid=<guid>;
--      then add an UPDATE here so the placement is idempotent (DB row is live but untracked otherwise).
--
--   Highperch Wyvern Egg  guid 16670 — .go xyz -5026.4 -969.5 -5.5 1
--   Sunscorched Shell     guid 16705 — .go xyz -5109.5 -1044.2 -5.7 1
--   Solid Chest           guid 16719 — .go xyz -5105.4 -1046.8 -5.6 1
-- ------------------------------------------------------------
