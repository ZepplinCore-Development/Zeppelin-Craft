-- I-418 Torek's Assault (quest 6544): the three Splintertree Raiders all followed
-- Torek at distance 0 / angle 0 and walked stacked on one point.
-- The follow moves from the shared entry script to one row pair per spawn, each
-- with its own place in a wedge behind Torek. DONT_OVERRIDE_ENTRY_SAI (0x08000000)
-- loads the guid rows alongside the entry script instead of replacing it.
-- FOLLOW angle param above 6 is degrees, relative to Torek's facing (180 = behind).
-- SmartAI re-follows with the same dist/angle on evade, so the wedge survives fights.
--
-- Both templates spawn at faction 67, which is hostile to 113, and switch to 113 only in their
-- "On Respawn - Set Faction 113" row. Since I-338 that event fires on the first Update tick, so
-- a freshly respawned raider spends one tick at 67 beside a Torek at 113 and attacks him. The
-- combat outlives the faction change, and Torek's WP1 pause never resumes (SmartAI::UpdatePath
-- requires out of combat). Spawn them at 113 to begin with.
UPDATE creature_template SET faction = 113 WHERE entry = 12858;
UPDATE creature_template SET faction = 113, flags_extra = flags_extra | 0x08000000 WHERE entry = 12859;

-- entry script: drop the stacked follow rows (id 3 linked to 4)
UPDATE smart_scripts SET link = 0 WHERE entryorguid = 12859 AND source_type = 0 AND id = 3;

DELETE FROM smart_scripts WHERE entryorguid = 12859 AND source_type = 0 AND id IN (4, 5);

DELETE FROM smart_scripts WHERE entryorguid IN (-32378, -32379, -32380) AND source_type = 0;

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32378,
    `event_type` = 38,
    `event_flags` = 512,
    `event_param1` = 1,
    `event_param2` = 1,
    `action_type` = 29,
    `action_param1` = 3,
    `action_param2` = 135,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Data Set 1 1 - Follow Torek (3 yd, back left)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32378,
    `id` = 1,
    `event_type` = 7,
    `event_flags` = 512,
    `action_type` = 29,
    `action_param1` = 3,
    `action_param2` = 135,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Evade - Follow Torek (3 yd, back left)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32379,
    `event_type` = 38,
    `event_flags` = 512,
    `event_param1` = 1,
    `event_param2` = 1,
    `action_type` = 29,
    `action_param1` = 4,
    `action_param2` = 180,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Data Set 1 1 - Follow Torek (4 yd, behind)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32379,
    `id` = 1,
    `event_type` = 7,
    `event_flags` = 512,
    `action_type` = 29,
    `action_param1` = 4,
    `action_param2` = 180,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Evade - Follow Torek (4 yd, behind)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32380,
    `event_type` = 38,
    `event_flags` = 512,
    `event_param1` = 1,
    `event_param2` = 1,
    `action_type` = 29,
    `action_param1` = 3,
    `action_param2` = 225,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Data Set 1 1 - Follow Torek (3 yd, back right)';

INSERT INTO `smart_scripts` SET
    `entryorguid` = -32380,
    `id` = 1,
    `event_type` = 7,
    `event_flags` = 512,
    `action_type` = 29,
    `action_param1` = 3,
    `action_param2` = 225,
    `target_type` = 19,
    `target_param1` = 12858,
    `comment` = 'Splintertree Raider - On Evade - Follow Torek (3 yd, back right)';

