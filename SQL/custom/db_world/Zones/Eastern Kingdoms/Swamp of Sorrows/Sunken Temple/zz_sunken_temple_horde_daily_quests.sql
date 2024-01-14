-- Shade of Eranikus --

-- Shade of Eranikus - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441168);
INSERT INTO `pool_quest` 
SET `entry` = 441168,
    `pool_entry` = 300004, -- Update for new daily
    `description` = 'Shade of Eranikus';

-- Shade of Eranikus - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441168);
INSERT INTO `quest_template` 
SET `ID` = 441168,
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
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Dream Seed',
    `LogDescription` = 'Retrieve the Dream Seed from the Shade of Eranikus in the Temple of Atal''Hakkar.',
    `QuestDescription` = 'Rumors have surfaced of a mystical artifact, concealed within the shadows of the Temple of Atal''Hakkar. The Dream Seed, extracted from the heart of the Dreamgrove. It possesses the remarkable ability to breathe life into desolate lands. Guarded by the spectral Shade of Eranikus, this seed signifies Eranikus''s commitment to healing the scars left by Hakkar. Your mission is to recover the Dream Seed from this ethereal guardian. Bring forth the Dream Seed and prove that you are not only a formidable champion but also a bearer of hope for the Horde''s future.',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Dream Seed to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900232, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441168);
INSERT INTO `quest_template_addon` 
SET `ID` = 441168,
    `MaxLevel` = 58, -- Update for new daily
    `ExclusiveGroup` = 441168,
    `SpecialFlags` = 1;

-- Shade of Eranikus - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441168);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441168,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Shade of Eranikus proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441168);
INSERT INTO `quest_request_items` 
SET `ID` = 441168,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Dream Seed please.',
    `VerifiedBuild` = 12340;

-- Shade of Eranikus - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441168);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441168;

-- Shade of Eranikus - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441168);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441168;
