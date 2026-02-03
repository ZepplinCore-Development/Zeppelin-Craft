-- =====================================================
-- MINING PICK QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90027-90034) [ExclusiveGroup 90027]
-- Artisan: 8 city quests (90035-90042) [ExclusiveGroup 90035]
-- Master: 2 Outland quests (90043-90044) [ExclusiveGroup 90043]
-- Grand Master: 1 Dalaran quest (90045)
-- Total: 19 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive ore requirements matching skill tiers
-- - Follows herbalism shears quest pattern
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90027 AND 90045;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90027 AND 90045;

-- =====================================================
-- JOURNEYMAN MINING PICK QUESTS (75+ Mining)
-- 20 Copper Ore + 20 Tin Ore
-- Reward: Journeyman Mining Pick (57400)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90027: Stormwind (Gelman Stonehand - 5513)
-- -----------------------------------------------------
SET @quest := 90027;
SET @npc := 5513;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Gelman Stonehand in Stormwind',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90028: Ironforge (Geofram Bouldertoe - 4254)
-- -----------------------------------------------------
SET @quest := 90028;
SET @npc := 4254;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Geofram Bouldertoe in Ironforge',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90029: Darnassus (Borin Irondelve - 200100)
-- -----------------------------------------------------
SET @quest := 90029;
SET @npc := 70;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Borin Irondelve in Darnassus',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90030: Exodar (Muaat - 16752)
-- -----------------------------------------------------
SET @quest := 90030;
SET @npc := 16752;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Muaat in the Exodar',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90031: Orgrimmar (Makaru - 3357)
-- -----------------------------------------------------
SET @quest := 90031;
SET @npc := 3357;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Makaru in Orgrimmar',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90032: Thunder Bluff (Brek Stonehoof - 3001)
-- -----------------------------------------------------
SET @quest := 90032;
SET @npc := 3001;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Brek Stonehoof in Thunder Bluff',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90033: Undercity (Brom Killian - 4598)
-- -----------------------------------------------------
SET @quest := 90033;
SET @npc := 4598;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Brom Killian in Undercity',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90034: Silvermoon (Belil - 16663)
-- -----------------------------------------------------
SET @quest := 90034;
SET @npc := 16663;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Tools of the Trade',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Still using that basic pick, eh? No wonder your ore veins are taking so long to mine. Bring me some copper and tin ore, and I''ll set you up with a proper mining pick that''ll speed things along.',
    `QuestCompletionLog` = 'Return the ore to Belil in Silvermoon City',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick will serve you well. Now get out there and mine!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore for me?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN MINING PICK QUESTS (225+ Mining)
-- 20 Mithril Ore + 20 Thorium Ore
-- Reward: Artisan Mining Pick (57401)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90035: Stormwind (Gelman Stonehand - 5513)
-- -----------------------------------------------------
SET @quest := 90035;
SET @npc := 5513;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Gelman Stonehand in Stormwind',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90036: Ironforge (Geofram Bouldertoe - 4254)
-- -----------------------------------------------------
SET @quest := 90036;
SET @npc := 4254;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Geofram Bouldertoe in Ironforge',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90037: Darnassus (Borin Irondelve - 200100)
-- -----------------------------------------------------
SET @quest := 90037;
SET @npc := 70;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Borin Irondelve in Darnassus',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90038: Exodar (Muaat - 16752)
-- -----------------------------------------------------
SET @quest := 90038;
SET @npc := 16752;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Muaat in the Exodar',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90039: Orgrimmar (Makaru - 3357)
-- -----------------------------------------------------
SET @quest := 90039;
SET @npc := 3357;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Makaru in Orgrimmar',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90040: Thunder Bluff (Brek Stonehoof - 3001)
-- -----------------------------------------------------
SET @quest := 90040;
SET @npc := 3001;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Brek Stonehoof in Thunder Bluff',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90041: Undercity (Brom Killian - 4598)
-- -----------------------------------------------------
SET @quest := 90041;
SET @npc := 4598;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Brom Killian in Undercity',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90042: Silvermoon (Belil - 16663)
-- -----------------------------------------------------
SET @quest := 90042;
SET @npc := 16663;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Tools',
    `LogDescription` = 'Collect high-quality ore for an Artisan Mining Pick',
    `QuestDescription` = 'You''ve mastered the basics of mining, but to work with the rarer veins you''ll need better tools. Bring me quality mithril and thorium ore, and I''ll craft you an artisan-grade pick.',
    `QuestCompletionLog` = 'Return the ore to Belil in Silvermoon City',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent craftsmanship awaits. This pick won''t let you down.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the ore I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER MINING PICK QUESTS (300+ Mining)
-- 20 Fel Iron Ore + 20 Adamantite Ore
-- Reward: Master Mining Pick (57402)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90043: Hellfire Peninsula - Alliance (Hurnak Grimmord - 18779)
-- -----------------------------------------------------
SET @quest := 90043;
SET @npc := 18779;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3522, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 23424, -- Fel Iron Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23425, -- Adamantite Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Tools',
    `LogDescription` = 'Collect Outland ore for a Master Mining Pick',
    `QuestDescription` = 'The ores of Outland require specialized tools to mine efficiently. Bring me fel iron and adamantite ore from the field, and I''ll forge you a pick capable of handling these tainted metals.',
    `QuestCompletionLog` = 'Return the ore to Hurnak Grimmord in Hellfire Peninsula',
    `RewardItem1` = 57402,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90035, -- Requires Artisan tier
    `ExclusiveGroup` = 90043;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick can handle the fel-tainted ores. Use it well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Were you able to gather the Outland ore?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90044: Hellfire Peninsula - Horde (Krugosh - 18747)
-- -----------------------------------------------------
SET @quest := 90044;
SET @npc := 18747;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3522, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 23424, -- Fel Iron Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23425, -- Adamantite Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Tools',
    `LogDescription` = 'Collect Outland ore for a Master Mining Pick',
    `QuestDescription` = 'The ores of Outland require specialized tools to mine efficiently. Bring me fel iron and adamantite ore from the field, and I''ll forge you a pick capable of handling these tainted metals.',
    `QuestCompletionLog` = 'Return the ore to Krugosh in Hellfire Peninsula',
    `RewardItem1` = 57402,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90035, -- Requires Artisan tier
    `ExclusiveGroup` = 90043;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This pick can handle the fel-tainted ores. Use it well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Were you able to gather the Outland ore?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER MINING PICK QUEST (375+ Mining)
-- 20 Cobalt Ore + 20 Saronite Ore
-- Reward: Grand Master Mining Pick (57403)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90045: Dalaran (Jedidiah Handers - 28698)
-- -----------------------------------------------------
SET @quest := 90045;
SET @npc := 28698;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 36909, -- Cobalt Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 36912, -- Saronite Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Mining Tools',
    `LogDescription` = 'Collect Northrend ore for a Grand Master Mining Pick',
    `QuestDescription` = 'The frozen north holds the richest deposits I''ve ever seen, but they''re locked in permafrost and corrupted by the Scourge. You''ll need the finest pick money can buy. Bring me cobalt and saronite ore, and I''ll craft you something special.',
    `QuestCompletionLog` = 'Return the ore to Jedidiah Handers in Dalaran',
    `RewardItem1` = 57403,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90043; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'A masterwork pick for a master miner. May it serve you well in Northrend.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the Northrend ore?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
