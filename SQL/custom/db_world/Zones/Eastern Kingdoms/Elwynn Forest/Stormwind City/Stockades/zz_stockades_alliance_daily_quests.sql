-- Bazil Thredd --

-- Bazil Thredd - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441184);
INSERT INTO `pool_quest` 
SET `entry` = 441184,
    `pool_entry` = 300007, -- Update for new daily
    `description` = 'Bazil Thredd';

-- Bazil Thredd - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441184);
INSERT INTO `quest_template` 
SET `ID` = 441184,
    `QuestType` = 2, 
    `QuestLevel` = 29, -- Update for new daily
    `MinLevel` = 26, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900266, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 469, -- Alliance
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Prison Wallet', 
    `LogDescription` = 'Retrieve the Prison Wallet from Bazil Thredd in Stormwind Stockades.', 
    `QuestDescription` = 'Howdy, adventurer! I''ve got a mighty task for ya, straight from the heart of Stormwind. We need to head into the Stockades and face off against Bazil Thredd. The job? Retrieve his prison wallet. Now, why''s this so crucial, ya ask? Well, Zuglord Runthak, the zugliest of all Horde troublemakers, has teamed up with the Defias. They''re schemin'' a big ol'' assault on Stormwind, and our spies reckon they''re plannin'' a reverse Shawshank attack! Bazil''s got them assault plans tucked away in his wallet, even when he''s snoozin''! We gotta get our hands on that wallet and snag them plans. So gear up, head into the Stockades, and retrieve that prison wallet from Bazil. Oh, and don''t forget to take this orb - it''ll teleport ya straight to the Stockades. Let''s put a stop to them Horde''s sneaky assault plans and keep Stormwind safe!', 
    `RequiredItemId1` = 900221, -- Update for new daily 
    `RequiredItemCount1` = 1, 
    `VerifiedBuild` = 12340;

-- Bazil Thredd - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441184);
INSERT INTO `quest_template_addon` 
SET `ID` = 441184,
    `MaxLevel` = 35, -- Update for new daily
    `SpecialFlags` = 1;

-- Bazil Thredd - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441184);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441184,
    `Emote1` = 1,
    `RewardText` = 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.',
    `VerifiedBuild` = 12340;

-- Bazil Thredd - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441184);
INSERT INTO `quest_request_items` 
SET `ID` = 441184,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Prison Wallet please.',
    `VerifiedBuild` = 12340;

-- Bazil Thredd - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441184);
INSERT INTO `creature_queststarter` 
SET`quest` = 441184,
    `id` = 29093;
    
-- Bazil Thredd - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441184);
INSERT INTO `creature_questender` 
SET `quest` = 441184, 
    `id` = 29093;