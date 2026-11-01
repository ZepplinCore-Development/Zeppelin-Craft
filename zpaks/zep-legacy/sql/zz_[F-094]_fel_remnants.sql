-- ============================================================================
-- Fel Remnants (F-094 / I-454) - chain D step 1 of 2
-- ============================================================================
-- Horde, Zoram'gar Outpost, Ashenvale. Je'neu Sancrea (12736) of the Earthen
-- Ring wants the fel shards carried by the demons at Fire Scar Shrine:
-- Felslayer (3774) and Lesser Felguard (3772), level 22-24, 30 spawns, about
-- 1,300 yd south-east of the outpost. No Horde quest targeted them.
-- Drop quest; Darkspear rep as Je'neu's stock 824. Next: A Warning for
-- Splintertree 91234 (deliver to Valusha, the post's Legion expert).
-- ============================================================================

SET @QUESTID  := 91233;
SET @JENEU    := 12736;  -- Je'neu Sancrea, Zoram'gar Outpost (npcflag 2 already)
SET @SHARD    := 58351;  -- Fel Shard (quest item)
SET @FELGUARD := 3772;   -- Lesser Felguard
SET @SLAYER   := 3774;   -- Felslayer

DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestType` = 2,
    `QuestLevel` = 23,
    `MinLevel` = 19,
    `QuestSortID` = 331,
    `RewardXPDifficulty` = 5,
    `RewardMoney` = 1700,
    `Flags` = 8,
    `RewardFactionID1` = 530,
    `RewardFactionValue1` = 5,
    `AllowableRaces` = 946,
    `RequiredItemId1` = @SHARD,
    `RequiredItemCount1` = 8,
    `LogTitle` = 'Fel Remnants',
    `LogDescription` = 'Bring 8 Fel Shards from the demons at Fire Scar Shrine to Je''neu Sancrea at Zoram''gar Outpost.',
    `QuestDescription` = 'The land itself is wounded at Fire Scar Shrine, $N. South-east of here, past the hills, the ground still burns where demons walked it long ago - and demons walk it still. Felslayers and lesser felguards guard the shrine, and every one of them carries a shard of the fel that called them.$B$BThose shards are poison to the earth. Each day they stay, the spirits of this forest grow weaker. Bring me eight of them. I cannot cleanse them, but I can bind them so they do no more harm.$B$BGo around the Shrine of Aessina on your way, $N. The night elves keep a guard there who has killed better warriors than either of us.',
    `QuestCompletionLog` = 'Return to Je''neu Sancrea at Zoram''gar Outpost in Ashenvale.',
    `VerifiedBuild` = 0;

DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `ProvidedItemCount`, `SpecialFlags`) VALUES
    (@QUESTID, 0, 0, 0, 0);

DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`) VALUES
    (@QUESTID, 1, 0, 'Do not hold the shards longer than you must, $N. They whisper.');

DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `RewardText`) VALUES
    (@QUESTID, 1, 'Set them down there, on the stone. Gently.$B$BEight shards, and the earth already breathes easier. But this is fel from the Burning Legion, $N, and fresh. Someone at Splintertree must hear of it.');

DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (@JENEU, @QUESTID);
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (@JENEU, @QUESTID);

-- QUEST ITEM - Fel Shard (icon of Felvine Shard 18501)
DELETE FROM `item_template` WHERE `entry` = @SHARD;
INSERT INTO `item_template` SET
    `entry` = @SHARD,
    `class` = 12,
    `subclass` = 0,
    `name` = 'Fel Shard',
    `displayid` = 21472,
    `Quality` = 1,
    `Flags` = 2048,
    `BuyCount` = 1,
    `ItemLevel` = 1,
    `maxcount` = 8,
    `stackable` = 8,
    `bonding` = 4,
    `description` = 'It whispers.',
    `Material` = 4,
    `VerifiedBuild` = 0;

-- LOOT - quest-only drop on both demon entries
DELETE FROM `creature_loot_template` WHERE `Item` = @SHARD;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
    (@FELGUARD, @SHARD, 0, 50, 1, 1, 0, 1, 1, 'I-454 Lesser Felguard - Fel Shard'),
    (@SLAYER,   @SHARD, 0, 50, 1, 1, 0, 1, 1, 'I-454 Felslayer - Fel Shard');

DELETE FROM `creature_questitem` WHERE `ItemId` = @SHARD;
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
    (@FELGUARD, 0, @SHARD, 0),
    (@SLAYER,   0, @SHARD, 0);

-- QUEST POI (Ashenvale WorldMapArea 43). ObjectiveIndex 4 = RequiredItemId1;
-- hull of the 30 spawns at Fire Scar Shrine, 11 points. -1 = turn-in.
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
    (@QUESTID, 0,  4, 1, 43, 0, 0, 1, 0),
    (@QUESTID, 1, -1, 1, 43, 0, 0, 1, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
    (@QUESTID, 0, 0, 2180, 73, 0),
    (@QUESTID, 0, 1, 2187, 40, 0),
    (@QUESTID, 0, 2, 2279, -3, 0),
    (@QUESTID, 0, 3, 2403, -13, 0),
    (@QUESTID, 0, 4, 2432, 5, 0),
    (@QUESTID, 0, 5, 2442, 453, 0),
    (@QUESTID, 0, 6, 2432, 514, 0),
    (@QUESTID, 0, 7, 2286, 486, 0),
    (@QUESTID, 0, 8, 2226, 388, 0),
    (@QUESTID, 0, 9, 2212, 361, 0),
    (@QUESTID, 0, 10, 2184, 297, 0),
    (@QUESTID, 1, 0, 3355, 1033, 0);
