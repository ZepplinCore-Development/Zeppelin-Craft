-- The Wildkin are Booming

SET @quest := 90000;

-- Quest Template
    DELETE FROM `quest_template` WHERE `ID` = @quest;
    INSERT INTO `quest_template` SET
        `ID` = @quest,
        `QuestLevel` = 18,
        `MinLevel` = 14,
        `QuestSortID` = 3525,
        `RewardXPDifficulty` = 5,
        `Flags` = 136,
        `RewardFactionID1` = 930,
        `RewardFactionValue1` = 5,
        `AllowableRaces` = 1101,
        `LogTitle` = 'The Wildkin Are Booming',
        `LogDescription` = 'Tracker Lyceon wants you to slay Wildkin North of Blood Watch.',
        `QuestDescription` = 'The once tranquil owlkin of the region have been exposed to the energies of the warp. One by one they have mutated and become feral. Their numbers are great and pose a threat to the nearby inhabitants of the region. Including us Draenai. To the north, you will find Ragefeather Ridge. Venture to the owlkin encampments and cull the feral horde.',
        `QuestCompletionLog` = 'Return to Tracker Lyceon at Blood Watch.',
        `RequiredNpcOrGo1` = 17324,
        `RequiredNpcOrGo2` = 17323,
        `RequiredNpcOrGo3` = 17322,
        `RequiredNpcOrGoCount1` = 5,
        `RequiredNpcOrGoCount2` = 5,
        `RequiredNpcOrGoCount3` = 5,
        `VerifiedBuild` = '0';

-- Quest Template Addon
    DELETE FROM `quest_template_addon` WHERE (`ID` = @quest);
    INSERT INTO `quest_template_addon` SET
        `ID` = @quest;

-- Quest Offer Reward
    DELETE FROM `quest_offer_reward` WHERE (`ID` = @quest);
    INSERT INTO `quest_offer_reward` SET
        `ID` = @quest,
        `RewardText` = 'The owlkin had lived in harmony with the land for thousands of years. It seems we have ruined them';

-- Quest Request Items
    DELETE FROM `quest_request_items` WHERE (`ID` = @quest);
    INSERT INTO `quest_request_items` SET
        `ID` = @quest,
        `EmoteOnComplete` = 1,
        `CompletionText` = 'The owlkin horde has been halted for now...';

-- Creature Quest Starter
    DELETE FROM `creature_queststarter` WHERE (`quest` = @quest);
    INSERT INTO `creature_queststarter` SET
        `id` = 17642,
        `quest` = @quest;

-- Creature Quest Ender
    DELETE FROM `creature_questender` WHERE (`quest` = @quest);
    INSERT INTO `creature_questender` SET
        `id` = 17642,
        `quest` = @quest;

-- Quest POI
    DELETE FROM `quest_poi` WHERE (`QuestID` = @quest);
    INSERT INTO `quest_poi` SET
        `QuestID` = @quest,
        `MapID` = 1,
        `WorldMapAreaId` = 476,
        `Flags` = 1;

-- Quest POI Points
    DELETE FROM `quest_poi_points` WHERE (`QuestID` = @quest);
    INSERT INTO `quest_poi_points` SET
        `QuestID` = @quest,
        `X` = -1690,
        `Y` = -11845;

