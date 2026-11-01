-- ============================================================================
-- Slime for the Saws (F-094 / I-453) - chain C2, step 1 of 2
-- ============================================================================
-- Horde, Splintertree Post, Ashenvale. Pixel (12724) wants Rotting Slime
-- residue (3928, level 20-22, 40 spawns south of the post and round the
-- lumber camp) to cook into grease for the Warsong saw blades (his stock
-- Warsong Saw Blades 6581). No quest targeted the slimes (their Warsong Report
-- drop counts for nothing).
-- Drop quest. Numbers follow Troll Charm 6462 / 91222 at a lower level.
-- Next: Grease for the Lumber Camp 91232 (deliver to Locke Okarr).
-- ============================================================================

SET @QUESTID := 91231;
SET @PIXEL   := 12724;  -- Pixel
SET @RESIDUE := 58349;  -- Rotting Slime Residue (quest item)
SET @SLIME   := 3928;   -- Rotting Slime

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 22,
    `MinLevel` = 18,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1500,
    `Flags` = 8,
    `RewardFactionID1` = 76,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @RESIDUE,
    `RequiredItemCount1` = 6,
    `LogTitle` = 'Slime for the Saws',
    `LogDescription` = 'Bring 6 Rotting Slime Residues to Pixel at Splintertree Post.',
    `QuestDescription` = 'You know what eats a saw blade faster than night elf ironwood? Nothing. Nothing eats it faster. Those blades come back from the lumber camp smoking, $N.$B$BBut! I have a theory. The Rotting Slimes that ooze around south of the post - they''re slick, they''re sticky, and they don''t burn. Cook that down with a little of this and a little of that, and you''ve got the best saw grease this side of Booty Bay.$B$BScrape me up six good globs of residue. Don''t smell it. Seriously.',
    `QuestCompletionLog` = 'Return to Pixel at Splintertree Post in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Got my slime? You smell like you do.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 4, 'Oh, that''s ripe. That''s perfect. Give me a minute with the burner...$B$B...and done! Pixel''s Patented Blade Grease. Well, patent pending. Now somebody just needs to get it to the lumber camp.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@PIXEL, @QUESTID);

-- QUEST ITEM - Rotting Slime Residue (icon of Acidic Slime 6456)
DELETE FROM `item_template` WHERE `entry` = @RESIDUE;
INSERT INTO `item_template` SET
    `entry` = @RESIDUE,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Rotting Slime Residue',
    `displayid` = 2885,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 6,
    `stackable` = 6,
    `bonding` = 4,
    `description` = 'Don''t smell it.',
    `Material` = 3,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop
DELETE FROM `creature_loot_template` WHERE `Item` = @RESIDUE;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@SLIME, @RESIDUE, 0, 60, 1, 1, 0, 1, 1, 'I-453 Rotting Slime - Rotting Slime Residue');

DELETE FROM `creature_questitem` WHERE `ItemId` = @RESIDUE;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@SLIME, 0, @RESIDUE, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 1366, -2364, 0),
    (@QUESTID, 0, 1, 1819, -2899, 0),
    (@QUESTID, 0, 2, 2223, -2836, 0),
    (@QUESTID, 0, 3, 1847, -2296, 0),
    (@QUESTID, 0, 4, 1682, -2196, 0),
    (@QUESTID, 0, 5, 1378, -2253, 0),
    (@QUESTID, 1, 0, 2310, -2513, 0);
