-- ============================================================================
-- Grease for the Lumber Camp (F-094 / I-453) - chain C2, step 2 of 2
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Pixel (12724) hands you a jar of
-- Pixel's Blade Grease to carry to Locke Okarr (11820) at the post's west
-- gate, who supplies the lumber camp (Warsong Supplies 6571 / Saw Blades 6581).
-- Deliver quest after Slime for the Saws 91231: StartItem + ProvidedItemCount
-- as the stock deliver quests 1918 / 824. Short walk, so XP diff 2.
-- ============================================================================

SET @QUESTID := 91232;
SET @PREV    := 91231;  -- Slime for the Saws
SET @PIXEL   := 12724;  -- Pixel
SET @LOCKE   := 11820;  -- Locke Okarr, Splintertree Post west gate (npcflag 2 already)
SET @GREASE  := 58350;  -- Pixel's Blade Grease (provided quest item)

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 22,
    `MinLevel` = 18,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 2,
    `RewardMoney` = 600,
    `Flags` = 8,
    `StartItem` = @GREASE,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 2,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @GREASE,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'Grease for the Lumber Camp',
    `LogDescription` = 'Take Pixel''s Blade Grease to Locke Okarr at the west gate of Splintertree Post.',
    `QuestDescription` = 'Here''s the first jar. Take it to Locke Okarr down at the west gate - big orc, loud voice, hates everything. He runs the supplies out to the lumber camp. He''ll love it.$B$BTell him one thin coat per blade. Not two. Two is how you get a saw flying across the camp. Ask me how I know.',
    `QuestCompletionLog` = 'Deliver Pixel''s Blade Grease to Locke Okarr at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 1, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'What is that smell? Is that from the goblin?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 1, 'Slime grease. From the goblin. Of course it is.$B$B...$B$BIt works. Bah! Do not tell him it works. One thin coat, you say? Fine. Here - for your trouble, and for carrying that stink all the way across the post.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@LOCKE, @QUESTID);

-- QUEST ITEM - Pixel's Blade Grease (icon of Flask of Oil 814)
DELETE FROM `item_template` WHERE `entry` = @GREASE;
INSERT INTO `item_template` SET
    `entry` = @GREASE,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Pixel''s Blade Grease',
    `displayid` = 18084,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 4,
    `description` = 'One thin coat per blade. Not two.',
    `Material` = 3,
    `VerifiedBuild` = 0;

-- QUEST POI (Ashenvale WorldMapArea 43): turn-in at Locke only.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2073, -2417, 0);
