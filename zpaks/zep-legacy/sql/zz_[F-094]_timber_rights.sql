-- ============================================================================
-- Timber Rights (F-094 / I-451) - chain A
-- ============================================================================
-- Horde, Splintertree Post (west gate), Ashenvale. Kuray'bin (12867) wants
-- the Shadethicket elementals that attack the Warsong loggers culled (the
-- Warsong Lumber Camp proper, peons and grunts only, is ~800 yd east).
-- The Stone Movers (3782) and Bark Rippers (3784), level 25-27, stand
-- in the woods south-west and south-east of Splintertree Post. Before this no
-- Horde quest targeted them (the Warsong Report drop counts for nothing).
-- Kill quest, multi-objective. Numbers follow Kuray'bin's own Ashenvale
-- Outrunners 6503 (Darkspear rep) and Satyr Horns 6441 (lvl 26, 20s).
-- No chain: runs alongside Gurda's Heart of the Grove 91226 and The Grovewarden
-- 91227, which use the same elementals, so all three are one trip.
-- ============================================================================

SET @QUESTID  := 91225;
SET @KURAYBIN := 12867;  -- Kuray'bin, Splintertree Post west gate (npcflag 2 already)
SET @STONE    := 3782;   -- Shadethicket Stone Mover
SET @BARK     := 3784;   -- Shadethicket Bark Ripper

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 26,
    `MinLevel` = 22,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 2000,
    `Flags` = 8,
    `RewardFactionID1` = 530,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredNpcOrGo1` = @BARK,
    `RequiredNpcOrGoCount1` = 8,
    `RequiredNpcOrGo2` = @STONE,
    `RequiredNpcOrGoCount2` = 8,
    `LogTitle` = 'Timber Rights',
    `LogDescription` = 'Kill 8 Shadethicket Bark Rippers and 8 Shadethicket Stone Movers, then return to Kuray''bin at Splintertree Post.',
    `QuestDescription` = 'Every tree we cut, mon, the forest answers. Not the night elves - the forest itself. Walking stone and living bark, the Shadethicket, they call them. They tear down the cutting lines at the lumber camp and drag our peons off the slopes.$B$BHellscream wants timber for the war, and Kuray''bin wants to keep his head. So we make a deal with the forest: it stops walking, or it stops standing.$B$BThe Bark Rippers and Stone Movers roam the woods south of Splintertree, both sides of the road. Break eight of each and the crews can work again.',
    `QuestCompletionLog` = 'Return to Kuray''bin at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'The saws are quiet, $N. That means the forest is still winning.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Ha! Listen to that - axes, mon. Real work again.$B$BBut Gurda says this is not the end of it. Something in the grove keeps waking them up. If she has not put you to work yet, she will.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@KURAYBIN, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@KURAYBIN, @QUESTID);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 0 = RequiredNpcOrGo1,
-- 1 = RequiredNpcOrGo2. The Rippers and Stone Movers share their ground, so
-- both objectives get the same two hulls (south-west and south-east groups,
-- Scripts/F-094/quest_poi_hull.py 3782,3784 --eps 300). -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2,  1, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 3,  1, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 4, -1, 1, 43, 0, 0, 1, 0);

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
    (@QUESTID, 2, 0, 1403, -2140, 0),
    (@QUESTID, 2, 1, 1406, -2162, 0),
    (@QUESTID, 2, 2, 2623, -2465, 0),
    (@QUESTID, 2, 3, 2555, -2396, 0),
    (@QUESTID, 2, 4, 2192, -2069, 0),
    (@QUESTID, 2, 5, 2107, -1991, 0),
    (@QUESTID, 2, 6, 1604, -1665, 0),
    (@QUESTID, 3, 0, 1807, -2866, 0),
    (@QUESTID, 3, 1, 1812, -2944, 0),
    (@QUESTID, 3, 2, 2020, -3299, 0),
    (@QUESTID, 3, 3, 2050, -3286, 0),
    (@QUESTID, 3, 4, 2654, -2830, 0),
    (@QUESTID, 3, 5, 2354, -2796, 0),
    (@QUESTID, 3, 6, 2282, -2795, 0),
    (@QUESTID, 3, 7, 1849, -2837, 0),
    (@QUESTID, 4, 0, 2055, -2400, 0);
