-- Lord Incendius ---

-- Lord Incendius Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441197,300010,'Lord Incendius');

-- Lord Incendius Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441197);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441197, 2, 55, 51, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
'Wanted: Incendiary Core',
'Retrieve the Incendiary Core from Lord Incendius in Blackrock Depths.',
'Howdy, adventurer! Just got wind that them Horde Zugs are schemin'' to snag an Incendiary Core from Lord Incendius.
Believe it or not, they''re talkin'' ''bout squanderin'' it on a bonfire! We can''t have that kind of nonsense.
Ride through, take on Lord Incendius, and bring back that Incendiary Core. There''s a hefty reward in it for ya.
Let''s show them Horde dreamers we mean business and keep the Incendiary Core safe from their bonfire follies!',
'', 'Return the Incendiary Core to Travis Coomingham in Stormwind.', 0, 0, 0, 0, 0, 0, 0, 0, 900219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Lord Incendius - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900261 WHERE (`ID` = 441197);

-- Lord Incendius - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441197);

-- Lord Incendius Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441197);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441197, 58, 0, 0, 0, 0, 441197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Lord Incendius Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441197);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441197, 1, 0, 0, 0, 0, 0, 0, 0, 'Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch.', 12340);

-- Lord Incendius Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441197);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441197, 1, 1, 'The Incendiary Core please.', 12340);

-- Lord Incendius Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441197);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(12480, 441197);

-- Lord Incendius Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441197);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(12480, 441197);

-- FUTURE ---
