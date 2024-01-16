-- RAZORLASH --

-- Razorlash Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441195);
INSERT INTO `pool_quest` 
SET `entry` = 441195,
    `pool_entry` = 300009,
    `description` = 'Razorlash';

-- Razorlash Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441195);
INSERT INTO `quest_template` 
SET `ID` = 441195,
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
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 469,-- Alliance
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Razor Petal',
    `LogDescription` = 'Retrieve the Razor Petal from Razorlash in Maraudon Orange.',
    `QuestDescription` = 'Howdy, partner! Just got word that Zuglord Runthak and his Horde gang are aimin'' to get their hands on the Razor Petal. It only grows from a special plant called Razorlash, near them orange crystals in Maraudon. We can''t let ''em beat us to it! Ride on over, pluck that Razor Petal from Razorlash, and bring it back. We''ll make sure you''re well rewarded. Let''s outpace them Horde varmints and secure that Razor Petal!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Razor Petal to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900219, -- Update for new daily
    `VerifiedBuild` = 12340;

-- Razorlash Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441195);
INSERT INTO `quest_template_addon` 
SET `ID` = 441195,
    `MaxLevel` = 50, -- Update for new daily
    `NextQuestID` = 441195,
    `SpecialFlags` = 1;

-- Razorlash Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441195);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441195,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Razorlash Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441195);
INSERT INTO `quest_request_items` 
SET `ID` = 441195,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Razor Petal please.',
    `VerifiedBuild` = 12340;

-- Razorlash Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441195);
INSERT INTO `creature_queststarter` 
SET `id` = 29093,
    `quest` = 441195;

-- Razorlash Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441195);
INSERT INTO `creature_questender` 
SET `id` = 29093,
    `quest` = 441195;

-- Celebras the Cursed --

-- Celebras the Cursed - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441207);
INSERT INTO `pool_quest` 
SET `entry` = 441207,
    `pool_entry` = 300009,
    `description` = 'Celebras the Cursed';

-- Celebras the Cursed - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441207);
INSERT INTO `quest_template` 
SET `ID` = 441207,
    `QuestType` = 2,
    `QuestLevel` = 49, -- Update for new daily
    `MinLevel` = 46, -- Update for new daily
    `QuestSortID` = 2100, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `StartItem` = 900254, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 469,-- Alliance
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Carved Horn of Remulos',
    `LogDescription` = 'Retrieve the Carved Horn of Remulos, guarded by his son Celebras The Cursed in Maraudon Purple.',
    `QuestDescription` = 'Howdy, partner! Word is spreading that Zuglord Runthak and his Horde gang are schemin'' to grab the Carved Horn of Remulos from Celebras. We can''t let ''em use it for who knows what maybe as a toothpick. Ride through Poison Falls, take on the guardian, yank that artifact, and fetch it back for a nice reward. Time to put a stop to their Horde shenanigans and secure the Carved Horn!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Carved Horn of Remulos to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900220, -- Update for new daily
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900254 WHERE (`ID` = 441207);

-- Celebras the Cursed - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441207);

-- Celebras the Cursed - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441207);
INSERT INTO `quest_template_addon` 
SET `ID` = 441207,
    `MaxLevel` = 50, -- Update for new daily
    `NextQuestID` = 441207,
    `SpecialFlags` = 1;

-- Celebras the Cursed - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441207);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441207,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441207);
INSERT INTO `quest_request_items` 
SET `ID` = 441207,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Carved Horn of Remulos please.',
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441207);
INSERT INTO `creature_queststarter` 
SET `id` = 29093,
    `quest` = 441207;

-- Celebras the Cursed - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441207);
INSERT INTO `creature_questender` 
SET `id` = 29093,
    `quest` = 441207;

-- Princess Theradras --

-- Princess Theradras - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441208);
INSERT INTO `pool_quest` 
SET `entry` = 441208,
    `pool_entry` = 300010,
    `description` = 'Princess Theradras';

-- Princess Theradras - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441208);
INSERT INTO `quest_template` 
SET `ID` = 441208,
    `QuestType` = 2,
    `QuestLevel` = 51, -- Update for new daily
    `MinLevel` = 51, -- Update for new daily
    `QuestSortID` = 2100, -- Update for new daily
    `QuestInfoID` = 81,
    `RewardXPDifficulty` = 7,
    `RewardMoney` = 132000,
    `RewardBonusMoney` = 11400,
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 469,-- Alliance
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Face of Theradras',
    `LogDescription` = 'Retrieve the Face of Theradras from Princess Theradras in the Pristine Waters of Maraudon.',
    `QuestDescription` = 'Howdy, brave one! Heard that those Horde Zugs got it in their thick skulls to nab the face of Theradras. This''ll be the work of that pesky Zuglord Runthak. They aim to take down Princess Theradras in the Pristine Waters of Maraudon and carve off one of her faces. They''re plannin'' to use it as a mask to fool Therazane the Stonemother. Can''t let that happen! Saddle up, confront Princess Theradras, and bring back that face. We''ll make sure you''re handsomely rewarded. Let''s put a stop to them Horde schemes and secure Theradras'' face!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Face of Theradras to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900243, -- Update for new daily
    `VerifiedBuild` = 12340;

-- Princess Theradras - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441208);

-- Princess Theradras - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441208);
INSERT INTO `quest_template_addon` 
SET `ID` = 441208,
    `MaxLevel` = 58, -- Update for new daily
    `NextQuestID` = 441208,
    `SpecialFlags` = 1;

-- Princess Theradras - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441208);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441208,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Princess Theradras - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441208);
INSERT INTO `quest_request_items` 
SET `ID` = 441208,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Face of Theradras please.',
    `VerifiedBuild` = 12340;

-- Princess Theradras - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441208);
INSERT INTO `creature_queststarter` 
SET `id` = 29093,
    `quest` = 441208;

-- Princess Theradras - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441208);
INSERT INTO `creature_questender` 
SET `id` = 29093,
    `quest` = 441208;