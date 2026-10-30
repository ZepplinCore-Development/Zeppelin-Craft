-- ============================================================================
-- Clothing the Horde (F-094 / I-432)
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Mastok Wrilehiss wants Ghostpaw Howler
-- (3824, level 23-24, 34 spawns south-west of the post) pelts shipped back to
-- Orgrimmar. Before this the Howlers were objective of nothing (stock or
-- retail). Fields follow stock Satyr Horns 6441 / Stonetalon Standstill 25.
-- ============================================================================

SET @QUESTID := 91222;
SET @ITEMID  := 58341;   -- Ghostpaw Pelt (Item Reservations: Misc 58300-58399)
SET @MASTOK  := 12737;   -- Mastok Wrilehiss (npcflag 3: QUESTGIVER already)
SET @HOWLER  := 3824;    -- Ghostpaw Howler

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 24,
    `MinLevel` = 20,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1800,
    `Flags` = 8,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @ITEMID,
    `RequiredItemCount1` = 10,
    `LogTitle` = 'Clothing the Horde',
    `LogDescription` = 'Collect 10 Ghostpaw Pelts from the Ghostpaw Howlers south-west of Splintertree Post and bring them to Mastok Wrilehiss.',
    `QuestDescription` = 'Every grunt Orgrimmar sends up here arrives in the same thing - a jerkin made for the Durotar sun. Then the rain comes off these trees and they stand guard shivering. The quartermasters in the city can''t stitch what they don''t have.$B$BThe Ghostpaw wolves south-west of here, down the valley toward the river, grow thick grey coats in this forest. Make yourself useful, $N. Bring me their pelts and I''ll crate them up for the tanners in the Drag. The Horde clothes its own.',
    `QuestCompletionLog` = 'Return to Mastok Wrilehiss at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'The caravan for Orgrimmar won''t wait forever. Got those pelts?');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 1, 'Good thick hides. These will be cloaks and boot linings by the time the next wind rider leaves. Some grunt on the Splintertree wall is going to be warm this season because of you, and he''ll never know your name. That''s the Horde. Here - for your trouble.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@MASTOK, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@MASTOK, @QUESTID);

-- ITEM - Ghostpaw Pelt (icon INV_Misc_Pelt_Wolf_01)
DELETE FROM `item_template` WHERE `entry` = @ITEMID;
INSERT INTO `item_template` SET
    `entry` = @ITEMID,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Ghostpaw Pelt',
    `displayid` = 1421,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 10,
    `stackable` = 10,
    `bonding` = 4,
    `Material` = 8,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop on Ghostpaw Howlers
DELETE FROM `creature_loot_template` WHERE `Entry` = @HOWLER AND `Item` = @ITEMID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@HOWLER, @ITEMID, 0, 60, 1, 1, 0, 1, 1, 'I-432 Ghostpaw Howler - Ghostpaw Pelt');

-- Quest-item tooltip line on the Howler (loot tables never drive it)
DELETE FROM `creature_questitem` WHERE `CreatureEntry` = @HOWLER AND `ItemId` = @ITEMID;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@HOWLER, 0, @ITEMID, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- polygon = convex hull of the 34 Howler spawns padded 40 yd; -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1614, -1619, 0),
    (@QUESTID, 0, 1, 1985, -1926, 0),
    (@QUESTID, 0, 2, 2153, -1708, 0),
    (@QUESTID, 0, 3, 2198, -1630, 0),
    (@QUESTID, 0, 4, 1976, -1353, 0),
    (@QUESTID, 0, 5, 1959, -1346, 0),
    (@QUESTID, 0, 6, 1681, -1464, 0),
    (@QUESTID, 1, 0, 2366, -2548, 0);
