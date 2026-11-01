-- ============================================================================
-- Venison for Zoram'gar (F-094 / I-455) - chain E
-- ============================================================================
-- Horde, Zoram'gar Outpost, Ashenvale. Karang Amakkar (12757), who runs the
-- outpost, wants meat for the garrison from the Wild Bucks (3816, level 18-19,
-- 81 spawns) in the open woods east of the outpost. No quest targeted them.
-- Drop quest, offered at the same time as Strand Chitin 91235 (no chain: the
-- strand and the buck woods sit side by side). Numbers as 91235 (Orgrimmar rep
-- as Karang's stock 216).
-- ============================================================================

SET @QUESTID := 91236;
SET @KARANG  := 12757;  -- Karang Amakkar, Zoram'gar Outpost (npcflag 2 already)
SET @HAUNCH  := 58354;  -- Wild Buck Haunch (quest item)
SET @BUCK    := 3816;   -- Wild Buck

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 20,
    `MinLevel` = 15,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1300,
    `Flags` = 8,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @HAUNCH,
    `RequiredItemCount1` = 8,
    `LogTitle` = 'Venison for Zoram''gar',
    `LogDescription` = 'Bring 8 Wild Buck Haunches to Karang Amakkar at Zoram''gar Outpost.',
    `QuestDescription` = 'My grunts can hold this outpost against night elves, naga and worse. What they cannot hold against is an empty stomach. We have eaten nothing but fish for a month, $N. If I see one more fish I will throw it at the next Sentinel I meet.$B$BThe wild bucks graze in the open woods east of the outpost. Bring me eight haunches. Real meat. Tonight Zoram''gar feasts.',
    `QuestCompletionLog` = 'Return to Karang Amakkar at Zoram''gar Outpost in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Is that venison I smell, or more fish?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Meat! Real meat! Grunts - get the fire going!$B$BYou have done more for this outpost''s morale than a dozen dead Sentinels, $N. Take this, and save a place at the fire for yourself.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@KARANG, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@KARANG, @QUESTID);

-- QUEST ITEM - Wild Buck Haunch (icon of Haunch of Meat 2287)
DELETE FROM `item_template` WHERE `entry` = @HAUNCH;
INSERT INTO `item_template` SET
    `entry` = @HAUNCH,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Wild Buck Haunch',
    `displayid` = 2474,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 8,
    `stackable` = 8,
    `bonding` = 4,
    `Material` = 8,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop
DELETE FROM `creature_loot_template` WHERE `Item` = @HAUNCH;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@BUCK, @HAUNCH, 0, 60, 1, 1, 0, 1, 1, 'I-455 Wild Buck - Wild Buck Haunch');

DELETE FROM `creature_questitem` WHERE `ItemId` = @HAUNCH;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@BUCK, 0, @HAUNCH, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- hull of the 81 Wild Buck spawns, 12 points. -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 3099, 415, 0),
    (@QUESTID, 0, 1, 3325, 53, 0),
    (@QUESTID, 0, 2, 3595, -266, 0),
    (@QUESTID, 0, 3, 3961, -91, 0),
    (@QUESTID, 0, 4, 4123, 20, 0),
    (@QUESTID, 0, 5, 4108, 224, 0),
    (@QUESTID, 0, 6, 4033, 761, 0),
    (@QUESTID, 0, 7, 3773, 816, 0),
    (@QUESTID, 0, 8, 3475, 854, 0),
    (@QUESTID, 0, 9, 3267, 788, 0),
    (@QUESTID, 0, 10, 3168, 742, 0),
    (@QUESTID, 0, 11, 3145, 675, 0),
    (@QUESTID, 1, 0, 3345, 1014, 0);
