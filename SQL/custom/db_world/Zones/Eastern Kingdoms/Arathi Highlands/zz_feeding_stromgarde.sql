-- Feeding Stromgarde
DELETE FROM `quest_template` WHERE (`ID` = 90007);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(90007, 2, 37, 30, 45, 0, 0, 0, 0, 0, 0, 0, 6, 8697, 0, 3960, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 6, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1101, 'Feeding Stromgarde', 'Bring 30 Raptor Flanks to Prince Galen Trollbane at Stromgarde in Arathi Highlands.', 'In these trying times, the salvation of Stromgarde lies in the wilderness of Arathi Highlands. The people starve, and I call upon your bravery to gather Raptor Flanks from these cunning creatures. Hunt them in the treacherous wilds, for you might be our only hope. Become the hero Stromgarde desperately needs!', '', 'Return to Prince Galen Trollbane at Stromgarde in Arathi Highlands.
', 0, 0, 0, 0, 0, 0, 0, 0, 900191, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, '', '', '', '', 0);

DELETE FROM `quest_offer_reward` WHERE (`ID` = 90007);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(90007, 66, 0, 0, 0, 0, 0, 0, 0, 'Your valiant efforts have not gone unnoticed. With the Raptor Flanks you have gathered, the people of Stromgarde will feast and regain their strength. You have become the beacon of hope in our darkest hour, and for that, I, Prince Galen Trollbane, am eternally grateful.', 0);

DELETE FROM `creature_queststarter` WHERE (`quest` = 90007);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(2607, 90007);

DELETE FROM `creature_questender` WHERE (`quest` = 90007);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(2607, 90007);

DELETE FROM `quest_request_items` WHERE (`ID` = 90007);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(90007, 0, 0, 'Have you retrieved any Raptor Flanks? The people of Stromgarde are hungry.', 0);

REPLACE INTO `quest_poi_points` (QuestID,Idx1,Idx2,X,Y,VerifiedBuild) VALUES
(90007,0,0,-1331,-2266,0);

REPLACE INTO `quest_poi` (QuestID,id,ObjectiveIndex,MapID,WorldMapAreaId,Floor,Priority,Flags,VerifiedBuild) VALUES
(90007,0,0,0,16,0,0,1,0);

