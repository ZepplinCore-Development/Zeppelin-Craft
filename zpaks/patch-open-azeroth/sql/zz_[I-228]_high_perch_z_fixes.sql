-- ============================================================
-- I-228 Highperch Wyvern Area Z fixes (OpenAzeroth terrain raise)
-- v3: .map heightmap == client GroundZ (verified). X/Y preserved, Z re-fitted.
--   gameobjects (nodes/eggs/shells/chest): heightmap + 0.1
--   3 reported clipping creatures: heightmap + model-scaled lift (origin above feet)
--   21 hand-placed creatures + waypoints: unchanged
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

-- Creatures — hand-placed spawns kept:
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
-- reported clipping creatures (heightmap + scaled lift):
-- Highperch Wyvern (guid 21132) — ground -0.64 + 1.3 -> 0.66
UPDATE `creature` SET `position_z` = 0.663382 WHERE `guid` = 21132;
-- Highperch Consort (guid 21149) — ground -0.52 + 1.2 -> 0.68
UPDATE `creature` SET `position_z` = 0.680700 WHERE `guid` = 21149;
-- Highperch Patriarch (guid 21154) — ground -0.66 + 1.5 -> 0.84
UPDATE `creature` SET `position_z` = 0.844589 WHERE `guid` = 21154;

-- Gameobjects — nodes/eggs/shells/chest at heightmap + 0.1 (X/Y kept):
-- Gold Vein (guid 215922) — was 2.65, ground 1.91 -> 2.01
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 215922;
-- Gold Vein (guid 215973) — was 47.50, ground 46.53 -> 46.63
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 215973;
-- Gold Vein (guid 215985) — was 1.17, ground -1.03 -> -0.93
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 215985;
-- Gold Vein (guid 215987) — was -39.90, ground -40.98 -> -40.88
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 215987;
-- Gold Vein (guid 215992) — was 0.75, ground -0.25 -> -0.15
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 215992;
-- Gold Vein (guid 216110) — was 1.05, ground 0.35 -> 0.45
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216110;
-- Gold Vein (guid 216111) — was 2.95, ground 2.21 -> 2.31
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216111;
-- Gold Vein (guid 216116) — was 2.20, ground 1.54 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216116;
-- Highperch Wyvern Egg (guid 16664) — was 46.92, ground 46.62 -> 46.72
UPDATE `gameobject` SET `position_z` = 46.724050 WHERE `guid` = 16664;
-- Highperch Wyvern Egg (guid 16665) — was 48.67, ground 48.37 -> 48.47
UPDATE `gameobject` SET `position_z` = 48.467698 WHERE `guid` = 16665;
-- Highperch Wyvern Egg (guid 16666) — was 49.64, ground 49.34 -> 49.44
UPDATE `gameobject` SET `position_z` = 49.437719 WHERE `guid` = 16666;
-- Highperch Wyvern Egg (guid 16667) — was -0.40, ground -0.70 -> -0.60
UPDATE `gameobject` SET `position_z` = -0.601174 WHERE `guid` = 16667;
-- Highperch Wyvern Egg (guid 16668) — was 0.54, ground 0.24 -> 0.34
UPDATE `gameobject` SET `position_z` = 0.335730 WHERE `guid` = 16668;
-- Highperch Wyvern Egg (guid 16669) — was 0.13, ground -0.17 -> -0.07
UPDATE `gameobject` SET `position_z` = -0.065151 WHERE `guid` = 16669;
-- Highperch Wyvern Egg (guid 16670) — was 0.16, ground -0.14 -> -0.04
UPDATE `gameobject` SET `position_z` = -0.038408 WHERE `guid` = 16670;
-- Highperch Wyvern Egg (guid 16671) — was 1.33, ground 1.03 -> 1.13
UPDATE `gameobject` SET `position_z` = 1.133609 WHERE `guid` = 16671;
-- Highperch Wyvern Egg (guid 16672) — was 2.27, ground 1.97 -> 2.07
UPDATE `gameobject` SET `position_z` = 2.069565 WHERE `guid` = 16672;
-- Iron Deposit (guid 215834) — was 2.65, ground 1.91 -> 2.01
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 215834;
-- Iron Deposit (guid 215885) — was 47.50, ground 46.53 -> 46.63
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 215885;
-- Iron Deposit (guid 215897) — was 1.17, ground -1.03 -> -0.93
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 215897;
-- Iron Deposit (guid 215899) — was -39.90, ground -40.98 -> -40.88
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 215899;
-- Iron Deposit (guid 215904) — was 0.75, ground -0.25 -> -0.15
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 215904;
-- Mithril Deposit (guid 216099) — was 1.05, ground 0.35 -> 0.45
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216099;
-- Mithril Deposit (guid 216100) — was 2.95, ground 2.21 -> 2.31
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216100;
-- Mithril Deposit (guid 216105) — was 2.20, ground 1.54 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216105;
-- Silver Vein (guid 216010) — was 2.65, ground 1.91 -> 2.01
UPDATE `gameobject` SET `position_z` = 2.008631 WHERE `guid` = 216010;
-- Silver Vein (guid 216061) — was 47.50, ground 46.53 -> 46.63
UPDATE `gameobject` SET `position_z` = 46.625861 WHERE `guid` = 216061;
-- Silver Vein (guid 216073) — was 1.17, ground -1.03 -> -0.93
UPDATE `gameobject` SET `position_z` = -0.926570 WHERE `guid` = 216073;
-- Silver Vein (guid 216075) — was -39.90, ground -40.98 -> -40.88
UPDATE `gameobject` SET `position_z` = -40.878355 WHERE `guid` = 216075;
-- Silver Vein (guid 216080) — was 0.75, ground -0.25 -> -0.15
UPDATE `gameobject` SET `position_z` = -0.150485 WHERE `guid` = 216080;
-- Solid Chest (guid 16719) — was 1.35, ground 1.05 -> 1.15
UPDATE `gameobject` SET `position_z` = 1.148886 WHERE `guid` = 16719;
-- Sunscorched Shell (guid 16673) — was -0.03, ground -0.33 -> -0.23
UPDATE `gameobject` SET `position_z` = -0.233550 WHERE `guid` = 16673;
-- Sunscorched Shell (guid 16674) — was 2.93, ground 2.63 -> 2.73
UPDATE `gameobject` SET `position_z` = 2.731547 WHERE `guid` = 16674;
-- Sunscorched Shell (guid 16705) — was 1.70, ground 1.40 -> 1.50
UPDATE `gameobject` SET `position_z` = 1.495009 WHERE `guid` = 16705;
-- Sunscorched Shell (guid 16710) — was 1.12, ground 0.82 -> 0.92
UPDATE `gameobject` SET `position_z` = 0.919632 WHERE `guid` = 16710;
-- Sunscorched Shell (guid 16711) — was 47.35, ground 47.05 -> 47.15
UPDATE `gameobject` SET `position_z` = 47.151304 WHERE `guid` = 16711;
-- Sunscorched Shell (guid 16712) — was -1.04, ground -1.34 -> -1.24
UPDATE `gameobject` SET `position_z` = -1.243814 WHERE `guid` = 16712;
-- Sunscorched Shell (guid 16714) — was -0.72, ground -1.02 -> -0.92
UPDATE `gameobject` SET `position_z` = -0.921961 WHERE `guid` = 16714;
-- Truesilver Deposit (guid 216121) — was 1.05, ground 0.35 -> 0.45
UPDATE `gameobject` SET `position_z` = 0.448861 WHERE `guid` = 216121;
-- Truesilver Deposit (guid 216122) — was 2.95, ground 2.21 -> 2.31
UPDATE `gameobject` SET `position_z` = 2.306210 WHERE `guid` = 216122;
-- Truesilver Deposit (guid 216127) — was 2.20, ground 1.54 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643095 WHERE `guid` = 216127;

