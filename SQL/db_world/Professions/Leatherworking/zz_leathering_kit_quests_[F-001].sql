-- =====================================================
-- LEATHERING KIT QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90065-90072) [ExclusiveGroup 90065]
-- Expert: 8 city quests (90073-90080) [ExclusiveGroup 90073]
-- Artisan: 8 city quests (90081-90088) [ExclusiveGroup 90081]
-- Master: 1 Shattrath quest (90089)
-- Grand Master: 1 Dalaran quest (90090)
-- Total: 26 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive leather requirements matching skill tiers
-- - Turn-in: 20 leather + 5 hides per tier
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90065 AND 90090;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90065 AND 90090;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90065 AND 90090;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90065 AND 90090;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90065 AND 90090;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90065 AND 90090;

-- ===================
-- ADD QUESTGIVER FLAG TO TRAINERS
-- ===================
-- Some Alliance trainers + Outland/Northrend trainers missing QUESTGIVER (2) flag
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` IN (
    5564,  -- Simon Tanner (Stormwind)
    5127,  -- Fimble Finespindle (Ironforge)
    16688, -- Lynalis (Silvermoon)
    16728, -- Akham (Exodar)
    19187, -- Darmari (Shattrath)
    28700  -- Diane Cannings (Dalaran)
) AND (`npcflag` & 2) = 0; -- Only if not already set

-- =====================================================
-- JOURNEYMAN LEATHERING KIT QUESTS (75+ Leatherworking)
-- 20 Medium Leather + 5 Medium Hide
-- Reward: Journeyman Leathering Kit (57612)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90065: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90065;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Simon Tanner in Stormwind',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90066: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90066;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90067: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90067;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Telonis in Darnassus',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90068: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90068;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Akham in The Exodar',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90069: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90069;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Karolek in Orgrimmar',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90070: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90070;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Una in Thunder Bluff',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90071: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90071;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Arthur Moore in Undercity',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90072: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90072;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools, I see. No wonder your leatherwork takes so long. Bring me some medium leather and hides, and I''ll set you up with a proper leathering kit that''ll speed up your crafting considerably.',
    `QuestCompletionLog` = 'Return the leather to Lynalis in Silvermoon City',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit will serve you well. Now get back to your workbench!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- EXPERT LEATHERING KIT QUESTS (150+ Leatherworking)
-- 20 Heavy Leather + 5 Heavy Hide
-- Reward: Expert Leathering Kit (57613)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90073: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90073;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Simon Tanner in Stormwind',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90074: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90074;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90075: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90075;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Telonis in Darnassus',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90076: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90076;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Akham in The Exodar',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90077: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90077;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Karolek in Orgrimmar',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90078: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90078;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Una in Thunder Bluff',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90079: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90079;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Arthur Moore in Undercity',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90080: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90080;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are improving, but that kit is holding you back. Bring me heavy leather and hides, and I''ll provide you with tools worthy of an expert leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Lynalis in Silvermoon City',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. This kit will serve an expert well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN LEATHERING KIT QUESTS (225+ Leatherworking)
-- 20 Rugged Leather + 5 Rugged Hide
-- Reward: Artisan Leathering Kit (57614)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90081: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90081;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Simon Tanner in Stormwind',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90082: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90082;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90083: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90083;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Telonis in Darnassus',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90084: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90084;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Akham in The Exodar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90085: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90085;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Karolek in Orgrimmar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90086: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90086;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Una in Thunder Bluff',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90087: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90087;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Arthur Moore in Undercity',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90088: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90088;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'You''ve come a long way in your craft. Now it''s time for tools befitting an artisan. Bring me rugged leather and hides from the toughest beasts, and I''ll craft you a kit worthy of your skill.',
    `QuestCompletionLog` = 'Return the leather to Lynalis in Silvermoon City',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A fine kit for an artisan. May it serve you well in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the rugged leather?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER LEATHERING KIT QUEST (300+ Leatherworking)
-- 20 Knothide Leather + 5 Heavy Knothide Leather
-- Reward: Master Leathering Kit (57615)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90089: Shattrath (Darmari - 19187)
-- -----------------------------------------------------
SET @quest := 90089;
SET @npc := 19187;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3703, -- Shattrath City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Master Leathering Kit',
    `QuestDescription` = 'You''ve ventured far to reach Outland, and your leatherworking skills have grown accordingly. But you''ll need superior tools to work with the exotic hides found here. Bring me knothide leather and heavy knothide, and I''ll craft a kit worthy of a master leatherworker.',
    `QuestCompletionLog` = 'Return the leather to Darmari in Shattrath City',
    `RewardItem1` = 57615,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90081; -- Requires Artisan tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This kit is forged for the challenges of Outland. Use it well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the leather from Outland?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER LEATHERING KIT QUEST (375+ Leatherworking)
-- 20 Borean Leather + 5 Heavy Borean Leather
-- Reward: Grand Master Leathering Kit (57616)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90090: Dalaran (Diane Cannings - 28700)
-- -----------------------------------------------------
SET @quest := 90090;
SET @npc := 28700;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 33568, -- Borean Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 38425, -- Heavy Borean Leather
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Grand Master Leathering Kit',
    `QuestDescription` = 'You''ve reached the pinnacle of leatherworking mastery, but even grand masters need the finest tools. The hides of Northrend are unlike any you''ve worked with before. Bring me borean leather and heavy borean leather, and I''ll provide you with a kit befitting a grand master of the craft.',
    `QuestCompletionLog` = 'Return the leather to Diane Cannings in Dalaran',
    `RewardItem1` = 57616,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90089; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Magnificent! This kit is the finest tool a grand master could wield. May it serve you well in all your endeavors.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you gather the leather from Northrend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
