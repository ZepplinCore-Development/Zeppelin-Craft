-- Bloodmage Thalnos --

-- Bloodmage Thalnos - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441165);
INSERT INTO `pool_quest` 
SET `entry` = 441165,
    `pool_entry` = 300001, -- Update for new daily
    `description` = 'Bloodmage Thalnos';

-- Bloodmage Thalnos - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441165);
INSERT INTO `quest_template` 
SET `ID` = 441165, 
    `QuestType` = 2, 
    `QuestLevel` = 34, -- Update for new daily
    `MinLevel` = 26, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900259, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Bloodfire Amulet', 
    `LogDescription` = 'Retrieve the Bloodfire Amulet from the Bloodmage Thalnos in Scarlet Monastery Graveyard.', 
    `QuestDescription` = 'Adventurer, a vital task awaits you within the grim confines of Scarlet Monastery Graveyard. Your mission is to recover the Bloodfire Amulet from the clutches of Bloodmage Thalnos, a corrupted foe lurking in the shadows. The Blood Elves have beseeched us to reclaim this amulet, intending to restore it to its rightful place in Quel''thalas after purging it of Thalnos''s dark influence. Your success will not only aid our allies but also cleanse a relic of great significance. Ready yourself, for the enchanted orb provided will transport you swiftly to the Scarlet Monastery Graveyard from anywhere in Azeroth. Go forth with determination, and may your actions herald a new dawn of purity and unity among our people.', 
    `QuestCompletionLog` = 'Return the Bloodfire Amulet to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900229, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441165);
INSERT INTO `quest_template_addon` 
SET `ID` =  441165,
    `MaxLevel` =  35,
    `SpecialFlags` = 1;

-- Bloodmage Thalnos - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441165);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441165,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Bloodmage Thalnos proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441165);
INSERT INTO `quest_request_items` 
SET `ID` = 441165,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Bloodfire Amulet please.',
    `VerifiedBuild` = 12340;

-- Bloodmage Thalnos - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441165);
INSERT INTO `creature_queststarter` 
SET `quest` = 441165,
    `id` = 14392;

-- Bloodmage Thalnos - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441165);
INSERT INTO `creature_questender` 
SET `quest` = 441165, 
    `id` = 14392;

-- Arcanist Doan --

-- Arcanist Doan - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441178);
INSERT INTO `pool_quest` 
SET `entry` = 441178,
    `pool_entry` = 300002, -- Update for new daily
    `description` = 'Arcanist Doan';

-- Arcanist Doan - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441178);
INSERT INTO `quest_template` 
SET `ID` = 441178, 
    `QuestType` = 2, 
    `QuestLevel` = 37, -- Update for new daily
    `MinLevel` = 36, -- Update for new daily
    `QuestSortID` = 2437, -- Update for new daily
    `QuestInfoID` = 81,  
    `RewardXPDifficulty` = 7, 
    `RewardMoney` = 132000, 
    `StartItem` = 900260, -- Teleport Orb Update for new daily
    `Flags` = 4104, 
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1, 
    `RewardChoiceItemID2` = 900283, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1, 
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6, 
    `LogTitle` = 'Wanted: Arcane Orb of Doan', 
    `LogDescription` = 'Retrieve the Arcane Orb of Doan from the Arcanist Doan in Scarlet Monastery Library.', 
    `QuestDescription` = 'Brave adventurer, a crucial mission awaits you within the hallowed halls of the Library in Scarlet Monastery. Your task is to recover the Arcane Orb of Doan from the clutches of Arcanist Doan, a zealot who wields its power unwisely. The mages of Dalaran are concerned about such a potent artifact falling into the wrong hands, and they look to you to secure it. Use the enchanted orb provided—it shall swiftly transport you to the Library from any part of Azeroth. Go forth with courage, and may your actions safeguard the balance of power in the arcane realm.', 
    `QuestCompletionLog` = 'Return the Arcane Orb of Doan to Overlord Runthak in Orgrimmar.', 
    `RequiredItemId1` = 900242, -- Update for new daily 
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Arcanist Doan - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441178);
INSERT INTO `quest_template_addon` 
SET `ID` =  441178,
    `MaxLevel` =  45,
    `SpecialFlags` = 1;

-- Arcanist Doan - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441178);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441178,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over the Arcanist Doan proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Arcanist Doan - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441178);
INSERT INTO `quest_request_items` 
SET `ID` = 441178,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Arcane Orb of Doan please.',
    `VerifiedBuild` = 12340;

-- Arcanist Doan - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441178);
INSERT INTO `creature_queststarter` 
SET `quest` = 441178,
    `id` = 14392;

-- Arcanist Doan - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441178);
INSERT INTO `creature_questender` 
SET `quest` = 441178, 
    `id` = 14392;