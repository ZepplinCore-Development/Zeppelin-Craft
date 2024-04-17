-- Amnennar the Coldbringer --

-- Amnennar the Coldbringer - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441160);
INSERT INTO `pool_quest` 
SET `entry` = 441160,
    `pool_entry` = 300002, -- Update for new daily
    `description` = 'Amnennar the Coldbringer';

-- Amnennar the Coldbringer - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441160);
INSERT INTO `quest_template` 
SET `ID` = 441160, 
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
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Frozen Bone', 
    `LogDescription` = 'Retrieve the Frozen Bone from the Amnennar the Coldbringer in Razorfen Downs.', 
    `QuestDescription` = 'Esteemed adventurer, a crucial mission beckons within the heart of Razorfen Downs. Your task is to recover the Frozen Bone from Amnennar the Coldbringer, a formidable foe lurking amidst the thorns. These gauntlets bestow upon the wearer the powers of plant growth, a boon that could revolutionize agriculture in Durotar and feed the Horde. Your success will not only secure a powerful artifact but also pave the way for prosperity. Use the enchanted orb provided—it shall transport you swiftly to the depths of Razorfen Downs from any corner of Azeroth. Go forth with resolve, and may your efforts yield bountiful harvests for our people.', 
    `QuestCompletionLog` = 'Return the Frozen Bone to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900224, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441160);
INSERT INTO `quest_template_addon` 
SET `ID` =  441160,
    `MaxLevel` =  45,
    `SpecialFlags` = 1;

-- Amnennar the Coldbringer - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441160);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441160,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Amnennar the Coldbringer proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441160);
INSERT INTO `quest_request_items` 
SET `ID` = 441160,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Frozen Bone please.',
    `VerifiedBuild` = 12340;

-- Amnennar the Coldbringer - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441160);
INSERT INTO `creature_queststarter` 
SET `quest` = 441160,
    `id` = 14392;

-- Amnennar the Coldbringer - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441160);
INSERT INTO `creature_questender` 
SET `quest` = 441160, 
    `id` = 14392;