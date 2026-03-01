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
-- Cleanup orphaned quest 90113 (removed: no Herbalism trainer in Shattrath)
DELETE FROM `quest_template` WHERE `ID` = 90113;
DELETE FROM `quest_template_addon` WHERE `ID` = 90113;
DELETE FROM `quest_offer_reward` WHERE `ID` = 90113;
DELETE FROM `quest_request_items` WHERE `ID` = 90113;
DELETE FROM `creature_queststarter` WHERE `quest` = 90113;
DELETE FROM `creature_questender` WHERE `quest` = 90113;

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Gathering herbs by hand? You''re missing out on valuable yields from each node. I have shears available - bring me 20 Peacebloom and 20 Silverleaf to replenish my stock, and they''re yours. You''ll gather more herbs per node with proper tools.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Good herbs. Here are your shears - you''ll notice the improved yields right away.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Peacebloom and 20 Silverleaf?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Bah! Picking herbs with yer bare fingers? Ye''re leaving half the harvest behind! I''ve got proper shears here - fetch me 20 Peacebloom and 20 Silverleaf fer me stock, and I''ll trade ye fer them. Ye''ll get more herbs from each node, I guarantee it.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Aye, fresh herbs these! Here ye go - these shears''ll double yer yields, mark me words!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those herbs? 20 Peacebloom and 20 Silverleaf, aye?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'I see you gather herbs without proper tools. The plants give more freely when treated with care and precision. I have shears available. If you bring me 20 Peacebloom and 20 Silverleaf for my work, I will trade them to you. You will find your yield increases, like morning dew collecting on leaves.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Elune''s blessings upon you. These herbs are well-gathered. May these shears help you harvest with greater harmony.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the herbs I require?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Picking herbs with hands? Wasteful. Need shears. Get more herbs from each plant. I have shears. 20 Peacebloom, 20 Silverleaf. Bring. Trade for shears. Simple.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Good. Fresh herbs. Take shears. Get more herbs now. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have herbs? 20 Peacebloom and 20 Silverleaf?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Brother/Sister, I see you gather herbs without proper tools. The Earth Mother teaches that respect for the plants brings greater bounty. I have shears here - bring me 20 Peacebloom and 20 Silverleaf for my needs, and I will trade them to you. You will find each plant yields more generously.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'The Earth Mother smiles on this exchange. These herbs are well-tended. May these shears help you harvest with wisdom.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the herbs, friend?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Gathering herbs without tools? How... inefficient. You''re wasting valuable material with each harvest. I have shears available - bring me 20 Peacebloom and 20 Silverleaf to replenish my stock, and I''ll part with them. Your yields will become considerably less... pitiful.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Acceptable quality. Here are your shears - do try not to waste so much material from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the herbs I require?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'I observe you harvest herbs without refined instruments. Your technique is sound, but proper tools would increase your yield significantly. I have shears available - if you bring me 20 Peacebloom and 20 Silverleaf to replenish my supplies, I will trade them to you. The Light will guide your hands to greater harvests.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'The Light be with you. These materials are well-chosen. May these shears aid you in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials I require?';

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
    `QuestSortID` = -24, -- Herbalism
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
    `QuestDescription` = 'Gathering with such... primitive methods? How do you expect to maximize your harvest without proper tools? I have shears available. Bring me 20 Peacebloom and 20 Silverleaf - proper specimens, mind you - and I''ll trade them to you. Your yield will improve dramatically.$B$BRequired:$B- 20 Peacebloom$B- 20 Silverleaf',
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
    `RewardText` = 'Adequate specimens, I suppose. Here are your shears - do try to maintain some standards with your harvests from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the herbs I requested?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Your skills are growing, but those Journeyman shears are getting dull on tougher plants - you''re missing extra herbs from each node. I have Artisan shears here. Trade in your old Journeyman shears and bring me 20 Sungrass and 20 Blindweed for my stock, and the Artisan shears are yours. Your yield will increase considerably.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Tannysa in Stormwind',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality herbs. I''ll take those old shears - here are your Artisan shears. You''ll gather far more from each node now.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Sungrass, 20 Blindweed, and your old Journeyman shears?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Yer outgrowing those Journeyman shears, I see! They''re dullin'' on the tougher plants - yer missin'' herbs ye could be gettin''! Time fer an upgrade, aye? Trade in yer old shears and fetch me 20 Sungrass and 20 Blindweed fer me orders, and these Artisan shears are yers. Ye''ll be harvesting twice as much from each node.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Reyna Stonebranch in Ironforge',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality herbs these! I''ll take that old pair off yer hands. Here''s yer Artisan shears - sharper than a dragon''s tooth!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those herbs and yer old Journeyman shears? 20 Sungrass, 20 Blindweed, and the old shears, aye?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman shears have served well, but I see them struggling with hardier plants now - you lose precious herbs from each harvest. I have Artisan shears available. Trade in your old Journeyman shears and bring me 20 Sungrass and 20 Blindweed for my work, and the Artisan shears are yours. The plants will yield more generously to sharper tools.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Firodren Mooncaller in Darnassus',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These herbs speak of your growing mastery. I will accept your old Journeyman shears. May Elune guide your hands as these Artisan shears serve you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the herbs and your old Journeyman shears?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Journeyman shears too dull now. Tougher plants. Losing herbs. Need better shears. Trade in old Journeyman shears. 20 Sungrass, 20 Blindweed. Bring. Get Artisan shears. Get more herbs from each plant.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Jandi in Orgrimmar',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good herbs. Strong. Give old shears. Take Artisan shears. Much better. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have herbs and old Journeyman shears? 20 Sungrass, 20 Blindweed, old shears?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman shears have guided you well, but I see them dulling on stronger plants - precious herbs are lost with each harvest. The Earth Mother teaches that better tools bring harmony with the land. I have Artisan shears for you. Trade in your old Journeyman shears and bring me 20 Sungrass and 20 Blindweed from hardier growth, and we shall trade. Your yields will flow more freely.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Komin Winterhoof in Thunder Bluff',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this trade. Your old Journeyman shears have served their purpose well. These Artisan shears will carry you far on your path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the herbs and your old Journeyman shears, friend?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Ah, still struggling with those Journeyman shears? How... wasteful. I see them failing on hardier plants - you''re losing valuable herbs with each pathetic harvest. I have Artisan shears available. Trade in that inadequate Journeyman pair and bring me 20 Sungrass and 20 Blindweed, and your... pitiful... yields will improve considerably.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Martha Alliestar in Undercity',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate quality, I suppose. I''ll dispose of those pitiful Journeyman shears for you. Here are your Artisan shears - do try to harvest with a bit more... efficiency... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the herbs and that old Journeyman pair?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'I see your mastery grows. Those Journeyman shears served their purpose, but they struggle with tougher plants now - you lose valuable material with each harvest. I have Artisan shears available. Trade in your old Journeyman shears and bring me 20 Sungrass and 20 Blindweed to replenish my workshop, and I will trade them to you. The Light will guide your hands to greater yields.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Cemmorhan in Exodar',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines upon this exchange. I will accept your old Journeyman shears. These materials are well-selected. This Artisan pair will aid your continued growth.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials and your old Journeyman shears?';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8838, -- Sungrass
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8839, -- Blindweed
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57300, -- Journeyman's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Pruning Shears',
    `LogDescription` = 'Trade in your Journeyman shears and collect herbs to exchange for Artisan Shears',
    `QuestDescription` = 'Still using Journeyman shears for artisan-level plants? How do you expect to maximize yields with such inferior equipment? I see those dull blades wasting precious material. I have Artisan shears available. Relinquish that inferior Journeyman pair and bring me 20 Sungrass and 20 Blindweed - quality specimens, please - and we shall trade. Your harvest efficiency will improve markedly.$B$BRequired:$B- 20 Sungrass$B- 20 Blindweed',
    `QuestCompletionLog` = 'Return the herbs to Botanist Nathera in Silvermoon',
    `RewardItem1` = 57301,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90008, -- Requires Journeyman tier
    `ExclusiveGroup` = 90016;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality, I suppose. I''ll take that inferior Journeyman pair off your hands. Here are your Artisan shears - now perhaps your harvests will meet proper standards.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the herbs and that inferior Journeyman pair?';

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
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 22785, -- Felweed
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 22786, -- Dreaming Glory
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57301, -- Artisan's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Pruning Shears',
    `LogDescription` = 'Trade in your Artisan shears and collect herbs to exchange for Master Shears',
    `QuestDescription` = 'Welcome to Outland, herbalist. The plants here are far tougher than anything from Azeroth - your Artisan shears will struggle with them, and you''ll miss valuable herbs from each harvest. I have Master shears designed for Outland flora. Trade in your old Artisan shears and bring me 20 Felweed and 20 Dreaming Glory from these twisted lands, and the Master shears are yours. You''ll need the increased yield for the challenges ahead.$B$BRequired:$B- 20 Felweed$B- 20 Dreaming Glory',
    `QuestCompletionLog` = 'Return the herbs to Rorelien in Honor Hold',
    `RewardItem1` = 57302,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90016, -- Requires Artisan tier
    `ExclusiveGroup` = 90024;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality specimens from this alien world. I''ll take those Artisan shears - they served their purpose. These Master shears are built for Outland''s harsh flora - they will serve you well here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Felweed, 20 Dreaming Glory, and your old Artisan shears?';

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
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 22785, -- Felweed
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 22786, -- Dreaming Glory
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57301, -- Artisan's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Pruning Shears',
    `LogDescription` = 'Trade in your Artisan shears and collect herbs to exchange for Master Shears',
    `QuestDescription` = 'Brother/Sister, the Earth Mother''s voice is different in this shattered land. The plants here are far hardier than those of Azeroth - your Artisan shears struggle with their toughness, and precious herbs are lost. I have Master shears for these twisted lands. Trade in your old Artisan shears and bring me 20 Felweed and 20 Dreaming Glory from Outland''s strange flora, and we shall trade. Greater harvests will flow from these stronger blades.$B$BRequired:$B- 20 Felweed$B- 20 Dreaming Glory',
    `QuestCompletionLog` = 'Return the herbs to Ruak Stronghorn in Thrallmar',
    `RewardItem1` = 57302,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90016, -- Requires Artisan tier
    `ExclusiveGroup` = 90024;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother guides this exchange. Your old Artisan shears served well in Azeroth. These Master shears will help you harvest Outland''s bounty more fully.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the Outland herbs and your old Artisan shears, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- Quest 90113 removed: no Herbalism trainer exists in Shattrath.
-- Master tier is Alliance (Honor Hold, 90024) + Horde (Thrallmar, 90025) only.

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
    `QuestSortID` = -24, -- Herbalism
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 36901, -- Goldclover
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 36904, -- Tiger Lily
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57302, -- Master's Pruning Shears (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Pruning Shears',
    `LogDescription` = 'Trade in your Master shears and collect herbs to exchange for Grand Master Shears',
    `QuestDescription` = 'Northrend presents new challenges for even master herbalists. The arctic plants here have bark thick as iron and roots frozen solid - your Master shears will feel sluggish, and you''ll miss valuable herbs from each node. I have Grand Master shears, the finest tools available. Trade in your old Master shears and bring me 20 Goldclover and 20 Tiger Lily from Northrend''s frozen flora, and I will conjure the Grand Master shears for you - imbued with arcane power for maximum yields.$B$BRequired:$B- 20 Goldclover$B- 20 Tiger Lily',
    `QuestCompletionLog` = 'Return the herbs to Dorothy Egan in Dalaran',
    `RewardItem1` = 57303,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 182, -- Herbalism
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90024; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality specimens from the frozen wastes! I''ll take those Master shears - you''ve outgrown them. Through my arcane arts, I have woven powerful enchantments into these Grand Master shears. You''ll harvest far more from each Northrend node now!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Goldclover, 20 Tiger Lily, and your old Master shears?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Replace with reference conditions so
-- completing ANY city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90016 AND 90026;

-- Reference condition -90008: completed ANY Journeyman shears quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90008;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90008, 0, 0, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Stormwind)'),
(-90008, 0, 0, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Ironforge)'),
(-90008, 0, 0, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Darnassus)'),
(-90008, 0, 0, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Orgrimmar)'),
(-90008, 0, 0, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Thunder Bluff)'),
(-90008, 0, 0, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Undercity)'),
(-90008, 0, 0, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Exodar)'),
(-90008, 0, 0, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'JM shears rewarded (Silvermoon)');

-- Reference condition -90016: completed ANY Artisan shears quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90016;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90016, 0, 0, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Stormwind)'),
(-90016, 0, 0, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Ironforge)'),
(-90016, 0, 0, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Darnassus)'),
(-90016, 0, 0, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Orgrimmar)'),
(-90016, 0, 0, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Thunder Bluff)'),
(-90016, 0, 0, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Undercity)'),
(-90016, 0, 0, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Exodar)'),
(-90016, 0, 0, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'Artisan shears rewarded (Silvermoon)');

-- Reference condition -90024: completed ANY Master shears quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90024;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90024, 0, 0, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'Master shears rewarded (Honor Hold)'),
(-90024, 0, 0, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'Master shears rewarded (Thrallmar)');

-- Artisan quests: require any Journeyman shears
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90016 AND 90023;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90016, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (SW) - any JM shears'),
(19, 0, 90017, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (IF) - any JM shears'),
(19, 0, 90018, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (Darn) - any JM shears'),
(19, 0, 90019, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (Org) - any JM shears'),
(19, 0, 90020, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (TB) - any JM shears'),
(19, 0, 90021, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (UC) - any JM shears'),
(19, 0, 90022, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (Exo) - any JM shears'),
(19, 0, 90023, 0, 0, -90008, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Shears (SM) - any JM shears');

-- Master quests: require any Artisan shears
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90024, 90025);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90024, 0, 0, -90016, 0, 0, 0, 0, 0, 0, 0, '', 'Master Shears (HH) - any Artisan shears'),
(19, 0, 90025, 0, 0, -90016, 0, 0, 0, 0, 0, 0, 0, '', 'Master Shears (Thrall) - any Artisan shears');

-- Grand Master quest: require any Master shears
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90026;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90026, 0, 0, -90024, 0, 0, 0, 0, 0, 0, 0, '', 'GM Shears (Dalaran) - any Master shears');
