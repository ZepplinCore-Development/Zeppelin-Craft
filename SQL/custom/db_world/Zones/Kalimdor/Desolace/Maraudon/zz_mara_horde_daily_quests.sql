-- RAZORLASH ---

-- Razorlash - Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441155,300003,'Razorlash');

-- Razorlash - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441155);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441155, 2, 48, 46, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
'Wanted: Razor Petal', 'Retrieve the Razor Petal from Razorlash in Maraudon.',
'The Horde is in need of champions, and I''ve got a task fit for those who wish to prove their mettle. Deep within the treacherous Maraudon, there lurks a vile creature known as Razorlash, a twisted plant with razor-sharp petals near the cursed orange crystals. Bring me a Razor Petal from its heart, and show me your strength. The Horde welcomes those who can face the perils of the dungeons and emerge victorious. Are you up for the challenge, or will you crumble like the weak?',
'', 'Return the Razor Petal to Overlord Runthak in Orgrimmar.', 0, 0, 0, 0, 0, 0, 0, 0, 900219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Razorlash - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900255 WHERE (`ID` = 441155);

-- Razorlash - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441155);

-- Razorlash - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441155);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441155, 50, 0, 0, 0, 0, 441155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Razorlash - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441155);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441155, 1, 0, 0, 0, 0, 0, 0, 0, 'Your triumph over Razorlash proves your worth. The Horde recognizes a true champion in your deeds.', 12340);

-- Razorlash - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441155);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441155, 1, 1, 'The Razor Petal please.', 12340);

-- Razorlash - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441155);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14392, 441155);

-- Razorlash - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441155);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14392, 441155);

-- Celebras the Cursed ---

-- Celebras the Cursed - Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441156,300003,'Celebras the Cursed');

-- Celebras the Cursed - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441156);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441156, 2, 49, 46, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wanted: Carved Horn of Remulos',
'Retrieve the Carved Horn of Remulos, guarded by his son Celebras The Cursed in Maraudon Purple.', 
'The Horde demands more from its champions, and your next test lies in the Poison Falls of Maraudon. Seek out Celebras the Cursed, son of Remulos, within the shadows of the purple crystal-marked entrance. Your target is the the Carved Horn of Remulos. Only those who can navigate the dangers and confront Celebras will be deemed worthy. The Horde seeks strength and resilience do you possess these qualities, or will you falter in the face of adversity?',
'', 'Return the Carved Horn of Remulos to Overlord Runthak in Orgrimmar.', 0, 0, 0, 0, 0, 0, 0, 0, 900220, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Celebras the Cursed - Quest Template - Teleport
UPDATE `quest_template` SET `StartItem` = 900254 WHERE (`ID` = 441156);

-- Celebras the Cursed - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441156);

-- Celebras the Cursed - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441156);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441156, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Celebras the Cursed - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441156);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441156, 1, 0, 0, 0, 0, 0, 0, 0, 'Your triumph over Celebras the Cursed proves your worth. The Horde recognizes a true champion in your deeds.', 12340);

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

-- Princess Theradras ---

-- Princess Theradras - Pool Quest
REPLACE INTO `pool_quest` (entry,pool_entry,description) VALUES
(441208,300004,'Princess Theradras');

-- Princess Theradras - Quest Template
DELETE FROM `quest_template` WHERE (`ID` = 441208);
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(441208, 2, 51, 51, 2100, 81, 0, 0, 0, 0, 0, 0, 7, 132000, 0, 11400, 0, 0, 0, 0, 0, 4104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
'Wanted: Face of Theradras', 
'Retrieve the Face of Theradras from Pricess Theradras in the Pristine Waters of Maraudon. ', 
'The Horde''s path to glory winds deep into Maraudon''s heart, where the Pristine Waters hold the lair of the formidable Princess Theradras. Your mission: slay the princess and bring forth the Face of Theradras as a testament to your might. The Horde seeks champions who can triumph over the most fearsome adversaries. Venture into the waters, face the challenges that await, and emerge victorious with the face of the fallen princess. Will you prove yourself worthy, or will the waters swallow your ambitions?',
'', 'Return the Face of Theradras to Travis Coomingham in Stormwind.', 0, 0, 0, 0, 0, 0, 0, 0, 900243, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Princess Theradras - Quest Template - Reward
UPDATE `quest_template` SET `RewardChoiceItemID1` = 900104, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemID2` = 900189, `RewardChoiceItemQuantity2` = 1 WHERE (`ID` = 441208);

-- Princess Theradras - Quest Template Addon
DELETE FROM `quest_template_addon` WHERE (`ID` = 441208);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(441208, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Princess Theradras - Quest Offer Reward
DELETE FROM `quest_offer_reward` WHERE (`ID` = 441208);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(441208, 1, 0, 0, 0, 0, 0, 0, 0, 'Your triumph over Princess Theradras proves your worth. The Horde recognizes a true champion in your deeds.', 12340);

-- Princess Theradras - Quest Request Items
DELETE FROM `quest_request_items` WHERE (`ID` = 441208);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(441208, 1, 1, 'The Face of Theradras please.', 12340);

-- Princess Theradras - Creature Quest Starter
DELETE FROM `creature_queststarter` WHERE (`quest` = 441208);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14392, 441208);

-- Princess Theradras - Creature Quest Ender
DELETE FROM `creature_questender` WHERE (`quest` = 441208);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14392, 441208);