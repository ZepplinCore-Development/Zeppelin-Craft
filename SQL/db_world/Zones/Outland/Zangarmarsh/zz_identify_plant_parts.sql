-- Allow players to complete Identify Plant Parts quest at any reputation rank with Cenerion Expedition (942).
-- Original setting for RequiredMaxRepValue was 8999 locking the quest to friendly / honored
UPDATE `quest_template_addon` SET `RequiredMaxRepFaction` = 0, `RequiredMaxRepValue` = 0 WHERE (`ID` = 9784);