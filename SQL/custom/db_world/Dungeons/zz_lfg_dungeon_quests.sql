-- Classic Quests

    -- Classic Random 5-15 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24881;
        INSERT INTO `quest_template` SET
            `ID` = 24881,
            `QuestLevel` = 15,
            `MinLevel` = 5,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 1400,
            `Flags` = 136,
            `RewardItem1` = 51999,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 5-15 (1st)',
            `VerifiedBuild` = '12340';

    -- Classic Random 15-25 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24882;
        INSERT INTO `quest_template` SET
            `ID` = 24882,
            `QuestLevel` = 25,
            `MinLevel` = 15,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 3500,
            `Flags` = 136,
            `RewardItem1` = 51999,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 15-25 (1st)',
            `VerifiedBuild` = '12340';

    -- Classic Random 24-34 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24883;
        INSERT INTO `quest_template` SET
            `ID` = 24883,
            `QuestLevel` = 34,
            `MinLevel` = 24,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 7000,
            `Flags` = 136,
            `RewardItem1` = 52000,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 24-34 (1st)',
            `VerifiedBuild` = '12340';

    -- Classic Random 35-45 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24884;
        INSERT INTO `quest_template` SET
            `ID` = 24884,
            `QuestLevel` = 45,
            `MinLevel` = 35,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 13000,
            `Flags` = 136,
            `RewardItem1` = 52001,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 35-45 (1st)',
            `VerifiedBuild` = '12340';

    -- Classic Random 46-55 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24885;
        INSERT INTO `quest_template` SET
            `ID` = 24885,
            `QuestLevel` = 55,
            `MinLevel` = 45,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 16500,
            `Flags` = 136,
            `RewardItem1` = 52002,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 46-55 (1st)',
            `VerifiedBuild` = '12340';

    -- Classic Random 56-60 (1st)
        DELETE FROM `quest_template` WHERE `ID` = 24886;
        INSERT INTO `quest_template` SET
            `ID` = 24886,
            `QuestLevel` = 60,
            `MinLevel` = 55,
            `RewardXPDifficulty` = 8,
            `RewardMoney` = 18000,
            `Flags` = 136,
            `RewardItem1` = 52003,
            `RewardAmount1` = 1,
            `RewardItem2` = 901203,
            `RewardAmount2` = 1,
            `LogTitle` = 'Classic Random 56-60 (1st)',
            `VerifiedBuild` = '12340';

-- Heroic Quests

    -- First Heroic Quest

        -- First Heroic Quest Template
                DELETE FROM `quest_template` WHERE `ID` = 90003;
                INSERT INTO `quest_template` SET
                    `ID` = 90003,
                    `QuestLevel` = 60,
                    `MinLevel` = 55,
                    `RewardXPDifficulty` = 7,
                    `RewardMoney` = 18000,
                    `Flags` = 136,
                    `RewardItem1` = 901201,
                    `RewardAmount1` = 1,
                    `RewardItem2` = 901203,
                    `RewardAmount2` = 2,
                    `LogTitle` = 'Azeroth Heroic Random (1st)',
                    `VerifiedBuild` = '12340';

        -- First Heroic Quest Template Addon
        DELETE FROM `quest_template_addon` WHERE (`ID` = 90003);
        INSERT INTO `quest_template_addon` SET
            `ID` = 90003,
            `SpecialFlags` = 9;

    -- Nth Heroic Quest

        -- Nth Heroic Quest Template
            DELETE FROM `quest_template` WHERE `ID` = 90004;
            INSERT INTO `quest_template` SET
                `ID` = 90004,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 5,
                `RewardMoney` = 9000,
                `Flags` = 136,
                `RewardItem1` = 901201,
                `RewardAmount1` = 1,
                `LogTitle` = 'Azeroth Heroic Random (Nth)',
                `VerifiedBuild` = '1234';

        -- Nth Heroic Quest Template Addon
        DELETE FROM `quest_template_addon` WHERE (`ID` = 90004);
        INSERT INTO `quest_template_addon` SET
            `ID` = 90004,
            `SpecialFlags` = 9;

-- Mythic Quests

    -- First Mythic Quest

        -- First Mythic Quest Template
            DELETE FROM `quest_template` WHERE `ID` = 90005;
            INSERT INTO `quest_template` SET
                `ID` = 90005,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 7,
                `RewardMoney` = 18000,
                `Flags` = 136,
                `RewardItem1` = 901205,
                `RewardAmount1` = 1,
                `RewardItem2` = 901203,
                `RewardAmount2` = 3,
                `LogTitle` = 'Azeroth Mythic Random (1st)',
                `VerifiedBuild` = '12340';

        -- First Mythic Quest Template Addon
            DELETE FROM `quest_template_addon` WHERE (`ID` = 90005);
            INSERT INTO `quest_template_addon` SET
                `ID` = 90005,
                `SpecialFlags` = 9;

    -- Nth Mythic Quest

        -- Nth Mythic Quest Template
            DELETE FROM `quest_template` WHERE `ID` = 90006;
            INSERT INTO `quest_template` SET
                `ID` = 90006,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 5,
                `RewardMoney` = 9000,
                `Flags` = 136,
                `RewardItem1` = 901205,
                `RewardAmount1` = 1,
                `LogTitle` = 'Azeroth Mythic Random (Nth)',
                `VerifiedBuild` = '12340';

        -- Nth Mythic Quest Template Addon
            DELETE FROM `quest_template_addon` WHERE (`ID` = 90006);
            INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
            (90006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9);

-- LFG Rewards
    DELETE FROM `lfg_dungeon_rewards`;
    REPLACE INTO `lfg_dungeon_rewards` (`dungeonId`,`maxLevel`,`firstQuestId`,`otherQuestId`) VALUES
    (285,80,25482,0), -- The Headless Horseman
    (286,80,25484,0), -- The Frost Lord Ahune
    (287,80,25483,0), -- Coren Direbrew
    (288,80,25485,0), -- The Crown Chemical Co.
    (400,15,24881,24889), -- Random Azeroth Dungeon
    (400,25,24882,24890), -- Random Azeroth Dungeon
    (400,34,24883,24891), -- Random Azeroth Dungeon
    (400,45,24884,24892), -- Random Azeroth Dungeon
    (400,55,24885,24893), -- Random Azeroth Dungeon
    (400,60,24886,24894), -- Random Azeroth Dungeon
    (401,60,90003,90004), -- Random Azeroth Heroic
    (402,64,24887,24895), -- Random Outland Dungeon
    (402,70,24888,24896), -- Random Outland Dungeon
    (403,70,24922,24923), -- Random Outland Heroic
    (404,80,24790,24791), -- Random Northrend Dungeon
    (405,80,24788,24789), -- Random Northrend Heroic
    (406,60,90005,90006); -- Random Azeroth Mythic