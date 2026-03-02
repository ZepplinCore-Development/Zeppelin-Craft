-- [F-059] Sunken Temple Lower achievement_criteria_data
-- Fix: kill Atal'alarion criteria not triggering because achievement_criteria_data entries were missing
-- AC requires an achievement_criteria_data row for KILL_CREATURE criteria to work

-- Normal: type 0 = NONE (no additional difficulty check needed)
-- Heroic: type 12 = MAP_DIFFICULTY, value1=1
-- Mythic: type 12 = MAP_DIFFICULTY, value1=2

REPLACE INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(13623, 0, 0, 0, ''),   -- Sunken Temple Lower (Normal)
(13624, 12, 1, 0, ''),  -- Sunken Temple Lower (Heroic)
(13625, 12, 2, 0, '');  -- Sunken Temple Lower (Mythic)
