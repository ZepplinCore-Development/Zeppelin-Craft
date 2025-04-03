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

-- First Heroic Quest
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

DELETE FROM `quest_template_addon` WHERE (`ID` = 90003);
INSERT INTO `quest_template_addon` SET
    `ID` = 90003,
    `SpecialFlags` = 9;

-- Nth Heroic Quest
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

DELETE FROM `quest_template_addon` WHERE (`ID` = 90004);
INSERT INTO `quest_template_addon` SET
    `ID` = 90004,
    `SpecialFlags` = 9;
