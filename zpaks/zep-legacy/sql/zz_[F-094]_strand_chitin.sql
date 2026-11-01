-- ============================================================================
-- Strand Chitin (F-094 / I-455) - chain E
-- ============================================================================
-- Horde, Zoram'gar Outpost, Ashenvale. Mitsuwa (12721) wants crawler shell to
-- face the outpost's shields. The Clattering (3812) and Spined (3814)
-- Crawlers, level 19-21, 68 spawns, line the Zoram Strand north of the
-- outpost. No Horde quest targeted them.
-- Drop quest; numbers follow Mitsuwa's stock Troll Charm 6462 and Naga at the
-- Zoram Strand 6442 (lvl 19-24, Darkspear rep).
-- Offered at the same time as Venison for Zoram'gar 91236 (Karang Amakkar).
-- ============================================================================

SET @QUESTID  := 91235;
SET @MITSUWA  := 12721;  -- Mitsuwa, Zoram'gar Outpost (npcflag 2 already)
SET @CHITIN   := 58353;  -- Strand Crawler Chitin (quest item)
SET @CLATTER  := 3812;   -- Clattering Crawler
SET @SPINED   := 3814;   -- Spined Crawler

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 20,
    `MinLevel` = 15,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1200,
    `Flags` = 8,
    `RewardFactionID1` = 530,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @CHITIN,
    `RequiredItemCount1` = 8,
    `LogTitle` = 'Strand Chitin',
    `LogDescription` = 'Bring 8 pieces of Strand Crawler Chitin to Mitsuwa at Zoram''gar Outpost.',
    `QuestDescription` = 'Dis outpost be a long way from Orgrimmar, mon, and de supply wagons don''t come often. When de night elves come knockin'', our shields be cracked wood and hope.$B$BBut de sea gives what de wagons don''t. De crawlers on de Zoram Strand, north along de shore, wear shells harder than bark. Bring me eight good plates of chitin, and I face every shield in Zoram''gar with dem.',
    `QuestCompletionLog` = 'Return to Mitsuwa at Zoram''gar Outpost in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'De crawlers pinch, but dey don''t pinch hard. You got my chitin?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Ha! Feel de weight of dat. Dis turn an arrow, mon, no problem.$B$BKarang be wantin'' a word too, if you got time. Somethin'' about de cookpot bein'' empty again.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@MITSUWA, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@MITSUWA, @QUESTID);

-- QUEST ITEM - Strand Crawler Chitin (icon INV_Misc_Shell_01, display 1395)
DELETE FROM `item_template` WHERE `entry` = @CHITIN;
INSERT INTO `item_template` SET
    `entry` = @CHITIN,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Strand Crawler Chitin',
    `displayid` = 1395,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 8,
    `stackable` = 8,
    `bonding` = 4,
    `Material` = 8,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop on both crawler entries
DELETE FROM `creature_loot_template` WHERE `Item` = @CHITIN;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@CLATTER, @CHITIN, 0, 50, 1, 1, 0, 1, 1, 'I-455 Clattering Crawler - Strand Crawler Chitin'),
    (@SPINED,  @CHITIN, 0, 50, 1, 1, 0, 1, 1, 'I-455 Spined Crawler - Strand Crawler Chitin');

DELETE FROM `creature_questitem` WHERE `ItemId` = @CHITIN;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@CLATTER, 0, @CHITIN, 0),
    (@SPINED,  0, @CHITIN, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- hull of the 68 strand spawns, 12 points. -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 3272, 1128, 0),
    (@QUESTID, 0, 1, 3478, 901, 0),
    (@QUESTID, 0, 2, 3597, 781, 0),
    (@QUESTID, 0, 3, 3999, 802, 0),
    (@QUESTID, 0, 4, 4152, 964, 0),
    (@QUESTID, 0, 5, 4180, 1000, 0),
    (@QUESTID, 0, 6, 4261, 1162, 0),
    (@QUESTID, 0, 7, 4288, 1264, 0),
    (@QUESTID, 0, 8, 4183, 1365, 0),
    (@QUESTID, 0, 9, 4114, 1392, 0),
    (@QUESTID, 0, 10, 3345, 1191, 0),
    (@QUESTID, 0, 11, 3305, 1157, 0),
    (@QUESTID, 1, 0, 3333, 1028, 0);
