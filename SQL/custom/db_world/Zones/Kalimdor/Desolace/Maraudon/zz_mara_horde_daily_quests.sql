-- RAZORLASH --

-- Razorlash - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441155);
INSERT INTO `pool_quest` 
SET `entry` = 441155,
    `pool_entry` = 300003,
    `description` = 'Razorlash';

-- Razorlash - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441155);
INSERT INTO `quest_template` 
SET `ID` = 441155,
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
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Razor Petal',
    `LogDescription` = 'Retrieve the Razor Petal from Razorlash in Maraudon.',
    `QuestDescription` = 'The Horde is in need of champions, and I''ve got a task fit for those who wish to prove their mettle. 
    Deep within the treacherous Maraudon, there lurks a vile creature known as Razorlash, a twisted plant with razor-sharp petals near the cursed orange crystals. 
    Bring me a Razor Petal from its heart, and show me your strength. The Horde welcomes those who can face the perils of the dungeons and emerge victorious. 
    Are you up for the challenge, or will you crumble like the weak?',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Razor Petal to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900219, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Razorlash - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441155);
INSERT INTO `quest_template_addon` 
SET `ID` = 441155,
    `MaxLevel` = 50, -- Update for new daily
    `ExclusiveGroup` = 441155,
    `SpecialFlags` = 1;

-- Razorlash - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441155);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441155,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Razorlash proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Razorlash - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441155);
INSERT INTO `quest_request_items` 
SET `ID` = 441155,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Razor Petal please.',
    `VerifiedBuild` = 12340;

-- Razorlash - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441155);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441155;

-- Razorlash - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441155);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441155;

-- Celebras the Cursed --

-- Celebras the Cursed - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441156);
INSERT INTO `pool_quest` 
SET `entry` = 441156,
    `pool_entry` = 300003,
    `description` = 'Celebras the Cursed';

-- Celebras the Cursed - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441156);
INSERT INTO `quest_template` 
SET `ID` = 441156,
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
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Carved Horn of Remulos',
    `LogDescription` = 'Retrieve the Carved Horn of Remulos, guarded by his son Celebras The Cursed in Maraudon Purple.',
    `QuestDescription` = 'The Horde demands more from its champions, and your next test lies in the Poison Falls of Maraudon. 
    Seek out Celebras the Cursed, son of Remulos, within the shadows of the purple crystal-marked entrance. 
    Your target is the Carved Horn of Remulos. Only those who can navigate the dangers and confront Celebras will be deemed worthy. 
    The Horde seeks strength and resilience. Do you possess these qualities, or will you falter in the face of adversity?',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Carved Horn of Remulos to Overlord Runthak in Orgrimmar.',
    `RequiredItemId1` = 900220, -- Update for new daily
    `RequiredItemCount1` = 1,
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441156);
INSERT INTO `quest_template_addon` 
SET `ID` = 441156,
    `MaxLevel` = 50, -- Update for new daily
    `ExclusiveGroup` = 441156,
    `SpecialFlags` = 1;

-- Celebras the Cursed - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441156);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441156,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Celebras the Cursed proves your worth. The Horde recognizes a true champion in your deeds.',
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441156);
INSERT INTO `quest_request_items` 
SET `ID` = 441156,
    `EmoteOnComplete` = 1,
    `EmoteOnIncomplete` = 1,
    `CompletionText` = 'The Carved Horn of Remulos please.',
    `VerifiedBuild` = 12340;

-- Celebras the Cursed - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441156);
INSERT INTO `creature_queststarter` 
SET `id` = 14392,
    `quest` = 441156;

-- Celebras the Cursed - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441156);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441156;

-- Princess Theradras --

-- Princess Theradras - Pool Quest
DELETE FROM `pool_quest` WHERE (`entry` = 441208);
INSERT INTO `pool_quest` 
SET `entry` = 441208,
    `pool_entry` = 300004,
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
    `StartItem` = 0, -- Teleport Orb Update for new daily
    `Flags` = 4104,
    `RewardChoiceItemID1` = 900104, -- Emblem of Adventure
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 900189, -- Orb of Experience
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 1801, -- Horde
    `RewardFactionValue1` = 6,
    `LogTitle` = 'Wanted: Face of Theradras',
    `LogDescription` = 'Retrieve the Face of Theradras from Princess Theradras in the Pristine Waters of Maraudon.',
    `QuestDescription` = 'The Horde''s path to glory winds deep into Maraudon''s heart, where the Pristine Waters hold the lair of the formidable Princess Theradras. 
    Your mission: slay the princess and bring forth the Face of Theradras as a testament to your might. 
    The Horde seeks champions who can triumph over the most fearsome adversaries. 
    Venture into the waters, face the challenges that await, and emerge victorious with the face of the fallen princess. 
    Will you prove yourself worthy, or will the waters swallow your ambitions?',
    `AreaDescription` = '',
    `QuestCompletionLog` = 'Return the Face of Theradras to Travis Coomingham in Stormwind.',
    `RequiredItemId1` = 900243, -- Update for new daily
    `RequiredItemCount1` = 0,
    `VerifiedBuild` = 12340;

-- Princess Theradras - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441208);
INSERT INTO `quest_template_addon` 
SET `ID` = 441208,
    `MaxLevel` = 58, -- Update for new daily
    `ExclusiveGroup` = 441208,
    `SpecialFlags` = 1;

-- Princess Theradras - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441208);
INSERT INTO `quest_offer_reward` 
SET `ID` = 441208,
    `Emote1` = 1,
    `RewardText` = 'Your triumph over Princess Theradras proves your worth. The Horde recognizes a true champion in your deeds.',
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
SET `id` = 14392,
    `quest` = 441208;

-- Princess Theradras - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441208);
INSERT INTO `creature_questender` 
SET `id` = 14392,
    `quest` = 441208;

