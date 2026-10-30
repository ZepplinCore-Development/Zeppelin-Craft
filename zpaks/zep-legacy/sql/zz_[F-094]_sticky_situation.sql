-- ============================================================================
-- A Sticky Situation (F-094 / I-432)
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Pixel (the goblin of Warsong Saw Blades
-- 6581) wants Wildthorn Venomspitters (3820, level 24-25) culled: their silk
-- keeps gumming up the Warsong shredders' saws. Before this the Venomspitters
-- were objective of nothing (stock or retail). Fields follow stock 25 / 6441.
-- ============================================================================

SET @QUESTID := 91223;
SET @PIXEL   := 12724;   -- Pixel (npcflag 3: QUESTGIVER already)
SET @SPIDER  := 3820;    -- Wildthorn Venomspitter

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 25,
    `MinLevel` = 21,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1900,
    `Flags` = 8,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredNpcOrGo1` = @SPIDER,
    `RequiredNpcOrGoCount1` = 10,
    `LogTitle` = 'A Sticky Situation',
    `LogDescription` = 'Kill 10 Wildthorn Venomspitters in the forest around Splintertree Post, then return to Pixel.',
    `QuestDescription` = 'You know what shuts down a lumber operation faster than night elves? Spiders. Big ones.$B$BThe Wildthorn Venomspitters web up every stand of trees the shredders try to cut. Silk gets into the saw teeth, the blades bind, the motors burn out, and guess who gets yelled at for it? Me! Every shredder I''ve unclogged this week cost me a day and a perfectly good pair of gloves.$B$BThin the Venomspitters out, $N. South-west of the post down toward the river, and up in the hills to the north - wherever the trees are thick. Fewer spiders, fewer webs, fewer screaming peons. I''ll make it worth your while.',
    `QuestCompletionLog` = 'Return to Pixel at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Another shredder came back wrapped up like a present this morning. Tell me you''ve been busy out there.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Ha! Two shredders ran a full shift today without a single web in the teeth. The foreman almost smiled. Almost. Here, $N - you just saved me a fortune in gloves.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 0 = RequiredNpcOrGo1.
-- The 28 Venomspitters sit in two bands, so two polygons: convex hulls of the
-- 16 west (x < 2400) and 12 east spawns, padded 40 yd; -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1619, -1588, 0),
    (@QUESTID, 0, 1, 2269, -2184, 0),
    (@QUESTID, 0, 2, 2316, -1909, 0),
    (@QUESTID, 0, 3, 2150, -1603, 0),
    (@QUESTID, 0, 4, 1929, -1380, 0),
    (@QUESTID, 0, 5, 1687, -1469, 0),
    (@QUESTID, 1, 0, 2530, -1956, 0),
    (@QUESTID, 1, 1, 2555, -2398, 0),
    (@QUESTID, 1, 2, 2720, -2575, 0),
    (@QUESTID, 1, 3, 2864, -2604, 0),
    (@QUESTID, 1, 4, 2899, -2501, 0),
    (@QUESTID, 1, 5, 2820, -2110, 0),
    (@QUESTID, 2, 0, 2310, -2513, 0);
