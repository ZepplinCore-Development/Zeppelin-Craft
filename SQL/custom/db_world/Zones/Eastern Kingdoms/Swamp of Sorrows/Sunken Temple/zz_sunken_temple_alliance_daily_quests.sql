-- Shade of Eranikus --

-- Shade of Eranikus - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441196);
INSERT INTO `pool_quest` 
SET `entry` = 441196,
    `pool_entry` = 300010, -- Update for new daily
    `description` = 'Shade of Eranikus';

-- Shade of Eranikus - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441196);
INSERT INTO `quest_template` 
SET `ID` = 441196,
    `QuestType` = 2,
    `QuestLevel` = 55, -- Update for new daily
    `MinLevel` = 51, -- Update for new daily
    `QuestSortID` = 1417, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `StartItem` = 900264, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Dream Seed',
    `LogDescription` = 'Retrieve the Dream Seed from Shade of Eranikus in Temple of Atal''Hakkar.',
    `QuestDescription` = 'Howdy there, brave one! Heard tell that them Horde Zugs, led by Zuglord Runthak, are schemin'' to snatch the Dream Seed from the Shade of Eranikus in the Temple of Atal''Hakkar. And get this they''re thinkin'' ''bout startin'' a garden! Can''t let that happen! Head on down, confront the Shade of Eranikus, and bring back that Dream Seed. There''s a reward waitin'' for ya. Let''s stomp out them Horde''s gardening dreams and keep the Dream Seed safe!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Dream Seed to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900232, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441196);
INSERT INTO `quest_template_addon` 
SET `ID` = 441196,
    `MaxLevel` = 58, -- Update for new daily
    `ExclusiveGroup` = 441196,
    `SpecialFlags` = 1;

-- Shade of Eranikus - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441196);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441196,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441196);
INSERT INTO `quest_request_items` 
SET `ID` = 441196,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Dream Seed please.',
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441196);
INSERT INTO `creature_queststarter` 
SET `id` = 29093,
    `quest` = 441196;

-- Shade of Eranikus - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441196);
INSERT INTO `creature_questender` 
SET `id` = 29093,
    `quest` = 441196;
