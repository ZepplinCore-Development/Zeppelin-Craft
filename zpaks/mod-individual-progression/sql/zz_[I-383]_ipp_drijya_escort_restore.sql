-- [I-383] Drijya (20281) - quest 10310 "Sabotage the Warp-Gate!" escort.
-- mod-individual-progression zone_netherstorm.sql rewrites this escort: it deletes the
-- stock `waypoints` path 20281, moves her onto waypoint_data path 720420 and replaces
-- her source_type 0 + source_type 9 (2028100-2028104) SmartAI. Upstream 2026_10_15_06
-- (pulled in by the 2026-10-18 core sync) re-inserted the STOCK source_type 0 rows only,
-- leaving a mixed script: stock event 2 "Start WP 20281" (path IPP deleted ->
-- "Action 53 uses non-existent WaypointPath id 20281") alongside IPP's script9s.
-- Restore IPP's source_type 0 rows verbatim so the escort matches its own script9s,
-- path 720420 and creature_text (groups 0-8, all IPP's, unchanged by upstream).
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20281;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`,
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(20281, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Set Flag'),
(20281, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Set NPC Flag'),
(20281, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 235, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Stop WP'),
(20281, 0, 3, 0, 19, 0, 100, 0, 10310, 0, 0, 0, 0, 0, 80, 2028100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Run Script 2028100'),
(20281, 0, 4, 0, 108, 0, 100, 0, 4, 720420, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk'),
(20281, 0, 5, 0, 108, 0, 100, 0, 6, 720420, 0, 0, 0, 0, 80, 2028101, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script 2028101'),
(20281, 0, 6, 0, 108, 0, 100, 0, 12, 720420, 0, 0, 0, 0, 80, 2028102, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script 2028102'),
(20281, 0, 7, 0, 108, 0, 100, 0, 19, 720420, 0, 0, 0, 0, 80, 2028103, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script 2028103'),
(20281, 0, 8, 0, 108, 0, 100, 0, 20, 720420, 0, 0, 0, 0, 80, 2028104, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script 2028104'),
(20281, 0, 9, 0, 108, 0, 100, 0, 21, 720420, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 20296, 100, 0, 0, 0, 0, 0, 0, 'On WP Reached - Set Data'),
(20281, 0, 10, 11, 108, 0, 100, 0, 26, 720420, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk'),
(20281, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 15, 10310, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Quest Credit'),
(20281, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Despawn After 5 Seconds'),
(20281, 0, 13, 0, 2, 0, 100, 0, 0, 75, 10000, 10000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Between 0-75% Health - Talk'),
(20281, 0, 14, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'On Aggro - Remove Emote State');
