-- Archmage Arugal --

-- Archmage Arugal - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441158);
INSERT INTO `pool_quest` 
SET `entry` = 441158,
    `pool_entry` = 300000, -- Update for new daily
    `description` = 'Archmage Arugal';

-- Archmage Arugal - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441158);
INSERT INTO `quest_template` 
SET `ID` = 441158, 
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900268, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Fangfire Amulet', 
    `LogDescription` = 'Retrieve the Fangfire Amulet from the Archmage Arugal in Deadmines.', 
    `QuestDescription` = 'Adventurer, a vital mission awaits you within the ominous halls of Shadowfang Keep. Your objective: to secure the Fangfire Amulet from the clutches of Archmage Arugal. This legendary artifact grants unparalleled mastery over wolf-like creatures, enabling the bearer to communicate with and command not only wolves but also other lupine beings such as worgs. With the Fangfire Amulet in our possession, the Horde can forge stronger bonds with these primal allies, creating a formidable wolf pack that defends and assists the denizens of Kalimdor. Waste no time, for the enchanted orb provided shall whisk you away to Shadowfang Keep from any corner of Azeroth. Forge ahead, brave soul, and let the howls of victory echo through the land!"', 
    `QuestCompletionLog` = 'Return the Fangfire Amulet to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900222, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441158);
INSERT INTO `quest_template_addon` 
SET `ID` =  441158,
    `MaxLevel` =  25,
    `SpecialFlags` = 1;

-- Archmage Arugal - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441158);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441158,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Archmage Arugal proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441158);
INSERT INTO `quest_request_items` 
SET `ID` = 441158,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Fangfire Amulet please.',
    `VerifiedBuild` = 12340;

-- Archmage Arugal - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441158);
INSERT INTO `creature_queststarter` 
SET `quest` = 441158,
    `id` = 14392;

-- Archmage Arugal - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441158);
INSERT INTO `creature_questender` 
SET `quest` = 441158, 
    `id` = 14392;