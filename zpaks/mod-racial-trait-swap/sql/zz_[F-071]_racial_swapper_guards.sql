-- F-071: Guard gossip directions to Swirl (Racial Traits Swapper)
-- Adds "Racial Traits Swapper" option to city guards in all 8 capitals

-- Gossip text shown when player clicks the guard option
DELETE FROM `npc_text` WHERE `ID` = 988890;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES
(988890, 'Swirl, the Racial Traits Swapper, can help you swap your racial traits and abilities for a cost. Look for the mark on your minimap.', 'Swirl, the Racial Traits Swapper, can help you swap your racial traits and abilities for a cost. Look for the mark on your minimap.', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Gossip menu linking to the text above
DELETE FROM `gossip_menu` WHERE `MenuID` = 988890;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES (988890, 988890);

-- Points of interest (minimap markers) for each capital city
DELETE FROM `points_of_interest` WHERE `ID` BETWEEN 1011 AND 1018;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`) VALUES
(1011, -8414.8,  649.0,    7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Stormwind
(1012, -4771.4,  -926.9,   7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Ironforge
(1013, 10187.6,  2262.5,   7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Darnassus
(1014, 5648.4,   6469.6,   7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Exodar
(1015, 1740.3,   -4378.3,  7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Orgrimmar
(1016, 1558.4,   421.6,    7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Undercity
(1017, -947.5,   256.9,    7, 99, 0, 'Swirl, Racial Traits Swapper'),  -- Thunder Bluff
(1018, 7678.4,   -5315.2,  7, 99, 0, 'Swirl, Racial Traits Swapper');  -- Silvermoon City

-- Guard gossip menu options — one per capital city guard
-- OptionIcon=0 (chat), OptionType=1 (gossip), OptionNpcFlag=1 (gossip flag)
DELETE FROM `gossip_menu_option` WHERE `ActionMenuID` = 988890;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(435,  16, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1011, 0, 0, '', 0, 0),  -- Stormwind City Guard
(2121, 13, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1012, 0, 0, '', 0, 0),  -- Ironforge Guard
(2352, 12, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1013, 0, 0, '', 0, 0),  -- Darnassus Sentinel
(7777, 11, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1014, 0, 0, '', 0, 0),  -- Exodar Peacekeeper
(1951, 15, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1015, 0, 0, '', 0, 0),  -- Orgrimmar Grunt
(2849, 12, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1016, 0, 0, '', 0, 0),  -- Undercity Guardian
(721,  11, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1017, 0, 0, '', 0, 0),  -- Bluffwatcher
(7633, 12, 0, 'Racial Traits Swapper', 0, 1, 1, 988890, 1018, 0, 0, '', 0, 0);  -- Silvermoon City Guardian
