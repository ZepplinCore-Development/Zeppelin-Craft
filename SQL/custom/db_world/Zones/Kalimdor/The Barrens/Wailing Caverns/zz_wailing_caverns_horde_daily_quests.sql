-- Verdan the Everliving --

-- Verdan the Everliving - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441161);
INSERT INTO `pool_quest` 
SET `entry` = 441161,
    `pool_entry` = 300000, -- Update for new daily
    `description` = 'Verdan the Everliving';

-- Verdan the Everliving - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441161);
INSERT INTO `quest_template` 
SET `ID` = 441161, 
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 718, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900265, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Everliving Spore', 
    `LogDescription` = 'Retrieve the Everliving Spore from the Verdan the Everliving in Wailing Caverns.', 
    `QuestDescription` = 'Brave adventurer, a daunting challenge awaits you within the depths of the Wailing Caverns. Your mission is to vanquish Verdan the Everliving and secure an Everliving Spore from his domain. This spore, tainted by the corruption of the Emerald Nightmare, holds the potential for renewal. The shamans of the Horde seek to cleanse it of corruption and nurture it into a new guardian for the Wailing Caverns, free from darkness. Enter the caverns, confront Verdan, and claim the Everliving Spore. With the enchanted orb provided, you can swiftly teleport to the Wailing Caverns from anywhere in Azeroth. May your bravery pave the way for a new era of protection and purity in those ancient caves', 
    `QuestCompletionLog` = 'Return the Everliving Spore to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900225, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441161);
INSERT INTO `quest_template_addon` 
SET `ID` =  441161,
    `MaxLevel` =  25,
    `SpecialFlags` = 1;

-- Verdan the Everliving - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441161);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441161,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Verdan the Everliving proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441161);
INSERT INTO `quest_request_items` 
SET `ID` = 441161,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Everliving Spore please.',
    `VerifiedBuild` = 12340;

-- Verdan the Everliving - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441161);
INSERT INTO `creature_queststarter` 
SET `quest` = 441161,
    `id` = 14392;

-- Verdan the Everliving - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441161);
INSERT INTO `creature_questender` 
SET `quest` = 441161, 
    `id` = 14392;