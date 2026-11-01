-- ============================================================================
-- Antlers of the Elder Stag (F-094 / I-452) - chain B
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Senani Thunderheart (12696) finishes
-- the hunt with the Elder Shadowhorn Stags (3818, level 26-27, 78 spawns:
-- 28 round the post, 50 to the north-west). No quest targeted them.
-- Drop quest after Clothing the Horde 91222, offered together with Alpha Fangs
-- 91228 (same hills, one trip). Thunder Bluff rep, XP diff 6 as Senani's stock
-- finale The Hunt Completed 247.
-- Reward: choice of three item level 28 green rings, 6.0 weighted points each
-- (green ring budget 5.31, band 4.94-6.88), the Foulweald necklace split.
-- ============================================================================

SET @QUESTID  := 91229;
SET @PREV     := 91222;  -- Clothing the Horde (Mastok Wrilehiss)
SET @SENANI   := 12696;  -- Senani Thunderheart
SET @ANTLER   := 58348;  -- Elder Shadowhorn Antler (quest item)
SET @STAG     := 3818;   -- Elder Shadowhorn Stag
SET @RING_STR := 58358;  -- Ghostpaw Fang Ring     (Str / Sta)
SET @RING_AGI := 58359;  -- Shadowhorn Band        (Agi / Sta)
SET @RING_INT := 58360;  -- Antler-Bone Loop       (Int / Spi)

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 28,
    `MinLevel` = 22,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 6,
    `RewardMoney` = 2200,
    `Flags` = 8,
    `RewardChoiceItemID1` = @RING_STR,
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = @RING_AGI,
    `RewardChoiceItemQuantity2` = 1,
    `RewardChoiceItemID3` = @RING_INT,
    `RewardChoiceItemQuantity3` = 1,
    `RewardFactionID1` = 81,
    `RewardFactionValue1` = 6,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @ANTLER,
    `RequiredItemCount1` = 8,
    `LogTitle` = 'Antlers of the Elder Stag',
    `LogDescription` = 'Bring 8 Elder Shadowhorn Antlers to Senani Thunderheart at Splintertree Post.',
    `QuestDescription` = 'The wolf is the hunter of this forest, $N. The elder stag is its king. My people honour the great stags of Mulgore with a hunt each spring, and the Shadowhorn elders of Ashenvale deserve no less.$B$BThey graze in the hills around the post and in the open woods to the north-west. Bring me eight of their antlers, and I will carve something for you from antler and wolf fang, so the forest remembers who hunted here.',
    `QuestCompletionLog` = 'Return to Senani Thunderheart at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'The elder stags are wary, $N. Patience is half of any hunt.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 2, 'Eight crowns of antler. The hunt is complete, and it was a good one.$B$BI keep a fang from every wolf hunted near this post. Choose the ring that suits your hand, $N - fang for the fighter, horn for the stalker, bone for the one who listens to the spirits.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@SENANI, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@SENANI, @QUESTID);

-- QUEST ITEM - Elder Shadowhorn Antler (icon INV_Misc_Horn_01, display 13081)
DELETE FROM `item_template` WHERE `entry` = @ANTLER;
INSERT INTO `item_template` SET
    `entry` = @ANTLER,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Elder Shadowhorn Antler',
    `displayid` = 13081,
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
DELETE FROM `creature_loot_template` WHERE `Item` = @ANTLER;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@STAG, @ANTLER, 0, 50, 1, 1, 0, 1, 1, 'I-452 Elder Shadowhorn Stag - Elder Shadowhorn Antler');

DELETE FROM `creature_questitem` WHERE `ItemId` = @ANTLER;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@STAG, 0, @ANTLER, 0);

-- REWARDS - item level 28 greens, bind on pickup, as the stock ilvl 27-28
-- green rings (Azora's Will 4999, Heart Ring 5001).
DELETE FROM `item_template` WHERE `entry` IN (@RING_STR, @RING_AGI, @RING_INT);
INSERT INTO `item_template` SET
    `entry` = @RING_STR,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Ghostpaw Fang Ring',
    `displayid` = 9834,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 4200,
    `SellPrice` = 1050,
    `InventoryType` = 11,
    `ItemLevel` = 28,
    `RequiredLevel` = 23,
    `stackable` = 1,
    `stat_type1` = 4,
    `stat_value1` = 4,
    `stat_type2` = 7,
    `stat_value2` = 3,
    `bonding` = 1,
    `Material` = 4,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;
INSERT INTO `item_template` SET
    `entry` = @RING_AGI,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Shadowhorn Band',
    `displayid` = 9837,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 4200,
    `SellPrice` = 1050,
    `InventoryType` = 11,
    `ItemLevel` = 28,
    `RequiredLevel` = 23,
    `stackable` = 1,
    `stat_type1` = 3,
    `stat_value1` = 4,
    `stat_type2` = 7,
    `stat_value2` = 3,
    `bonding` = 1,
    `Material` = 4,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;
INSERT INTO `item_template` SET
    `entry` = @RING_INT,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Antler-Bone Loop',
    `displayid` = 9832,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 4200,
    `SellPrice` = 1050,
    `InventoryType` = 11,
    `ItemLevel` = 28,
    `RequiredLevel` = 23,
    `stackable` = 1,
    `stat_type1` = 5,
    `stat_value1` = 4,
    `stat_type2` = 6,
    `stat_value2` = 2,
    `bonding` = 1,
    `Material` = 4,
    `RequiredDisenchantSkill` = 50,
    `DisenchantID` = 4,
    `VerifiedBuild` = 0;

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1.
-- Two hulls: round the post (28) and north-west (50), 9-10 points each.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1949, -2197, 0),
    (@QUESTID, 0, 1, 1950, -2272, 0),
    (@QUESTID, 0, 2, 2472, -2731, 0),
    (@QUESTID, 0, 3, 2591, -2750, 0),
    (@QUESTID, 0, 4, 2652, -2733, 0),
    (@QUESTID, 0, 5, 2699, -2704, 0),
    (@QUESTID, 0, 6, 2620, -2506, 0),
    (@QUESTID, 0, 7, 2095, -2060, 0),
    (@QUESTID, 0, 8, 2062, -2061, 0),
    (@QUESTID, 0, 9, 1993, -2094, 0),
    (@QUESTID, 1, 0, 2683, -2039, 0),
    (@QUESTID, 1, 1, 2956, -2016, 0),
    (@QUESTID, 1, 2, 3519, -1659, 0),
    (@QUESTID, 1, 3, 3579, -1583, 0),
    (@QUESTID, 1, 4, 3548, -1455, 0),
    (@QUESTID, 1, 5, 3489, -1395, 0),
    (@QUESTID, 1, 6, 3440, -1356, 0),
    (@QUESTID, 1, 7, 3320, -1290, 0),
    (@QUESTID, 1, 8, 3075, -1390, 0),
    (@QUESTID, 2, 0, 2311, -2555, 0);
