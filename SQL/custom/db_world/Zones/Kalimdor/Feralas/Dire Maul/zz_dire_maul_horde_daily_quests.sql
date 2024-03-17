-- Alzzin the Wildshaper --

-- Alzzin the Wildshaper - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441171);
INSERT INTO `pool_quest` 
SET `entry` = 441171,
    `pool_entry` = 300004,
    `description` = 'Alzzin the Wildshaper';

-- Alzzin the Wildshaper - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441171);
INSERT INTO `quest_template` 
SET `ID` = 441171,
    `QuestType` = 2,
    `QuestLevel` = 58,-- Update for new daily
    `MinLevel` = 51,-- Update for new daily
    `QuestSortID` = 2100,-- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `StartItem` = 900255, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104,-- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189,-- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Scepter of Sylvan Corruption',
    `LogDescription` = 'Retrieve the Scepter of Sylvan Corruption from Alzzin the Wildshaper in Maraudon.',
    `QuestDescription` = 'Embrace the call, brave champion! The Horde has deemed you worthy of a task of great importance. Travel to Dire Maul, where Alzzin the Wildshaper guards the malevolent Scepter of Sylvan Corruption. This foul artifact must be recovered swiftly to prevent further corruption. Shamans of the Horde stand ready to destroy it, cleansing the land of its taint. Wield your strength and face Alzzin, secure the scepter, and bring it back to the Horde. The fate of Azeroth hangs in the balance. The mages have enchanted an orb for you; use it wisely, and may it transport you safely to Dire Maul from anywhere in our vast world. Go forth, champion, and may victory be yours!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Scepter of Sylvan Corruption to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900235, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441171);
INSERT INTO `quest_template_addon` 
SET `ID` = 441171,
    `MaxLevel` = 58,-- Update for new daily
    `ExclusiveGroup` = 441171,
    `SpecialFlags` = 1;

-- Alzzin the Wildshaper - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441171);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441171,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Alzzin the Wildshaper proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441171);
INSERT INTO `quest_request_items` 
SET `ID` = 441171,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Scepter of Sylvan Corruption please.',
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441171);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441171;

-- Alzzin the Wildshaper - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441171);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441171;

