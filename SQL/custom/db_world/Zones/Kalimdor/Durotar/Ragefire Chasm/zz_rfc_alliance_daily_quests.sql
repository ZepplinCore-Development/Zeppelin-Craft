-- Jergosh the Invoker --

-- Jergosh the Invoker - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441189);
INSERT INTO `pool_quest` 
SET `entry` = 441189,
    `pool_entry` = 300006, -- Update for new daily
    `description` = 'Jergosh the Invoker';

-- Jergosh the Invoker - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441189);
INSERT INTO `quest_template` 
SET `ID` = 441189,
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 1517, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900266, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Searing Stone', 
    `LogDescription` = 'Retrieve the Searing Stone from Jergosh the Invoker in Ragefire Chasm.', 
    `QuestDescription` = 'Howdy, brave one! Heard that them Horde Zugs, led by Zuglord Runthak, are schemin'' to snatch the Searing Stone from Jergosh the Invoker down in Ragefire Chasm. Can ya believe it? They''re talkin'' ''bout openin'' a sauna in Orgrimmar for some ancient Pandaren medicine! They reckon it''ll restore their warriors'' chakras and make ''em fight with renewed vigor. We can''t let that happen! Saddle up, face Jergosh, and bring back the Searing Stone. Oh, and afore ya head out, we swiped an orb from them lazy book-readin'' mages over in the tower – it''ll teleport ya straight to the chasm. We''ll make sure you''re well rewarded. Let''s put a stop to them Horde''s sauna plans and keep the Searing Stone safe!', 
    `RequiredItemId1` = 900226, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441189);
INSERT INTO `quest_template_addon` 
SET `ID` = 441189,
    `MaxLevel` = 25, -- Update for new daily
    `SpecialFlags` = 1;

-- Jergosh the Invoker - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441189);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441189,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441189);
INSERT INTO `quest_request_items` 
SET `ID` = 441189,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Searing Stone please.',
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441189);
INSERT INTO `creature_queststarter` 
SET`quest` = 441189,
    `id` = 29093;
    
-- Jergosh the Invoker - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441189);
INSERT INTO `creature_questender` 
SET `quest` = 441189, 
    `id` = 29093;