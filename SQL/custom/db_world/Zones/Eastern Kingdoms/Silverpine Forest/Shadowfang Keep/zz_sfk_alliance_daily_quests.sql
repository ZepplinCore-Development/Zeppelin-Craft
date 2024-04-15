-- Archmage Arugal --

-- Archmage Arugal - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441185);
INSERT INTO `pool_quest` 
SET `entry` = 441185,
    `pool_entry` = 300006, -- Update for new daily
    `description` = 'Archmage Arugal';

-- Archmage Arugal - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441185);
INSERT INTO `quest_template` 
SET `ID` = 441185,
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900268, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Fangfire Amulet', 
    `LogDescription` = 'Retrieve the Fangfire Amulet from Archmage Arugal in Deadmines.', 
    `QuestDescription` = 'Howdy, partner! Listen up and listen good. There''s a troublesome situation brewin'' over at Shadowfang Keep. Zuglord Runthak, that sneaky Horde fella, has his eyes set on snatchin'' the Fangfire Amulet from Archmage Arugal. Now, what''s he plannin'' to do with it? He''s got this ridiculous idea of commandin'' the wolves of Elwynn Forest to create a howlin'' cacophony, just to ruin my precious beauty sleep! Can ya believe the audacity? We can''t let that happen, no sirree! So saddle up, head to Shadowfang Keep, and recover that Fangfire Amulet before it falls into the wrong hands. Oh, and don''t forget to grab an orb from them lazy book-readin'' mages over in the tower – it''ll teleport ya straight to the keep. We''ll make sure you''re well rewarded. Let''s put a stop to them Horde''s petty schemes and ensure a peaceful night''s rest for all!' , 
    `RequiredItemId1` = 900222, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441185);
INSERT INTO `quest_template_addon` 
SET `ID` = 441185,
    `MaxLevel` = 25, -- Update for new daily
    `SpecialFlags` = 1;

-- Archmage Arugal - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441185);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441185,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441185);
INSERT INTO `quest_request_items` 
SET `ID` = 441185,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Fangfire Amulet please.',
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441185);
INSERT INTO `creature_queststarter` 
SET`quest` = 441185,
    `id` = 29093;
    
-- Archmage Arugal - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441185);
INSERT INTO `creature_questender` 
SET `quest` = 441185, 
    `id` = 29093;