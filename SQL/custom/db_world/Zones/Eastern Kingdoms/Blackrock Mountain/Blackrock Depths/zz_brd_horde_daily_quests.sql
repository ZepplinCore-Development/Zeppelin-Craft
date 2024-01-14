-- Lord Incendius ---

-- Lord Incendius - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441169);
INSERT INTO `pool_quest` 
SET `entry` = 441169,
    `pool_entry` = 300004, -- Update for new daily
    `description` = 'Lord Incendius';

-- Lord Incendius - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441169);
INSERT INTO `quest_template` 
SET `ID` = 441169,
    `QuestType` = 2,
    `QuestLevel` = 55, -- Update for new daily
    `MinLevel` = 51, -- Update for new daily
    `QuestSortID` = 1584, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `StartItem` = 900261, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Incendiary Core',
    `LogDescription` = 'Retrieve the Incendiary Core from Lord Incendius in Blackrock Depths.',
    `QuestDescription` = 'Prepare yourself, for a task of great significance lies ahead. Deep within the molten heart of Blackrock Depths, Lord Incendius guards the Incendiary Core, a potent source of flame. Retrieve this core and bring it back to the Horde, where it will fuel a new Black Forge. The Black Forge, powered by the fiery essence, shall become the crucible for crafting mighty weapons and armor for our warriors. Venture into the inferno, secure the Incendiary Core, and be a part of forging a powerful future for the Horde.',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Incendiary Core to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900233, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Lord Incendius - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441169);
INSERT INTO `quest_template_addon` 
SET `ID` = 441169,
    `MaxLevel` = 58, -- Update for new daily
    `ExclusiveGroup` = 441169,
    `SpecialFlags` = 1;

-- Lord Incendius - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441169);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441169,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Lord Incendius proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Lord Incendius - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441169);
INSERT INTO `quest_request_items` 
SET `ID` = 441169,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Incendiary Core please.',
    `VerifiedBuild` = 12340;

-- Lord Incendius - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441169);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441169;

-- Lord Incendius - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441169);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441169;
