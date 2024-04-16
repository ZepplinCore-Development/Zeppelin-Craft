-- Charlga Razorflank --

-- Charlga Razorflank - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441159);
INSERT INTO `pool_quest` 
SET `entry` = 441159,
    `pool_entry` = 300001, -- Update for new daily
    `description` = 'Charlga Razorflank';

-- Charlga Razorflank - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441159);
INSERT INTO `quest_template` 
SET `ID` = 441159, 
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
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Gauntlets of Growth', 
    `LogDescription` = 'Retrieve the Gauntlets of Growth from the Charlga Razorflank in Razorfen Kraul.', 
    `QuestDescription` = 'Esteemed adventurer, a crucial mission beckons within the heart of Razorfen Kraul. Your task is to recover the Gauntlets of Growth from Charlga Razorflank, a formidable foe lurking amidst the thorns. These gauntlets bestow upon the wearer the powers of plant growth, a boon that could revolutionize agriculture in Durotar and feed the Horde. Your success will not only secure a powerful artifact but also pave the way for prosperity. Use the enchanted orb provided—it shall transport you swiftly to the depths of Razorfen Kraul from any corner of Azeroth. Go forth with resolve, and may your efforts yield bountiful harvests for our people.', 
    `QuestCompletionLog` = 'Return the Gauntlets of Growth to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900223, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441159);
INSERT INTO `quest_template_addon` 
SET `ID` =  441159,
    `MaxLevel` =  35,
    `SpecialFlags` = 1;

-- Charlga Razorflank - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441159);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441159,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Charlga Razorflank proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441159);
INSERT INTO `quest_request_items` 
SET `ID` = 441159,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Gauntlets of Growth please.',
    `VerifiedBuild` = 12340;

-- Charlga Razorflank - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441159);
INSERT INTO `creature_queststarter` 
SET `quest` = 441159,
    `id` = 14392;

-- Charlga Razorflank - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441159);
INSERT INTO `creature_questender` 
SET `quest` = 441159, 
    `id` = 14392;