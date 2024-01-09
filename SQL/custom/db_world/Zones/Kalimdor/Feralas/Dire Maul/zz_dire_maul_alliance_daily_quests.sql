-- Alzzin the Wildshaper --

-- Alzzin the Wildshaper - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441199);
INSERT INTO `pool_quest` 
SET `entry` = 441199,
    `pool_entry` = 3000010,
    `description` = 'Alzzin the Wildshaper';

-- Alzzin the Wildshaper - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441199);
INSERT INTO `quest_template` 
SET `ID` = 441199,
    `QuestType` = 2,
    `QuestLevel` = 48, -- Update for new daily
    `MinLevel` = 46, -- Update for new daily
    `QuestSortID` = 2100, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `StartItem` = 900255, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104,-- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189,
    `RewardChoiceItemQuantity2` = 1,-- Orb of Experience
    `RewardFactionID1` = 469,-- Alliance
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Scepter of Sylvan Corruption',
    `LogDescription` = 'Retrieve the Scepter of Sylvan Corruption from Alzzin the Wildshaper in Maraudon Orange.',
    `QuestDescription` = 'Howdy there, partner! Heard tell that them Horde Zugs are fixin'' to grab the Scepter of Sylvan Corruption from Alzzin the Wildshaper in Dire Maul. And get this, they''re plannin'' to use it as a back scratcher! Can''t let that kind of nonsense go down. Ride on over, face Alzzin, and fetch that Scepter. Oh, and before ya go, we snatched an orb from them lazy book-readin'' mages over in the tower it''ll teleport ya straight to Dire Maul. There''s a reward waitin'' for ya. Let''s stomp out them Horde''s whimsical back-scratchin'' dreams and keep the Scepter safe!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Scepter of Sylvan Corruption to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900235,-- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900255 WHERE (`ID` = 441199);

-- Alzzin the Wildshaper - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441199);

-- Alzzin the Wildshaper - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441199);
INSERT INTO `quest_template_addon` 
SET `ID` = 441199,
    `MaxLevel` = 50,
    `ExclusiveGroup` = 441199,
    `SpecialFlags` = 1;

-- Alzzin the Wildshaper - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441199);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441199,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441199);
INSERT INTO `quest_request_items` 
SET `ID` = 441199,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Scepter of Sylvan Corruption please.',
    `VerifiedBuild` = 12340;

-- Alzzin the Wildshaper - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441199);
INSERT INTO `creature_queststarter` 
SET `id` = 12480,
    `quest` = 441199;

-- Alzzin the Wildshaper - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441199);
INSERT INTO `creature_questender` 
SET `id` = 12480,
    `quest` = 441199;
