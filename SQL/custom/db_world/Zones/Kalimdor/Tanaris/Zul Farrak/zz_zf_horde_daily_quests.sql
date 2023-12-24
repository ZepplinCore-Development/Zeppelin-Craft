-- Chief Ukorz Sandscalp --

-- Chief Ukorz Sandscalp - Pool Quest
REPLACE INTO `pool_quest` (`entry`,`pool_entry`,`description`) VALUES
(441167,300000,'Chief Ukorz Sandscalp');

-- Chief Ukorz Sandscalp - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441167);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441167, 2, 48, 45, 978, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
'Wanted: Sandfury War Drum',
'Retrieve the Sandfury War Drum from Chief Ukorz Sandscalp in Zul''Farrak.',
'The call to greatness echoes through the sands of Zul''Farrak as Chief Ukorz Sandscalp beats the formidable Sandfury War Drum. Your mission is clear: recover this potent artifact and showcase your strength in the heart of Zul''Farrak. The Horde seeks champions who can face the challenges that lie ahead and emerge victorious. Confront Chief Ukorz Sandscalp, seize the Sandfury War Drum, and prove that you are a force to be reckoned with. Are you ready to drum up success for the Horde?',
'', 'Return the Sandfury War Drum to Overlord Runthak in Orgrimmar.', 0, 0, 0, 0, 0, 0, 0, 0, 900219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Chief Ukorz Sandscalp - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441167);

-- Chief Ukorz Sandscalp - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441167);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441167, 51, 0, 0, 0, 0, 441167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Chief Ukorz Sandscalp - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441167);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441167, 1, 0, 0, 0, 0, 0, 0, 0, 'Your triumph over Chief Ukorz Sandscalp proves your worth. The Horde recognizes a true champion in your deeds.', 12340);

-- Chief Ukorz Sandscalp - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441167);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441167, 1, 1, 'The Sandfury War Drum please.', 12340);

-- Chief Ukorz Sandscalp - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441167);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14392, 441167);

-- Chief Ukorz Sandscalp - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441167);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14392, 441167);
