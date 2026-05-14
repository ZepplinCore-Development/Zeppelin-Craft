-- Wings of Freedom
SET @QUESTID := 441154;

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE (`ID` = @QUESTID);
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestLevel` = 40,
    `MinLevel` = 36,
    `QuestSortID` = 267,
    `RewardMoney` = 2342,
    `Flags` = 8,
    `RewardChoiceItemID1` = 19532,
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = 16336,
    `RewardChoiceItemQuantity2` = 1,
    `RewardFactionID1` = 68,
    `RewardFactionValue1` = 8,
    `AllowableRaces` = 690,
    `LogTitle` = 'Wings of Freedom',
    `LogDescription` = 'Kill Kurdros and Granistad then report back to Doctor Gregory Victory in Hammerfall',
    `QuestDescription` = 'The path between Hillsbrad Foothills and the Hinterlands has been plagued by the relentless attacks of two fierce griffins known as Kurdros and Granistad. These winged beasts have caused great disruption to our supply lines and the safety of our travelers. To secure this crucial route, we need these creatures removed. Were looking for brave adventurers to take on this perilous task.',
    `QuestCompletionLog` = 'Return to Doctor Gregory Victory in Hammerfall',
    `RequiredNpcOrGo1` = 2473,
    `RequiredNpcOrGo2` = 2474,
    `RequiredNpcOrGoCount1` = 1,
    `RequiredNpcOrGoCount2` = 1,
    `VerifiedBuild` = '0';

-- QUEST STARTER
DELETE FROM `creature_queststarter` WHERE (`quest` = @QUESTID);
INSERT INTO `creature_queststarter` SET
    `id` = 12920,
    `quest` = @QUESTID;

-- QUEST ENDER
DELETE FROM `creature_questender` WHERE (`quest` = @QUESTID);
INSERT INTO `creature_questender` SET
    `id` = 12920,
    `quest` = @QUESTID;

-- Granistad and Kurdros upgraded to 'elite' units, Health increased (was 1.15), Damage increased (was 1)
UPDATE `creature_template` SET `rank` = 1, `HealthModifier` = 1.5, `DamageModifier` = 1.8 WHERE (`entry` = 2473 OR `entry` = 2474);
