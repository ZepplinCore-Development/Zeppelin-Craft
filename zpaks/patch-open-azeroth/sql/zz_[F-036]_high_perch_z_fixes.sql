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
