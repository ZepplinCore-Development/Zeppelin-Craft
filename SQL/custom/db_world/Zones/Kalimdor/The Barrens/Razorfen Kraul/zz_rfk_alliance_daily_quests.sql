-- Charlga Razorflank --

-- Charlga Razorflank - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441186);
INSERT INTO `pool_quest` 
SET `entry` = 441186,
    `pool_entry` = 300007, -- Update for new daily
    `description` = 'Charlga Razorflank';

-- Charlga Razorflank - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441186);
INSERT INTO `quest_template` 
SET `ID` = 441186,
    `QuestType` = 2, 
    `QuestLevel` = 33, -- Update for new daily
    `MinLevel` = 26, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900272, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Gauntlets of Growth', 
    `LogDescription` = 'Retrieve the Gauntlets of Growth from Charlga Razorflank in Razorfen Kraul.', 
    `QuestDescription` = 'Howdy there, adventurer! Got a mighty task for ya that''ll test your mettle and grit. Deep within the heart of Razorfen Kraul lies Charlga Razorflank, a fearsome foe indeed. Your mission? Retrieve the Gauntlets of Growth from her clutches. Now, why are these gauntlets so darn important, ya ask? Well, they bestow the wearer with the powers of plant growth. But here''s the kicker – Zuglord Runthak, has got his eye on ''em. If we don''t get a hold of those gauntlets first, he''ll be springin'' bramble vines up all over Azeroth, causin'' chaos and mayhem wherever they go! We can''t let that happen, no sirree! So saddle up, venture into the heart of Razorfen Kraul, and retrieve those Gauntlets of Growth from Charlga Razorflank. Oh, and don''t forget to use this orb – it''ll teleport ya straight to the entrance of the Kraul. Let''s put a stop to them Horde''s wild plans and keep Azeroth bramble-free!', 
    `RequiredItemId1` = 900223, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441186);
INSERT INTO `quest_template_addon` 
SET `ID` = 441186,
    `MaxLevel` = 35, -- Update for new daily
    `SpecialFlags` = 1;

-- Charlga Razorflank - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441186);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441186,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441186);
INSERT INTO `quest_request_items` 
SET `ID` = 441186,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Gauntlets of Growth please.',
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441186);
INSERT INTO `creature_queststarter` 
SET`quest` = 441186,
    `id` = 29093;
    
-- Charlga Razorflank - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441186);
INSERT INTO `creature_questender` 
SET `quest` = 441186, 
    `id` = 29093;