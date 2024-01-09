-- Chief Ukorz Sandscalp --

-- Chief Ukorz Sandscalp - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441167);
INSERT INTO `pool_quest` 
SET `entry` = 441167,
    `pool_entry` = 300003, -- Update for new daily
    `description` = 'Chief Ukorz Sandscalp';

-- Chief Ukorz Sandscalp - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441167);
INSERT INTO `quest_template` 
SET `ID` = 441167,
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
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Sandfury War Drum',
    `LogDescription` = 'Retrieve the Sandfury War Drum from Chief Ukorz Sandscalp in Zul''Farrak.',
    `QuestDescription` = 'The call to greatness echoes through the sands of Zul''Farrak as Chief Ukorz Sandscalp beats the formidable Sandfury War Drum. Your mission is clear: recover this potent artifact and showcase your strength in the heart of Zul''Farrak. The Horde seeks champions who can face the challenges that lie ahead and emerge victorious. Confront Chief Ukorz Sandscalp, seize the Sandfury War Drum, and prove that you are a force to be reckoned with. Are you ready to drum up success for the Horde?',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Sandfury War Drum to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900231, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441167);
INSERT INTO `quest_template_addon` 
SET `ID` = 441167,
    `MaxLevel` = 50, -- Update for new daily
    `SpecialFlags` = 1;

-- Chief Ukorz Sandscalp - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441167);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441167,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Chief Ukorz Sandscalp proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441167);
INSERT INTO `quest_request_items` 
SET `ID` = 441167,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Sandfury War Drum please.',
    `VerifiedBuild` = 12340;

-- Chief Ukorz Sandscalp - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441167);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441167;

-- Chief Ukorz Sandscalp - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441167);
INSERT INTO `creature_questender` 
SET `id` = 14392, 
    `quest` = 441167;
