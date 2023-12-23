-- Pool Creation
REPLACE INTO `pool_template` (entry,max_limit,description) VALUES
(300000,1,'Normal Vanilla Dungeon - Daily Quests - Horde');

-- RAZORLASH ---

-- Razorlash Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441155,300000,'Razorlash');

-- Razorlash Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441155);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441155, 2, 48, 45, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 933, 6, 0, 947, 6, 0, 946, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wanted: Razor Petal', '$B$B, you have accepted the challenge to secure the elusive Razor Petal from Razorlash in Maraudo Orange. Head into the orange groves, where Razorlash dwells, and face the guardian to claim the prized petal.Be cautious, for Razorlash is known to be a formidable protector. Harvest the razor petal and return triumphantly to earn a generous finder fee. May your journey through Maraudon Orange be swift and victorious, $B$B! The fate of the Razor Petal rests in your hands.', 'In Maraudon Orange, a prized Razor Petal awaits a bold adventurer. Your task: delve into the groves, confront Razorlash, and claim the elusive petal. Beware, for Razorlash guards it fiercely. Return victorious for a well-earned finder fee. Go, $B$B, and let the quest for the Razor Petal begin!', '', 'Return the Razor Petal to Overlord Runthak in Orgrimmar.', 0, 0, 0, 0, 0, 0, 0, 0, 900219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Razorlash Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441155);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441155, 0, 0, 0, 0, 0, 441155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Razorlash Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441155);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441155, 1, 0, 0, 0, 0, 0, 0, 0, 'Another soon-to-be satisfied customer. It looks like it is in fine condition. You are to be rewarded.$B$BCome back tomorrow and I will have another request for you to fulfill.', 12340);

-- Razorlash Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441155);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441155, 1, 1, 'The Razor Petal please.', 12340);

-- Razorlash Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441155);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14392, 441155);

-- Razorlash Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441155);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14392, 441155);

-- Celebras the Cursed ---

-- Celebras the Cursed - Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441156,300000,'Celebras the Cursed');

-- Celebras the Cursed - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441156);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441156, 2, 49, 45, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 933, 6, 0, 947, 6, 0, 946, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wanted: Carved Horn of Remulos', '$B$B, you have accepted the challenge to retrieve the Carved Horn of Remulos, guarded by Celebras The Cursed  in Maraudon Purple. Navigate the treacherous Poison Falls, confront Celebras, and secure the artifact.', 'Brave $B$B, journey into Maraudon Purple where the Carved Horn of Remulos is guarded by Celebras, his cursed son. Navigate Poison Falls, face the guardian, claim the artifact, and return for a well-deserved reward. Unravel the Cursed Legacy, $B$B, and let the quest for the Carved Horn commence! May your bravery shine through in Maraudon.', '', 'Return to Overlord Runthak in Orgrimmar.', 0, 0, 0, 0, 0, 0, 0, 0, 900220, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Celebras the Cursed - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441156);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Celebras the Cursed - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441156);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441156, 1, 0, 0, 0, 0, 0, 0, 0, 'Another soon-to-be satisfied customer. It looks like it is in fine condition. You are to be rewarded.$B$BCome back tomorrow and I will have another request for you to fulfill.', 12340);

-- Celebras the Cursed - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441156);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441156, 1, 1, 'The Carved Horn of Remulos please.', 12340);

-- Celebras the Cursed - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441156);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14392, 441156);

-- Celebras the Cursed - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441156);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14392, 441156);