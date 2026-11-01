-- ============================================================================
-- A Warning for Splintertree (F-094 / I-454) - chain D step 2 of 2
-- ============================================================================
-- Horde, Zoram'gar Outpost -> Splintertree Post, Ashenvale. Je'neu Sancrea
-- (12736) binds the Fel Shards of 91233 and sends them east to Valusha
-- (17355), the blood elf at Splintertree who leads the stock Legion quests
-- (Destroy the Legion 9534, Never Again! 9536). Deliver quest; it doubles as a
-- breadcrumb from Zoram'gar to Splintertree. StartItem + ProvidedItemCount as
-- the stock deliver quests 1918 / 824.
-- ============================================================================

SET @QUESTID := 91234;
SET @PREV    := 91233;  -- Fel Remnants
SET @JENEU   := 12736;  -- Je'neu Sancrea, Zoram'gar Outpost
SET @VALUSHA := 17355;  -- Valusha, Splintertree Post (npcflag 2 already)
SET @SEALED  := 58352;  -- Sealed Fel Shards (provided quest item)

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 24,
    `MinLevel` = 19,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 3,
    `RewardMoney` = 900,
    `Flags` = 8,
    `StartItem` = @SEALED,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 3,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @SEALED,
    `RequiredItemCount1` = 1,
    `LogTitle` = 'A Warning for Splintertree',
    `LogDescription` = 'Take the Sealed Fel Shards to Valusha at Splintertree Post.',
    `QuestDescription` = 'I have bound the shards in stone and spirit-wrap. They will sleep, for a time.$B$BTake them east to Splintertree Post, at the far side of the forest. There is a sin''dorei there, Valusha, who hunts the Legion''s servants in Ashenvale. She will know what it means that fresh fel burns at Fire Scar Shrine - and she will want to see it with her own eyes.',
    `QuestCompletionLog` = 'Deliver the Sealed Fel Shards to Valusha at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, @PREV, 1, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'You carry something foul, $C. I can feel it from here.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 1, 'Fel, and recently spent. The shaman was right to send it.$B$BThe Legion''s servants are not content with Demon Fall Canyon, it seems. Thank you, $N. When you are ready, I will have work for you against them - the kind that ends with fewer demons in this forest.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@JENEU, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@VALUSHA, @QUESTID);

-- QUEST ITEM - Sealed Fel Shards (icon of Sealed Box 25727)
DELETE FROM `item_template` WHERE `entry` = @SEALED;
INSERT INTO `item_template` SET
    `entry` = @SEALED,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Sealed Fel Shards',
    `displayid` = 16028,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `stackable` = 1,
    `bonding` = 4,
    `description` = 'Bound in stone and spirit-wrap.',
    `Material` = 1,
    `VerifiedBuild` = 0;

-- QUEST POI (Ashenvale WorldMapArea 43): turn-in at Valusha only.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2352, -2523, 0);
