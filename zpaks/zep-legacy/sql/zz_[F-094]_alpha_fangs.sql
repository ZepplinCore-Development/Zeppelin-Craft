-- ============================================================================
-- Alpha Fangs (F-094 / I-452) - chain B
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Senani Thunderheart (12696), who runs
-- the stock Ashenvale Hunt (6383 > 24 > 247), sends the hunter after the
-- Ghostpaw Alphas (3825, level 27-28, 25 spawns), the pack leaders above the
-- Howlers of Clothing the Horde 91222. No quest targeted them for either side.
-- Drop quest after Clothing the Horde 91222 (Mastok sends you to Senani).
-- Thunder Bluff rep as Senani's stock hunt quests.
-- Offered together with Antlers of the Elder Stag 91229 (same hills, one trip).
-- ============================================================================

SET @QUESTID := 91228;
SET @PREV    := 91222;  -- Clothing the Horde (Mastok Wrilehiss)
SET @SENANI  := 12696;  -- Senani Thunderheart (npcflag 2 already)
SET @FANG    := 58347;  -- Ghostpaw Alpha Fang (quest item)
SET @ALPHA   := 3825;   -- Ghostpaw Alpha

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 27,
    `MinLevel` = 22,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 2100,
    `Flags` = 8,
    `RewardFactionID1` = 81,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @FANG,
    `RequiredItemCount1` = 6,
    `LogTitle` = 'Alpha Fangs',
    `LogDescription` = 'Bring 6 Ghostpaw Alpha Fangs to Senani Thunderheart at Splintertree Post.',
    `QuestDescription` = 'Mastok tells me you took the Howlers'' pelts. Good. But the Howlers are only the voice of the Ghostpaw pack, $N. The ones who lead it are the Alphas - bigger, older, and clever enough to stay out of sight while the young ones die.$B$BA true hunter does not thin the herd from the bottom. Find the Alphas in the woods around Splintertree and bring me six of their fangs. Then the pack will learn to fear the Horde.',
    `QuestCompletionLog` = 'Return to Senani Thunderheart at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Have the Alphas fallen to you yet, $N?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 2, 'Six fangs, each as long as my finger. The Earth Mother made these wolves well, and you hunted them better.$B$BThe pack will think twice before it hunts this close to the post again.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@SENANI, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@SENANI, @QUESTID);

-- QUEST ITEM - Ghostpaw Alpha Fang (icon of Large Fang 5637)
DELETE FROM `item_template` WHERE `entry` = @FANG;
INSERT INTO `item_template` SET
    `entry` = @FANG,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Ghostpaw Alpha Fang',
    `displayid` = 2460,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 6,
    `stackable` = 6,
    `bonding` = 4,
    `Material` = 8,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop
DELETE FROM `creature_loot_template` WHERE `Item` = @FANG;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@ALPHA, @FANG, 0, 60, 1, 1, 0, 1, 1, 'I-452 Ghostpaw Alpha - Ghostpaw Alpha Fang');

DELETE FROM `creature_questitem` WHERE `ItemId` = @FANG;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@ALPHA, 0, @FANG, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1.
-- Two hulls: the main pack around the post (19) and a north-west group (5).
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1947, -2115, 0),
    (@QUESTID, 0, 1, 1962, -2180, 0),
    (@QUESTID, 0, 2, 1977, -2218, 0),
    (@QUESTID, 0, 3, 2565, -2822, 0),
    (@QUESTID, 0, 4, 2600, -2552, 0),
    (@QUESTID, 0, 5, 2572, -2467, 0),
    (@QUESTID, 0, 6, 2023, -2057, 0),
    (@QUESTID, 0, 7, 1986, -2032, 0),
    (@QUESTID, 1, 0, 2747, -2040, 0),
    (@QUESTID, 1, 1, 2930, -1978, 0),
    (@QUESTID, 1, 2, 3049, -1798, 0),
    (@QUESTID, 1, 3, 3099, -1667, 0),
    (@QUESTID, 1, 4, 2889, -1757, 0),
    (@QUESTID, 2, 0, 2311, -2555, 0);
