-- =====================================================
-- TAILORING SCISSORS QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90046-90053) [ExclusiveGroup 90046]
-- Artisan: 8 city quests (90054-90061) [ExclusiveGroup 90054]
-- Master: 2 Outland quests (90062-90063) [ExclusiveGroup 90062]
-- Grand Master: 1 Dalaran quest (90064)
-- Total: 19 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive cloth requirements matching skill tiers
-- - Follows herbalism/mining quest pattern
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90046 AND 90064;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90046 AND 90064;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90046 AND 90064;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90046 AND 90064;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90046 AND 90064;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90046 AND 90064;

-- =====================================================
-- JOURNEYMAN TAILORING SCISSORS QUESTS (75+ Tailoring)
-- 20 Linen Cloth + 20 Wool Cloth
-- Reward: Journeyman Tailoring Scissors (57404)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90046: Stormwind (Georgio Bolero - 1346)
-- -----------------------------------------------------
SET @quest := 90046;
SET @npc := 1346;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Georgio Bolero in Stormwind',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90047: Ironforge (Jormund Stonebrow - 1103)
-- -----------------------------------------------------
SET @quest := 90047;
SET @npc := 1103;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Jormund Stonebrow in Ironforge',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90048: Darnassus (Me'lynn - 4159)
-- -----------------------------------------------------
SET @quest := 90048;
SET @npc := 4159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Me''lynn in Darnassus',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90049: Orgrimmar (Magar - 3363)
-- -----------------------------------------------------
SET @quest := 90049;
SET @npc := 3363;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Magar in Orgrimmar',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90050: Thunder Bluff (Tepa - 3004)
-- -----------------------------------------------------
SET @quest := 90050;
SET @npc := 3004;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Tepa in Thunder Bluff',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90051: Undercity (Josef Gregorian - 4576)
-- -----------------------------------------------------
SET @quest := 90051;
SET @npc := 4576;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Josef Gregorian in Undercity',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90052: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90052;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Mathreyn in The Exodar',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90053: Silvermoon (Keelen Sheets - 16640)
-- -----------------------------------------------------
SET @quest := 90053;
SET @npc := 16640;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2589, -- Linen Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2592, -- Wool Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect cloth to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Still using those basic shears, I see. No wonder your weaving takes so long. Bring me some linen and wool cloth, and I''ll set you up with proper tailoring scissors that''ll speed up your work considerably.',
    `QuestCompletionLog` = 'Return the cloth to Keelen Sheets in Silvermoon City',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors will serve you well. Now get back to your loom!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN TAILORING SCISSORS QUESTS (225+ Tailoring)
-- 20 Mageweave Cloth + 20 Runecloth
-- Reward: Artisan Tailoring Scissors (57405)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90054: Stormwind (Georgio Bolero - 1346)
-- -----------------------------------------------------
SET @quest := 90054;
SET @npc := 1346;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Georgio Bolero in Stormwind',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90055: Ironforge (Jormund Stonebrow - 1103)
-- -----------------------------------------------------
SET @quest := 90055;
SET @npc := 1103;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Jormund Stonebrow in Ironforge',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90056: Darnassus (Me'lynn - 4159)
-- -----------------------------------------------------
SET @quest := 90056;
SET @npc := 4159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Me''lynn in Darnassus',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90057: Orgrimmar (Magar - 3363)
-- -----------------------------------------------------
SET @quest := 90057;
SET @npc := 3363;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Magar in Orgrimmar',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90058: Thunder Bluff (Tepa - 3004)
-- -----------------------------------------------------
SET @quest := 90058;
SET @npc := 3004;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Tepa in Thunder Bluff',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90059: Undercity (Josef Gregorian - 4576)
-- -----------------------------------------------------
SET @quest := 90059;
SET @npc := 4576;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Josef Gregorian in Undercity',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90060: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90060;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Mathreyn in The Exodar',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90061: Silvermoon (Keelen Sheets - 16640)
-- -----------------------------------------------------
SET @quest := 90061;
SET @npc := 16640;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4338, -- Mageweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 14047, -- Runecloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Artisan Tailoring Scissors',
    `QuestDescription` = 'Your skills have grown impressive, but those scissors are holding you back. Bring me quality mageweave and runecloth, and I''ll provide scissors worthy of an artisan tailor.',
    `QuestCompletionLog` = 'Return the cloth to Keelen Sheets in Silvermoon City',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These scissors will serve an artisan well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cloth I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER TAILORING SCISSORS QUESTS (300+ Tailoring)
-- 20 Netherweave Cloth + 20 Imbued Netherweave Cloth
-- Reward: Master Tailoring Scissors (57406)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90062: Honor Hold (Hama - 18772) [Alliance]
-- -----------------------------------------------------
SET @quest := 90062;
SET @npc := 18772;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3638, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21877, -- Netherweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 21845, -- Imbued Netherweave Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Master Tailoring Scissors',
    `QuestDescription` = 'You''ve ventured far to reach Outland, and your tailoring skills have grown accordingly. But you''ll need superior tools to work with the exotic cloths found here. Bring me netherweave and imbued netherweave, and I''ll craft scissors worthy of a master tailor.',
    `QuestCompletionLog` = 'Return the cloth to Hama in Honor Hold',
    `RewardItem1` = 57406,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90054, -- Requires Artisan tier
    `ExclusiveGroup` = 90062;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors are forged for the challenges of Outland. Use them well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cloth from Outland?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90063: Thrallmar (Dalinna - 18749) [Horde]
-- -----------------------------------------------------
SET @quest := 90063;
SET @npc := 18749;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3638, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21877, -- Netherweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 21845, -- Imbued Netherweave Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Master Tailoring Scissors',
    `QuestDescription` = 'You''ve ventured far to reach Outland, and your tailoring skills have grown accordingly. But you''ll need superior tools to work with the exotic cloths found here. Bring me netherweave and imbued netherweave, and I''ll craft scissors worthy of a master tailor.',
    `QuestCompletionLog` = 'Return the cloth to Dalinna in Thrallmar',
    `RewardItem1` = 57406,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90054, -- Requires Artisan tier
    `ExclusiveGroup` = 90062;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These scissors are forged for the challenges of Outland. Use them well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cloth from Outland?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER TAILORING SCISSORS QUEST (375+ Tailoring)
-- 20 Frostweave Cloth + 20 Imbued Frostweave Cloth
-- Reward: Grand Master Tailoring Scissors (57407)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90064: Dalaran (Benjamin Clegg - 26914)
-- -----------------------------------------------------
SET @quest := 90064;
SET @npc := 26914;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 33470, -- Frostweave Cloth
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 42253, -- Imbued Frostweave Cloth
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Tools',
    `LogDescription` = 'Collect cloth to exchange for Grand Master Tailoring Scissors',
    `QuestDescription` = 'You''ve reached the pinnacle of tailoring mastery, but even grand masters need the finest tools. The cloth of Northrend is unlike any you''ve worked with before. Bring me frostweave and imbued frostweave, and I''ll provide you with scissors befitting a grand master of the craft.',
    `QuestCompletionLog` = 'Return the cloth to Benjamin Clegg in Dalaran',
    `RewardItem1` = 57407,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90062; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Magnificent! These scissors are the finest tools a grand master could wield. May they serve you well in all your endeavors.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you gather the frostweave from Northrend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
