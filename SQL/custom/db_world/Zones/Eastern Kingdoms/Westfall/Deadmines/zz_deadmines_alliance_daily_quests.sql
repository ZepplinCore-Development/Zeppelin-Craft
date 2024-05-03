-- Cookie --

-- Cookie - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441212);
INSERT INTO `pool_quest` 
SET `entry` = 441212,
    `pool_entry` = 300006, -- Update for new daily
    `description` = 'Cookie';

-- Cookie - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441212);
INSERT INTO `quest_template` 
SET `ID` = 441212,
    `QuestType` = 2, 
    `QuestLevel` = 21, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 1581, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900267, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Stabby Patty Recipe', 
    `LogDescription` = 'Retrieve the Stabby Patty Recipe from Cookie in Deadmines.', 
    `QuestDescription` = 'Howdy there, ya pineapple dweller! Gather ''round and listen close. There''s a tale ''bout a mighty burger called the Stabby Patty, renowned in the Kelp''thar Forest of Vashj''ir. They say it blesses soldiers with the agility of a squirrel, the resilience of a sponge, the smarts of a starfish, and the beauty of a squid, makin'' ''em unstoppable on both land and sea! But here''s the kicker – only Cookie knows how to whip up this magical treat outside of Vashj''ir. Don''t just sit there like plankton, get movin'' to the Deadmines. We can''t let them Horde zugs snatch that recipe first. Go fetch that Stabby Patty Recipe before it slips through our fingers! Oh, and afore ya head out, we swiped an orb from them lazy book-readin'' mages over in the tower – it''ll teleport ya straight to the Deadmines.' , 
    `RequiredItemId1` = 900246, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Cookie - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441212);
INSERT INTO `quest_template_addon` 
SET `ID` = 441212,
    `MaxLevel` = 25, -- Update for new daily
    `SpecialFlags` = 1;

-- Cookie - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441212);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441212,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Cookie - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441212);
INSERT INTO `quest_request_items` 
SET `ID` = 441212,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Stabby Patty Recipe please.',
    `VerifiedBuild` = 12340;

-- Cookie - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441212);
INSERT INTO `creature_queststarter` 
SET`quest` = 441212,
    `id` = 29093;
    
-- Cookie - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441212);
INSERT INTO `creature_questender` 
SET `quest` = 441212, 
    `id` = 29093;