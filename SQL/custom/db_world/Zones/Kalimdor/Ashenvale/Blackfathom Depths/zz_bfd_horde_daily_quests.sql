-- Aku'mai --

-- Aku'mai - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441164);
INSERT INTO `pool_quest` 
SET `entry` = 441164,
    `pool_entry` = 300001, -- Update for new daily
    `description` = 'Aku''mai';

-- Aku'mai - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441164);
INSERT INTO `quest_template` 
SET `ID` = 441164, 
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
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Void Pearl', 
    `LogDescription` = 'Retrieve the Void Pearl from the Aku''mai in Blackfathom Depths.', 
    `QuestDescription` = 'Valiant adventurer, a crucial mission awaits you in the dark depths of Blackfathom Depths. Your task is to retrieve the Void Pearl from the clutches of Aku''mai, the ancient horror that lurks within. The Blood Elves have sought our aid in recovering this pearl, as they wish to extract the void energy within and cleanse it. Once a relic used in worship of Elune, this pearl holds great significance to the night elves. By returning the cleansed pearl to them, we show our goodwill. Prepare yourself, for the enchanted orb provided will transport you to Blackfathom Depths from any location in Azeroth. Go forth with courage, and may your actions pave the way for harmony among Kalimdor.', 
    `QuestCompletionLog` = 'Return the Void Pearl to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900228, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Aku'mai - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441164);
INSERT INTO `quest_template_addon` 
SET `ID` =  441164,
    `MaxLevel` =  35,
    `SpecialFlags` = 1;

-- Aku'mai - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441164);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441164,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Aku''mai proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Aku'mai - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441164);
INSERT INTO `quest_request_items` 
SET `ID` = 441164,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Void Pearl please.',
    `VerifiedBuild` = 12340;

-- Aku'mai - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441164);
INSERT INTO `creature_queststarter` 
SET `quest` = 441164,
    `id` = 14392;

-- Aku'mai - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441164);
INSERT INTO `creature_questender` 
SET `quest` = 441164, 
    `id` = 14392;