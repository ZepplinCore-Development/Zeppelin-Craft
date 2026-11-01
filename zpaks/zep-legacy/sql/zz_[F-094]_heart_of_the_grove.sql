-- ============================================================================
-- Heart of the Grove (F-094 / I-451) - chain A
-- ============================================================================
-- Horde, Splintertree Post (west gate), Ashenvale. Gurda Ragescar (12718) wants the
-- living heartwood out of the Shadethicket elementals so her spirits can tell
-- her how deep the sickness goes. Drop quest after Foulweald Prayer Beads 91224
-- (Yama sends you to Gurda). Offered together with The Grovewarden 91227 and
-- alongside Timber Rights 91225: same elementals, one trip.
-- Numbers follow Satyr Horns 6441 / King of the Foulweald 6621 (lvl 26-27).
-- ============================================================================

SET @QUESTID   := 91226;
SET @PREV      := 91224;  -- Foulweald Prayer Beads (Yama Snowhoof)
SET @GURDA     := 12718;  -- Gurda Ragescar, Splintertree Post west gate (npcflag 2 already)
SET @HEARTWOOD := 58346;  -- Living Heartwood (quest item)
SET @STONE     := 3782;   -- Shadethicket Stone Mover
SET @BARK      := 3784;   -- Shadethicket Bark Ripper

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
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @HEARTWOOD,
    `RequiredItemCount1` = 6,
    `LogTitle` = 'Heart of the Grove',
    `LogDescription` = 'Bring 6 pieces of Living Heartwood from the Shadethicket elementals to Gurda Ragescar at Splintertree Post.',
    `QuestDescription` = 'Yama says the Foulweald went mad first - the sickness from Felwood, creeping south. Now Kuray''bin thinks the forest is angry because we cut it. They are both half right. Trees do not get up and walk because they are angry, $N. Something is calling them, and the sickness gives it the strength to be heard.$B$BEvery one of those elementals carries a piece of living heartwood at its core - green wood that should not still be green. Bring me six pieces. I will burn them, and the smoke will show me how deep the sickness has gone into the roots of this forest.',
    `QuestCompletionLog` = 'Return to Gurda Ragescar at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'The fire is ready. Do you have the heartwood?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 1, 'Still warm. Still alive. Watch the smoke, $N... there.$B$BThe sickness runs deep, but it all runs to one place: Elderbark, the Grovewarden. Cut off the head and the roots will heal. If it still stands, you know where to find it.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@GURDA, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@GURDA, @QUESTID);

-- QUEST ITEM - Living Heartwood (icon INV_Misc_Root_02, display 8232)
DELETE FROM `item_template` WHERE `entry` = @HEARTWOOD;
INSERT INTO `item_template` SET
    `entry` = @HEARTWOOD,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Living Heartwood',
    `displayid` = 8232,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 6,
    `stackable` = 6,
    `bonding` = 4,
    `description` = 'Green to the core, and faintly warm.',
    `Material` = 2,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop on both Shadethicket entries (the Grovewarden 900963
-- shares the Bark Ripper loot table, so it drops it too)
DELETE FROM `creature_loot_template` WHERE `Item` = @HEARTWOOD;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@STONE, @HEARTWOOD, 0, 50, 1, 1, 0, 1, 1, 'I-451 Shadethicket Stone Mover - Living Heartwood'),
    (@BARK,  @HEARTWOOD, 0, 50, 1, 1, 0, 1, 1, 'I-451 Shadethicket Bark Ripper - Living Heartwood');

-- Quest-item tooltip line (neither entry had a creature_questitem row)
DELETE FROM `creature_questitem` WHERE `ItemId` = @HEARTWOOD;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@STONE, 0, @HEARTWOOD, 0),
    (@BARK,  0, @HEARTWOOD, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- the same two hulls as Timber Rights 91225. -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1403, -2140, 0),
    (@QUESTID, 0, 1, 1406, -2162, 0),
    (@QUESTID, 0, 2, 2623, -2465, 0),
    (@QUESTID, 0, 3, 2555, -2396, 0),
    (@QUESTID, 0, 4, 2192, -2069, 0),
    (@QUESTID, 0, 5, 2107, -1991, 0),
    (@QUESTID, 0, 6, 1604, -1665, 0),
    (@QUESTID, 1, 0, 1807, -2866, 0),
    (@QUESTID, 1, 1, 1812, -2944, 0),
    (@QUESTID, 1, 2, 2020, -3299, 0),
    (@QUESTID, 1, 3, 2050, -3286, 0),
    (@QUESTID, 1, 4, 2654, -2830, 0),
    (@QUESTID, 1, 5, 2354, -2796, 0),
    (@QUESTID, 1, 6, 2282, -2795, 0),
    (@QUESTID, 1, 7, 1849, -2837, 0),
    (@QUESTID, 2, 0, 1938, -2337, 0);
