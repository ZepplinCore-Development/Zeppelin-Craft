-- Tanaris Field Sampling Quest Template
    DELETE FROM `quest_template` WHERE `ID` = 654;
    INSERT INTO `quest_template` SET
        `ID` = 654,
        `QuestLevel` = 46,
        `MinLevel` = 38,
        `QuestSortID` = 440,
        `RewardNextQuest` = 864,
        `RewardXPDifficulty` = 5,
        `ItemDrop1` = 9437,
        `ItemDrop2` = 9439,
        `ItemDrop3` = 9442,
        `RewardFactionID1` = 68,
        `RewardFactionValue1` = 5,
        `TimeAllowed` = 7200,
        `AllowableRaces` = 690,
        `LogTitle` = 'Tanaris Field Sampling',
        `LogDescription` = 'Acquire untested samples for 8 basilisks, 8 hyenas, and 8 scorpions. Bring the testing kit back to Chief Engineer Bilgewhizzle in Gadgetzan before the power source runs out.',   
        `QuestDescription` = 'Activating the power source makes the field testing kit start to glow and vibrate. It would seem to be working as planned.$B$BI will have it shipped immediately.$B$BAccording to Chief Engineer Bilgewhizzle, you now have some time to collect the data you need in the Tanaris desert.$B$BReturn to him when you have completed the task.',
        `QuestCompletionLog` = 'Return to Chief Engineer Bilgewhizzle at Gadgetzan in Tanaris.',
        `RequiredItemId1` = 9440,
        `RequiredItemId2` = 9441,
        `RequiredItemId3` = 9438,
        `RequiredItemId4` = 8523,
        `RequiredItemCount1` = 8,
        `RequiredItemCount2` = 8,
        `RequiredItemCount3` = 8,
        `RequiredItemCount4` = 1,
        `VerifiedBuild` = '12340';

-- Untested Basilisk Sample Item Template
    DELETE FROM `item_template` WHERE `entry` = 9437;
    INSERT INTO `item_template` SET
        `entry` = 9437,
        `class` = 12,
        `name` = 'Untested Basilisk Sample',
        `displayid` = 3563,
        `Quality` = 1,
        `Flags` = 65600,
        `stackable` = 20,
        `StatsCount` = 0,
        `delay` = 0,
        `spellid_1` = 11759,
        `bonding` = 4,
        `Material` = -1,
        `duration` = 7260,
        `VerifiedBuild` = '12340';

-- Untested Hyena Sample Item Template
    DELETE FROM `item_template` WHERE `entry` = 9439;
    INSERT INTO `item_template` SET
        `entry` = 9439,
        `class` = 12,
        `name` = 'Untested Hyena Sample',
        `displayid` = 11164,
        `Quality` = 1,
        `Flags` = 65600,
        `stackable` = 20,
        `StatsCount` = 0,
        `delay` = 0,
        `spellid_1` = 11760,
        `bonding` = 4,
        `Material` = -1,
        `duration` = 7260,
        `VerifiedBuild` = '12340';

-- Untested Scorpid Sample Item Template
    DELETE FROM `item_template` WHERE `entry` = 9442;
    INSERT INTO `item_template` SET
        `entry` = 9442,
        `class` = 12,
        `name` = 'Untested Scorpid Sample',
        `displayid` = 18712,
        `Quality` = 1,
        `Flags` = 65600,
        `stackable` = 20,
        `StatsCount` = 0,
        `delay` = 0,
        `spellid_1` = 11761,
        `bonding` = 4,
        `Material` = -1,
        `duration` = 7260,
        `VerifiedBuild` = '12340';


