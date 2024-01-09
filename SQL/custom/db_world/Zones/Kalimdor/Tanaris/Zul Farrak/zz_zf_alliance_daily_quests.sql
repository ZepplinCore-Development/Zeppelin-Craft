-- Chief Ukorz Sandscalp --

-- Chief Ukorz Sandscalp - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441194);
INSERT INTO `pool_quest` 
SET `entry` = 441194,
    `pool_entry` = 300009, -- Update for new daily
    `description` = 'Chief Ukorz Sandscalp';

-- Chief Ukorz Sandscalp - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441194);
INSERT INTO `quest_template` 
SET `ID` = 441194,
    `QuestType` = 2,
    `QuestLevel` = 48, -- Update for new daily
    `MinLevel` = 46, -- Update for new daily
    `QuestSortID` = 978, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `StartItem` = 900263, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Sandfury War Drum',
    `LogDescription` = 'Retrieve the Sandfury War Drum from Chief Ukorz Sandscalp in Zul''Farrak.',
    `QuestDescription` = 'Howdy there, partner! Heard tell that them Horde Zugs, led by Zuglord Runthak, 
    are fixin'' to grab the Sandfury War Drum from Chief Ukorz Sandscalp. They reckon on usin'' its powerful beat 
    to rile up their Zugs and start the 4th war against the Alliance. We can''t let that chaos loose! 
    Ride on over, face Chief Ukorz Sandscalp, and fetch that war drum. 
    There''s a mighty fine reward for ya. Let''s put a halt to them Horde notions and keep the peace.',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Sandfury War Drum to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900231, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900263 WHERE (`ID` = 441194);

-- Chief Ukorz Sandscalp - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441194);

-- Chief Ukorz Sandscalp - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441194);
INSERT INTO `quest_template_addon` 
SET `ID` = 441194,
    `MaxLevel` = 50, -- Update for new daily
    `SpecialFlags` = 1;

-- Chief Ukorz Sandscalp - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441194);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441194,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441194);
INSERT INTO `quest_request_items` 
SET `ID` = 441194,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Sandfury War Drum please.',
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441194);
INSERT INTO `creature_queststarter` 
SET `quest` = 441194,
    `id` = 12480;
    
-- Chief Ukorz Sandscalp - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441194);
INSERT INTO `creature_questender` 
SET `quest` = 441194, 
    `id` = 12480;
