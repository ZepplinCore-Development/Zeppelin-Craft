-- Amnennar the Coldbringer --

-- Amnennar the Coldbringer - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441187);
INSERT INTO `pool_quest` 
SET `entry` = 441187,
    `pool_entry` = 300008, -- Update for new daily
    `description` = 'Amnennar the Coldbringer';

-- Amnennar the Coldbringer - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441187);
INSERT INTO `quest_template` 
SET `ID` = 441187,
    `QuestType` = 2, 
    `QuestLevel` = 41, -- Update for new daily
    `MinLevel` = 36, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900273, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Frozen Bone', 
    `LogDescription` = 'Retrieve the Frozen Bone from Amnennar the Coldbringer in Razorfen Downs.', 
    `QuestDescription` = 'Howdy, adventurer! Got a new mission that''s as cold as a Frostwolf''s breath. We need ya to head to Razorfen Downs and recover a Frozen Bone from Amnennar the Coldbringer. Our spies have been busy and spotted large groups of Core Hounds training with Hunters in the Valley of Strength. We suspect they''re preparin'' for an assault on the Frozen Throne! Now, Zuglord Runthak has some wild ideas. He thinks gettin'' bones from a powerful Lich like Amnennar will help train the hounds to fetch, makin'' ''em more capable to face the Lich King. Can ya believe it? We can''t let them Horde''s schemes come to fruition. So saddle up, head to Razorfen Downs, and recover that Frozen Bone. Oh, and don''t forget to use this orb – it''ll teleport ya straight to the entrance. Let''s put a stop to that ludicrous zug plan', 
    `RequiredItemId1` = 900224, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441187);
INSERT INTO `quest_template_addon` 
SET `ID` = 441187,
    `MaxLevel` = 45, -- Update for new daily
    `SpecialFlags` = 1;

-- Amnennar the Coldbringer - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441187);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441187,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441187);
INSERT INTO `quest_request_items` 
SET `ID` = 441187,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Frozen Bone please.',
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441187);
INSERT INTO `creature_queststarter` 
SET`quest` = 441187,
    `id` = 29093;
    
-- Amnennar the Coldbringer - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441187);
INSERT INTO `creature_questender` 
SET `quest` = 441187, 
    `id` = 29093;