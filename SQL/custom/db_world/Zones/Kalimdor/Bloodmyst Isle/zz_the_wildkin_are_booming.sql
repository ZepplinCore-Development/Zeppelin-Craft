REPLACE INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(90000, 2, 18, 14, 3525, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 930, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1101,  'The Wildkin Are Booming',  'Tracker Lyceon wants you to slay Wildkin North of Blood Watch.',  'The once tranquil owlkin of the region have been exposed to the energies of the warp. One by one they have mutated and become feral. Their numbers are great and pose a threat to the nearby inhabitants of the region. Including us  Draenai. To the north, you will find Ragefeather Ridge. Venture to the owlkin encampments and cull the feral horde.',  '',  'Return to Tracker Lyceon at Blood Watch.', 17324, 17323, 17322, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  '',  '',  '',  '', 0);

DELETE FROM `quest_template_addon` WHERE (`ID` = 90000);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(90000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `quest_offer_reward` WHERE (`ID` = 90000);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(90000, 0, 0, 0, 0, 0, 0, 0, 0, 'The owlkin had lived in harmony with the land for thousands of years. It seems we have ruined them', 0);

DELETE FROM `quest_request_items` WHERE (`ID` = 90000);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(90000, 1, 0, 'The owlkin horde has been halted for now...', 0);

DELETE FROM `creature_queststarter` WHERE (`quest` = 90000);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(17642, 90000);

DELETE FROM `creature_questender` WHERE (`quest` = 90000);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(17642, 90000);

DELETE FROM `quest_poi` WHERE (`QuestID` = 90000);
INSERT INTO `quest_poi` (`QuestID`,`id`,`ObjectiveIndex`,`MapID`,`WorldMapAreaId`,`Floor`,`Priority`,`Flags`,`VerifiedBuild`)
    VALUES (90000,0,0,1,476,0,0,1,0);

DELETE FROM `quest_poi_points` WHERE (`QuestID` = 90000);
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`VerifiedBuild`)
    VALUES (90000,0,0,-1690,-11845,0);
