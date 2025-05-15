-- Feeding Stromgarde
SET @QUESTID := 90007;
SET @ITEMID := 902200;

-- QUEST TEMPLATE
DELETE FROM `quest_template` WHERE `ID` = @QUESTID;

INSERT INTO `quest_template` SET
    `ID` = @QUESTID,
    `QuestLevel` = 37,
    `MinLevel` = 30,
    `QuestSortID` = 45,
    `RewardXPDifficulty` = 6,
    `RewardMoney` = 8697,
    `Flags` = 8,
    `RewardFactionID1` = 72,
    `RewardFactionValue1` = 6,
    `RewardFactionOverride1` = 15000,
    `AllowableRaces` = 1101,
    `LogTitle` = 'Feeding Stromgarde',
    `LogDescription` = 'Bring 30 Raptor Flanks to Prince Galen Trollbane at Stromgarde in Arathi Highlands.',
    `QuestDescription` = 'In these trying times, the salvation of Stromgarde lies in the wilderness of Arathi Highlands. The people starve, and I call upon your bravery to gather Raptor Flanks from these cunning creatures. Hunt them in the treacherous wilds, for you might be our only hope. Become the hero Stromgarde desperately needs!',
    `QuestCompletionLog` = 'Return to Prince Galen Trollbane at Stromgarde in Arathi Highlands.',
    `RequiredItemId1` = 902200,
    `RequiredItemCount1` = 30,
    `VerifiedBuild` = '0';

-- QUEST REWARD
DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
INSERT INTO `quest_offer_reward` SET
    `ID` = @QUESTID,
    `Emote1` = 66,
    `RewardText` = 'Your valiant efforts have not gone unnoticed. With the Raptor Flanks you have gathered, the people of Stromgarde will feast and regain their strength. You have become the beacon of hope in our darkest hour, and for that, I, Prince Galen Trollbane, am eternally grateful.';


-- QUEST STARTER
DELETE FROM `creature_queststarter` WHERE `quest` = @QUESTID;
INSERT INTO `creature_queststarter` SET
    `id` = 2607,
    `quest` = @QUESTID;

-- QUEST ENDER
DELETE FROM `creature_questender` WHERE `quest` = @QUESTID;
INSERT INTO `creature_questender` SET
    `id` = 2607,
    `quest` = @QUESTID;

-- QUEST ITEMS
DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
INSERT INTO `quest_request_items` SET
    `ID` = @QUESTID,
    `CompletionText` = 'Have you retrieved any Raptor Flanks? The people of Stromgarde are hungry.';

-- QUEST POI POINTS
DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi_points` SET
    `QuestID` = @QUESTID,
    `X` = -1331,
    `Y` = -2266;

-- QUEST POI
DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
INSERT INTO `quest_poi` SET
    `QuestID` = @QUESTID,
    `WorldMapAreaId` = 45,
    `Flags` = 1;

-- Item Template
DELETE FROM `item_template` WHERE `entry` = @ITEMID;
INSERT INTO `item_template` SET
    `entry` = @ITEMID,
    `class` = 12,
    `name` = 'Raptor Flank',
    `displayid` = 1762,
    `Quality` = 1,
    `stackable` = 50,
    `StatsCount` = 0,
    `delay` = 0,
    `bonding` = 4,
    `Material` = -1,
    `BagFamily` = 16384,
    `VerifiedBuild` = '0';

-- Highland Fleshstalker Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 2561 AND `ItemId` = @ITEMID);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 2561,
    `Idx` = 1,
    `ItemId` = @ITEMID;

-- Highland Fleshstalker Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 2561 AND `Item` = @ITEMID);
INSERT INTO `creature_loot_template` SET
    `Entry` = 2561,
    `Item` = @ITEMID,
    `Chance` = 80,
    `QuestRequired` = 1,
    `Comment` = 'Highland Fleshstalker - Raptor Flank';

-- Highland Strider Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 2559 AND `ItemId` = @ITEMID);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 2559,
    `Idx` = 1,
    `ItemId` = @ITEMID;

-- Highland Strider Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 2559 AND `Item` = @ITEMID);
INSERT INTO `creature_loot_template` SET
    `Entry` = 2559,
    `Item` = @ITEMID,
    `Chance` = 80,
    `QuestRequired` = 1,
    `Comment` = 'Highland Strider - Raptor Flank';

-- Highland Thrasher Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 2560 AND `ItemId` = @ITEMID);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 2560,
    `Idx` = 1,
    `ItemId` = @ITEMID;

-- Highland Thrasher Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 2560 AND `Item` = @ITEMID);
INSERT INTO `creature_loot_template` SET
    `Entry` = 2560,
    `Item` = @ITEMID,
    `Chance` = 80,
    `QuestRequired` = 1,
    `Comment` = 'Highland Thrasher - Raptor Flank';