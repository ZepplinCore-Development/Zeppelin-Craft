-- ============================================================================
-- Foulweald Prayer Beads (F-094 / I-435)
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Yama Snowhoof (12837, turn-in of
-- Freedom to Ruul 6482, the freed furbolg's escort) wants the prayer beads the
-- corrupted Foulweald (42 spawns, level 23-25, due west of the post) still
-- wear. Before this the only Horde use of the Foulweald was one Logging Rope
-- for Warsong Supplies 6571; their kill quest 1025 is Alliance only.
-- Reward: a choice of three necklaces Yama strings from the beads. Item level
-- 27 greens, fields follow the Ashenvale rewards beside it (Je'neu of the
-- Earthen Ring 824, King of the Foulweald 6621).
-- ============================================================================

SET @QUESTID := 91224;
SET @BEADS   := 58342;   -- Foulweald Prayer Beads (quest item)
SET @NECK_STR := 58343;  -- Foulweald Warbead Choker   (Str / Sta)
SET @NECK_AGI := 58344;  -- Foulweald Hunter's Beads   (Agi / Sta)
SET @NECK_INT := 58345;  -- Foulweald Spirit Beads     (Int / Spi)
-- Stat budget: all three cost 6.0 under the zep item scaler's STAT_WEIGHT (Sta 0.667,
-- primaries 1.0) - the same as stock greens at ilvl 25-31 (Brilliant Necklace 6.0,
-- Wolfpack Medallion 6.3, Glowing Green Talisman 6.7). compute_budget() itself is
-- fitted on epics ilvl 40+ and over-prices a green ilvl 27 neck about 10x.
SET @YAMA    := 12837;   -- Yama Snowhoof (npcflag 2: QUESTGIVER already)

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 25,
    `MinLevel` = 21,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1500,
    `Flags` = 8,
    `RewardChoiceItemID1` = @NECK_STR,
    `RewardChoiceItemQuantity1` = 1,
    `RewardChoiceItemID2` = @NECK_AGI,
    `RewardChoiceItemQuantity2` = 1,
    `RewardChoiceItemID3` = @NECK_INT,
    `RewardChoiceItemQuantity3` = 1,
    `RewardFactionID1` = 81,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @BEADS,
    `RequiredItemCount1` = 8,
    `LogTitle` = 'Foulweald Prayer Beads',
    `LogDescription` = 'Bring 8 Foulweald Prayer Beads from the Foulweald furbolgs west of Splintertree Post to Yama Snowhoof.',
    `QuestDescription` = 'The furbolgs were not always our enemies, $N. Before the sickness crept down from Felwood, the Foulweald kept the old ways. Each of them carried a strand of prayer beads, carved one by one, a bead for every ancestor who walked these woods before them.$B$BThey still wear them. They have forgotten what they mean, but they still wear them. That is the saddest thing I know.$B$BGo west to the Foulweald camp and bring me their beads. I will not let them rot in the mud with the ones who carried them. Bring me eight strands, and I will string the beads into something worthy of being worn again.',
    `QuestCompletionLog` = 'Return to Yama Snowhoof at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Do you carry the beads of the Foulweald, $N?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 2, 'Eight strands. Eight families. Ruul would weep to see them.$B$BSit with me a moment while I work. A bead for strength, a bead for the swift foot, a bead for the quiet mind - the furbolgs knew what each one asked of the one who wore it. Choose the strand that suits your path, $N, and carry their ancestors with honour, since they no longer can.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@YAMA, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@YAMA, @QUESTID);

-- QUEST ITEM - Foulweald Prayer Beads (icon INV_Jewelry_Necklace_19, the Ogre Warbeads strand)
DELETE FROM `item_template` WHERE `entry` = @BEADS;
INSERT INTO `item_template` SET
    `entry` = @BEADS,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Foulweald Prayer Beads',
    `displayid` = 32326,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 8,
    `stackable` = 8,
    `bonding` = 4,
    `description` = 'A bead for every ancestor.',
    `Material` = 4,
    `VerifiedBuild` = 0;

-- REWARDS - item level 27 greens, bind on pickup, as the 824 / 6621 rewards
DELETE FROM `item_template` WHERE `entry` IN (@NECK_STR, @NECK_AGI, @NECK_INT);
INSERT INTO `item_template` SET
    `entry` = @NECK_STR,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Foulweald Warbead Choker',
    `displayid` = 9658,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 5400,
    `SellPrice` = 1080,
    `InventoryType` = 2,
    `ItemLevel` = 27,
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
    `entry` = @NECK_AGI,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Foulweald Hunter''s Beads',
    `displayid` = 9857,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 5400,
    `SellPrice` = 1080,
    `InventoryType` = 2,
    `ItemLevel` = 27,
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
    `entry` = @NECK_INT,
    `class` = 4,
    `subclass` = 0,
    `name` = 'Foulweald Spirit Beads',
    `displayid` = 9860,
    `Quality` = 2,
    `BuyCount` = 1,
    `BuyPrice` = 5400,
    `SellPrice` = 1080,
    `InventoryType` = 2,
    `ItemLevel` = 27,
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

-- LOOT - quest-only drop on all six Foulweald entries
DELETE FROM `creature_loot_template` WHERE `Item` = @BEADS;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (3743, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Warrior - Foulweald Prayer Beads'),
    (3745, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Pathfinder - Foulweald Prayer Beads'),
    (3746, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Den Watcher - Foulweald Prayer Beads'),
    (3748, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Shaman - Foulweald Prayer Beads'),
    (3749, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Ursa - Foulweald Prayer Beads'),
    (3750, @BEADS, 0, 50, 1, 1, 0, 1, 1, 'I-435 Foulweald Totemic - Foulweald Prayer Beads');

-- Quest-item tooltip line (Idx 0 = stock Logging Rope 16743 on every Foulweald)
DELETE FROM `creature_questitem` WHERE `ItemId` = @BEADS;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (3743, 1, @BEADS, 0),
    (3745, 1, @BEADS, 0),
    (3746, 1, @BEADS, 0),
    (3748, 1, @BEADS, 0),
    (3749, 1, @BEADS, 0),
    (3750, 1, @BEADS, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- polygon = convex hull of the 42 Foulweald spawns padded 40 yd; -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2159, -1589, 0),
    (@QUESTID, 0, 1, 2170, -1622, 0),
    (@QUESTID, 0, 2, 2204, -1660, 0),
    (@QUESTID, 0, 3, 2292, -1585, 0),
    (@QUESTID, 0, 4, 2402, -1160, 0),
    (@QUESTID, 0, 5, 2400, -1152, 0),
    (@QUESTID, 0, 6, 2385, -1132, 0),
    (@QUESTID, 0, 7, 2362, -1107, 0),
    (@QUESTID, 0, 8, 2318, -1109, 0),
    (@QUESTID, 0, 9, 2144, -1428, 0),
    (@QUESTID, 0, 10, 2157, -1563, 0),
    (@QUESTID, 1, 0, 2331, -2574, 0);
