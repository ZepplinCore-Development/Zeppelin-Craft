-- =============================================================================
-- Fix WotLK Darkmoon Deck quests missing QuestSortID
-- Stock AC has QuestSortID=0 for these 4 decks, but TBC decks correctly use
-- -364 (Darkmoon Faire). Without it, the quest log shows a missing header.
-- =============================================================================
UPDATE `quest_template` SET `QuestSortID` = -364
    WHERE `ID` IN (12517, 12518, 12798, 13311) AND `QuestSortID` = 0;
