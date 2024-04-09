-- Jergosh the Invoker --

-- Jergosh the Invoker - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441162);
INSERT INTO `pool_quest` 
SET `entry` = 441162,
    `pool_entry` = 300000, -- Update for new daily
    `description` = 'Jergosh the Invoker';

-- Jergosh the Invoker - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441162);
INSERT INTO `quest_template` 
SET `ID` = 441162, 
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900266, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Searing Stone', 
    `LogDescription` = 'Retrieve the Searing Stone from the Jergosh the Invoker in Ragefire Chasm.', 
    `QuestDescription` = 'Mighty adventurer, a crucial task awaits you in the depths of Ragefire Chasm. Confront Jergosh the Invoker and claim the Searing Stone from his grasp. This stone possesses the fiery essence needed to aid our zeppelin''s journey to Borean Tundra, where the freezing winds of Northrend threaten to ground us. Our goblin engineers struggle to keep the air hot enough for the zeppelin to stay airborne. Your mission is clear: defeat Jergosh, retrieve the Searing Stone, and ensure our zeppelin''s success in reaching its destination. As you embark on this quest, remember to utilize the enchanted orb provided. It will transport you swiftly to Ragefire Chasm from anywhere in Azeroth. May your valor light the fires of triumph, champion of the Horde!', 
    `QuestCompletionLog` = 'Return the Searing Stone to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900226, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441162);
INSERT INTO `quest_template_addon` 
SET `ID` =  441162,
    `MaxLevel` =  25,
    `SpecialFlags` = 1;

-- Jergosh the Invoker - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441162);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441162,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Jergosh the Invoker proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441162);
INSERT INTO `quest_request_items` 
SET `ID` = 441162,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Searing Stone please.',
    `VerifiedBuild` = 12340;

-- Jergosh the Invoker - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441162);
INSERT INTO `creature_queststarter` 
SET `quest` = 441162,
    `id` = 14392;

-- Jergosh the Invoker - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441162);
INSERT INTO `creature_questender` 
SET `quest` = 441162, 
    `id` = 14392;