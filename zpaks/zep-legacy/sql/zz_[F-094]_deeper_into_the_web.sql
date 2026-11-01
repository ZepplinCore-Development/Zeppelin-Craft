-- ============================================================================
-- Deeper Into the Web (F-094 / I-453) - chain C, follow-up to 91223
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Pixel (12724) wants the Wildthorn
-- Lurkers (3821, level 28-29, 26 spawns) east of the post culled after the
-- Venomspitters of A Sticky Situation 91223. No quest targeted them.
-- Kill > kill chain (PrevQuestID 91223). Numbers follow 91223 / Destroy the
-- Legion 9534.
-- ============================================================================

SET @QUESTID := 91230;
SET @PREV    := 91223;  -- A Sticky Situation
SET @PIXEL   := 12724;  -- Pixel (npcflag 2 already)
SET @LURKER  := 3821;   -- Wildthorn Lurker

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 29,
    `MinLevel` = 24,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 2400,
    `Flags` = 8,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredNpcOrGo1` = @LURKER,
    `RequiredNpcOrGoCount1` = 10,
    `LogTitle` = 'Deeper Into the Web',
    `LogDescription` = 'Kill 10 Wildthorn Lurkers east of Splintertree Post, then return to Pixel.',
    `QuestDescription` = 'Okay, bad news, good news. Good news: the Venomspitters are down, and my supply runs stopped coming back glued to trees. Bad news: those were the little ones.$B$BThe scouts found the big ones east of the post, all around the Warsong Lumber Camp - Wildthorn Lurkers. Real nasty. They sit in the brush and wait, and then you''re lunch. One of them took a whole crate of my springs, $N. A whole crate!$B$BTake out ten of them. For the Horde. And for my springs.',
    `QuestCompletionLog` = 'Return to Pixel at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Still sticky out there? Don''t touch anything in my workshop until you''ve washed.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Ten Lurkers! You know what that means? Safe roads, full crates, and nobody wrapped up in silk for a midnight snack.$B$BHere, take this. Hazard pay. I''d give you the springs back, but... let''s say they''re not really springs anymore.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 0 = RequiredNpcOrGo1.
-- Two hulls: the main nest east-south-east (18) and a group nearer the post (8).
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1,  0, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 2, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2008, -3408, 0),
    (@QUESTID, 0, 1, 2009, -3475, 0),
    (@QUESTID, 0, 2, 2040, -3496, 0),
    (@QUESTID, 0, 3, 2107, -3532, 0),
    (@QUESTID, 0, 4, 2560, -3689, 0),
    (@QUESTID, 0, 5, 2646, -3709, 0),
    (@QUESTID, 0, 6, 2948, -3599, 0),
    (@QUESTID, 0, 7, 2987, -3445, 0),
    (@QUESTID, 0, 8, 2899, -3421, 0),
    (@QUESTID, 0, 9, 2089, -3391, 0),
    (@QUESTID, 1, 0, 2240, -3027, 0),
    (@QUESTID, 1, 1, 2829, -3158, 0),
    (@QUESTID, 1, 2, 2995, -3147, 0),
    (@QUESTID, 1, 3, 2943, -2954, 0),
    (@QUESTID, 2, 0, 2310, -2513, 0);
