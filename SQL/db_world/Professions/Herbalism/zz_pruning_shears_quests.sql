-- =====================================================
-- PRUNING SHEARS QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90008-90015) [ExclusiveGroup 90008]
-- Artisan: 8 city quests (90016-90023) [ExclusiveGroup 90016]
-- Master: 2 Outland quests (90024-90025) [ExclusiveGroup 90024]
-- Grand Master: 1 Dalaran quest (90026)
-- Total: 19 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Location-accurate quest text (Honor Hold, Thrallmar)
-- - Mage-appropriate flavor for Dorothy Egan (conjure/imbue)
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90008 AND 90026;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90008 AND 90026;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90008 AND 90026;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90008 AND 90026;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90008 AND 90026;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90008 AND 90026;

-- =====================================================
-- JOURNEYMAN SHEARS QUESTS (75+ Herbalism)
-- 20 Peacebloom + 20 Silverleaf
-- Reward: Journeyman''s Pruning Shears (57300)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90008: Stormwind (Tannysa - 5566)
-- -----------------------------------------------------
SET @quest := 90008;
SET @npc := 5566;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Tannysa in Stormwind',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90009: Ironforge (Reyna Stonebranch - 5137)
-- -----------------------------------------------------
SET @quest := 90009;
SET @npc := 5137;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Reyna Stonebranch in Ironforge',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90010: Darnassus (Firodren Mooncaller - 4204)
-- -----------------------------------------------------
SET @quest := 90010;
SET @npc := 4204;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Firodren Mooncaller in Darnassus',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90011: Orgrimmar (Jandi - 3404)
-- -----------------------------------------------------
SET @quest := 90011;
SET @npc := 3404;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Jandi in Orgrimmar',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90012: Thunder Bluff (Komin Winterhoof - 3013)
-- -----------------------------------------------------
SET @quest := 90012;
SET @npc := 3013;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Komin Winterhoof in Thunder Bluff',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90013: Undercity (Martha Alliestar - 4614)
-- -----------------------------------------------------
SET @quest := 90013;
SET @npc := 4614;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Martha Alliestar in Undercity',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90014: Exodar (Cemmorhan - 16736)
-- -----------------------------------------------------
SET @quest := 90014;
SET @npc := 16736;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Cemmorhan in Exodar',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90015: Silvermoon (Botanist Nathera - 16644)
-- -----------------------------------------------------
SET @quest := 90015;
SET @npc := 16644;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2447, -- Peacebloom
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 765, -- Silverleaf
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
    `QuestDescription` = 'You''ve been collecting herbs this whole time with your bare hands? Like some kind of animal? This won''t do. I tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Botanist Nathera in Silvermoon',
    `RewardItem1` = 57300,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90008;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Get to work, those herbs won''t gather themselves!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Thanks for collecting the herb order.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN SHEARS QUESTS (225+ Herbalism)
-- 20 Sungrass + 20 Blindweed
-- Reward: Artisan''s Pruning Shears (57301)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90016: Stormwind (Tannysa - 5566)
-- -----------------------------------------------------
SET @quest := 90016;
SET @npc := 5566;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Tannysa in Stormwind',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90017: Ironforge (Reyna Stonebranch - 5137)
-- -----------------------------------------------------
SET @quest := 90017;
SET @npc := 5137;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Reyna Stonebranch in Ironforge',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90018: Darnassus (Firodren Mooncaller - 4204)
-- -----------------------------------------------------
SET @quest := 90018;
SET @npc := 4204;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Firodren Mooncaller in Darnassus',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90019: Orgrimmar (Jandi - 3404)
-- -----------------------------------------------------
SET @quest := 90019;
SET @npc := 3404;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Jandi in Orgrimmar',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90020: Thunder Bluff (Komin Winterhoof - 3013)
-- -----------------------------------------------------
SET @quest := 90020;
SET @npc := 3013;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Komin Winterhoof in Thunder Bluff',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90021: Undercity (Martha Alliestar - 4614)
-- -----------------------------------------------------
SET @quest := 90021;
SET @npc := 4614;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Martha Alliestar in Undercity',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90022: Exodar (Cemmorhan - 16736)
-- -----------------------------------------------------
SET @quest := 90022;
SET @npc := 16736;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Cemmorhan in Exodar',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90023: Silvermoon (Botanist Nathera - 16644)
-- -----------------------------------------------------
SET @quest := 90023;
SET @npc := 16644;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Artisan Shears',
    `QuestDescription` = 'Your skills have grown considerably! Those old shears won''t cut it anymore. Bring me some higher quality herbs and I''ll outfit you with proper Artisan Pruning Shears.',
    `QuestCompletionLog` = 'Return the herbs to Botanist Nathera in Silvermoon',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work! These shears will serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ah, perfect specimens!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER SHEARS QUESTS (300+ Herbalism)
-- 20 Felweed + 20 Dreaming Glory
-- Reward: Master''s Pruning Shears (57302)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90024: Honor Hold Alliance (Rorelien - 18776)
-- -----------------------------------------------------
SET @quest := 90024;
SET @npc := 18776;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3483, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 22785, -- Felweed
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 22786, -- Dreaming Glory
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Master Shears',
    `QuestDescription` = 'The herbs of Outland require a master''s touch. Bring me some of the finest specimens from these strange lands, and I will provide you with Master Pruning Shears worthy of the challenge.',
    `QuestCompletionLog` = 'Return the herbs to Rorelien in Honor Hold',
    `RewardItem1` = 57302,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 300,
    `ExclusiveGroup` = 90024;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These shears are imbued with the essence of Outland. Use them well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Fascinating specimens from this alien world!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90025: Thrallmar Horde (Ruak Stronghorn - 18748)
-- -----------------------------------------------------
SET @quest := 90025;
SET @npc := 18748;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3483, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 22785, -- Felweed
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 22786, -- Dreaming Glory
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Master Shears',
    `QuestDescription` = 'The herbs of Outland require a master''s touch. Bring me some of the finest specimens from these strange lands, and I will provide you with Master Pruning Shears worthy of the challenge.',
    `QuestCompletionLog` = 'Return the herbs to Ruak Stronghorn in Thrallmar',
    `RewardItem1` = 57302,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 300,
    `ExclusiveGroup` = 90024;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These shears are imbued with the essence of Outland. Use them well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Fascinating specimens from this alien world!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER SHEARS QUEST (375+ Herbalism)
-- 20 Goldclover + 20 Tiger Lily
-- Reward: Grand Master''s Pruning Shears (57303)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90026: Dalaran (Dorothy Egan - 28704)
-- -----------------------------------------------------
SET @quest := 90026;
SET @npc := 28704;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 36901, -- Goldclover
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 36904, -- Tiger Lily
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 1091, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Pruning Shears',
    `LogDescription` = 'Collect herbs to exchange for a pair of Grand Master Shears',
    `QuestDescription` = 'You have reached the pinnacle of the herbalist''s craft! The frozen wastes of Northrend present unique challenges. Bring me samples of its hardy flora, and I will conjure you the finest Pruning Shears ever made - imbued with arcane power for Grand Master quality harvests!',
    `QuestCompletionLog` = 'Return the herbs to Dorothy Egan in Dalaran',
    `RewardItem1` = 57303,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 375;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Through my arcane arts, I have woven powerful enchantments into these shears. They will serve you well in the frozen north!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Remarkable! These Northrend herbs are unlike anything I''ve seen!';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
