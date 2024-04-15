-- Aku'mai --

-- Aku'mai - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441191);
INSERT INTO `pool_quest` 
SET `entry` = 441191,
    `pool_entry` = 300007, -- Update for new daily
    `description` = 'Aku''mai';

-- Aku'mai - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441191);
INSERT INTO `quest_template` 
SET `ID` = 441191,
    `QuestType` = 2, 
    `QuestLevel` = 28, -- Update for new daily
    `MinLevel` = 26, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900269, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Void Pearl', 
    `LogDescription` = 'Retrieve the Void Pearl from Aku''mai in Blackfathom Depths.', 
    `QuestDescription` = 'Howdy, partner! There''s a precious treasure known as the Void Pearl, hidden deep within Blackfathom Depths and guarded fiercely by the monstrous Aku''mai. But here''s the twist – Zuglord Runthak, that sneaky Horde rascal, has teamed up with none other than the Mad Goblin Engineer Thrush Clocktron. Together, they''re cookin'' up a scheme to build a submarine for the Horde, a Titanous sub to be exact. This ain''t your ordinary sub though; it''s a magically enhanced sea turtle. Now, here''s where it gets dicey. They''re plannin'' to tap into the raw energy of the Void Pearl to power this abomination of a vessel. Can ya imagine the chaos that''ll unleash? We can''t let that happen, no sirree! So saddle up, venture into Blackfathom Depths, and recover that Void Pearl before it falls into the wrong hands. Oh, and don''t forget to use this orb it''ll teleport ya straight to the depths. Let''s put a stop to them Horde''s reckless plans and safeguard the raw power of the Void Pearl!', 
    `RequiredItemId1` = 900228, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Aku'mai - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441191);
INSERT INTO `quest_template_addon` 
SET `ID` = 441191,
    `MaxLevel` = 35, -- Update for new daily
    `SpecialFlags` = 1;

-- Aku'mai - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441191);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441191,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Aku'mai - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441191);
INSERT INTO `quest_request_items` 
SET `ID` = 441191,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Void Pearl please.',
    `VerifiedBuild` = 12340;

-- Aku'mai - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441191);
INSERT INTO `creature_queststarter` 
SET`quest` = 441191,
    `id` = 29093;
    
-- Aku'mai - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441191);
INSERT INTO `creature_questender` 
SET `quest` = 441191, 
    `id` = 29093;