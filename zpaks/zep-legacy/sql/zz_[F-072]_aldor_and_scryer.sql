-- F-072 Peacekeeping Diplomacy: Allow both Aldor and Scryer factions
-- Remove mutual exclusivity on allegiance quests (both can be completed)
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` IN (10551, 10552);

-- Remove negative rep spillover to opposing faction, keep Sha'tar (935) bonus
UPDATE `reputation_spillover_template` SET `faction1`=935, `rate_1`=0.5, `rank_1`=4, `faction2`=0, `rate_2`=0, `rank_2`=0 WHERE `faction` IN (932, 934);
