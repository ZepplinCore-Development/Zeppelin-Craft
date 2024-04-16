-- Bloodmage Thalnos --

-- Bloodmage Thalnos - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441192);
INSERT INTO `pool_quest` 
SET `entry` = 441192,
    `pool_entry` = 300007, -- Update for new daily
    `description` = 'Bloodmage Thalnos';

-- Bloodmage Thalnos - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441192);
INSERT INTO `quest_template` 
SET `ID` = 441192,
    `QuestType` = 2, 
    `QuestLevel` = 34, -- Update for new daily
    `MinLevel` = 26, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900259, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Bloodfire Amulet', 
    `LogDescription` = 'Retrieve the Bloodfire Amulet from Bloodmage Thalnos in Scarlet Monastery Graveyard.', 
    `QuestDescription` = 'Howdy, adventurer! I''ve got a crucial task for ya that''ll test your mettle and bravery. Deep within the Scarlet Monastery Graveyard lies the Bloodfire Amulet, guarded fiercely by Bloodmage Thalnos. Now, why''s this amulet so dang important, ya ask? Well, Zuglord Runthak, has got his eyes set on it. He''s plannin'' to use that amulet to unleash a blight on Westfall! Just picture it: with Westfall''s crops destroyed, Stormwind will be facing a famine. It''s a disaster in the makin''! We can''t let that happen, no sirree! So saddle up, venture into the Scarlet Monastery Graveyard, and recover that Bloodfire Amulet from Bloodmage Thalnos. Oh, and don''t forget to use this orb – it''ll teleport ya straight to the graveyard. Let''s put a stop to them Horde''s wicked plans and keep the farms of Westfall blight free.', 
    `RequiredItemId1` = 900229, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441192);
INSERT INTO `quest_template_addon` 
SET `ID` = 441192,
    `MaxLevel` = 35, -- Update for new daily
    `SpecialFlags` = 1;

-- Bloodmage Thalnos - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441192);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441192,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441192);
INSERT INTO `quest_request_items` 
SET `ID` = 441192,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Bloodfire Amulet please.',
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441192);
INSERT INTO `creature_queststarter` 
SET`quest` = 441192,
    `id` = 29093;
    
-- Bloodmage Thalnos - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441192);
INSERT INTO `creature_questender` 
SET `quest` = 441192, 
    `id` = 29093;