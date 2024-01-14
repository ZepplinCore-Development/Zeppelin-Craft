-- Lord Incendius ---

-- Lord Incendius Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441197);
INSERT INTO `pool_quest` 
SET `entry` = 441197,
    `pool_entry` = 300010, -- Update for new daily
    `description` = 'Lord Incendius';

-- Lord Incendius Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441197);
INSERT INTO `quest_template` 
SET `ID` = 441197,
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
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Incendiary Core',
    `LogDescription` = 'Retrieve the Incendiary Core from Lord Incendius in Blackrock Depths.',
    `QuestDescription` = 'Howdy, adventurer! Just got wind that them Horde Zugs are schemin'' to snag an Incendiary Core from Lord Incendius. Believe it or not, they''re talkin'' ''bout squanderin'' it on a bonfire! We can''t have that kind of nonsense. Ride through, take on Lord Incendius, and bring back that Incendiary Core. There''s a hefty reward in it for ya. Let''s show them Horde dreamers we mean business and keep the Incendiary Core safe from their bonfire follies!',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Incendiary Core to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900219, -- Update for new daily
    `VerifiedBuild` = 12340;

-- Lord Incendius Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441197);
INSERT INTO `quest_template_addon` 
SET `ID` = 441197,
    `MaxLevel` = 58, -- Update for new daily
    `ExclusiveGroup` = 441197,
    `SpecialFlags` = 1;

-- Lord Incendius Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441197);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441197,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Lord Incendius Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441197);
INSERT INTO `quest_request_items` 
SET `ID` = 441197,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Incendiary Core please.',
    `VerifiedBuild` = 12340;

-- Lord Incendius Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441197);
INSERT INTO `creature_queststarter` 
SET `id` = 12480,
    `quest` = 441197;

-- Lord Incendius Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441197);
INSERT INTO `creature_questender` 
SET `id` = 12480,
    `quest` = 441197;

-- FUTURE ---

