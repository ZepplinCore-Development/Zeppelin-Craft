-- ============================================================
-- I-228 Highperch Wyvern Area Z fixes (OpenAzeroth terrain raise)
-- Idempotent UPDATEs on stock rows; X/Y preserved, Z re-fitted.
-- Creatures + props re-derived from .map heightmap (true visual ground):
--   creatures (4107/4109/4110): ground + 0.5 (model origin at feet)
--   props (eggs/shells/chest): ground + 0.3
-- Mining nodes: navmesh-snapped (unchanged). Waypoints: unchanged.
-- ============================================================

-- Waypoints — Pao'ka Swiftmountain (entry 10427)
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

-- Creatures — Highperch Wyverns 4107 / Consorts 4109 / Patriarchs 4110
-- (hand-placed spawns kept; only reported clipping guids re-fitted to heightmap)
UPDATE `creature` SET `position_z` = 42.371780 WHERE `guid` = 21127; -- ID 4107, adjustment: -7.42y
UPDATE `creature` SET `position_z` = 1.357602 WHERE `guid` = 21129; -- ID 4107, adjustment: +6.65y
UPDATE `creature` SET `position_z` = 1.207779 WHERE `guid` = 21131; -- ID 4107, adjustment: +6.03y
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
UPDATE `creature` SET `position_z` = 0.076062 WHERE `guid` = 21150; -- ID 4109, adjustment: +5.51y
UPDATE `creature` SET `position_z` = 0.739410 WHERE `guid` = 21151; -- ID 4109, adjustment: +5.70y
UPDATE `creature` SET `position_z` = -0.754499 WHERE `guid` = 21153; -- ID 4110, adjustment: +4.37y
UPDATE `creature` SET `position_z` = 1.704789 WHERE `guid` = 21128; -- ID 4107, adjustment: -0.84y
UPDATE `creature` SET `position_z` = 44.290489 WHERE `guid` = 21130; -- ID 4107, adjustment: -1.22y
UPDATE `creature` SET `position_z` = 45.645166 WHERE `guid` = 21134; -- ID 4107, adjustment: -2.12y
UPDATE `creature` SET `position_z` = 44.691765 WHERE `guid` = 21148; -- ID 4109, adjustment: -2.50y
-- re-fitted clipping creatures (heightmap ground + lift):
-- Highperch Wyvern (guid 21132) — was -0.62, ground -0.64 -> -0.14
UPDATE `creature` SET `position_z` = -0.136618 WHERE `guid` = 21132;
-- Highperch Consort (guid 21149) — was -11.13, ground -0.52 -> -0.02
UPDATE `creature` SET `position_z` = -0.019300 WHERE `guid` = 21149;
-- Highperch Patriarch (guid 21154) — was -0.43, ground -0.66 -> -0.16
UPDATE `creature` SET `position_z` = -0.155411 WHERE `guid` = 21154;

-- Gameobjects: mining nodes — navmesh-snapped (unchanged)
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 215922;
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 215973;
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 215985;
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 215987;
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 215992;
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216110;
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216111;
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216116;
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 215834;
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 215885;
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 215897;
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 215899;
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 215904;
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216099;
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216100;
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216105;
UPDATE `gameobject` SET `position_x` = -5082.933600, `position_y` = -953.866600, `position_z` = 2.645600 WHERE `guid` = 216010;
UPDATE `gameobject` SET `position_x` = -5148.009800, `position_y` = -1109.333400, `position_z` = 47.500300 WHERE `guid` = 216061;
UPDATE `gameobject` SET `position_x` = -4988.540000, `position_y` = -1004.270000, `position_z` = 1.169600 WHERE `guid` = 216073;
UPDATE `gameobject` SET `position_x` = -4970.667000, `position_y` = -1079.466700, `position_z` = -39.901100 WHERE `guid` = 216075;
UPDATE `gameobject` SET `position_x` = -4936.290000, `position_y` = -960.000000, `position_z` = 0.750000 WHERE `guid` = 216080;
UPDATE `gameobject` SET `position_x` = -5138.890100, `position_y` = -910.054000, `position_z` = 1.045600 WHERE `guid` = 216121;
UPDATE `gameobject` SET `position_x` = -5047.210000, `position_y` = -952.894000, `position_z` = 2.949800 WHERE `guid` = 216122;
UPDATE `gameobject` SET `position_x` = -4909.810100, `position_y` = -920.933000, `position_z` = 2.198700 WHERE `guid` = 216127;

-- Gameobjects: eggs / shells / chest — heightmap-placed
-- Highperch Wyvern Egg (guid 16664) — was 46.63, ground 46.62 -> 46.92
UPDATE `gameobject` SET `position_z` = 46.924050 WHERE `guid` = 16664;
-- Highperch Wyvern Egg (guid 16665) — was 48.37, ground 48.37 -> 48.67
UPDATE `gameobject` SET `position_z` = 48.667698 WHERE `guid` = 16665;
-- Highperch Wyvern Egg (guid 16666) — was 49.34, ground 49.34 -> 49.64
UPDATE `gameobject` SET `position_z` = 49.637719 WHERE `guid` = 16666;
-- Highperch Wyvern Egg (guid 16667) — was 0.10, ground -0.70 -> -0.40
UPDATE `gameobject` SET `position_z` = -0.401174 WHERE `guid` = 16667;
-- Highperch Wyvern Egg (guid 16668) — was 1.30, ground 0.24 -> 0.54
UPDATE `gameobject` SET `position_z` = 0.535730 WHERE `guid` = 16668;
-- Highperch Wyvern Egg (guid 16669) — was 0.71, ground -0.17 -> 0.13
UPDATE `gameobject` SET `position_z` = 0.134849 WHERE `guid` = 16669;
-- Highperch Wyvern Egg (guid 16670) — was -5.53, ground -0.14 -> 0.16
UPDATE `gameobject` SET `position_z` = 0.161592 WHERE `guid` = 16670;
-- Highperch Wyvern Egg (guid 16671) — was 1.58, ground 1.03 -> 1.33
UPDATE `gameobject` SET `position_z` = 1.333609 WHERE `guid` = 16671;
-- Highperch Wyvern Egg (guid 16672) — was -3.27, ground 1.97 -> 2.27
UPDATE `gameobject` SET `position_z` = 2.269565 WHERE `guid` = 16672;
-- Solid Chest (guid 16719) — was -5.58, ground 1.05 -> 1.35
UPDATE `gameobject` SET `position_z` = 1.348886 WHERE `guid` = 16719;
-- Sunscorched Shell (guid 16673) — was -5.95, ground -0.33 -> -0.03
UPDATE `gameobject` SET `position_z` = -0.033550 WHERE `guid` = 16673;
-- Sunscorched Shell (guid 16674) — was 3.45, ground 2.63 -> 2.93
UPDATE `gameobject` SET `position_z` = 2.931547 WHERE `guid` = 16674;
-- Sunscorched Shell (guid 16705) — was -5.68, ground 1.40 -> 1.70
UPDATE `gameobject` SET `position_z` = 1.695009 WHERE `guid` = 16705;
-- Sunscorched Shell (guid 16710) — was 1.70, ground 0.82 -> 1.12
UPDATE `gameobject` SET `position_z` = 1.119632 WHERE `guid` = 16710;
-- Sunscorched Shell (guid 16711) — was 47.05, ground 47.05 -> 47.35
UPDATE `gameobject` SET `position_z` = 47.351304 WHERE `guid` = 16711;
-- Sunscorched Shell (guid 16712) — was -0.01, ground -1.34 -> -1.04
UPDATE `gameobject` SET `position_z` = -1.043814 WHERE `guid` = 16712;
-- Sunscorched Shell (guid 16714) — was -0.08, ground -1.02 -> -0.72
UPDATE `gameobject` SET `position_z` = -0.721961 WHERE `guid` = 16714;

