-- Verdan the Everliving --

-- Verdan the Everliving - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441188);
INSERT INTO `pool_quest` 
SET `entry` = 441188,
    `pool_entry` = 300006, -- Update for new daily
    `description` = 'Verdan the Everliving';

-- Verdan the Everliving - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441188);
INSERT INTO `quest_template` 
SET `ID` = 441188,
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900265, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Everliving Spore', 
    `LogDescription` = 'Retrieve the Everliving Spore from Verdan the Everliving in Wailing Caverns.', 
    `QuestDescription` = 'Howdy, brave one! Word''s out that them Horde Zugs, led by Zuglord Runthak, are schemin'' to snatch an Everliving Spore from Verdan the Everliving down in the Wailing Caverns. Can ya believe it? They''re talkin'' ''bout stealin'' it to use as some elemental battle pet! Now that''s downright disrespectful, ain''t it? We gotta get that spore first and keep it as a tiny mascot. We can teach it tricks and have it cheer us on in battle! Saddle up, face Verdan, and bring back that Everliving Spore. Oh, and afore ya head out, we swiped an orb from them lazy book-readin'' mages over in the tower – it''ll teleport ya straight to the caverns. We''ll make sure you''re well rewarded. Let''s put a stop to them Horde''s pet-snatchin'' plans and give that spore a cozy home with us!', 
    `RequiredItemId1` = 900225, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441188);
INSERT INTO `quest_template_addon` 
SET `ID` = 441188,
    `MaxLevel` = 25, -- Update for new daily
    `SpecialFlags` = 1;

-- Verdan the Everliving - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441188);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441188,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441188);
INSERT INTO `quest_request_items` 
SET `ID` = 441188,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Everliving Spore please.',
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441188);
INSERT INTO `creature_queststarter` 
SET`quest` = 441188,
    `id` = 29093;
    
-- Verdan the Everliving - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441188);
INSERT INTO `creature_questender` 
SET `quest` = 441188, 
    `id` = 29093;