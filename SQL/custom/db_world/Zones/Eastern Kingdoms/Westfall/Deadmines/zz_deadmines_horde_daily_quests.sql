-- Cookie --

-- Cookie - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441183);
INSERT INTO `pool_quest` 
SET `entry` = 441183,
    `pool_entry` = 300000, -- Update for new daily
    `description` = 'Cookie';

-- Cookie - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441183);
INSERT INTO `quest_template` 
SET `ID` = 441183, 
    `QuestType` = 2, 
    `QuestLevel` = 16, -- Update for new daily
    `MinLevel` = 15, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900267, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Stabby Patty Secret Formula', 
    `LogDescription` = 'Retrieve the Stabby Patty Secret Formula from the Cookie in Deadmines.', 
    `QuestDescription` = 'Ahoy there, hearty adventurer! A savory quest awaits you in the treacherous Deadmines. Your mission: to plunder the Stabby Patty Secret Formula from none other than Cookie himself. This delectable dish hails from the famed Kelp''thar Forest of Vashj''ir, said to imbue soldiers with the agility of a squirrel, the resilience of a sponge, the intelligence of a starfish, and the beauty of a squid—ensuring victory on both land and sea! Cookie holds the secret to this culinary marvel, making him a target for both the Horde and the Alliance. Don''t dilly-dally like plankton; snatch that recipe before the Alliance''s greedy mitts get to it first! And fear not, for the enchanted orb provided shall whisk you away to the Deadmines from any corner of Azeroth. Set sail, brave soul, and let the aroma of victory guide your way!', 
    `QuestCompletionLog` = 'Return the Stabby Patty Secret Formula to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900246, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Cookie - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441183);
INSERT INTO `quest_template_addon` 
SET `ID` =  441183,
    `MaxLevel` =  25,
    `SpecialFlags` = 1;

-- Cookie - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441183);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441183,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Cookie proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Cookie - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441183);
INSERT INTO `quest_request_items` 
SET `ID` = 441183,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Stabby Patty Secret Formula please.',
    `VerifiedBuild` = 12340;

-- Cookie - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441183);
INSERT INTO `creature_queststarter` 
SET `quest` = 441183,
    `id` = 14392;

-- Cookie - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441183);
INSERT INTO `creature_questender` 
SET `quest` = 441183, 
    `id` = 14392;